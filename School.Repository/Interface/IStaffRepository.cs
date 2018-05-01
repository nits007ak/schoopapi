using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.Repository.Interface
{
   public interface IStaffRepository
    {
        Model.StaffInfo InsertUpdateStaff(Model.StaffInfo staffInfo);
        List<Model.StaffInfo> GetAllStaffBySchoolInfoId(long schoolInfoId);
        Model.StaffInfo GetStaffBasicInfoByStaffId(long staffInfoId);
        Model.StaffOtherInfo InsertUpdateStaffOtherInfo(Model.StaffOtherInfo staffOtherInfo);
        Model.StaffOtherInfo GetStaffOtherInfoByStaffId(long staffInfoId);
        Model.StaffExperience InsertUpdateStaffExp(Model.StaffExperience staffExperience);
        List<Model.StaffExperience> GetStaffExperienceByStaffId(long staffInfoId);
        bool InsertUpdatedStaffClass(Model.StaffClass staffClass);
        Model.StaffClass GetStaffAllClassesByStaffId(long staffInfoId);
        Model.StaffDocument InsertStaffDocument(Model.StaffDocument staffDoc);
        List<Model.StaffDocument> GetStaffAllDocumentByStaffId(long staffInfoId);
        bool DeleteStaffDocById(long staffDocId);
        bool DeleteStaffIdById(long staffInfoId);
        bool DeleteStaffExperienceById(long staffExperienceId);
    }
}
