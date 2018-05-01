using School.Repository;
using School.Model;
using School.Repository.Interface;
using School.Service.Interface;
using System.Collections.Generic;

namespace School.Service
{
   public class SchoolService : ISchoolService
    {
        ISchoolRepository _schoolRepo;
        public SchoolService()
        {
            _schoolRepo = new SchoolRepository();
        }

        public SchoolBasicInfo InsertUpdatedSchool(SchoolBasicInfo schoolBasicInfo)
        {
            return _schoolRepo.InsertUpdatedSchool(schoolBasicInfo);
        }

        public List<SchoolBasicInfo> GetAllSchoolBasicInfo()
        {
            return _schoolRepo.GetAllSchoolBasicInfo();
        }

        public SchoolBasicInfo GetSchoolBasicInfoByUniqueId(string schoolUniqueId)
        {
            return _schoolRepo.GetSchoolBasicInfoByUniqueId(schoolUniqueId);
        }

        public SchoolOtherInfo InsertUpdateSchoolOtherInfo(SchoolOtherInfo schoolOtherInfo)
        {
            return _schoolRepo.InsertUpdateSchoolOtherInfo(schoolOtherInfo);
        }

        public SchoolOtherInfo GetSchoolOtherInfoByUniqueId(string schoolUniqueId)
        {
            return _schoolRepo.GetSchoolOtherInfoByUniqueId(schoolUniqueId);
        }
    }
}
