using AutoMapper;
using School.Repository.Interface;
using School.Utility;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.Repository
{
    public class StaffRepository : IStaffRepository
    {

        SchoolContext _schoolContext;
        public StaffRepository()
        {
            _schoolContext = new SchoolContext();
        }

        public Model.StaffInfo InsertUpdateStaff(Model.StaffInfo staffInfo)
        {
            try
            {
                var config = new MapperConfiguration(cfg => {
                    cfg.CreateMap<Model.StaffInfo, Entity.StaffInfo>();
                });
                IMapper mapper = config.CreateMapper();
                var staffInfoEntity = mapper.Map<Model.StaffInfo, Entity.StaffInfo>(staffInfo);

                if (staffInfoEntity.StaffInfoId == 0)
                {

                    Entity.UserProfile userProfile = new Entity.UserProfile
                    {
                        FirstName = staffInfoEntity.FirstName,
                        LastName = staffInfoEntity.LastName,
                        Email = staffInfoEntity.Email,
                        Password = Utilities.CreateRandomPassword(8),
                        ContactNumber = staffInfoEntity.MobileNumber,
                        RoleId = (int)_schoolContext.Roles.Where(r => r.RoleName == "Staff").Select(s => s.RoleID).FirstOrDefault(),
                        UserId = 0
                    };
                    _schoolContext.UserProfile.Add(userProfile);
                    _schoolContext.SaveChanges();
                    if (userProfile.UserId > 0)
                    {
                        staffInfoEntity.UserId = userProfile.UserId;
                        staffInfoEntity.IsActive = true;
                        _schoolContext.StaffInfo.Add(staffInfoEntity);
                        _schoolContext.SaveChanges();
                        staffInfo.StaffInfoId = staffInfoEntity.StaffInfoId;
                        staffInfo.IsActive = staffInfoEntity.IsActive;
                        staffInfo.UserId = userProfile.UserId;
                    }

                }
                else
                {
                    _schoolContext.Entry(staffInfoEntity).State = EntityState.Modified;
                    _schoolContext.SaveChanges();
                }

                return staffInfo;
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public List<Model.StaffInfo> GetAllStaffBySchoolInfoId(long schoolInfoId)
        {
            try
            {
                var config = new MapperConfiguration(cfg => {
                    cfg.CreateMap<Entity.StaffInfo, Model.StaffInfo>();
                });
                IMapper mapper = config.CreateMapper();
                return _schoolContext.StaffInfo.AsNoTracking().Where(s => s.SchoolInfoId == schoolInfoId)
                      .AsEnumerable().Select(s => mapper.Map<Entity.StaffInfo, Model.StaffInfo>(s)).ToList();
               
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public Model.StaffInfo GetStaffBasicInfoByStaffId(long staffInfoId)
        {
            try
            {
                var config = new MapperConfiguration(cfg => {
                    cfg.CreateMap<Entity.StaffInfo, Model.StaffInfo>();
                });
                IMapper mapper = config.CreateMapper();
                var staffBasicInfo= _schoolContext.StaffInfo.Where(s => s.StaffInfoId == staffInfoId).AsNoTracking()
                    .AsEnumerable().Select(s => mapper.Map<Entity.StaffInfo, Model.StaffInfo>(s)).FirstOrDefault();

                if (staffBasicInfo != null && staffBasicInfo.UserId > 0)
                {
                    staffBasicInfo.Password = _schoolContext.UserProfile
                    .Where(u => u.UserId == staffBasicInfo.UserId).Select(s => s.Password).FirstOrDefault();
                } 

                return staffBasicInfo;

            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public Model.StaffOtherInfo InsertUpdateStaffOtherInfo(Model.StaffOtherInfo staffOtherInfo)
        {
            try
            {
                var config = new MapperConfiguration(cfg => {
                    cfg.CreateMap<Model.StaffOtherInfo, Entity.StaffOtherInfo>();
                });
                IMapper mapper = config.CreateMapper();
                var staffOtherInfoEntity = mapper.Map<Model.StaffOtherInfo, Entity.StaffOtherInfo>(staffOtherInfo);
                if (staffOtherInfoEntity.StaffInfoId > 0)
                {
                    var isExist = _schoolContext.StaffOtherInfo.AsNoTracking().Where(s => s.StaffInfoId == staffOtherInfo.StaffInfoId).Any();
                    if (!isExist)
                    { 
                        _schoolContext.StaffOtherInfo.Add(staffOtherInfoEntity);
                        _schoolContext.SaveChanges();
                        staffOtherInfo.StaffInfoId = staffOtherInfoEntity.StaffInfoId;
                     }
                    else
                    {
                        _schoolContext.Entry(staffOtherInfoEntity).State = EntityState.Modified;
                        _schoolContext.SaveChanges(); 
                    }
                }
                 
                return staffOtherInfo;
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public Model.StaffOtherInfo GetStaffOtherInfoByStaffId(long staffInfoId)
        {
            try
            {
                var config = new MapperConfiguration(cfg => {
                    cfg.CreateMap<Entity.StaffOtherInfo, Model.StaffOtherInfo>();
                });
                IMapper mapper = config.CreateMapper();
                 
                return _schoolContext.StaffOtherInfo.Where(s => s.StaffInfoId == staffInfoId)
                .AsEnumerable().Select(s => mapper.Map<Entity.StaffOtherInfo, Model.StaffOtherInfo>(s)).FirstOrDefault();
               

            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public Model.StaffExperience InsertUpdateStaffExp(Model.StaffExperience staffExperience)
        {
            try
            {
                var config = new MapperConfiguration(cfg => {
                    cfg.CreateMap<Model.StaffExperience, Entity.StaffExperience>();
                });
                IMapper mapper = config.CreateMapper();
                var staffExpInfoEntity = mapper.Map<Model.StaffExperience, Entity.StaffExperience>(staffExperience);
                
                    var isExist = _schoolContext.StaffExperience.AsNoTracking().Where(s => s.StaffExperienceId == staffExperience.StaffExperienceId).Any();
                    if (!isExist)
                    {
                        _schoolContext.StaffExperience.Add(staffExpInfoEntity);
                        _schoolContext.SaveChanges();
                        staffExperience.StaffExperienceId = staffExpInfoEntity.StaffExperienceId;
                    }
                    else
                    {
                        _schoolContext.Entry(staffExpInfoEntity).State = EntityState.Modified;
                        _schoolContext.SaveChanges();
                    }
                 
                return staffExperience;
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public List<Model.StaffExperience> GetStaffExperienceByStaffId(long staffInfoId)
        {
            try
            {
                var config = new MapperConfiguration(cfg => {
                    cfg.CreateMap<Entity.StaffExperience, Model.StaffExperience>();
                });
                IMapper mapper = config.CreateMapper();

                return _schoolContext.StaffExperience.Where(s => s.StaffInfoId == staffInfoId)
                .AsEnumerable().Select(s => mapper.Map<Entity.StaffExperience, Model.StaffExperience>(s)).ToList();


            }
            catch (Exception ex)
            {

                throw;
            }
        }


        public bool InsertUpdatedStaffClass(Model.StaffClass staffClass)
        {
            try
            {
                
                foreach (long classId in staffClass.ClassIds)
                {
                    Entity.StaffClasses staffClassEntity = new Entity.StaffClasses
                    {
                        ClassId = classId,
                        StaffInfoId = staffClass.StaffInfoId,
                        UpdateDate = DateTime.Now,
                        UpdatedEmail = staffClass.UpdatedEmail
                    };

                    _schoolContext.StaffClasses.Add(staffClassEntity);
                }

                var staffExistClassList = _schoolContext.StaffClasses.Where(s => s.StaffInfoId == staffClass.StaffInfoId).ToList();
                if (staffExistClassList.Count > 0)
                {
                    _schoolContext.StaffClasses.RemoveRange(staffExistClassList);
                }
               
                 var result = _schoolContext.SaveChanges();
                if (result > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {

                throw;
            }
        }


        public Model.StaffClass GetStaffAllClassesByStaffId(long staffInfoId)
        {
            try
            {
                Model.StaffClass staffClassModel = new Model.StaffClass();
                staffClassModel.StaffInfoId = staffInfoId;
                //var config = new MapperConfiguration(cfg => {
                //    cfg.CreateMap<Entity.StaffClasses, Model.StaffClasses>();
                //});
                //IMapper mapper = config.CreateMapper();
                //return _schoolContext.StaffClasses.Where(s => s.StaffInfoId == staffInfoId)
                //.AsEnumerable().Select(s => mapper.Map<Entity.StaffClasses, Model.StaffClasses>(s)).ToList();

               staffClassModel.ClassIds= _schoolContext.StaffClasses.Where(s => s.StaffInfoId == staffInfoId).Select(c => c.ClassId).ToList();
                return staffClassModel;
            }
            catch (Exception ex)
            {
                throw;
            }
        }



        public Model.StaffDocument InsertStaffDocument(Model.StaffDocument staffDoc)
        {
            try
            {

                var config = new MapperConfiguration(cfg => {
                    cfg.CreateMap<Model.StaffDocument, Entity.StaffDocument>();
                });
                IMapper mapper = config.CreateMapper();
                var staffDocEntity = mapper.Map<Model.StaffDocument, Entity.StaffDocument>(staffDoc);
                 _schoolContext.StaffDocument.Add(staffDocEntity);
                _schoolContext.SaveChanges();
                if (staffDocEntity.StaffDocumentId > 0)
                {
                    staffDoc.StaffDocumentId = staffDocEntity.StaffDocumentId;
                }

                return staffDoc;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        public List<Model.StaffDocument> GetStaffAllDocumentByStaffId(long staffInfoId)
        {
            try
            {
                var config = new MapperConfiguration(cfg => {
                    cfg.CreateMap<Entity.StaffDocument, Model.StaffDocument>();
                });
                IMapper mapper = config.CreateMapper();
                return _schoolContext.StaffDocument.Where(s => s.StaffInfoId == staffInfoId)
                .AsEnumerable().Select(s => mapper.Map<Entity.StaffDocument, Model.StaffDocument>(s)).ToList();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public bool DeleteStaffIdById(long staffInfoId)
        {
            var result = 0;
            try
            {
                var st = _schoolContext.StaffInfo.Where(p => p.StaffInfoId == staffInfoId).FirstOrDefault();
                if (st != null)
                {
                    var staffOtherData = _schoolContext.StaffOtherInfo.Where(u => u.StaffInfoId == st.StaffInfoId).FirstOrDefault();
                    var staffClass = _schoolContext.StaffClasses.Where(u => u.StaffInfoId == st.StaffInfoId).ToList();
                    var staffExp = _schoolContext.StaffExperience.Where(u => u.StaffInfoId == st.StaffInfoId).ToList();
                    var staffDoc = _schoolContext.StaffDocument.Where(u => u.StaffInfoId == st.StaffInfoId).ToList();
                    var userProfile = _schoolContext.UserProfile.Where(u => u.UserId == st.UserId).FirstOrDefault();
                    _schoolContext.StaffOtherInfo.Remove(staffOtherData);
                    _schoolContext.StaffClasses.RemoveRange(staffClass);
                    _schoolContext.StaffExperience.RemoveRange(staffExp);
                    _schoolContext.StaffDocument.RemoveRange(staffDoc);
                    _schoolContext.StaffInfo.Remove(st);
                    _schoolContext.UserProfile.Remove(userProfile);
                    result = _schoolContext.SaveChanges();
                }

                if (result > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public bool DeleteStaffDocById(long staffDocId)
        {
            try
            {
               var staffDoc= _schoolContext.StaffDocument.Where(d => d.StaffDocumentId == staffDocId).FirstOrDefault();
                _schoolContext.StaffDocument.Remove(staffDoc);
                var result = _schoolContext.SaveChanges();
                if (result > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public bool DeleteStaffExperienceById(long staffExperienceId)
        {
            try
            {
                var staffExp = _schoolContext.StaffExperience.Where(d => d.StaffExperienceId == staffExperienceId).FirstOrDefault();
                _schoolContext.StaffExperience.Remove(staffExp);
                var result = _schoolContext.SaveChanges();
                if (result > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}
