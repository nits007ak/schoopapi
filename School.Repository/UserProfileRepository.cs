using System.Linq;
using Model = School.Model;
using Entity = School.Entity;
using System.Data.Sql;
using School.Model;
using School.Repository.Interface;

namespace School.Repository
{

   public class UserProfileRepository : IUserProfileRepository
    {
        SchoolContext _schoolContext;

     public  UserProfileRepository()
        {
            _schoolContext = new SchoolContext();
        }

        

        public UserProfile GetUserProfile(long userId)
        {
            try
            {
                var objUserModel = new UserProfile();
                
                    objUserModel = _schoolContext.UserProfile.Join(_schoolContext.Roles, u => u.RoleId, r => r.RoleID, (u, r) => new Model.UserProfile
                    {
                        UserId = u.UserId,
                        FirstName = u.FirstName,
                        LastName = u.LastName,
                        Email = u.Email,
                        Password = u.Password,
                        ContactNumber = u.ContactNumber,
                        RoleId = u.RoleId,
                        RoleName = r.RoleName
                    }).Where(u => u.UserId == userId).FirstOrDefault();

                   
             
               
                return objUserModel;
            }
            catch (System.Exception ex)
            {
                var x = ex;
                throw;
            }
            

        }

       

        public UserProfile ValidateUser(string email, string password)
        {
            
            UserProfile objUserModel =null;
            objUserModel = _schoolContext.UserProfile.Join(_schoolContext.Roles, u => u.RoleId, r => r.RoleID, (u, r) => new Model.UserProfile
            {
                UserId = u.UserId,
                FirstName = u.FirstName,
                LastName = u.LastName,
                Email = u.Email,
                Password = u.Password,
                ContactNumber = u.ContactNumber,
                RoleId = u.RoleId,
                RoleName = r.RoleName
            }).Where(u => u.Email == email.Trim() && u.Password == password.Trim()).FirstOrDefault();

            if (objUserModel != null)
            {
                if (objUserModel.RoleName == "Staff")
                {
                    objUserModel.SchoolInfoId = _schoolContext.StaffInfo.Where(s => s.UserId == objUserModel.UserId).Select(s => s.SchoolInfoId).FirstOrDefault();
                }

                if (objUserModel.RoleName == "SchoolAdmin")
                {
                    objUserModel.SchoolInfoId = _schoolContext.SchoolBasicInfo.Where(s => s.UserId == objUserModel.UserId).Select(s => s.SchoolInfoId).FirstOrDefault();
                }

            }

            return objUserModel;
             
        }

         
       
    }
}
