using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using School.Model;
using School.Service;
using School.Service.Interface;
using School.WebApi.Helper;
using School.WebApi.Attribute;
using System.IO;

namespace School.WebApi.Controllers
{
    
    [ValidationActionFilter]
    public class SchoolController : ApiController
    {
       private ISchoolService _schoolService;
        private IUserProfileService _userService;
        public SchoolController()
        {
            _schoolService = new SchoolService();
            _userService = new UserProfileService();
        }

        [Authorize(Roles = "SuperAdmin")]
        [Route("api/school/insertupdateschool")]
        [HttpPost]
        public SchoolBasicInfo CreateNewSchool([FromBody]SchoolBasicInfo schoolBasicInfo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    
                        if (schoolBasicInfo.SchoolInfoId == 0)
                        {
                            if (!_userService.IsEmailAddressExists(schoolBasicInfo.Email))
                            {
                                schoolBasicInfo.SchoolUniqueId = Utilities.GenerateSchoolUnqKey(schoolBasicInfo.Name, schoolBasicInfo.State,schoolBasicInfo.City);
                            }
                            else
                            {
                                throw new Exception("Email address already Exists!!");
                            }
                        } 

                        schoolBasicInfo.UpdateDate = DateTime.Now;
                        schoolBasicInfo = _schoolService.InsertUpdatedSchool(schoolBasicInfo);
                    
                }
            }
            catch (Exception ex)
            {

                throw (ex);
            }

            return schoolBasicInfo;
        }




        // GET api/<controller>
        [Authorize(Roles = "SuperAdmin")]
        [Route("api/school/getallschoollist")]
        [HttpGet]
        public IEnumerable<SchoolBasicInfo> GetAllSchoolBasicInfoList()
        {
            List<SchoolBasicInfo> schoolBasicInfoList = new List<SchoolBasicInfo>();
            try
            {
                var reaultList= _schoolService.GetAllSchoolBasicInfo();
                foreach (SchoolBasicInfo schoolBasicInfo in reaultList)
                {
                     
                    schoolBasicInfoList.Add(schoolBasicInfo);
                }
               
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return schoolBasicInfoList;
        }

        // GET api/<controller>/5
        [Authorize(Roles = "SuperAdmin")]
        [Route("api/school/getschoolinfobyuniqueid")]
        [HttpGet]
        public SchoolBasicInfo GetSchoolBasicInfo(string schoolUniqueId)
        {
            SchoolBasicInfo schoolBasicInfo = new SchoolBasicInfo();
            try
            {
                if (!string.IsNullOrEmpty(schoolUniqueId))
                {
                    schoolBasicInfo = _schoolService.GetSchoolBasicInfoByUniqueId(schoolUniqueId);
                    //if (schoolBasicInfo != null && !string.IsNullOrEmpty(schoolBasicInfo.SchoolTypeIds))
                    //{
                    //    var intArr = (schoolBasicInfo.SchoolTypeIds.Split('|'));
                    //    schoolBasicInfo.SchoolTypeIdList = intArr.Select(c => int.Parse(c)).ToList();
                    //}
                   
                }
               
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return schoolBasicInfo;
        }


        // GET api/<controller>/5
        //[Authorize(Roles = "SuperAdmin,SchoolAdmin")]
        [Route("api/school/getschoolinfobyid")]
        [HttpGet]
        public SchoolModel GetSchoolBasicInfo(long schoolInfoId)
        {
            SchoolModel schoolModel = new SchoolModel();
            try
            {
                if (schoolInfoId > 0)
                {
                    schoolModel = _schoolService.GetSchoolBasicInfoById(schoolInfoId);
                    //if (schoolModel != null && !string.IsNullOrEmpty(schoolModel.SchoolBasicInfoModel.SchoolTypeIds))
                    //{
                    //    var intArr = (schoolModel.SchoolBasicInfoModel.SchoolTypeIds.Split('|'));
                    //    schoolModel.SchoolBasicInfoModel.SchoolTypeIdList = intArr.Select(c => int.Parse(c)).ToList();
                    //}

                }
                else
                {
                    throw new Exception("SchoolInfoId is required!!");
                }

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return schoolModel;
        }

        //[Authorize(Roles = "SuperAdmin")]
        [Route("api/school/instupdschoolotherinfo")]
        [HttpPost]
        public SchoolOtherInfo InsertUpdateSchoolOtherDetail([FromBody]SchoolOtherInfo schoolOtherInfo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (schoolOtherInfo.MultimediaFile != null && !string.IsNullOrEmpty(schoolOtherInfo.MultimediaFile.data))
                    {
                        schoolOtherInfo.logo = Utilities.SaveImage(schoolOtherInfo.MultimediaFile.data, schoolOtherInfo.MultimediaFile.fileType, FileSavePath.SCHOOLLOGOPATH.ToString());
                    }
                    else
                    {
                        if (!string.IsNullOrEmpty(schoolOtherInfo.logo))
                        {
                            schoolOtherInfo.logo = Path.GetFileName(schoolOtherInfo.logo);
                        }
                    }
                     
                    schoolOtherInfo.UpdateDate = DateTime.Now;
                    schoolOtherInfo = _schoolService.InsertUpdateSchoolOtherInfo(schoolOtherInfo);
                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return schoolOtherInfo;
        }

        [Authorize(Roles = "SuperAdmin")]
        [Route("api/school/getschoolotherInfobyuniqueid")]
        [HttpGet]
        public SchoolOtherInfo GetSchoolOtherInfo(string schoolUniqueId)
        {
            SchoolOtherInfo schoolOtherInfo = new SchoolOtherInfo();
            try
            {
                if (!string.IsNullOrEmpty(schoolUniqueId))
                {
                    schoolOtherInfo = _schoolService.GetSchoolOtherInfoByUniqueId(schoolUniqueId);
                    if (schoolOtherInfo != null && !string.IsNullOrEmpty(schoolOtherInfo.logo))
                    {
                        schoolOtherInfo.LogoURL = Utilities.GetFileURL(schoolOtherInfo.logo, FileSavePath.SCHOOLLOGOPATH2.ToString());
                        if (!string.IsNullOrEmpty(schoolOtherInfo.SchoolTypeIds))
                        {
                            var intArr = (schoolOtherInfo.SchoolTypeIds.Split('|'));
                            schoolOtherInfo.SchoolTypeIdList = intArr.Select(c => int.Parse(c)).ToList();
                        }

                    } 
                }

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return schoolOtherInfo;
        }
        [Authorize(Roles = "SuperAdmin")]
        [Route("api/school/addsuperadminschool")]
        [HttpPost]
        public bool AddSuperAdminSchool([FromBody]SuperAdminSchool model)
        {
            try
            {

              return  _schoolService.AddSuperAdminSchool(model.UserId, model.SchoolInfoId); 
           }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            } 
        }

        [Authorize(Roles = "SuperAdmin")]
        [Route("api/school/deletesuperadminschool")]
        [HttpPost]
        public bool DeleteSuperAdminSchool([FromBody]SuperAdminSchool model)
        {
            try
            {
                 return _schoolService.DeleteSuperAdminSchool(model.UserId);
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }

    }


   

}