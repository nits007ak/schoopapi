using School.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.Service.Interface
{
    public interface IStudentService
    {
        Student InsertUpdatedStudent(Student st);
        List<Student> GetAllStudentBySchoolInfoId(long schoolInfoId);
        Student GetStudentProfileById(long studentId);
        StudentParent InsertUpdateStudentParent(StudentParent stParent);
        List<Student> GetAllStudentWithParent(long schoolInfoId);
        List<StudentParent> GetStudentParentById(long studentId);
        bool updateStudentAppCode(long studentId, string appCode);
        bool DeleteParentById(long parentId);
        bool DeleteStudentById(long studentId);
        Model.UserProfile GetParentInfoById(long userId);
    }
}
