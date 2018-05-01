using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
 

namespace School.Entity
{
    [Table("Student")]
    public  class Student
    {
        [Key]
        public long StudentId { get; set; }
        public long SchoolInfoId { get; set; }
        public string StudentUniqueId { get; set; }
        public string Name { get; set; }
        public string Gender { get; set; }
        public DateTime DOB { get; set; }
        public bool IsActive { get; set; }
        public string AadharNumber { get; set; }
        public Nullable<long> ClassId { get; set; }
        public DateTime UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
        public string AppCode { get; set; }
    }
    [Table("StudentParent")]
    public class StudentParent
    {
        [Key]
        public long StudentParentId { get; set; }
        public long UserId { get; set; }
        public long StudentId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Gender { get; set; }
        public string Email { get; set; }
        public string MobileNumber { get; set; }
        public string ContactNumber { get; set; }
        public bool IsActive { get; set; }
        public bool IsAppSignUp { get; set; }
        public DateTime UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
    }

}
 