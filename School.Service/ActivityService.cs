using School.Service.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using School.Model;
using School.Repository.Interface;
using School.Repository;

namespace School.Service
{
    public class ActivityService : IActivityService
    {
        IActivityRepository _ActivityRepo;
        public ActivityService()
        {
            _ActivityRepo = new ActivityRepository();
        }
        public List<ActivityType> GetAllActivitiesList()
        {
            return _ActivityRepo.GetAllActivitiesList();
        }

        public bool InsertActivity(ActivityPostModel activityPostModel)
        {
            return _ActivityRepo.InsertActivity(activityPostModel);
        }
    }
}
