using School.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.Service.Interface
{
   public interface IUserProfileService
    {
        UserProfile GetUserProfile(long userId);
        UserProfile ValidateUser(string email, string password);
    }
}
