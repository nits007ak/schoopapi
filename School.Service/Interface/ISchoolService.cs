using School.Model;
using System.Collections.Generic;
 

namespace School.Service.Interface
{
   public interface ISchoolService
    {
        SchoolBasicInfo InsertUpdatedSchool(SchoolBasicInfo userProfile);
        List<SchoolBasicInfo> GetAllSchoolBasicInfo();
        SchoolBasicInfo GetSchoolBasicInfoByUniqueId(string schoolUniqueId);
        SchoolOtherInfo InsertUpdateSchoolOtherInfo(SchoolOtherInfo schoolOtherInfo);
        SchoolOtherInfo GetSchoolOtherInfoByUniqueId(string schoolUniqueId);
    }
}
