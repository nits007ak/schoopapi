using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.Model
{
     public class NotificationType
    {
        public int NotificationTypeId { get; set; }
        public string NotificationName { get; set; }
        public bool IsActive { get; set; }
    }
     public class NotificationsDetails
    {
         public long NotificationsDetailsId { get; set; }
        public int NotificationTypeId { get; set; }
        public long StaffInfoId { get; set; }
        public DateTime NotificationDate { get; set; }
        public string ImageUrl { get; set; }
        public string DocumentUrl { get; set; }
        public string Note { get; set; }
        public bool IsActive { get; set; }
    }
     public class StudentNotificationsMapping
    {
         public long NotificationsMappingId { get; set; }
        public long NotificationsDetailsId { get; set; }
        public bool IsStudentLevel { get; set; }
        public bool IsClassLevel { get; set; }
        public bool IsSchoolLevel { get; set; }
        public long StudentId { get; set; }
        public long? ClassId { get; set; }
    }

    public class NotificationPostModel
    {
        [Required]
        public long StaffId { get; set; }
        [Required]
        public DateTime NotificationDate { get; set; }
        public bool IsStudentLevel { get; set; }
        public bool IsClassLevel { get; set; }
        public bool IsSchoolLevel { get; set; }
        public List<long> StudentIds { get; set; }
        public string ImageStr { get; set; }
        public string ImageType { get; set; }
        public string ImageURL { get; set; } 
        public string DocStr { get; set; }
        public string DocType { get; set; }
        public string DocURL { get; set; }
        public string Notes { get; set; }
        public NotificationType NotificationType { get; set; }
        public long SchoolInfoId { get; set; }
        public long? ClassId { get; set; }
    }
}
 