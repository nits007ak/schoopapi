using School.Model;
using School.Service;
using School.Service.Interface;
using School.WebApi.Attribute;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace School.WebApi.Controllers
{
    //[Authorize]
    [ValidationActionFilter]
    public class ClassController : ApiController
    {

        private IClassService _classService;
        public ClassController()
        {
            _classService = new ClassService();
        }

        [Route("api/class/insertupdateclass")]
        [HttpPost]
        public Class CreateNewClass([FromBody]Class room)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    room.UpdateDate = DateTime.Now;
                    room = _classService.InsertUpdatedSchool(room);
                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return room;
        }

        [Route("api/class/getallclassBySchoolInfoId")]
        [HttpGet]
        public List<Class> CreateNewClass(long schoolInfoId)
        {
            List<Class> classList = new List<Class>();
            try
            {
                classList= _classService.GetAllSchoolBasicInfo(Convert.ToInt64(schoolInfoId));
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return classList;
        }

        // GET api/<controller>
        [Route("api/class/getallstudentbyclassid")]
        [HttpGet]
        public IEnumerable<Student> GetAllStudentList(long classId)
        {
            List<Student> studentInfoList = new List<Student>();
            try
            {
                if (classId > 0)
                {
                    studentInfoList = _classService.GetAllStudentByClassId(classId);
                }

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return studentInfoList;
        }

        [Route("api/class/updatestudentclass")]
        [HttpPost]
        public bool UpdateStudentClass([FromBody]StudentClassModel studentClassModel)
        {
            bool result = false;
            try
            {
                    result = _classService.updateStudentClass(studentClassModel);
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return result;
        }

        [Route("api/class/removestudentclass")]
        [HttpPost]
        public bool RemoveStudentClass([FromBody]StudentClassModel studentIdList)
        {
            bool result = false;
            try
            {
                result = _classService.removeStudentClass(studentIdList);
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return result;
        }

        // GET api/<controller>
        [Route("api/class/getallstudentcheckInfobyclassid")]
        [HttpGet]
        public IEnumerable<StudentCheckin> GetAllStudentCheckInInfo(long classId)
        {
            List<StudentCheckin> studentInfoList = new List<StudentCheckin>();
            try
            {
                if (classId > 0)
                {
                    studentInfoList = _classService.GetAllStudentCheckInInfo(classId);
                }

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return studentInfoList;
        }

        [Route("api/class/insertupdatestudentcheckininfo")]
        [HttpPost]
        public bool InsertStudentCheckinfo([FromBody]List<StudentCheckin> stChk)
        {
            bool result = false;
            try
            {
                if (ModelState.IsValid)
                {
                    
                    result = _classService.InsertUpdatedStudentCheckInfo(stChk);
                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return result;
        }

        [Route("api/class/deleteclassById")]
        [HttpPost]
        public HttpResponseMessage DeleteClass([FromBody]long classId)
        {
            HttpResponseMessage responseMessage = new HttpResponseMessage();
            try
            {
                if (classId > 0)
                {
                     if(!_classService.IsClassHaveStudent(classId))
                    {
                        if (!_classService.IsClassHaveStaff(classId))
                        {
                            var result = _classService.DeleteClassById(classId);
                            if (result)
                            {
                                responseMessage = Request.CreateResponse(HttpStatusCode.OK, true);
                            }
                            else
                            {
                                responseMessage = Request.CreateErrorResponse(HttpStatusCode.NotFound, "Class not found.");
                            }
                        }
                        else
                        {
                            responseMessage = Request.CreateErrorResponse(HttpStatusCode.Forbidden, "Class have Staff. First remove class From Staff than try again.");
                        }
                       
                    }
                    else
                    {
                        responseMessage = Request.CreateErrorResponse(HttpStatusCode.Forbidden, "Class have Student. First remove class From Student than try again.");
                    }
                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return responseMessage;
        }
    }
}
