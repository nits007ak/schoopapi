using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.Model
{
    public class ActivityType
    {

        public ActivityType()
        {
            ActivitySubType = new List<ActivitySubType>();
        }

        public int ActivityTypeId { get; set; }
        public string ActivityName { get; set; }
        public bool IsActive { get; set; }
        public bool HasChild { get; set; }
        public List<ActivitySubType> ActivitySubType { get; set; }
    }

    public class ActivityParam
    {
        public int ActivityParamId { get; set; }
        public int ActivityTypeId { get; set; }
        public string ParamName { get; set; }
        public int? ParentId { get; set; }
        public bool IsActive { get; set; }
    }

     public class ActivityDetails
    {
         public long ActivityDetailsId { get; set; }
        public int ActivityTypeId { get; set; }
        public string ActivitySubTypeIds { get; set; }
        public string ActivitySubTypeChildIds { get; set; }
        public long StaffId { get; set; }
        public DateTime ActivityDateTime { get; set; }
        public bool IsActive { get; set; }
        public string Notes { get; set; }
        public string ImageURL { get; set; }
    }

     public class StudentActivityMapping
    {
         public long ActivitiesMappingId { get; set; }
        public long ActivityDetailsId { get; set; }
        public bool IsStudentLevel { get; set; }
        public bool IsClassLevel { get; set; }
        public bool IsSchoolLevel { get; set; }
        public long StudentId { get; set; }
        public long? ClassId { get; set; }
    }

    public class ActivityModel
    {
        public int ActivityTypeId { get; set; }
        public string ActivityName { get; set; }
        public int ActivitySubTypeId { get; set; }
        public string ActivitySubTypeName { get; set; }
        public int ActivitySubTypeChildId { get; set; }
        public string ChildName { get; set; }
        public int ActivityParamId { get; set; }
        public string ParamName { get; set; }
        public int? ParentId { get; set; }
        public bool IsActive { get; set; }
    }

    public class ActivityPostModel
    {
        [Required]
        public long  StaffId { get; set; }
        [Required]
        public DateTime ActivityDate { get; set; }
        [Required]
        public bool IsStudentLevel { get; set; }
        [Required]
        public bool IsClassLevel { get; set; }
        [Required]
        public bool IsSchoolLevel { get; set; }
        public List<long> StudentIds { get; set; }
        public string ImageStr { get; set; }
        public string ImageType { get; set; }
        public string ImageURL { get; set; }
        public string Notes { get; set; }
        public ActivityType ActivityType { get; set; }
        public long SchoolInfoId { get; set; }
        public long? ClassId { get; set; }
    }


   

    public class ActivitySubType
    {
        public ActivitySubType()
        {
            SubTypeChilds = new List<ActivitySubTypeChild>();
        }
 
        public int ActivityTypeId { get; set; }
        public int ActivitySubTypeId { get; set; }
        public string Name { get; set; }
        public bool HasChild { get; set; }
        public List<ActivitySubTypeChild> SubTypeChilds { get; set; }
    }


    public class ActivitySubTypeChild
    {
        public int ActivitySubTypeId { get; set; }
        public int ActivitySubTypeChildId { get; set; }
        public string Name { get; set; }
    }
}
 