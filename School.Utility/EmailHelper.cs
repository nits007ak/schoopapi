using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace School.Utility
{
    public static class EmailHelper
    {
         
        private static readonly string FromEmail = ConfigurationManager.AppSettings.Get("FromAddress");
        private static readonly string SmtpHost = ConfigurationManager.AppSettings.Get("SMTPHost");
        private static readonly string EmailPassword = ConfigurationManager.AppSettings.Get("Password");
        private static readonly string SmtpPort = ConfigurationManager.AppSettings.Get("SMTPPort");
        private static readonly string UseSsl = ConfigurationManager.AppSettings.Get("EnableTLS");
        
        public static void SendMail(string emailid, string strMsg, string subject)
        {
            var objEmail = new MailMessage();
            try
            {
                objEmail.From = new MailAddress(FromEmail);
                objEmail.To.Add(new MailAddress(emailid));
                objEmail.Subject = subject;
                objEmail.Body = strMsg;
                objEmail.IsBodyHtml = true;
                objEmail.Priority = MailPriority.Normal;
                var smtp = new SmtpClient
                {
                    Host = SmtpHost,
                    Port = Convert.ToInt32(SmtpPort),
                    EnableSsl = Convert.ToBoolean(UseSsl),
                    UseDefaultCredentials = true,
                   // DeliveryMethod = SmtpDeliveryMethod.Network,
                    Credentials = new NetworkCredential(FromEmail, EmailPassword),
                };
                smtp.Send(objEmail);
            }
            catch (Exception ex)
            {

                throw ex;

            }
            finally
            {
                objEmail.Dispose();
            }
        }
    }
}
