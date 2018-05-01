using School.Model;

namespace School.Repository.Interface
{
   public interface IUserProfileRepository
    {
        UserProfile GetUserProfile(long userId);
        UserProfile ValidateUser(string email, string password);
    }
}
