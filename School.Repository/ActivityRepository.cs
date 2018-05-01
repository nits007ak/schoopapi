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
        SchoolContext _schoolContext;
        public ActivityRepository()
        {
            _schoolContext = new SchoolContext();
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
    }
}
