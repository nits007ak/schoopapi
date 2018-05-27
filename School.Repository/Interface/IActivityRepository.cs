using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.Repository.Interface
{
    public interface IActivityRepository
    {
        List<Model.ActivityType> GetAllActivitiesList();
        bool InsertActivity(Model.ActivityPostModel activityPostModel);
        List<Model.NotificationType> GetAllNotificationList();
        bool InsertNotification(Model.NotificationPostModel notificationPostModel);
        List<Model.ActivityGetModel> GetAllActivitiesByStudentId(long studentId);
        string GetActivitySubType(string activitySubTypeIds);
        string GetActivitySubTypeChild(string activitySubTypeChildIds);
        List<Model.ActivityGetModel> GetAllActivitiesByClassId(long classId);
    }
}
