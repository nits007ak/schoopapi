using School.Model;
using School.Service;
using School.Service.Interface;
using School.WebApi.Attribute;
using School.WebApi.Helper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace School.WebApi.Controllers
{
    //[Authorize(Roles = "SuperAdmin,SchoolAdmin,Staff")]
    [ValidationActionFilter]
    public class StudentController : ApiController
    {
        private static readonly int _appCodeExpiryDays = Convert.ToInt32(ConfigurationManager.AppSettings.Get("APPCODEEXPIRYDAYS"));
        private IStudentService _studentService;
        private IUserProfileService _userService;
        public StudentController()
        {
            _studentService = new StudentService();
            _userService = new UserProfileService();
        }

        [Route("api/student/insertupdatestudent")]
        [HttpPost]
        public Student CreateNewStudent([FromBody]Student student)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (student.StudentId == 0)
                    {
                        student.StudentUniqueId = Utilities.GenerateStudentUnqKey(student.SchoolInfoId, student.Name);
                    }

                    student.UpdateDate = DateTime.Now;
                    student = _studentService.InsertUpdatedStudent(student);
                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return student;
        }

        // GET api/<controller>
        [Route("api/student/getallstudentbyschoolinfoid")]
        [HttpGet]
        public IEnumerable<Student> GetAllStudentList(long schoolInfoId)
        {
            List<Student> studentInfoList = new List<Student>();
            try
            {
                if (schoolInfoId > 0)
                {
                    studentInfoList = _studentService.GetAllStudentBySchoolInfoId(schoolInfoId);
                }
               
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return studentInfoList;
        }

        // GET api/<controller>/5
        [Route("api/student/getstudentbyid")]
        [HttpGet]
        public Student GetStudentProfileById(long studentId)
        {
            Student student = new Student();
            try
            {
                if (studentId > 0)
                {
                    student = _studentService.GetStudentProfileById(studentId);
                    int numberOfDays = 0;
                    if (student.AppCodeCreatedDate.HasValue)
                    {
                        numberOfDays = (DateTime.Now - (DateTime)student.AppCodeCreatedDate).Days;
                    }

                    if (numberOfDays > _appCodeExpiryDays)
                    {
                        student.AppCode = null;
                    }
                }

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return student;
        }


        [Route("api/student/insertupdatestudentparent")]
        [HttpPost]
        public StudentParent AddStudentParent([FromBody]StudentParent studentParent)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    bool isNewParent = false;
                    if (studentParent.StudentParentId == 0)
                    {
                        isNewParent = true;
                        if (_userService.IsEmailAddressExists(studentParent.Email))
                        {
                            throw new Exception("Email address already Exists!!");
                        }
                    }

                    studentParent.UpdateDate = DateTime.Now;
                    studentParent = _studentService.InsertUpdateStudentParent(studentParent);

                    if (studentParent != null && isNewParent)
                    {
                        Utilities.SendWelcomeMailToParent(studentParent.Email, studentParent.Password, studentParent.FirstName + " " + studentParent.LastName);
                    }
                }
            }
            catch (Exception ex)
            { 
                throw (ex);
            }

            return studentParent;
        }

        // GET api/<controller>
        [Route("api/student/getallstudentwithparent")]
        [HttpGet]
        public IEnumerable<Student> GetAllStudentWithParentListBySchoolId(long schoolInfoId)
        {
            List<Student> studentParentList = new List<Student>();
            try
            {
                if (schoolInfoId > 0)
                {
                    studentParentList = _studentService.GetAllStudentWithParent(schoolInfoId);
                }

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return studentParentList;
        }

        // GET api/<controller>/5
        [Route("api/student/getstudentparentbyid")]
        [HttpGet]
        public List<StudentParent> GetStudentparentProfileById(long studentId)
        {
            List<StudentParent> stParent = new List<StudentParent>();
            try
            {
                if (studentId > 0)
                {
                    stParent = _studentService.GetStudentParentById(studentId);
                }

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return stParent;
        }

        [Route("api/student/updateappcode")]
        [HttpPost]
        public bool InsertUpdateAppCode([FromBody]AppCodeModel appCodeModel)
        {
            bool result = false;
            try
            {
                if (appCodeModel.StudentId > 0)
                {
                    result = _studentService.updateStudentAppCode(appCodeModel.StudentId,appCodeModel.AppCode);
                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return result;
        }

        [Route("api/student/deleteparent")]
        [HttpPost]
        public bool DeleteStudentParent([FromBody]long parentId)
        {
            bool result = false;
            try
            {
                if (parentId > 0)
                {
                    result = _studentService.DeleteParentById(parentId);
                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return result;
        }

        [Route("api/student/deletestudent")]
        [HttpPost]
        public bool DeleteStudent([FromBody]long studentId)
        {
            bool result = false;
            try
            {
                if (studentId > 0)
                {
                    result = _studentService.DeleteStudentById(studentId);
                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return result;
        }

        [Route("api/student/remindmail")]
        [HttpPost]
        public bool RemindMailParent([FromBody]long parentId)
        {
             try
            {
                if (parentId > 0)
                {
                    var  model = _studentService.GetParentInfoById(parentId);
                    if (model != null)
                    {
                        Utilities.SendWelcomeMailToParent(model.Email, model.Password, model.FirstName + " " + model.LastName);
                       
                    }
                    else
                    {
                        throw new Exception("Does not have Parent for this is Id.");
                    }
                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
            return true;
        }


        [Route("api/student/sendappcode")]
        [HttpPost]
        public bool SendAppCodeMailParent([FromBody]long studentId)
        {
            try
            {
                if (studentId > 0)
                {
                    var model = _studentService.GetStudentParentById(studentId);
                    var student = _studentService.GetStudentProfileById(studentId);
                    if (!string.IsNullOrEmpty(student.AppCode))
                    {
                        if (model.Count > 0)
                        {
                            foreach (StudentParent parent in model)
                            {
                                Utilities.SendAppCodeMailToParent(parent.Email, student.AppCode, parent.FirstName + " " + parent.LastName);
                            } 
                        }
                        else
                        {
                            throw new Exception("Does not have any parent associated this student.");
                        }
                    }
                    else
                    {
                        throw new Exception("App code is Empty.Please Generate App Code First!");
                    }
                   
                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
            return true;
        }

    }
}
