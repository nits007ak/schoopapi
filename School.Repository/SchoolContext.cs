using School.Entity;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.Repository
{
   public  class SchoolContext  : DbContext 
    {
        public SchoolContext() : base("SchoolContext")
        {

        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }

        public virtual DbSet<UserProfile> UserProfile { get; set; }
        public virtual DbSet<Roles> Roles { get; set; }
        public virtual DbSet<SchoolBasicInfo> SchoolBasicInfo { get; set; }
        public virtual DbSet<SchoolUserMapping> SchoolUserMapping { get; set; }
        public virtual DbSet<SchoolOtherInfo> SchoolOtherInfo { get; set; }
        public virtual DbSet<Class> Class { get; set; }
        public virtual DbSet<Student> Student { get; set; }
        public virtual DbSet<StudentParent> StudentParent { get; set; }
        public virtual DbSet<StaffInfo> StaffInfo { get; set; }
        public virtual DbSet<StaffOtherInfo> StaffOtherInfo { get; set; }
        public virtual DbSet<StaffExperience> StaffExperience { get; set; }
        public virtual DbSet<StaffClasses> StaffClasses { get; set; }
        public virtual DbSet<StaffDocument> StaffDocument { get; set; }
        public virtual DbSet<StudentCheckin> StudentCheckin { get; set; }
        public virtual DbSet<ActivityType> ActivityType { get; set; }
        public virtual DbSet<ActivitySubType> ActivitySubType { get; set; }
        public virtual DbSet<ActivitySubTypeChild> ActivitySubTypeChild { get; set; }
        public virtual DbSet<ActivityDetails> ActivityDetails { get; set; }
        public virtual DbSet<StudentActivityMapping> StudentActivityMapping { get; set; }
        public virtual DbSet<NotificationType> NotificationType { get; set; }
        public virtual DbSet<NotificationsDetails> NotificationsDetails { get; set; }
        public virtual DbSet<StudentNotificationsMapping> StudentNotificationsMapping { get; set; }
    }
}

 