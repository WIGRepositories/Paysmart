﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Text;
using System.Web.Http;
using Paysmart.Models;
using System.Web.Http.Tracing;
namespace Paysmart.Controllers
{
    public class ForgotpasswordController : ApiController
    {

        [HttpPost]
        [Route("api/Forgotpassword/Forgotpassword")]
        public DataTable  Forgotpassword(UserAccount ocr)
        {
            int Status = 0;
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Forgotpassword....");
                str.Append("UserAccountNo:" + ocr.UserAccountNo + ",");
               // str.Append("Email:" + ocr.Email + ",");
                
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSInsUpdDelPasswordverification";

                cmd.Connection = conn;

                SqlParameter c = new SqlParameter("@UserAccountNo", SqlDbType.VarChar, 20);
                c.Value = ocr.UserAccountNo;
                cmd.Parameters.Add(c);

                //SqlParameter a = new SqlParameter("@Email", SqlDbType.VarChar, 50);
                //a.Value = ocr.Email;
                //cmd.Parameters.Add(a);


                //SqlParameter cnty = new SqlParameter("@CountryId", SqlDbType.Int);
                //cnty.Value = ocr.CountryId;
                //cmd.Parameters.Add(cnty);

                SqlDataAdapter ds = new SqlDataAdapter(cmd);
                ds.Fill(dt);

                #region password otp
                string potp = dt.Rows[0]["passwordotp"].ToString();
                string emailAddrss = dt.Rows[0]["Email"].ToString();
                if (potp != null)
                {
                    try
                    {
                        MailMessage mail = new MailMessage();
                        string emailserver = System.Configuration.ConfigurationManager.AppSettings["emailserver"].ToString();

                        string username = System.Configuration.ConfigurationManager.AppSettings["username"].ToString();
                        string pwd = System.Configuration.ConfigurationManager.AppSettings["password"].ToString();
                        string fromaddress = System.Configuration.ConfigurationManager.AppSettings["fromaddress"].ToString();
                        string port = System.Configuration.ConfigurationManager.AppSettings["port"].ToString();

                        SmtpClient SmtpServer = new SmtpClient(emailserver);

                        mail.From = new MailAddress(fromaddress);
                        mail.To.Add(emailAddrss);
                        mail.Subject = "User Forgot Password - Password OTP";
                        mail.IsBodyHtml = true;

                        string verifcodeMail = @"<table>
                                                        <tr>
                                                            <td>
                                                                <h2>Thank you for registering with PaySmart APP</h2>
                                                                <table width=\""760\"" align=\""center\"">
                                                                    <tbody style='background-color:#F0F8FF;'>
                                                                        <tr>
                                                                            <td style=\""font-family:'Zurich BT',Arial,Helvetica,sans-serif;font-size:15px;text-align:left;line-height:normal;background-color:#F0F8FF;\"" >
<div style='padding:10px;border:#0000FF solid 2px;'>    <br /><br />
                                                                             
                                                       Your Password OTP is:<h3>" + potp + @" </h3>

                                                        

                                                                                <br/>
                                                                                <br/>             
                                                                       
                                                                                Warm regards,<br>
                                                                                PAYSMART Customer Service Team<br/><br />
</div>
                                                                            </td>
                                                                        </tr>

                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>

                                                    </table>";


                        mail.Body = verifcodeMail;
                        //SmtpServer.Port = 465;
                        //SmtpServer.Port = 587;
                        SmtpServer.Port = Convert.ToInt32(port);
                        SmtpServer.UseDefaultCredentials = false;

                        SmtpServer.Credentials = new System.Net.NetworkCredential(username, pwd);
                        SmtpServer.EnableSsl = true;
                        //SmtpServer.TargetName = "STARTTLS/smtp.gmail.com";
                        SmtpServer.Send(mail);
                        Status = 1;

                    }
                    catch (Exception ex)
                    {
                        //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                    }
                    finally
                    {
                        conn.Close();
                    }
                #endregion password otp
                }
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Forgotpassword successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Forgotpassword...." + ex.Message.ToString());
               // throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.OK, ex.Message));
                dt.Columns.Add("Code");
                dt.Columns.Add("description");
                DataRow dr = dt.NewRow();
                dr[0] = "ERR001";
                dr[1] = ex.Message;
                dt.Rows.Add(dr);
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return dt;
        }
      
    }
}
