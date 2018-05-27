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

        public string GetActivitySubType(string activitySubTypeIds)
        {
            return _ActivityRepo.GetActivitySubType(activitySubTypeIds);
        }

        public string GetActivitySubTypeChild(string activitySubTypeChildIds)
        {
            return _ActivityRepo.GetActivitySubTypeChild(activitySubTypeChildIds);
        }

        public List<ActivityGetModel> GetAllActivitiesByClassId(long classId)
        {
            return _ActivityRepo.GetAllActivitiesByClassId(classId);
        }

        public List<ActivityGetModel> GetAllActivitiesByStudentId(long studentId)
        {
            return _ActivityRepo.GetAllActivitiesByStudentId(studentId);
        }

        public List<ActivityType> GetAllActivitiesList()
        {
            return _ActivityRepo.GetAllActivitiesList();
        }

        public List<NotificationType> GetAllNotificationList()
        {
            return _ActivityRepo.GetAllNotificationList();
        }

        public bool InsertActivity(ActivityPostModel activityPostModel)
        {
            return _ActivityRepo.InsertActivity(activityPostModel);
        }

        public bool InsertNotification(NotificationPostModel notificationPostModel)
        {
            return _ActivityRepo.InsertNotification(notificationPostModel);
        }
    }
}
