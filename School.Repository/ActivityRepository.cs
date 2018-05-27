using AutoMapper;
using School.Entity;
using School.Repository.Interface;
using School.Utility;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace School.Repository
{
    public class ActivityRepository : IActivityRepository
    {
        private List<ActivitySubType> _activitySubType = new List<ActivitySubType>();
        private List<ActivitySubTypeChild> _activitySubTypeChild = new List<ActivitySubTypeChild>();
        SchoolContext _schoolContext;
        public ActivityRepository()
        {
            _schoolContext = new SchoolContext();
            _activitySubType= _schoolContext.ActivitySubType.ToList();
            _activitySubTypeChild= _schoolContext.ActivitySubTypeChild.ToList();
        }

        public List<Model.ActivityType> GetAllActivitiesList()
        {
            try
            {
                var objActivityModel = new List<Model.ActivityType>();
 

                //objActivityModel = (from act in _schoolContext.ActivityType
                //                    join actSub in _schoolContext.ActivitySubType on act.ActivityTypeId equals actSub.ActivityTypeId
                //                    join subChild in _schoolContext.ActivitySubTypeChild on actSub.ActivitySubTypeId equals subChild.ActivitySubTypeId
                //                    where act.IsActive == true
                //                    select new Model.ActivityModel
                //                    {
                //                        ActivityTypeId=act.ActivityTypeId,
                //                        ActivityName=act.ActivityName,
                //                        ActivitySubTypeId=actSub.ActivitySubTypeId,
                //                        ActivitySubTypeName=actSub.Name,
                //                        ActivitySubTypeChildId= subChild.ActivitySubTypeChildId,
                //                        ChildName= subChild.Name,
                //                        ActivityParamId =subChild.ActivitySubTypeChildId,
                //                        IsActive=act.IsActive,
                //                        ParamName=subChild.Name,
                //                        ParentId=actSub.ActivityTypeId,
                //                    }).ToList();

                var activityTypeModel = _schoolContext.ActivityType.Where(a => a.IsActive).ToList();
                foreach (ActivityType item in activityTypeModel)
                {
                    var activityModel = new Model.ActivityType();
                    activityModel.ActivityTypeId = item.ActivityTypeId;
                    activityModel.ActivityName = item.ActivityName;                    
                    activityModel.IsActive = item.IsActive;
                    var activitySubTypeModelList = new List<Model.ActivitySubType>();
                    var activitySubTypeModel = _schoolContext.ActivitySubType.AsNoTracking().Where(s => s.ActivityTypeId == item.ActivityTypeId).ToList();
                    if (activitySubTypeModel.Count > 0)
                    {
                        activityModel.HasChild = true;
                        foreach (ActivitySubType actSubType in activitySubTypeModel)
                        {
                            var actSubTypeModel = new Model.ActivitySubType();
                            actSubTypeModel.ActivitySubTypeId = actSubType.ActivitySubTypeId;
                            actSubTypeModel.ActivityTypeId = actSubType.ActivityTypeId;
                            actSubTypeModel.Name = actSubType.Name;
                            
                            var config = new MapperConfiguration(cfg => {
                                cfg.CreateMap<Entity.ActivitySubTypeChild, Model.ActivitySubTypeChild>();
                            });
                            IMapper mapper = config.CreateMapper();

                            actSubTypeModel.SubTypeChilds = _schoolContext.ActivitySubTypeChild.AsNoTracking().Where(s => s.ActivitySubTypeId == actSubType.ActivitySubTypeId)
                                  .AsEnumerable().Select(s => mapper.Map<Entity.ActivitySubTypeChild, Model.ActivitySubTypeChild>(s)).ToList();
                            if (actSubTypeModel.SubTypeChilds.Count > 0)
                                actSubTypeModel.HasChild = true;
                            else
                                actSubTypeModel.HasChild = false;


                            activitySubTypeModelList.Add(actSubTypeModel);
                        }
                    }
                    else
                    {
                        activityModel.HasChild = false;
                    }
                    
                    activityModel.ActivitySubType = activitySubTypeModelList;
                    objActivityModel.Add(activityModel);

                }

               
                return objActivityModel;
            }
            catch (System.Exception ex)
            {
                var x = ex;
                throw;
            }
        }

        public bool InsertActivity(Model.ActivityPostModel activityPostModel)
        {
            bool result = false;
            try
            {
                List<int> arr = new List<int>();
                foreach (var item in activityPostModel.ActivityType.ActivitySubType)
                {
                    arr.AddRange(item.SubTypeChilds.Select(s => s.ActivitySubTypeChildId).ToList());
                }
                Entity.ActivityDetails activityDetails = new ActivityDetails
                {
                    ActivityDetailsId = 0,
                    ActivityTypeId = activityPostModel.ActivityType.ActivityTypeId,
                    ActivitySubTypeIds = string.Join("|", activityPostModel.ActivityType.ActivitySubType.Select(s => s.ActivitySubTypeId).ToArray()),
                    
                    ActivitySubTypeChildIds= string.Join("|", arr.ToArray()),
                    ActivityDateTime = activityPostModel.ActivityDate,
                    StaffId = activityPostModel.StaffId,
                    ImageURL = activityPostModel.ImageURL,
                    Notes = activityPostModel.Notes,
                    IsActive = true
                };

                _schoolContext.ActivityDetails.Add(activityDetails);
                _schoolContext.SaveChanges();

                if (activityDetails.ActivityDetailsId > 0)
                {
                    foreach (var studentId in activityPostModel.StudentIds)
                    {
                        Entity.StudentActivityMapping studentActivityMapping = new StudentActivityMapping
                        {
                            ActivityDetailsId = activityDetails.ActivityDetailsId,
                            IsClassLevel = activityPostModel.IsClassLevel,
                            IsSchoolLevel = activityPostModel.IsSchoolLevel,
                            IsStudentLevel = activityPostModel.IsStudentLevel,
                            StudentId = studentId,
                            ClassId=activityPostModel.ClassId
                        };

                        _schoolContext.StudentActivityMapping.Add(studentActivityMapping);
                    }

                  var recordsAffect=  _schoolContext.SaveChanges();
                  if (recordsAffect > 0) result = true;

                  
                }

                return result;
            }
            catch (Exception ex)
            {
                return result;
                throw;
            }
        }


        public List<Model.NotificationType> GetAllNotificationList()
        {
            try
            {
                var config = new MapperConfiguration(cfg => {
                    cfg.CreateMap<Entity.NotificationType, Model.NotificationType>();
                });
                IMapper mapper = config.CreateMapper();
                return _schoolContext.NotificationType.AsNoTracking()
                      .AsEnumerable().Select(s => mapper.Map<Entity.NotificationType, Model.NotificationType>(s)).ToList(); 
             }
            catch (System.Exception ex)
            {
                var x = ex;
                throw;
            }
        }

        public bool InsertNotification(Model.NotificationPostModel notificationPostModel)
        {
            bool result = false;
            try
            {
                 
                Entity.NotificationsDetails notificationDetails = new NotificationsDetails
                {
                     DocumentUrl=notificationPostModel.DocURL,
                     ImageUrl=notificationPostModel.ImageURL,
                     Note=notificationPostModel.Notes,
                     NotificationDate=notificationPostModel.NotificationDate,
                     NotificationsDetailsId=0,
                     NotificationTypeId=notificationPostModel.NotificationType.NotificationTypeId,
                     StaffInfoId=notificationPostModel.SchoolInfoId,
                    IsActive = true,
                    
                };

                _schoolContext.NotificationsDetails.Add(notificationDetails);
                _schoolContext.SaveChanges();

                if (notificationDetails.NotificationsDetailsId > 0)
                {
                    foreach (var studentId in notificationPostModel.StudentIds)
                    {
                        Entity.StudentNotificationsMapping studentNotificationsMapping = new StudentNotificationsMapping
                        {
                            NotificationsDetailsId = notificationDetails.NotificationsDetailsId,
                            IsClassLevel = notificationPostModel.IsClassLevel,
                            IsSchoolLevel = notificationPostModel.IsSchoolLevel,
                            IsStudentLevel = notificationPostModel.IsStudentLevel,
                            StudentId = studentId,
                            ClassId = notificationPostModel.ClassId
                            
                        };

                        _schoolContext.StudentNotificationsMapping.Add(studentNotificationsMapping);
                    }

                    var recordsAffect = _schoolContext.SaveChanges();
                    if (recordsAffect > 0) result = true; 
                }

                return result;
            }
            catch (Exception ex)
            {
                return result;
                throw;
            }
        }

        public List<Model.ActivityGetModel> GetAllActivitiesByStudentId(long studentId)
        {
            try
            {
                var StudentActivities = (from sa in _schoolContext.StudentActivityMapping
                                         join ad in _schoolContext.ActivityDetails on sa.ActivityDetailsId equals ad.ActivityDetailsId
                                         join at in _schoolContext.ActivityType on ad.ActivityTypeId equals at.ActivityTypeId
                                         where sa.StudentId == studentId
                                         select new Model.ActivityGetModel
                                         {
                                             ActivityDate = ad.ActivityDateTime,
                                             ActivityDetailsId = ad.ActivityDetailsId,
                                             ActivitySubChildTypeIds = ad.ActivitySubTypeChildIds,
                                             ActivitySubTypeIds = ad.ActivitySubTypeIds,
                                             ActivityTypeId = ad.ActivityTypeId,
                                             ClassId = sa.ClassId,
                                             ImageURL = ad.ImageURL,
                                             IsClassLevel = sa.IsClassLevel,
                                             IsSchoolLevel = sa.IsSchoolLevel,
                                             IsStudentLevel = sa.IsStudentLevel,
                                             Notes = ad.Notes,
                                             StaffId = ad.StaffId,
                                             StudentId = sa.StudentId,
                                             ActivityName=at.ActivityName

                                         }).ToList();

                return StudentActivities;


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public List<Model.ActivityGetModel> GetAllActivitiesByClassId(long classId)
        {
            try
            {
                var StudentActivities = (from sa in _schoolContext.StudentActivityMapping
                                         join ad in _schoolContext.ActivityDetails on sa.ActivityDetailsId equals ad.ActivityDetailsId
                                         join at in _schoolContext.ActivityType on ad.ActivityTypeId equals at.ActivityTypeId
                                         where sa.ClassId == classId && sa.IsClassLevel == true
                                         select new Model.ActivityGetModel
                                         {
                                             ActivityDate = ad.ActivityDateTime,
                                             ActivityDetailsId = ad.ActivityDetailsId,
                                             ActivitySubChildTypeIds = ad.ActivitySubTypeChildIds,
                                             ActivitySubTypeIds = ad.ActivitySubTypeIds,
                                             ActivityTypeId = ad.ActivityTypeId,
                                             ClassId = sa.ClassId,
                                             ImageURL = ad.ImageURL,
                                             IsClassLevel = sa.IsClassLevel,
                                             IsSchoolLevel = sa.IsSchoolLevel,
                                             IsStudentLevel = sa.IsStudentLevel,
                                             Notes = ad.Notes,
                                             StaffId = ad.StaffId,
                                             StudentId = sa.StudentId,
                                             ActivityName = at.ActivityName

                                         }).ToList();

                return StudentActivities;


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public string GetActivitySubType(string activitySubTypeIds)
        {
            var joinedStr = string.Empty;
            if (!string.IsNullOrEmpty(activitySubTypeIds))
            {
                 var strArr = activitySubTypeIds.Split('|');
                List<string> strList = new List<string>();
                foreach (var item in strArr)
                {
                    int convertToInt = Convert.ToInt32(item);
                    strList.Add(_activitySubType.Where(s => s.ActivitySubTypeId == convertToInt).Select(s => s.Name).FirstOrDefault());
                }

                joinedStr = String.Join("|", strList.ToArray());
            }
            

            return joinedStr;
        }

        public string GetActivitySubTypeChild(string activitySubTypeChildIds)
        {
            var joinedStr = string.Empty;
            if (!string.IsNullOrEmpty(activitySubTypeChildIds))
            {
                 var strArr = activitySubTypeChildIds.Split('|');
                List<string> strList = new List<string>();
                foreach (var item in strArr)
                {
                    int convertToInt = Convert.ToInt32(item);
                    strList.Add(_activitySubTypeChild.Where(s => s.ActivitySubTypeChildId == convertToInt).Select(s => s.Name).FirstOrDefault());
                }

                joinedStr = String.Join("|", strList.ToArray());
            }
            

            return joinedStr;
        }
    }
}
