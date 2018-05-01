using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.Model
{
   public class Class
    {
        public long ClassId { get; set; }
        [Required]
        public long SchoolInfoId { get; set; }
        [Required]
        public string ClassName { get; set; }
        public bool IsActive { get; set; }
        public DateTime UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
        public int TotalStudent { get; set; }
    }

     public class StudentCheckin
    {
        public long CheckInId { get; set; }
        [Required]
        public long UserId { get; set; }
        [Required]
        public long StudentId { get; set; }
        [Required]
        public long ClassId { get; set; }
        [Required]
        public bool IsPresent { get; set; }
        public DateTime? CheckInDate { get; set; }
        public DateTime? UpdateDate { get; set; }
        public string UpdatedEmail { get; set; }
        public string ClassName { get; set; }
        public string Name { get; set; }
        public string StudentUniqueId { get; set; }
    }

    public class StudentClassModel
    {
        public long ClassId { get; set; }
        public List<long> StudentIds { get; set; }
    }
}
 