using School.Model;
using School.Repository;
using School.Repository.Interface;
using School.Service.Interface;
using System.Collections.Generic;

namespace School.Service
{
    public class ClassService : IClassService
    {
        IClassRepository _classRepo;
        public ClassService()
        {
            _classRepo = new ClassRepository();
        }

        public Class InsertUpdatedSchool(Class room)
        {
            return _classRepo.InsertUpdatedClass(room);
        }

        public List<Class> GetAllSchoolBasicInfo(long schoolInfoId)
        {
            return _classRepo.GetAllClassBySchoolInfoId(schoolInfoId);
        }

        public List<Student> GetAllStudentByClassId(long classId)
        {
            return _classRepo.GetAllStudentByClassId(classId);
        }

        public bool updateStudentClass(StudentClassModel stClassModel)
        {
            return _classRepo.updateStudentClass(stClassModel);
        }

        public bool removeStudentClass(StudentClassModel stClassModel)
        {
            return _classRepo.removeStudentClass(stClassModel);
        }

        public List<StudentCheckin> GetAllStudentCheckInInfo(long classId)
        {
            return _classRepo.GetAllStudentCheckInInfo(classId);
        }

        public bool InsertUpdatedStudentCheckInfo(List<StudentCheckin> stChkList)
        {
            return _classRepo.InsertUpdatedStudentCheckInfo(stChkList);
        }

        public bool IsClassHaveStudent(long classId)
        {
            return _classRepo.IsClassHaveStudent(classId);    
        }

        public bool DeleteClassById(long classId)
        {
            return _classRepo.DeleteClassById(classId);
        }

        public bool IsClassHaveStaff(long classId)
        {
            return _classRepo.IsClassHaveStaff(classId);
        }
    }
}
