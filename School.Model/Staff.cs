using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.Model
{
   public class StaffInfo
    {
        public long StaffInfoId { get; set; }
        public long UserId { get; set; }
        [Required]
        public long SchoolInfoId { get; set; }
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]
        public string MobileNumber { get; set; }
        [Required]
        public int StaffTypeId { get; set; }
        [Required]
        public string Address { get; set; }
        public int StaffSubTypeId { get; set; }
        public string OtherInfo { get; set; }
        [Required]
        public bool MarriedStatus { get; set; }
        [Required]
        public string Gender { get; set; }
        public Nullable<DateTime> Dob { get; set; }
        public Nullable<DateTime> DateOfJoining { get; set; }
        public Nullable<DateTime> DateOfLeaving { get; set; }
        public bool IsActive { get; set; }
        public bool IsAppSignUp { get; set; }
        public DateTime UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
    }

    public class StaffOtherInfo
    {
        public StaffOtherInfo()
        {
            DegreeIdList = new List<int>();
            SubjectIdList = new List<int>();
        }
        public long StaffOtherInfoId { get; set; }
        [Required]
        public long StaffInfoId { get; set; }
        [Required]
        public string HighEducation { get; set; }
         public string DegreeIds { get; set; }
        [Required]
        public string DegreeSepecialization { get; set; }
         public string SubjectIds { get; set; }
        public string Skills { get; set; }
        public string Awards { get; set; }
        public string Hobbies { get; set; }
        public DateTime UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
        [Required]
        public List<int> DegreeIdList { get; set; }
        [Required]
        public List<int> SubjectIdList { get; set; }
    }

    public class StaffExperience
    {
        public long StaffExperienceId { get; set; }
        [Required]
        public long StaffInfoId { get; set; }
        [Required]
        public DateTime FromDate { get; set; }
        [Required]
        public DateTime ToDate { get; set; }
        [Required]
        public int ExperienceTypeId { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Details { get; set; }
        public DateTime UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
    }

    public class StaffClasses
    {
        [Required]
        public long StaffInfoId { get; set; }
        public long ClassId { get; set; }
        public DateTime UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
    }
    public class StaffDocument
    {

        public long StaffDocumentId { get; set; }
        [Required]
        public long StaffInfoId { get; set; }
        [Required]
        public string DocumentName { get; set; }
        [Required]
        public string DocumentCode { get; set; }
        public bool ManualVerification { get; set; }
        public string DocURL { get; set; }
        public string VerifiedBy { get; set; }
        public DateTime UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
        [Required]
        public MultimediaFile MultimediaFile { get; set; }
    }

    public class StaffClass
    {
        [Required]
        public long StaffInfoId { get; set; }
        public List<long> ClassIds { get; set; }
        public DateTime UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
    }
}
 
 
 