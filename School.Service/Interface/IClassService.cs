using School.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.Service.Interface
{
   public interface IClassService
    {
        Class InsertUpdatedSchool(Class room);
        List<Class> GetAllSchoolBasicInfo(long schoolInfoId);
        List<Student> GetAllStudentByClassId(long classId);
        bool updateStudentClass(StudentClassModel stClassModel);
        bool removeStudentClass(StudentClassModel stClassModel);
        List<StudentCheckin> GetAllStudentCheckInInfo(long classId);
        bool InsertUpdatedStudentCheckInfo(List<StudentCheckin> stChkList);
        bool IsClassHaveStudent(long classId);
        bool DeleteClassById(long classId);
        bool IsClassHaveStaff(long classId);
    }
}
