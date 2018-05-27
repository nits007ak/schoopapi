using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.Model
{
   public class SchoolBasicInfo
    {
        public long SchoolInfoId { get; set; }
        [Required]
        public long UserId { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]
        public string ContactNumber { get; set; }
        [Required]
        public string Address { get; set; }
        [Required]
        public string City { get; set; }
        [Required]
        public string State { get; set; }
        [Required]
        public string KeyContactName { get; set; }
        [Required]
        public string KeyDesignation { get; set; }
        
        public string SchoolUniqueId { get; set; }
        public DateTime UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
        public bool IsActive { get; set; }
        public string Password { get; set; }

    }

     public class SchoolUserMapping
    {
         public long MappingId { get; set; }
        public long SchoolInfoId { get; set; }
        public long UserId { get; set; }
    }

    public class SchoolOtherInfo
    {
        public long? SchoolOtherInfoId { get; set; }
        [Required]
        public long? SchoolInfoId { get; set; }
        public List<int> SchoolTypeIdList { get; set; }
        public int? BoardTypeId { get; set; }
        public string OtherContactName { get; set; }
        public string OtherEmail { get; set; }
        public string OtherContacNumber { get; set; }
        public string Designation { get; set; }
        public string Tagline { get; set; }
        public string Notes { get; set; }
        public DateTime? Validity { get; set; }
        public string logo { get; set; }
        public bool? AllowVideo { get; set; }
        public bool? AllowBranding { get; set; }
        public bool? AllowDocument { get; set; }
        public DateTime? UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
        public bool? IsActive { get; set; }
        public MultimediaFile MultimediaFile { get; set; }
        public string LogoURL { get; set; }
        public string SchoolTypeIds { get; set; }
    }

    public class SchoolModel
    {
        public SchoolModel()
        {
            SchoolBasicInfoModel = new SchoolBasicInfo();
            SchoolOtherInfoModel = new SchoolOtherInfo();

        }

        public SchoolBasicInfo SchoolBasicInfoModel { get; set; }
        public SchoolOtherInfo SchoolOtherInfoModel { get; set; }
    }


    public class SuperAdminSchool
    {
        public long UserId { get; set; }
        public long SchoolInfoId { get; set; }
    }

    
}
 