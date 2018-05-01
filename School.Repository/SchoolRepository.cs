using School.Repository.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using School.Model;
using School.Entity;
using AutoMapper;
using System.Data.Entity;
using School.Utility;

namespace School.Repository
{
   public class SchoolRepository : ISchoolRepository
    {
        SchoolContext _schoolContext;

        public SchoolRepository()
        {
            _schoolContext = new SchoolContext();
        }

        public Model.SchoolBasicInfo InsertUpdatedSchool(Model.SchoolBasicInfo schoolBasicInfo)
        {
            try
            {
                var config = new MapperConfiguration(cfg => {
                    cfg.CreateMap<Model.SchoolBasicInfo, Entity.SchoolBasicInfo>();
                });
                IMapper mapper = config.CreateMapper();
                var schoolInfo = mapper.Map <Model.SchoolBasicInfo, Entity.SchoolBasicInfo>(schoolBasicInfo);
                schoolInfo.SchoolTypeIds = string.Join("|", schoolBasicInfo.SchoolTypeIdList);
                schoolBasicInfo.SchoolTypeIds = schoolInfo.SchoolTypeIds;
                if (schoolInfo.SchoolInfoId == 0)
                {
                    Entity.UserProfile userProfile = new Entity.UserProfile
                    {
                        FirstName = string.Empty,
                        LastName = string.Empty,
                        Email = schoolInfo.Email,
                        Password = Utilities.CreateRandomPassword(8),
                        ContactNumber = schoolInfo.ContactNumber,
                        RoleId = 2,
                        UserId = 0
                    };
                    _schoolContext.UserProfile.Add(userProfile);
                    _schoolContext.SaveChanges();
                    if (userProfile.UserId > 0)
                    {
                        schoolInfo.UserId = userProfile.UserId;
                        schoolInfo.IsActive = true;
                        _schoolContext.SchoolBasicInfo.Add(schoolInfo);
                        _schoolContext.SaveChanges();
                        schoolBasicInfo.SchoolInfoId = schoolInfo.SchoolInfoId;
                        schoolBasicInfo.IsActive = schoolInfo.IsActive;
                        schoolBasicInfo.UserId = userProfile.UserId;
                    }

                   

                }
                else
                {
                    _schoolContext.Entry(schoolInfo).State = EntityState.Modified;
                     _schoolContext.SaveChanges();

                }

                return schoolBasicInfo;
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public List<Model.SchoolBasicInfo> GetAllSchoolBasicInfo()
        {
            try
            {
                var config = new MapperConfiguration(cfg => {
                    cfg.CreateMap<Entity.SchoolBasicInfo, Model.SchoolBasicInfo>();
                });
                IMapper mapper = config.CreateMapper();
                return _schoolContext.SchoolBasicInfo.AsNoTracking()
                    .AsEnumerable().Select(s => mapper.Map<Entity.SchoolBasicInfo, Model.SchoolBasicInfo>(s)).ToList();
               
            }
            catch (Exception ex)
            {

                throw;
            }
        }


        public Model.SchoolBasicInfo GetSchoolBasicInfoByUniqueId(string uniqueId)
        {
            try
            {
                var config = new MapperConfiguration(cfg => {
                    cfg.CreateMap<Entity.SchoolBasicInfo, Model.SchoolBasicInfo>();
                });
                IMapper mapper = config.CreateMapper();
                var schoolBasicInfo= _schoolContext.SchoolBasicInfo.Where(s => s.SchoolUniqueId == uniqueId).AsNoTracking()
                    .AsEnumerable().Select(s => mapper.Map<Entity.SchoolBasicInfo, Model.SchoolBasicInfo>(s)).FirstOrDefault();
                if (schoolBasicInfo != null && schoolBasicInfo.UserId > 0)
                {
                    schoolBasicInfo.Password = _schoolContext.UserProfile
                    .Where(u => u.UserId == schoolBasicInfo.UserId).Select(s => s.Password).FirstOrDefault();
                }
                

                return schoolBasicInfo;


            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public Model.SchoolOtherInfo InsertUpdateSchoolOtherInfo(Model.SchoolOtherInfo schoolOtherInfo)
        {
            try
            {
                var config = new MapperConfiguration(cfg => {
                    cfg.CreateMap<Model.SchoolOtherInfo, Entity.SchoolOtherInfo>();
                });
                IMapper mapper = config.CreateMapper();
                var schoolOtherInfoEntity = mapper.Map<Model.SchoolOtherInfo, Entity.SchoolOtherInfo>(schoolOtherInfo);
                if (schoolOtherInfoEntity.SchoolInfoId > 0)
                {
                    var isExist = _schoolContext.SchoolOtherInfo.AsNoTracking().Where(s => s.SchoolInfoId == schoolOtherInfoEntity.SchoolInfoId).Any();
                    if (!isExist)
                    {
                        schoolOtherInfoEntity.IsActive = true;
                        _schoolContext.SchoolOtherInfo.Add(schoolOtherInfoEntity);
                        _schoolContext.SaveChanges();
                        schoolOtherInfo.SchoolOtherInfoId = schoolOtherInfoEntity.SchoolOtherInfoId;
                        schoolOtherInfo.IsActive = schoolOtherInfoEntity.IsActive;
                    }
                    else
                    {
                         
                        _schoolContext.Entry(schoolOtherInfoEntity).State = EntityState.Modified;
                        _schoolContext.SaveChanges();

                        if (schoolOtherInfo.IsActive != null && schoolOtherInfo.IsActive == false)
                        {
                            var schoolBasicInfo = _schoolContext.SchoolBasicInfo.Where(s => s.SchoolInfoId == schoolOtherInfoEntity.SchoolInfoId).FirstOrDefault();
                            schoolBasicInfo.IsActive = false;
                            _schoolContext.SaveChanges();
                        }
                    }
                }
                

                return schoolOtherInfo;
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public Model.SchoolOtherInfo GetSchoolOtherInfoByUniqueId(string uniqueId)
        {
            try
            {
                var config = new MapperConfiguration(cfg => {
                    cfg.CreateMap<Entity.SchoolOtherInfo, Model.SchoolOtherInfo>();
                });
                IMapper mapper = config.CreateMapper();

                var schoolId=_schoolContext.SchoolBasicInfo.AsNoTracking().Where(s => s.SchoolUniqueId == uniqueId).Select(s => s.SchoolInfoId).FirstOrDefault();
                if (schoolId > 0)
                {
                    return _schoolContext.SchoolOtherInfo.Where(s => s.SchoolInfoId == schoolId)
                    .AsEnumerable().Select(s => mapper.Map<Entity.SchoolOtherInfo, Model.SchoolOtherInfo>(s)).FirstOrDefault();
                }
                else
                {
                    return null;
                }
                

            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}
