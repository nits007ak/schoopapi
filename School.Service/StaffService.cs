using School.Model;
using School.Repository;
using School.Repository.Interface;
using School.Service.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.Service
{
   public class StaffService : IStaffService
    {
        IStaffRepository _staffRepo;
        public StaffService()
        {
            _staffRepo = new StaffRepository();
        }

        public StaffInfo InsertUpdatedStaff(StaffInfo staffInfo)
        {
            return _staffRepo.InsertUpdateStaff(staffInfo);
        }

        public List<StaffInfo> GetAllStaffBasicInfo(long schoolInfoId)
        {
            return _staffRepo.GetAllStaffBySchoolInfoId(schoolInfoId);
        }

        public StaffInfo GetStaffBasicInfoByStaffId(long staffInfoId)
        {
            return _staffRepo.GetStaffBasicInfoByStaffId(staffInfoId);
        }

        public StaffOtherInfo InsertUpdateStaffOtherInfo(StaffOtherInfo staffOtherInfo)
        {
            return _staffRepo.InsertUpdateStaffOtherInfo(staffOtherInfo);
        }

        public StaffOtherInfo GetStaffOtherInfoByStaffId(long staffInfoId)
        {
            return _staffRepo.GetStaffOtherInfoByStaffId(staffInfoId);
        }

        public StaffExperience InsertUpdateStaffExp(StaffExperience staffExperience)
        {
            return _staffRepo.InsertUpdateStaffExp(staffExperience);
        }

        public List<StaffExperience> GetStaffExperienceByStaffId(long staffInfoId)
        {
            return _staffRepo.GetStaffExperienceByStaffId(staffInfoId);
        }

        public bool InsertUpdatedStaffClass(StaffClass staffClass)
        {
            return _staffRepo.InsertUpdatedStaffClass(staffClass);
        }

        public Model.StaffClass GetStaffAllClassesByStaffId(long staffInfoId)
        {
            return _staffRepo.GetStaffAllClassesByStaffId(staffInfoId);
        }

        public StaffDocument InsertStaffDocument(StaffDocument staffDoc)
        {
            try
            {
                return _staffRepo.InsertStaffDocument(staffDoc);
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }

        public List<StaffDocument> GetStaffAllDocumentByStaffId(long staffInfoId)
        {
            return _staffRepo.GetStaffAllDocumentByStaffId(staffInfoId);
        }

        public bool DeleteStaffDocById(long staffDocId)
        {
            return _staffRepo.DeleteStaffDocById(staffDocId);
        }

        public bool DeleteStaffIdById(long staffInfoId)
        {
            return _staffRepo.DeleteStaffIdById(staffInfoId);
        }

        public bool DeleteStaffExperienceById(long staffExperienceId)
        {
            return _staffRepo.DeleteStaffExperienceById(staffExperienceId);
        }
    }
}
