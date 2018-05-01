using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using School.Model;
using School.Entity;
using AutoMapper;
using System.Data.Entity;
using School.Repository.Interface;

namespace School.Repository
{
    public class ClassRepository : IClassRepository
    {
        SchoolContext _schoolContext;
        public ClassRepository()
        {
            _schoolContext = new SchoolContext();
        }

        public Model.Class InsertUpdatedClass(Model.Class room)
        {
            try
            {
                var config = new MapperConfiguration(cfg => {
                    cfg.CreateMap<Model.Class, Entity.Class>();
                });
                IMapper mapper = config.CreateMapper();
                var classEntity = mapper.Map<Model.Class, Entity.Class>(room);
                 
                if (classEntity.ClassId == 0)
                {
                    classEntity.IsActive = true;
                    _schoolContext.Class.Add(classEntity);
                    _schoolContext.SaveChanges();
                    room.ClassId = classEntity.ClassId;
                    room.IsActive = classEntity.IsActive;

                }
                else
                {
                    _schoolContext.Entry(classEntity).State = EntityState.Modified;
                    _schoolContext.SaveChanges();

                }

                return room;
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public List<Model.Class>  GetAllClassBySchoolInfoId(long schoolInfoId)
        {
            try
            {
                

                var result = (from room in _schoolContext.Class
                              join st in _schoolContext.Student on room.ClassId equals st.ClassId into rmst
                              from st in rmst.DefaultIfEmpty()
                              where room.SchoolInfoId == schoolInfoId
                              group st by  new { room.ClassName, room.SchoolInfoId, room.ClassId,room.IsActive}
                                  
                              into g
                              select new Model.Class {
                                  ClassId = g.Key.ClassId,
                                  ClassName = g.Key.ClassName,
                                  SchoolInfoId = g.Key.SchoolInfoId,
                                 IsActive= g.Key.IsActive,
                                  TotalStudent = g.Count(s => s.StudentId > 0) }
                              ).ToList();
                return result;
               
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public List<Model.Student> GetAllStudentByClassId(long classId)
        {
            try
            {

                var result = (from st in _schoolContext.Student
                              join room in _schoolContext.Class on st.ClassId equals room.ClassId into rmst
                              from ro in rmst.DefaultIfEmpty()
                              where st.ClassId == classId
                              select new Model.Student
                              {
                                  AadharNumber = st.AadharNumber,
                                  ClassId = st.ClassId,
                                  ClassName = ro.ClassName,
                                  DOB = st.DOB,
                                  IsActive = st.IsActive,
                                  Name = st.Name,
                                  SchoolInfoId = st.SchoolInfoId,
                                  StudentId = st.StudentId,
                                  StudentUniqueId = st.StudentUniqueId,
                                  UpdateDate = st.UpdateDate,
                                  UpdatedEmail = st.UpdatedEmail

                              }
                              ).ToList();
                return result;

            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public bool updateStudentClass(StudentClassModel stClassModel)
        {
            var isSuccess = false;
            try
            {
                foreach (var studentId in stClassModel.StudentIds)
                {
                    var std = _schoolContext.Student.Where(s => s.StudentId == studentId).FirstOrDefault();
                    std.ClassId = stClassModel.ClassId;
                    var result = _schoolContext.SaveChanges();
                    if (result > 0)
                    {
                        isSuccess = true;
                    }
                }
                
            }
            catch (Exception ex)
            {

                throw;
            }

            return isSuccess;
        }

        public bool removeStudentClass(StudentClassModel stClassModel)
        {
            var isSuccess = false;
            try
            {
                foreach (var studentId in stClassModel.StudentIds)
                {
                    var std = _schoolContext.Student.Where(s => s.StudentId == studentId && s.ClassId == stClassModel.ClassId).FirstOrDefault();
                    std.ClassId = null;
                    var result = _schoolContext.SaveChanges();
                    if (result > 0)
                    {
                        isSuccess = true;
                    }
                }

            }
            catch (Exception ex)
            {

                throw;
            }

            return isSuccess;
        }

        public List<Model.StudentCheckin> GetAllStudentCheckInInfo(long classId)
        {
            try
            {

                var result = (from st in _schoolContext.Student
                              join room in _schoolContext.Class on st.ClassId equals room.ClassId into rmst
                              from ro in rmst.DefaultIfEmpty()
                              join checkin in _schoolContext.StudentCheckin on
                              new { p1 = (long)st.ClassId, p2 = st.StudentId,p3= DbFunctions.TruncateTime(DateTime.Now) }
                              equals new { p1 = checkin.ClassId, p2 = checkin.StudentId,p3= DbFunctions.TruncateTime(checkin.CheckInDate) } into chk
                              from chki in chk.DefaultIfEmpty()
                              where st.ClassId == classId 
                              select new Model.StudentCheckin
                              {
                                  ClassId = st.ClassId ?? 0,
                                  ClassName = ro.ClassName,
                                   Name = st.Name,
                                   StudentId = st.StudentId,
                                  StudentUniqueId = st.StudentUniqueId,
                                  UserId = chki != null ? (long)chki.UserId : 0 ,
                                  CheckInDate=chki != null ? chki.CheckInDate:null,
                                  IsPresent=chki!=null ? chki.IsPresent:false,
                                  UpdateDate = chki != null ?  chki.UpdateDate : null,
                                  UpdatedEmail = chki != null ? chki.UpdatedEmail: null

                              }
                              ).ToList();
                return result;

            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public bool InsertUpdatedStudentCheckInfo(List<Model.StudentCheckin> checkinfoList)
        {
            try
            {
                var config = new MapperConfiguration(cfg => {
                    cfg.CreateMap<Model.StudentCheckin, Entity.StudentCheckin>();
                });
                IMapper mapper = config.CreateMapper();
                var stChkEntity = mapper.Map<List<Model.StudentCheckin>, List<Entity.StudentCheckin>>(checkinfoList);
                foreach (var chkInfo in checkinfoList)
                {
                    var item = _schoolContext.StudentCheckin.Where(s => s.StudentId == chkInfo.StudentId && s.ClassId == chkInfo.ClassId && DbFunctions.TruncateTime(s.CheckInDate.Value) == DbFunctions.TruncateTime(DateTime.Now)).FirstOrDefault();
                    if (item == null)
                    {
                        var chkEntity = new Entity.StudentCheckin
                        {
                            CheckInDate = chkInfo.CheckInDate.HasValue ? chkInfo.CheckInDate : DateTime.Now,
                            ClassId = chkInfo.ClassId,
                            IsPresent = (bool)chkInfo.IsPresent,
                            StudentId = chkInfo.StudentId,
                            UpdateDate = DateTime.Now,
                            UserId = chkInfo.UserId,
                            UpdatedEmail = chkInfo.UpdatedEmail
                        };

                        _schoolContext.StudentCheckin.Add(chkEntity);
                    }
                    else
                    {
                       
                        item.IsPresent = (bool)chkInfo.IsPresent;
                        item.UpdateDate = DateTime.Now;
                        item.UserId = chkInfo.UserId;
                        item.UpdatedEmail = chkInfo.UpdatedEmail;
                       _schoolContext.Entry(item).State = EntityState.Modified;
                    }

                    
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

        public bool IsClassHaveStudent(long classId)
        {
            try
            {
               return _schoolContext.Student.Where(s => s.ClassId == classId).Any();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public bool IsClassHaveStaff(long classId)
        {
            try
            {
                return _schoolContext.StaffClasses.Where(s => s.ClassId == classId).Any();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public bool DeleteClassById(long classId)
        {
            try
            {
                var data = _schoolContext.Class.Where(c => c.ClassId == classId).FirstOrDefault();
                var stdChk = _schoolContext.StudentCheckin.Where(c => c.ClassId == data.ClassId).ToList();
                var stdactivityMapping = _schoolContext.StudentActivityMapping.Where(c => c.ClassId == data.ClassId).ToList();
                _schoolContext.StudentCheckin.RemoveRange(stdChk);
                _schoolContext.StudentActivityMapping.RemoveRange(stdactivityMapping);
                _schoolContext.Class.Remove(data);
               var result=  _schoolContext.SaveChanges();
                if (result > 0)
                    return true;
                else
                    return false; 
             }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
