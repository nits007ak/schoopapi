using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace School.Entity
{
    [Table("Roles")]
    public class Roles
    {
        [Key]
        public long RoleID { get; set; }
        public string RoleName { get; set; }
    }
}
 