using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.Entity
{
    [Table("StaffInfo")]
    public class StaffInfo
    {
        [Key]
        public long StaffInfoId { get; set; }
        public long UserId { get; set; }
        public long SchoolInfoId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string MobileNumber { get; set; }
        public int StaffTypeId { get; set; }
        public string Address { get; set; }
        public int StaffSubTypeId { get; set; }
        public string OtherInfo { get; set; }
        public bool MarriedStatus { get; set; }
        public string Gender { get; set; }
        public Nullable<DateTime> Dob { get; set; }
        public Nullable<DateTime> DateOfJoining { get; set; }
        public Nullable<DateTime> DateOfLeaving { get; set; }
        public bool IsActive { get; set; }
        public bool IsAppSignUp { get; set; }
        public DateTime UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
    }
    [Table("StaffOtherInfo")]
    public class StaffOtherInfo
    {
        [Key]
        public long StaffOtherInfoId { get; set; }
        public long StaffInfoId { get; set; }
        public string HighEducation { get; set; }
        public string DegreeIds { get; set; }
        public string DegreeSepecialization { get; set; }
        public string SubjectIds { get; set; }
        public string Skills { get; set; }
        public string Awards { get; set; }
        public string Hobbies { get; set; }
        public DateTime UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
    }
    [Table("StaffExperience")]
    public class StaffExperience
    {
        [Key]
        public long StaffExperienceId { get; set; }
        public long StaffInfoId { get; set; }
        public DateTime FromDate { get; set; }
        public DateTime ToDate { get; set; }
        public int ExperienceTypeId { get; set; }
        public string Name { get; set; }
        public string Details { get; set; }
        public DateTime UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
    }
    [Table("StaffClasses")]
    public class StaffClasses
    {
        [Key]
        public long StaffClassesId { get; set; }
        public long StaffInfoId { get; set; }
        public long ClassId { get; set; }
        public DateTime UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
    }
    [Table("StaffDocument")]
    public class StaffDocument
    {
        [Key]
        public long StaffDocumentId { get; set; }
        public long StaffInfoId { get; set; }
        public string DocumentName { get; set; }
        public string DocumentCode { get; set; }
        public bool ManualVerification { get; set; }
        public string DocURL { get; set; }
        public string VerifiedBy { get; set; }
        public DateTime UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
    }
}
 
 
 