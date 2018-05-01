﻿using School.Model;
using System.Collections.Generic;

namespace School.Repository.Interface
{
   public interface  ISchoolRepository
    {

        SchoolBasicInfo InsertUpdatedSchool(SchoolBasicInfo userProfile);
        List<SchoolBasicInfo> GetAllSchoolBasicInfo();
        SchoolBasicInfo GetSchoolBasicInfoByUniqueId(string schoolUniqueId);
        SchoolOtherInfo InsertUpdateSchoolOtherInfo(SchoolOtherInfo schoolOtherInfo);
        SchoolOtherInfo GetSchoolOtherInfoByUniqueId(string uniqueId);
     }
}