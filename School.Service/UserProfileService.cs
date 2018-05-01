using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using School.Repository;
using School.Model;
using School.Service.Interface;
using School.Repository.Interface;

namespace School.Service
{
   public class UserProfileService : IUserProfileService
    {
        IUserProfileRepository _userRepo;
        public UserProfileService()
        {
            _userRepo = new UserProfileRepository();
        }

        public UserProfile GetUserProfile(long userId)
        {
            return _userRepo.GetUserProfile(userId);
        }

        public UserProfile ValidateUser(string email, string password)
        {
            return _userRepo.ValidateUser(email,password);
        }
    }
}
