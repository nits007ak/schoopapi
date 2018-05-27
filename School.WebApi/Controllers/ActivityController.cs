using School.Model;
using School.Service;
using School.Service.Interface;
using School.WebApi.Attribute;
using School.WebApi.Helper;
using School.WebApi.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace School.WebApi.Controllers
{
    //[Authorize(Roles = "SuperAdmin,SchoolAdmin,Staff,Parent")]
    [ValidationActionFilter]
    public class ActivityController : ApiController
    {
        private IActivityService _activityService;
        private readonly string _activityImgPath = ConfigurationManager.AppSettings[FileSavePath.ACTIVITYIMGPATH2.ToString()];
        public ActivityController()
        {
            _activityService = new ActivityService();
        }

        // GET api/<controller>
        [Route("api/activity/getallactivity")]
        [HttpGet]
        public IEnumerable<ActivityType> GetAllActivityList()
        {
            List<ActivityType> activityModelList = new List<ActivityType>();
            try
            {
                activityModelList = _activityService.GetAllActivitiesList(); 
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return activityModelList;
        }

        [Route("api/activity/insertactivity")]
        [HttpPost]
        public ResponseModel InsertAcivity([FromBody]ActivityPostModel activityPostModel)
        {
            var objResponse = new ResponseModel();
            try
            {
                if (!string.IsNullOrEmpty(activityPostModel.ImageStr))
                {
                    var arrData = activityPostModel.ImageStr.Split(',');
                    if (arrData.Length > 0)
                    {
                        activityPostModel.ImageStr = arrData[1];
                    }

                    activityPostModel.ImageURL = Utilities.SaveImage(activityPostModel.ImageStr, activityPostModel.ImageType, FileSavePath.ACTIVITYIMGPATH.ToString());
                }

                objResponse.IsSuccess = _activityService.InsertActivity(activityPostModel);

            }
            catch (Exception ex)
            {
                objResponse.IsSuccess = false;
                objResponse.Message = ex.Message.ToString();
            }

            return objResponse;
        }


        [Route("api/activity/getallnotification")]
        [HttpGet]
        public IEnumerable<NotificationType> GetAllNotificationList()
        {
            List<NotificationType> notyModelList = new List<NotificationType>();
            try
            {
                notyModelList = _activityService.GetAllNotificationList();
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return notyModelList;
        }

        [Route("api/activity/insertnotification")]
        [HttpPost]
        public bool InsertNotifications([FromBody]NotificationPostModel NotyPostModel)
        {
            bool result = false;
            try
            { 
                    if (!string.IsNullOrEmpty(NotyPostModel.ImageStr))
                    {
                       NotyPostModel.ImageURL = Utilities.SaveImage(NotyPostModel.ImageStr, NotyPostModel.ImageType, FileSavePath.NOTIFICATIONIMGPATH.ToString());
                    }

                    if (!string.IsNullOrEmpty(NotyPostModel.DocStr))
                    {
                        NotyPostModel.DocURL = Utilities.SaveImage(NotyPostModel.DocStr, NotyPostModel.DocType, FileSavePath.NOTIFICATIONDOCPATH.ToString());
                    }

                result = _activityService.InsertNotification(NotyPostModel);
 
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return result;
        }

        // GET api/<controller>
        [Route("api/activity/getstudentActivities")]
        [HttpGet]
        public IEnumerable<ActivityGetModel> GetStudentActicityList(long studentId)
        {
            List<ActivityGetModel> activityGetModel = new List<ActivityGetModel>();
            try
            {
              var model = _activityService.GetAllActivitiesByStudentId(studentId);
                foreach (var item in model)
                {
                    if (!string.IsNullOrEmpty(item.ImageURL))
                    {
                        item.ImageURL = Utilities.GetFileURL(item.ImageURL, FileSavePath.ACTIVITYIMGPATH2.ToString());
                    }

                    if (!string.IsNullOrEmpty(item.ActivitySubTypeIds))
                    {
                        item.ActivitySubTypeNames = _activityService.GetActivitySubType(item.ActivitySubTypeIds);
                    }

                    if (!string.IsNullOrEmpty(item.ActivitySubChildTypeIds))
                    {
                        item.ActivitySubChildTypeNames = _activityService.GetActivitySubTypeChild(item.ActivitySubChildTypeIds);
                    }

                    activityGetModel.Add(item);
                }

                
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return activityGetModel;
        }


        [Route("api/activity/getclassActivities")]
        [HttpGet]
        public IEnumerable<ActivityGetModel> GetClassActicityList(long classId)
        {
            List<ActivityGetModel> activityGetModel = new List<ActivityGetModel>();
            try
            {
                var model = _activityService.GetAllActivitiesByClassId(classId);
                foreach (var item in model)
                {
                    if (!string.IsNullOrEmpty(item.ImageURL))
                    {
                        item.ImageURL = Utilities.GetFileURL(item.ImageURL, FileSavePath.ACTIVITYIMGPATH2.ToString());
                    }

                    if (!string.IsNullOrEmpty(item.ActivitySubTypeIds))
                    {
                        item.ActivitySubTypeNames = _activityService.GetActivitySubType(item.ActivitySubTypeIds);
                    }

                    if (!string.IsNullOrEmpty(item.ActivitySubChildTypeIds))
                    {
                        item.ActivitySubChildTypeNames = _activityService.GetActivitySubTypeChild(item.ActivitySubChildTypeIds);
                    }

                    activityGetModel.Add(item);
                }


            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return activityGetModel;
        }

    }
}
