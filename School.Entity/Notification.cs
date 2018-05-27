using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace School.Entity
{
    [Table("NotificationType")]
    public class NotificationType
    {
        [Key]
        public int NotificationTypeId { get; set; }
        public string NotificationName { get; set; }
        public bool IsActive { get; set; }
    }
    [Table("NotificationsDetails")]
    public class NotificationsDetails
    {
        [Key]
        public long NotificationsDetailsId { get; set; }
        public int NotificationTypeId { get; set; }
        public long StaffInfoId { get; set; }
        public DateTime NotificationDate { get; set; }
        public string ImageUrl { get; set; }
        public string DocumentUrl { get; set; }
        public string Note { get; set; }
        public bool IsActive { get; set; }
    }
    [Table("StudentNotificationsMapping")]
    public class StudentNotificationsMapping
    {
        [Key]
        public long NotificationsMappingId { get; set; }
        public long NotificationsDetailsId { get; set; }
        public bool IsStudentLevel { get; set; }
        public bool IsClassLevel { get; set; }
        public bool IsSchoolLevel { get; set; }
        public long StudentId { get; set; }
        public long? ClassId { get; set; }
    }

}
 