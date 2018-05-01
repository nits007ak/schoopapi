using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.Entity
{
    [Table("ActivityType")]
    public class ActivityType
    {
        [Key]
        public int ActivityTypeId { get; set; }
        public string ActivityName { get; set; }
        public bool IsActive { get; set; }
    }

    [Table("ActivitySubType")]
    public class ActivitySubType
    {
        [Key]
        public int ActivitySubTypeId { get; set; }
        public int ActivityTypeId { get; set; }
        public string Name { get; set; }
       
    }

    [Table("ActivitySubTypeChild")]
    public class ActivitySubTypeChild
    {
        [Key]
        public int ActivitySubTypeChildId { get; set; }
        public int ActivitySubTypeId { get; set; }
        public string Name { get; set; }

    }

    [Table("ActivityDetails")]
    public class ActivityDetails
    {
        [Key]
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

    [Table("StudentActivityMapping")]
    public class StudentActivityMapping
    {
        [Key]
        public long ActivitiesMappingId { get; set; }
        public long ActivityDetailsId { get; set; }
        public bool IsStudentLevel { get; set; }
        public bool IsClassLevel { get; set; }
        public bool IsSchoolLevel { get; set; }
        public long StudentId { get; set; }
        public long? ClassId { get; set; }
    }
}
 