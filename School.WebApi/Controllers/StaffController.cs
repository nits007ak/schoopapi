using School.Model;
using School.Service;
using School.Service.Interface;
using School.WebApi.Attribute;
using School.WebApi.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace School.WebApi.Controllers
{
    [Authorize]
    [ValidationActionFilter]
    public class StaffController : ApiController
    {
        private IStaffService _staffService;
        public StaffController()
        {
            _staffService = new StaffService();
        }

        [Route("api/staff/insertupdatestaff")]
        [HttpPost]
        public StaffInfo CreateNewClass([FromBody]StaffInfo staffInfo)
        {
            try
            {
                if (ModelState.IsValid)
                { 
                    staffInfo.UpdateDate = DateTime.Now;
                    staffInfo = _staffService.InsertUpdatedStaff(staffInfo);
                }
            }
            catch (Exception)
            {

                throw;
            }

            return staffInfo;
        }

        // GET api/<controller>
        [Route("api/staff/getallstaffbyschoolinfoid")]
        [HttpGet]
        public IEnumerable<StaffInfo> GetAllStudentList(long schoolInfoId)
        {
            List<StaffInfo> staffInfoList = new List<StaffInfo>();
            try
            {
                if (schoolInfoId > 0)
                {
                    staffInfoList = _staffService.GetAllStaffBasicInfo(schoolInfoId);
                }

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return staffInfoList;
        }

        // GET api/<controller>
        [Route("api/staff/getstaffbasicinfobystaffid")]
        [HttpGet]
        public StaffInfo GetStaffBasicInfoByStaffId(long staffId)
        {
            StaffInfo staffInfo = new StaffInfo();
            try
            {
                if (staffId > 0)
                {
                    staffInfo= _staffService.GetStaffBasicInfoByStaffId(staffId);
                }

            }
            catch (Exception)
            {

                throw;
            }

            return staffInfo;

         }

        [Route("api/staff/insertupdatestaffotherinfo")]
        [HttpPost]
        public StaffOtherInfo InsertUpdateStaffOtherData([FromBody]StaffOtherInfo staffOtherInfo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    staffOtherInfo.UpdateDate = DateTime.Now;
                    staffOtherInfo.DegreeIds = staffOtherInfo.DegreeIdList.Count > 0 ? string.Join("|", staffOtherInfo.DegreeIdList) : null;
                    staffOtherInfo.SubjectIds = staffOtherInfo.SubjectIdList.Count > 0 ? string.Join("|", staffOtherInfo.SubjectIdList) : null;
                    staffOtherInfo = _staffService.InsertUpdateStaffOtherInfo(staffOtherInfo);
                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return staffOtherInfo;
        }

        // GET api/<controller>
        [Route("api/staff/getstaffotherinfobystaffid")]
        [HttpGet]
        public StaffOtherInfo GetStaffOtherInfoByStaffId(long staffId)
        {
            StaffOtherInfo staffOtherInfo = new StaffOtherInfo();
            try
            {
                if (staffId > 0)
                {
                    staffOtherInfo = _staffService.GetStaffOtherInfoByStaffId(staffId);
                    if(staffOtherInfo != null)
                    {
                        if (!string.IsNullOrEmpty(staffOtherInfo.DegreeIds))
                        {
                            string[] degreeIds = staffOtherInfo.DegreeIds.Split('|');
                            staffOtherInfo.DegreeIdList = Array.ConvertAll(degreeIds, int.Parse).ToList();
                        }
                        if (!string.IsNullOrEmpty(staffOtherInfo.SubjectIds))
                        {
                            string[] subjectIds = staffOtherInfo.SubjectIds.Split('|');
                             staffOtherInfo.SubjectIdList = Array.ConvertAll(subjectIds, int.Parse).ToList();
                        }
                        
                    } 
                }

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return staffOtherInfo;

        }

        [Route("api/staff/insertupdatestaffExperience")]
        [HttpPost]
        public StaffExperience InsertUpdateStaffExpData([FromBody]StaffExperience staffExperience)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    staffExperience.UpdateDate = DateTime.Now;
                    staffExperience = _staffService.InsertUpdateStaffExp(staffExperience);
                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
            return staffExperience;
        }

        // GET api/<controller>
        [Route("api/staff/getstaffexperienceinfobystaffid")]
        [HttpGet]
        public List<StaffExperience> GetStaffExpDataByStaffId(long staffId)
        {
            List<StaffExperience> staffExperience = new List<StaffExperience>();
            try
            {
                if (staffId > 0)
                {
                    staffExperience = _staffService.GetStaffExperienceByStaffId(staffId);
                }

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return staffExperience;

        }


        [Route("api/staff/insertupdatestaffclass")]
        [HttpPost]
        public bool InsertUpdateStaffClass([FromBody]StaffClass staffClasses)
        {
            bool result = false;
            try
            {
                if (ModelState.IsValid)
                {
                    staffClasses.UpdateDate = DateTime.Now;
                    result = _staffService.InsertUpdatedStaffClass(staffClasses);
                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return result;
        }

        // GET api/<controller>
        [Route("api/staff/getstaffallclassbystaffid")]
        [HttpGet]
        public StaffClass GetStaffAllClassByStaffId(long staffId)
        {
            StaffClass staffClass = new StaffClass();
            try
            {
                if (staffId > 0)
                {
                    staffClass = _staffService.GetStaffAllClassesByStaffId(staffId);
                }

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return staffClass;

        }

        [Route("api/staff/insertstaffdoc")]
        [HttpPost]
        public StaffDocument InsertStaffDoc([FromBody]StaffDocument staffDoc)
        {
            
            try
            {
                if (ModelState.IsValid)
                {
                    if (staffDoc.MultimediaFile != null && !string.IsNullOrEmpty(staffDoc.MultimediaFile.data))
                    {
                        staffDoc.DocURL = Utilities.SaveImage(staffDoc.MultimediaFile.data, staffDoc.MultimediaFile.fileType, FileSavePath.STAFFDOCPATH.ToString());
                    }
                    else
                    {
                        throw new Exception("Document is not found.Please upload Document!");
                    }

                    staffDoc.UpdateDate = DateTime.Now;
                    staffDoc = _staffService.InsertStaffDocument(staffDoc);
                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return staffDoc;
        }

        // GET api/<controller>
        [Route("api/staff/getstaffalldocbystaffid")]
        [HttpGet]
        public List<StaffDocument> GetStaffAllDocByStaffId(long staffId)
        {
            List<StaffDocument> staffDocList = new List<StaffDocument>();
            try
            {
                if (staffId > 0)
                {
                   var staffDocData = _staffService.GetStaffAllDocumentByStaffId(staffId);
                    foreach (var item in staffDocData)
                    {
                        if (!string.IsNullOrEmpty(item.DocURL))
                        {
                            item.DocURL = Utilities.GetFileURL(item.DocURL, FileSavePath.STAFFDOCPATH2.ToString());
                        }
                        
                        staffDocList.Add(item);
                    }
                     
                }

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return staffDocList;

        }

        // GET api/<controller>
        [Route("api/staff/deletestaffdocbydocid")]
        [HttpPost]
        public bool DeleteStaffDocByDocId([FromBody]long staffDocId)
        {
            bool result = false;
            try
            {
                if (staffDocId > 0)
                {
                    result = _staffService.DeleteStaffDocById(staffDocId);
                }

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return result;

        }

        [Route("api/student/deletestaff")]
        [HttpPost]
        public bool DeleteStaff([FromBody]long staffInfoId)
        {
            bool result = false;
            try
            {
                if (staffInfoId > 0)
                {
                    result = _staffService.DeleteStaffIdById(staffInfoId);
                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return result;
        }

        [Route("api/staff/deletestaffexpbyid")]
        [HttpPost]
        public bool DeleteStaffExpByExpId([FromBody]long staffExpId)
        {
            bool result = false;
            try
            {
                if (staffExpId > 0)
                {
                    result = _staffService.DeleteStaffExperienceById(staffExpId);
                }

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return result;

        }
    }

    
}
