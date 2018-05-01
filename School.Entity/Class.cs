using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace School.Entity
{
    [Table("Class")]
    public class Class
    {
        [Key]
        public long ClassId { get; set; }
        public long SchoolInfoId { get; set; }
        public string ClassName { get; set; }
        public bool IsActive { get; set; }
        public DateTime UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
    }

    [Table("StudentCheckin")]
    public class StudentCheckin
    {
        [Key]
        public long CheckInId { get; set; }
        public long? UserId { get; set; }
        public long StudentId { get; set; }
        public long ClassId { get; set; }
        public bool IsPresent { get; set; }
        public DateTime? CheckInDate { get; set; }
        public DateTime? UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
    }
}
 