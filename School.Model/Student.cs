using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.Model
{
   public  class Student
    {
        public long StudentId { get; set; }
        [Required]
        public long SchoolInfoId { get; set; }
        public string StudentUniqueId { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Gender { get; set; }
        [Required]
        public DateTime DOB { get; set; }
        public bool IsActive { get; set; }
        public string AadharNumber { get; set; }
        public Nullable<long> ClassId { get; set; }
        public DateTime UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
        public string AppCode { get; set; }
        public string ClassName { get; set; }
        public DateTime? AppCodeCreatedDate { get; set; }
        public List<StudentParent> ParentProfile { get; set; }
    }

    public class StudentParent
    {
        public long StudentParentId { get; set; }
        public long UserId { get; set; }
        [Required]
        public long StudentId { get; set; }
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        [Required]
        public string Gender { get; set; }
         [Required]
        public string Email { get; set; }
        [Required]
        public string MobileNumber { get; set; }
        public string ContactNumber { get; set; }
        public bool IsActive { get; set; }
        public bool IsAppSignUp { get; set; }
        public DateTime UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
        public string Password { get; set; }
    }

   

    public class AppCodeModel
    {
        public long StudentId { get; set; }
        public string AppCode { get; set; }
    }

}
 