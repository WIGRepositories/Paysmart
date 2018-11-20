using Paysmart;
using Paysmart.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Tracing;
using System.Text;
using System.Net.Mail;
using Paysmart.Helpers;

namespace Paysmart.Controllers
{
    public class AppUsersController : ApiController
    {

        [Route("api/AppUsers/AppUserDetails")]
        public DataTable GetUserById(int id)
        {

            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection(); try
            {
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
                SqlCommand cmd = new SqlCommand();

                SqlParameter UId = new SqlParameter("@id", SqlDbType.Int);
                UId.Value = id;
                cmd.Parameters.Add(UId);

                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSGetAppUserdetails";
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
                dt = ds.Tables[0];
                
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "AppUserDetails successful....");
                StringBuilder str = new StringBuilder();
                str.Append("@id:" + id + ",");


                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "AppUserDetails Input sent...." + str.ToString());

                if (dt.Rows.Count > 0)
                    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "AppUserDetails Output...." + dt.Rows[0].ToString());
                else
                    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "AppUserDetails Output....App User ");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "AppUserDetails failed...." + ex.Message.ToString());
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                dt.Columns.Add("Code");
                dt.Columns.Add("description");
                DataRow dr = dt.NewRow();
                dr[0] = "ERR001";
                dr[1] = ex.Message;
                dt.Rows.Add(dr);

                //throw new Exception("dddd");
                //throw new ApiException((int)HttpStatusCode.BadRequest, "bad requsetst", HttpStatusCode.ExpectationFailed, "Bad Request...");
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return dt;
        }

        [HttpPost]
        [Route("api/UserAccount/UpdateAppUser")]
        public DataTable RegisterUser(UserAccount ocr)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSInsUpdAppusers";

                cmd.Connection = conn;

                SqlParameter f = new SqlParameter("@flag", SqlDbType.VarChar);
                f.Value = ocr.flag;
                cmd.Parameters.Add(f);

                SqlParameter c = new SqlParameter("@Username", SqlDbType.VarChar, 20);
                c.Value = ocr.Username;
                cmd.Parameters.Add(c);

                SqlParameter ce = new SqlParameter("@Email", SqlDbType.VarChar, 50);
                ce.Value = ocr.Email;
                cmd.Parameters.Add(ce);


                SqlParameter cm = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
                cm.Value = ocr.Mobilenumber;
                cmd.Parameters.Add(cm);

                SqlParameter q1 = new SqlParameter("@Password", SqlDbType.VarChar, 50);
                q1.Value = ocr.Password;
                cmd.Parameters.Add(q1);

                SqlParameter v = new SqlParameter("@Firstname", SqlDbType.VarChar, 50);
                v.Value = ocr.Firstname;
                cmd.Parameters.Add(v);

                SqlParameter v1 = new SqlParameter("@lastname", SqlDbType.VarChar, 50);
                v1.Value = ocr.lastname;
                cmd.Parameters.Add(v1);

                SqlParameter v2 = new SqlParameter("@AuthTypeId", SqlDbType.VarChar, 50);
                v2.Value = ocr.AuthTypeId;
                cmd.Parameters.Add(v2);

                SqlParameter u = new SqlParameter("@AltPhonenumber", SqlDbType.VarChar, 50);
                u.Value = ocr.AltPhonenumber;
                cmd.Parameters.Add(u);

                SqlParameter u1 = new SqlParameter("@Altemail", SqlDbType.VarChar, 50);
                u1.Value = ocr.Altemail;
                cmd.Parameters.Add(u1);

                SqlParameter i = new SqlParameter("@AccountNo", SqlDbType.VarChar, 50);
                i.Value = ocr.AccountNo;
                cmd.Parameters.Add(i);

                SqlParameter amt = new SqlParameter("@Amount", SqlDbType.Decimal);
                amt.Value = ocr.Amount;
                cmd.Parameters.Add(amt);

                SqlParameter photo = new SqlParameter("@UserPhoto", SqlDbType.VarChar);
                photo.Value = ocr.UserPhoto;
                cmd.Parameters.Add(photo);

                SqlParameter gender = new SqlParameter("@Gender", SqlDbType.Int);
                gender.Value = ocr.Gender;
                cmd.Parameters.Add(gender);


                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "UpdateAppUser successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "UpdateAppUser failed...." + ex.Message.ToString());
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
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

        [Route("api/GetFileContent")]
        public DataTable GetFileContent(int id, int cat)
        {
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection(); 
            try
            {
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
                SqlCommand cmd = new SqlCommand();

                SqlParameter Id = new SqlParameter("@FileId", SqlDbType.Int);
                Id.Value = id;
                cmd.Parameters.Add(Id);

                SqlParameter c = new SqlParameter("@Category", SqlDbType.Int);
                c.Value = cat;
                cmd.Parameters.Add(c);

                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSGetFileContent";
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
                dt = ds.Tables[0];

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetFileContent successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetFileContent failed...." + ex.Message.ToString());
               // throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
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
        [HttpPost]
        [Route("api/UserAccount/EwalletOTPSending")]
        public DataTable EwalletSendOTP(UserAccount ocr)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "RegisterUser....");

                str.Append("UserAccountNo:" + ocr.Mobilenumber + ",");
                str.Append("mobilenumber:" + ocr.Email + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "EwalletSendOTP";

                cmd.Connection = conn;

                SqlParameter f = new SqlParameter("@UserAccountNo", SqlDbType.VarChar);
                f.Value = ocr.UserAccountNo;
                cmd.Parameters.Add(f);

                SqlParameter c = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
                c.Value = ocr.Mobilenumber;
                cmd.Parameters.Add(c);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                //[Mobileotp] ,[Emailotp]
                //send email otp\


                //send mobile otp as SMS
                #region Mobile OTP
                string motp = dt.Rows[0]["Mobileotp"].ToString();
                string email = dt.Rows[0]["Email"].ToString();
                if (motp != null)
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
                        mail.To.Add(email);
                        mail.Subject = "Ewallet - Mobile OTP";
                        mail.IsBodyHtml = true;

                        string verifcodeMail = @"<table>
                                                        <tr>
                                                            <td>
                                                                <h2>Thank you for using  Ewallet with PaySmart APP</h2>
                                                                <table width=\""760\"" align=\""center\"">
                                                                    <tbody style='background-color:#F0F8FF;'>
                                                                        <tr>
                                                                            <td style=\""font-family:'Zurich BT',Arial,Helvetica,sans-serif;font-size:15px;text-align:left;line-height:normal;background-color:#F0F8FF;\"" >
<div style='padding:10px;border:#0000FF solid 2px;'>    <br /><br />
                                                                             
                                                       Your Mobile OTP is:<h3>" + motp + @" </h3>

                                                        If you didn't make this request, <a href='http://154.120.237.198:52800'>click here</a> to cancel.

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

                    }
                    catch (Exception ex)
                    {
                        //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                    }
                }
                #endregion Mobile OTP
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Send OTP successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "RegisterUser...." + ex.Message.ToString());
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
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

        [HttpPost]
        [Route("api/UserAccount/EwalletOTPVerification")]
        public DataTable EwalletOTPVerification(UserAccount ocr)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Verifing OTP....");

                str.Append("Mobilenumber:" + ocr.Mobilenumber + ",");
                str.Append("MVerificationCode:" + ocr.MVerificationCode + ",");
                str.Append("UserAccountNo:" + ocr.UserAccountNo + ",");
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "EwalletOTPVerification";

                cmd.Connection = conn;

                SqlParameter f = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
                f.Value = ocr.Mobilenumber;
                cmd.Parameters.Add(f);

                SqlParameter c = new SqlParameter("@MVerificationCode", SqlDbType.VarChar, 20);
                c.Value = ocr.MVerificationCode;
                cmd.Parameters.Add(c);
                SqlParameter d = new SqlParameter("@UserAccountNo", SqlDbType.VarChar, 20);
                d.Value = ocr.UserAccountNo;
                cmd.Parameters.Add(d);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                //[Mobileotp] ,[Emailotp]
                //send email otp\


                //send mobile otp as SMS

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "OTP Verified  successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "RegisterUser...." + ex.Message.ToString());
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
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

        [HttpGet]
        [Route("api/AppUsers/GetEwalletStatus")]
        public DataTable GetBusinessappusersuser(string acct)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Get Business App User....");

                str.Append("UserAccountNo:" + acct + ",");
               


                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "GetEwalletStatus";

                cmd.Connection = conn;

                SqlParameter uaccno = new SqlParameter("@UserAccountNo", SqlDbType.VarChar, 15);
                uaccno.Value = acct;
                cmd.Parameters.Add(uaccno);
               
                //DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                //dt = ds.Tables[0];
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "successful Get Business App User");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Get Business App User...." + ex.Message.ToString());
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
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
