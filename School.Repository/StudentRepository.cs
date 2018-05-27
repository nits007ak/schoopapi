
using AutoMapper;
using School.Repository.Interface;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using School.Utility;
namespace School.Repository
{
    public class StudentRepository : IStudentRepository
    {
        SchoolContext _schoolContext;
        public StudentRepository()
        {
            _schoolContext = new SchoolContext();
        }

        public Model.Student InsertUpdateStudent(Model.Student student)
        {
            try
            {
                var config = new MapperConfiguration(cfg => {
                    cfg.CreateMap<Model.Student, Entity.Student>();
                });
                IMapper mapper = config.CreateMapper();
                var studentEntity = mapper.Map<Model.Student, Entity.Student>(student);

                if (studentEntity.StudentId == 0)
                {
                    studentEntity.IsActive = true;
                    _schoolContext.Student.Add(studentEntity);
                    _schoolContext.SaveChanges();
                    student.StudentId = studentEntity.StudentId;
                    student.IsActive = studentEntity.IsActive;

                }
                else
                {
                    _schoolContext.Entry(studentEntity).State = EntityState.Modified;
                    _schoolContext.SaveChanges();

                }

                return student;
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public List<Model.Student> GetAllStudentSchoolInfoId(long schoolInfoId)
        {
            try
            {
 
                var result = (from st in _schoolContext.Student
                              join room in _schoolContext.Class on st.ClassId equals room.ClassId into rmst
                              from ro in rmst.DefaultIfEmpty()
                              where st.SchoolInfoId == schoolInfoId
                              select new Model.Student
                              {
                                  AadharNumber=st.AadharNumber,
                                  ClassId=st.ClassId,
                                  ClassName=ro.ClassName,
                                  DOB=st.DOB,
                                  IsActive=st.IsActive,
                                  Name=st.Name,
                                  SchoolInfoId=st.SchoolInfoId,
                                  StudentId=st.StudentId,
                                  StudentUniqueId=st.StudentUniqueId,
                                  UpdateDate=st.UpdateDate,
                                  UpdatedEmail=st.UpdatedEmail
                                   
                              }
                              ).ToList();
                return result;

            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public Model.Student GetStudentProfileById(long studentId)
        {
            try
            {
                var config = new MapperConfiguration(cfg => {
                    cfg.CreateMap<Entity.Student, Model.Student>();
                });
                IMapper mapper = config.CreateMapper(); 
              return _schoolContext.Student.AsNoTracking().Where(s => s.StudentId == studentId)
                    .AsEnumerable().Select(s => mapper.Map<Entity.Student, Model.Student>(s)).FirstOrDefault();
               
            }
            catch (Exception  ex)
            {

                throw;
            }
        }


        public Model.StudentParent InsertUpdateStudentParent(Model.StudentParent stParent)
        {
            try
            {
                var config = new MapperConfiguration(cfg => {
                    cfg.CreateMap<Model.StudentParent, Entity.StudentParent>();
                });
                IMapper mapper = config.CreateMapper();
                var stParentEntity = mapper.Map<Model.StudentParent, Entity.StudentParent>(stParent);
                if (stParentEntity.StudentParentId == 0)
                {
                    
                     Entity.UserProfile userProfile = new Entity.UserProfile
                    {
                        FirstName = stParentEntity.FirstName,
                        LastName = stParentEntity.LastName,
                        Email = stParentEntity.Email,
                        Password = Utilities.CreateRandomPassword(8),
                        ContactNumber = stParentEntity.MobileNumber,
                        RoleId = (int)_schoolContext.Roles.Where(r => r.RoleName == "Parent").Select(s => s.RoleID).FirstOrDefault(),
                         UserId =0
                    };
                    _schoolContext.UserProfile.Add(userProfile);
                    _schoolContext.SaveChanges();
                    if (userProfile.UserId > 0)
                    {
                        stParentEntity.UserId = userProfile.UserId;
                        stParentEntity.IsActive = true;
                        _schoolContext.StudentParent.Add(stParentEntity);
                        _schoolContext.SaveChanges();
                        stParent.StudentParentId = stParentEntity.StudentParentId;
                        stParent.IsActive = stParentEntity.IsActive;
                        stParent.UserId = userProfile.UserId;
                        stParent.Password = userProfile.Password;
                    }
                    
                }
                else
                {
                     _schoolContext.Entry(stParentEntity).State = EntityState.Modified;
                    _schoolContext.SaveChanges();
                }
                return stParent;
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public  List<Model.Student> GetAllStudentWithParent(long schoolInfoId)
        {
            List<Model.Student> stParentList = new List<Model.Student>();

            var config = new MapperConfiguration(cfg => {
                cfg.CreateMap<Entity.Student, Model.Student>();
            });
            IMapper mapper = config.CreateMapper();
            try
            {
                Model.Student stParentModel = null;
               var allStudent= _schoolContext.Student.Where(s => s.SchoolInfoId == schoolInfoId).ToList();
                foreach (Entity.Student st in allStudent)
                {
                    stParentModel = new Model.Student();
                    stParentModel = _schoolContext.Student.AsNoTracking().Where(s => s.StudentId == st.StudentId)
                    .AsEnumerable().Select(s => mapper.Map<Entity.Student, Model.Student>(s)).FirstOrDefault();

                    //stParentModel.ParentProfile=  _schoolContext.StudentParent.AsNoTracking().Where(s => s.StudentId == st.StudentId)
                    //.AsEnumerable().Select(s => mapper.Map<Entity.StudentParent, Model.StudentParent>(s)).ToList();

                    stParentModel.ParentProfile = _schoolContext.StudentParent.Join(_schoolContext.UserProfile, p => p.UserId, u => u.UserId, (p, u) => new Model.StudentParent
                    {
                        ContactNumber = p.ContactNumber,
                        UserId = u.UserId,
                        Email = u.Email,
                        FirstName = p.FirstName,
                        Gender = p.Gender,
                        IsActive = p.IsActive,
                        IsAppSignUp = p.IsAppSignUp,
                        LastName = p.LastName,
                        MobileNumber = p.MobileNumber,
                        Password = u.Password,
                        StudentId = p.StudentId,
                        StudentParentId = p.StudentParentId,
                        UpdateDate = p.UpdateDate,
                        UpdatedEmail = p.UpdatedEmail
                    }).Where(p => p.StudentId == st.StudentId).ToList();

                    stParentList.Add(stParentModel);
                }
            }
            catch (Exception ex)
            {

                throw;
            }

            return stParentList;
        }


        public List<Model.StudentParent> GetStudentParentById(long studentId)
        {
            try
            {
                var config = new MapperConfiguration(cfg => {
                    cfg.CreateMap<Entity.StudentParent, Model.StudentParent>();
                });
                IMapper mapper = config.CreateMapper();
                //return _schoolContext.StudentParent.AsNoTracking().Where(s => s.StudentId == studentId)
                //      .AsEnumerable().Select(s => mapper.Map<Entity.StudentParent, Model.StudentParent>(s)).ToList();

                var objParentModel = new List<Model.StudentParent>();

                objParentModel = _schoolContext.StudentParent.Join(_schoolContext.UserProfile, p => p.UserId, u => u.UserId, (p,u) => new Model.StudentParent
                {
                    ContactNumber=p.ContactNumber,
                    UserId=u.UserId,
                    Email=u.Email,
                    FirstName=p.FirstName,
                    Gender=p.Gender,
                    IsActive=p.IsActive,
                    IsAppSignUp=p.IsAppSignUp,
                    LastName=p.LastName,
                    MobileNumber=p.MobileNumber,
                    Password=u.Password,
                    StudentId=p.StudentId,
                    StudentParentId=p.StudentParentId,
                    UpdateDate=p.UpdateDate,
                    UpdatedEmail=p.UpdatedEmail
                }).Where(p => p.StudentId == studentId).ToList();

                return objParentModel;

            }
            catch (Exception ex)
            {

                throw;
            }
        }


        public bool updateStudentAppCode(long studentId,string appCode)
        {
            try
            {
                 var std = _schoolContext.Student.Where(s => s.StudentId == studentId).First();
                std.AppCodeCreatedDate = DateTime.Now;
                std.AppCode = appCode;
                 var result= _schoolContext.SaveChanges();
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
        public bool DeleteParentById(long parentId)
        {
            var result = 0;
            try
            {
                var parent = _schoolContext.StudentParent.Where(p => p.StudentParentId == parentId).FirstOrDefault();
                if (parent != null)
                {
                    var userProfile = _schoolContext.UserProfile.Where(u => u.UserId == parent.UserId).FirstOrDefault();
                    _schoolContext.UserProfile.Remove(userProfile);
                    _schoolContext.StudentParent.Remove(parent);
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

        public bool DeleteStudentById(long studentId)
        {
            var result = 0;
            try
            {
                var st = _schoolContext.Student.Where(p => p.StudentId == studentId).FirstOrDefault();
                if (st != null)
                {
                    var stCheckinData = _schoolContext.StudentCheckin.Where(u => u.StudentId == st.StudentId).ToList();
                    var stParentData = _schoolContext.StudentParent.Where(u => u.StudentId == st.StudentId).ToList  ();
                    var stActivityData = _schoolContext.StudentActivityMapping.Where(u => u.StudentId == st.StudentId).ToList();
                    _schoolContext.StudentCheckin.RemoveRange(stCheckinData);
                    _schoolContext.StudentParent.RemoveRange(stParentData);
                    _schoolContext.StudentActivityMapping.RemoveRange(stActivityData);
                    _schoolContext.Student.Remove(st);
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


        public Model.UserProfile GetParentInfoById(long userId)
        {
            List<Model.Student> stParentList = new List<Model.Student>();

            var config = new MapperConfiguration(cfg => {
                cfg.CreateMap<Entity.UserProfile, Model.UserProfile>();
            });
            IMapper mapper = config.CreateMapper();
            try
            {
                return _schoolContext.UserProfile.AsNoTracking().Where(s => s.UserId == userId)
                   .AsEnumerable().Select(s => mapper.Map<Entity.UserProfile, Model.UserProfile>(s)).FirstOrDefault(); 
             }
            catch (Exception ex)
            {

                throw ex;
            } 
             
        }

    }

    public static class MappingExpressionExtensions
    {
        public static IMappingExpression<TSource, TDest> IgnoreAllUnmapped<TSource, TDest>(this IMappingExpression<TSource, TDest> expression)
        {
            expression.ForAllMembers(opt => opt.Ignore());
            return expression;
        }
    }

     
}
