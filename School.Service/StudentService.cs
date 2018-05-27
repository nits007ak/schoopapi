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
   public class StudentService : IStudentService
    {

        IStudentRepository _studentRepo;
        public StudentService()
        {
            _studentRepo = new StudentRepository();
        }

        public Student InsertUpdatedStudent(Student st)
        {
            return _studentRepo.InsertUpdateStudent(st);
        }

        public List<Student> GetAllStudentBySchoolInfoId(long schoolInfoId)
        {
            return _studentRepo.GetAllStudentSchoolInfoId(schoolInfoId);
        }

        public Student GetStudentProfileById(long studentId)
        {
            return _studentRepo.GetStudentProfileById(studentId);
        }

        public StudentParent InsertUpdateStudentParent(StudentParent stParent)
        {
            return _studentRepo.InsertUpdateStudentParent(stParent);
        }

        public List<Student> GetAllStudentWithParent(long schoolInfoId)
        {
            return _studentRepo.GetAllStudentWithParent(schoolInfoId);
        }
        public List<StudentParent> GetStudentParentById(long studentId)
        {
            return _studentRepo.GetStudentParentById(studentId);
        }

        public bool updateStudentAppCode(long studentId, string appCode)
        {
            return _studentRepo.updateStudentAppCode(studentId,appCode);
        }

        public bool DeleteParentById(long parentId)
        {
            return _studentRepo.DeleteParentById(parentId);
        }

        public bool DeleteStudentById(long studentId)
        {
            return _studentRepo.DeleteStudentById(studentId);
        }

        public UserProfile GetParentInfoById(long userId)
        {
            return _studentRepo.GetParentInfoById(userId);
        }
    }
}
