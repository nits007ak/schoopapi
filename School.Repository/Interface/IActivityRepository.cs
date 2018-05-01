using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.Repository.Interface
{
    public interface IActivityRepository
    {
        List<Model.ActivityType> GetAllActivitiesList();
        bool InsertActivity(Model.ActivityPostModel activityPostModel);
    }
}
