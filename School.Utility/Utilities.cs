using System;
using System.IO;
using System.Web;

namespace School.Utility
{
   public static class Utilities
    {
        public static string CreateRandomPassword(int PasswordLength)
        {
            string _allowedChars = "0123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ";
            Random randNum = new Random();
            char[] chars = new char[PasswordLength];
            int allowedCharCount = _allowedChars.Length;
            for (int i = 0; i < PasswordLength; i++)
            {
                chars[i] = _allowedChars[(int)((_allowedChars.Length) * randNum.NextDouble())];
            }
            return new string(chars);
        }

        public static string GenericEmailTemplateSet(string[] fieldNames, string[] fieldValues, string fullTemplatePath, string seprator)
        {
            var strReturn = string.Empty;
            var fieldNameset = string.Empty;
            if (fieldNames.Length == fieldValues.Length)
            {
                //string filepath = Path.Combine(Environment.CurrentDirectory, fullTemplatePath);
                var filepath = HttpContext.Current.Server.MapPath(fullTemplatePath);
                strReturn = ReadEmailTemplate(filepath);
                for (int i = 0; i < fieldNames.Length; i++)
                {
                    if (seprator != string.Empty)
                    {
                        fieldNameset = seprator + fieldNames[i] + seprator;
                        strReturn = strReturn.Replace(fieldNameset, fieldValues[i]);
                    }
                    else
                    {
                        strReturn = strReturn.Replace(fieldNames[i], fieldValues[i]);
                    }
                }
            }
            return strReturn;
        }

        public static string ReadEmailTemplate(string filePath)
        {
            var tempReadTemplate = "";
            if (!File.Exists(filePath)) return tempReadTemplate;
            var objStreamReader = File.OpenText(filePath);
            var contents = objStreamReader.ReadToEnd();
            objStreamReader.Close();
            tempReadTemplate = contents;
            return tempReadTemplate;
        }
    }
}
