using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.Model
{
   public class NotificationType
    {

        public long NotificationTypeId { get; set; }
        public string NotificationName { get; set; }
        public bool IsActive { get; set; }
    }

    public class NotificationsDetails
    {
        public long NotificationsDetailsId { get; set; }
        public long NotificationTypeId { get; set; }
        public long StaffInfoId { get; set; }
        public DateTime NotificationDate { get; set; }
        public string ImageUrl { get; set; }
        public string DocumentUrl { get; set; }
        public string Note { get; set; }
        public bool IsActive { get; set; }
    }
    public class NotificationsLevel
    {
        public long NotificationsLevelId { get; set; }
        public long NotificationsDetailsId { get; set; }
        public bool IsStudentLevel { get; set; }
        public bool IsClassLevel { get; set; }
        public bool IsSchoolLevel { get; set; }
        public long Id { get; set; }
    }

}
 