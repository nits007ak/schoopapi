using School.Model;
using School.Service;
using School.Service.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace School.WebApi.Controllers
{
    public class UserProfileController : ApiController
    {
        private IUserProfileService _userProfileService;
        public UserProfileController()
        {
            _userProfileService = new UserProfileService();
        }

        [Route("api/userprofile/getadminprofile")]
        [HttpGet]
        public UserProfile GetAdminProfile([FromBody]long userId)
        {
            UserProfile userProfile = new UserProfile();
            try
            {
                userProfile = _userProfileService.GetUserProfile(userId);
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return userProfile;
        }
    }
}
