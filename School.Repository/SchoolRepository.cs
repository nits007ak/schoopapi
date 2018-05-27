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
using System.Data;

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
                if (schoolInfo.SchoolInfoId == 0)
                {
                    using (var dbContextTransaction = _schoolContext.Database.BeginTransaction())
                    {
                        try
                        {
                            Entity.UserProfile userProfile = new Entity.UserProfile
                            {
                                FirstName = string.Empty,
                                LastName = string.Empty,
                                Email = schoolInfo.Email,
                                Password = Utilities.CreateRandomPassword(8),
                                ContactNumber = schoolInfo.ContactNumber,
                                RoleId = (int)_schoolContext.Roles.Where(r => r.RoleName == "SchoolAdmin").Select(s => s.RoleID).FirstOrDefault(),
                                UserId = 0
                            };
                            _schoolContext.UserProfile.Add(userProfile);
                            _schoolContext.SaveChanges();
                            schoolInfo.IsActive = true;
                            _schoolContext.SchoolBasicInfo.Add(schoolInfo);
                            _schoolContext.SaveChanges();
                            if (userProfile.UserId > 0 && schoolInfo.SchoolInfoId > 0)
                            {
                                Entity.SchoolUserMapping schoolUserMapping = new Entity.SchoolUserMapping
                                {
                                    SchoolInfoId = schoolInfo.SchoolInfoId,
                                    UserId = userProfile.UserId
                                };
                                _schoolContext.SchoolUserMapping.Add(schoolUserMapping);
                            }

                            _schoolContext.SaveChanges(); 
                            schoolBasicInfo.SchoolInfoId = schoolInfo.SchoolInfoId;
                            schoolBasicInfo.IsActive = schoolInfo.IsActive;
                            schoolBasicInfo.UserId = userProfile.UserId;

                            dbContextTransaction.Commit();

                        }
                        catch (Exception ex)
                        {
                            dbContextTransaction.Rollback();
                            throw ex;
                        }
                       
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
                if (schoolBasicInfo != null && schoolBasicInfo.SchoolInfoId > 0)
                {
                    var result = _schoolContext.SchoolUserMapping.Join(_schoolContext.UserProfile, s => s.UserId,u => u.UserId, (s,u) => new  {
                        u.Password,u.UserId,s.SchoolInfoId,u.RoleId
                    })
                    .Where(s => s.SchoolInfoId == schoolBasicInfo.SchoolInfoId && s.RoleId != 1).Select(s => s).FirstOrDefault();

                    schoolBasicInfo.UserId = result.UserId;
                    schoolBasicInfo.Password = result.Password;
                }
                

                return schoolBasicInfo;


            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public Model.SchoolModel GetSchoolBasicInfoById(long schoolInfoId)
        {
            try
            {
                
                var objUserModel = new SchoolModel(); 
               objUserModel = (from s in _schoolContext.SchoolBasicInfo
                              join c in _schoolContext.SchoolOtherInfo on s.SchoolInfoId equals c.SchoolInfoId into g
                              from o in g.DefaultIfEmpty()
                              where s.SchoolInfoId == schoolInfoId
                              select new Model.SchoolModel
                              {
                                  SchoolBasicInfoModel = new Model.SchoolBasicInfo
                                  {
                                      Address = s.Address,
                                      City = s.City,
                                      ContactNumber = s.ContactNumber,
                                      Email = s.Email,
                                      IsActive = s.IsActive,
                                      Name = s.Name,
                                      SchoolInfoId = s.SchoolInfoId,
                                      SchoolUniqueId = s.SchoolUniqueId,
                                      KeyContactName = s.KeyContactName,
                                      KeyDesignation = s.KeyDesignation,

                                  },
                                  SchoolOtherInfoModel = new Model.SchoolOtherInfo
                                  {
                                      BoardTypeId = o.BoardTypeId ?? 0,
                                      SchoolTypeIds = o.SchoolTypeIds,
                                      LogoURL = o.logo,
                                      AllowBranding = o.AllowBranding,
                                      AllowDocument = o.AllowDocument,
                                      AllowVideo = o.AllowVideo,
                                      Designation = o.Designation,
                                      IsActive = o.IsActive,
                                      OtherContacNumber = o.OtherContacNumber,
                                      OtherEmail = o.OtherEmail,
                                      OtherContactName = o.OtherContactName,
                                      SchoolOtherInfoId = o.SchoolOtherInfoId ?? 0,
                                      Tagline = o.Tagline,
                                      Validity = o.Validity,
                                      logo = o.logo
                                  }
                              }).FirstOrDefault();

                return objUserModel; 

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
                        schoolOtherInfoEntity.SchoolTypeIds = string.Join("|", schoolOtherInfo.SchoolTypeIdList);
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

        public bool AddSuperAdminSchool(long userId,long schoolInfoId)
        {
            try
            {
                Entity.SchoolUserMapping schoolUserMapping = new Entity.SchoolUserMapping
                {
                    UserId = userId,
                    SchoolInfoId = schoolInfoId
                };

                _schoolContext.SchoolUserMapping.Add(schoolUserMapping);
                _schoolContext.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {

                throw ex;
            }


        }

        public bool DeleteSuperAdminSchool(long userId)
        {
            try
            {
                var result = _schoolContext.SchoolUserMapping.Where(s => s.UserId == userId).FirstOrDefault();
                _schoolContext.SchoolUserMapping.Remove(result);
                _schoolContext.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
