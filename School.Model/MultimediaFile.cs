using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.Model
{
   public class MultimediaFile
    {
        public string data { get; set; }
        public string fileType { get; set; }
    }

    public enum FileSavePath
    {
        ACTIVITYIMGPATH=1,
        STAFFDOCPATH=2,
        SCHOOLLOGOPATH=3,
        NOTIFICATIONIMGPATH=4,
        NOTIFICATIONDOCPATH=5,
        ACTIVITYIMGPATH2 = 6,
        STAFFDOCPATH2 = 7,
        SCHOOLLOGOPATH2 = 8,
        NOTIFICATIONIMGPATH2 = 9,
        NOTIFICATIONDOCPATH2 = 10
    }
}
