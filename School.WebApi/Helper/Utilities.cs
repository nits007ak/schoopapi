﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Configuration;
namespace School.WebApi.Helper
{
    public static class Utilities
    {
        public static string GenerateSchoolUnqKey(string schoolName,string city)
        {
            var str = string.Empty;
            if (schoolName.Length >=  5 && city.Length >= 3)
            {
                var schoolFirstFiveChar = schoolName.Replace(" ", "").ToUpper().Trim().Substring(0, 5);
                var cityFirstThreeChar = city.Replace(" ", "").ToUpper().Trim().Substring(0, 3);
                var randomNo = RandomNumber(100, 10000);
                str = schoolFirstFiveChar + cityFirstThreeChar + randomNo.ToString();
            }
            else
            {
                str = schoolName+city+RandomNumber(100, 10000).ToString();
            }
            return str;
        }

        public static string GenerateStudentUnqKey(long schoolInfoId, string studentName)
        {
            var str = string.Empty;
            if (studentName.Length >= 3 && schoolInfoId > 0)
            {
                var stFirstThreeChar = studentName.Replace(" ", "").ToUpper().Trim().Substring(0, 3);
                var randomNo = RandomNumber(100, 10000);
                str = stFirstThreeChar + schoolInfoId.ToString() + randomNo.ToString();
            }
            else
            {
                str = studentName + schoolInfoId + RandomNumber(100, 10000).ToString();
            }
            return str;
        }

        public static int RandomNumber(int min, int max)
        {
            Random random = new Random();
            return random.Next(min, max);
        }


        public static string SaveImage(string ImgStr, string FileType,string appSettingKey)
        {
            string filePath = ConfigurationManager.AppSettings[appSettingKey];
            String path = HttpContext.Current.Server.MapPath(filePath); //Path

            //Check if directory exist
            if (!System.IO.Directory.Exists(path))
            {
                System.IO.Directory.CreateDirectory(path); //Create directory if it doesn't exist
            }

            string imageName = Guid.NewGuid() + "." + FileType;

            //set the image path
            string imgPath = Path.Combine(path, imageName);

            byte[] imageBytes = Convert.FromBase64String(ImgStr);

            File.WriteAllBytes(imgPath, imageBytes);

            return imageName;
        }

        public static string GetFileURL(string fileName,string appSettingKey)
        {
            string filePath = ConfigurationManager.AppSettings[appSettingKey];
            string hostURL = ConfigurationManager.AppSettings["HOSTURLPATH"];
            //String path = System.Web.Hosting.HostingEnvironment.MapPath(filePath+ fileName); //Path
            return hostURL+ filePath+ fileName;
        }

    }
}