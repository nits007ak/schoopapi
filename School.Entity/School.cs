using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace School.Entity
{
    [Table("SchoolBasicInfo")]
    public class SchoolBasicInfo
    {
        [Key]
        public long SchoolInfoId { get; set; }
        public long UserId { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string ContactNumber { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public bool IsActive { get; set; }
        public int BoardTypeId { get; set; }
        public string SchoolTypeIds { get; set; }
        public string SchoolUniqueId { get; set; }
        public DateTime UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
    }
    [Table("SchoolOtherInfo")]
    public class SchoolOtherInfo
    {
        [Key]
        public long SchoolOtherInfoId { get; set; }
        public long SchoolInfoId { get; set; }
        public string OtherContactName { get; set; }
        public string OtherEmail { get; set; }
        public string OtherContacNumber { get; set; }
        public string Designation { get; set; }
        public string Tagline { get; set; }
        public DateTime? Validity { get; set; }
        public string logo { get; set; }
        public bool? AllowVideo { get; set; }
        public bool? AllowBranding { get; set; }
        public bool? AllowDocument { get; set; }
        public DateTime? UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
        public bool? IsActive { get; set; }
    }
 


}
 