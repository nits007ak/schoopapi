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
    //[Authorize]
    [ValidationActionFilter]
    public class SchoolController : ApiController
    {
       private ISchoolService _schoolService;
        public SchoolController()
        {
            _schoolService = new SchoolService();
        }
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
                        schoolBasicInfo.SchoolUniqueId = Utilities.GenerateSchoolUnqKey(schoolBasicInfo.Name, schoolBasicInfo.City);
                    }
                   
                    schoolBasicInfo.UpdateDate = DateTime.Now;
                    schoolBasicInfo = _schoolService.InsertUpdatedSchool(schoolBasicInfo);
                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return schoolBasicInfo;
        }




        // GET api/<controller>
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
                    if (!string.IsNullOrEmpty(schoolBasicInfo.SchoolTypeIds))
                    {
                        var intArr = (schoolBasicInfo.SchoolTypeIds.Split('|'));
                        schoolBasicInfo.SchoolTypeIdList = intArr.Select(c => int.Parse(c)).ToList();
                    }

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
                    if (schoolBasicInfo != null && !string.IsNullOrEmpty(schoolBasicInfo.SchoolTypeIds))
                    {
                        var intArr = (schoolBasicInfo.SchoolTypeIds.Split('|'));
                        schoolBasicInfo.SchoolTypeIdList = intArr.Select(c => int.Parse(c)).ToList();
                    }
                   
                }
               
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return schoolBasicInfo;
        }

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

        [Route("api/school/getschoolotherInfobyuniqueid")]
        [HttpGet]
        public SchoolOtherInfo GetSchoolOtherInfo(string schoolUniqueId)
        {
            SchoolOtherInfo schoolBasicInfo = new SchoolOtherInfo();
            try
            {
                if (!string.IsNullOrEmpty(schoolUniqueId))
                {
                    schoolBasicInfo = _schoolService.GetSchoolOtherInfoByUniqueId(schoolUniqueId);
                    if (schoolBasicInfo != null && !string.IsNullOrEmpty(schoolBasicInfo.logo))
                    {
                        schoolBasicInfo.LogoURL = Utilities.GetFileURL(schoolBasicInfo.logo, FileSavePath.SCHOOLLOGOPATH2.ToString());
                    }
                     
                }

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return schoolBasicInfo;
        }

       
    }
}