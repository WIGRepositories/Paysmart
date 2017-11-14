using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Web.Http;
using System.Web.Http.Tracing;

namespace Paysmart.Controllers
{
    public class Email : ApiController
    {

        public void sendMail()
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "sendMail....");
                MailMessage mail = new MailMessage();
                string emailserver = System.Configuration.ConfigurationManager.AppSettings["emailserver"].ToString();
                string username = System.Configuration.ConfigurationManager.AppSettings["username"].ToString();
                string pwd = System.Configuration.ConfigurationManager.AppSettings["password"].ToString();
                string fromaddress = System.Configuration.ConfigurationManager.AppSettings["fromaddress"].ToString();
                string port = System.Configuration.ConfigurationManager.AppSettings["port"].ToString();

                SmtpClient SmtpServer = new SmtpClient(emailserver);

                mail.From = new MailAddress(fromaddress);
                mail.To.Add("msrujansimha@gmail.com");
                mail.Subject = "Test Mail";
                mail.Body = "This is for testing SMTP mail from GMAIL";

                //SmtpServer.Port = 465;
                //SmtpServer.Port = 587;
                SmtpServer.Port = Convert.ToInt32(port);
                SmtpServer.UseDefaultCredentials = false;

                SmtpServer.Credentials = new System.Net.NetworkCredential(username, pwd);
                SmtpServer.EnableSsl = true;
                //SmtpServer.TargetName = "STARTTLS/smtp.gmail.com";
                SmtpServer.Send(mail);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "sendMail successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "sendMail...." + ex.Message.ToString());
                throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
            }
           
        }
    }
}
