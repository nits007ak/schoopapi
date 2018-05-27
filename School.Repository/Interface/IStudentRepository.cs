using School.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.Repository.Interface
{
    public interface IStudentRepository
    {
        Student InsertUpdateStudent(Student student);
        List<Student> GetAllStudentSchoolInfoId(long schoolInfoId);
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
