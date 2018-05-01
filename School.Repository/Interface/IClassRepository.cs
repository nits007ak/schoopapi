using School.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.Repository.Interface
{
    public interface IClassRepository
    {
        Class InsertUpdatedClass(Class room);
        List<Model.Class> GetAllClassBySchoolInfoId(long schoolInfoId);
        List<Model.Student> GetAllStudentByClassId(long classId);
        bool updateStudentClass(Model.StudentClassModel stClassModel);
        bool removeStudentClass(StudentClassModel stClassModel);
        List<Model.StudentCheckin> GetAllStudentCheckInInfo(long classId);
        bool InsertUpdatedStudentCheckInfo(List<Model.StudentCheckin> stChekin);
        bool IsClassHaveStudent(long classId);
        bool DeleteClassById(long classId);
        bool IsClassHaveStaff(long classId);
    }
}
