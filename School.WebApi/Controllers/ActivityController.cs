using School.Model;
using School.Service;
using School.Service.Interface;
using School.WebApi.Attribute;
using School.WebApi.Helper;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace School.WebApi.Controllers
{ 
    [Authorize]
    [ValidationActionFilter]
    public class ActivityController : ApiController
    {
        private IActivityService _activityService;
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
        public bool InsertAcivity([FromBody]ActivityPostModel activityPostModel)
        {
            bool result = false;
            try
            {
                if (ModelState.IsValid)
                {
                    if (!string.IsNullOrEmpty(activityPostModel.ImageStr))
                    {
                         activityPostModel.ImageURL = Utilities.SaveImage(activityPostModel.ImageStr, activityPostModel.ImageType, FileSavePath.ACTIVITYIMGPATH.ToString());
                    }
                    
                    result = _activityService.InsertActivity(activityPostModel);
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
