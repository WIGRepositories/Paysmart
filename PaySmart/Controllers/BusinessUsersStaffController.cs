using Paysmart.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Text;
using System.Web.Http;
using System.Web.Http.Tracing;

namespace Paysmart.Controllers
{
    public class BusinessUsersStaffController : ApiController
    {
        [HttpPost]
        [Route("api/BusinessUsersStaff/RegisterBusinessUsersStaff")]
        public DataTable RegisterBusinessAppUser(BusinessUserStafff ocr)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            try
            {

                //traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "RegisterUser....");

                str.Append("Mobilenumber:" + ocr.Mobilenumber + ",");
                str.Append("Email:" + ocr.Email + ",");
                str.Append("Username:" + ocr.Username + ",");

                //traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSInsUpdBusinessUsersStaff";

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

                SqlParameter i = new SqlParameter("@AccountNumber", SqlDbType.VarChar, 50);
                i.Value = ocr.AccountNo;
                cmd.Parameters.Add(i);

                SqlParameter ct = new SqlParameter("@CountryId", SqlDbType.Int);
                ct.Value = ocr.CountryId;
                cmd.Parameters.Add(ct);

                SqlParameter cts = new SqlParameter("@CurrentStateId", SqlDbType.Int);
                cts.Value = ocr.CurrentStateId;
                cmd.Parameters.Add(cts);

                SqlParameter pd = new SqlParameter("@UserPhoto", SqlDbType.VarChar, 50);
                pd.Value = ocr.UserPhoto;
                cmd.Parameters.Add(pd);

                SqlParameter paym = new SqlParameter("@PaymentModeId", SqlDbType.Int);
                paym.Value = ocr.PaymentModeId;
                cmd.Parameters.Add(paym);

                SqlParameter ccode = new SqlParameter("@CCode", SqlDbType.VarChar, 10);
                ccode.Value = ocr.CCode;
                cmd.Parameters.Add(ccode);


                SqlParameter uaccno = new SqlParameter("@UserAccountNo", SqlDbType.VarChar, 15);
                uaccno.Value = ocr.UserAccountNo;
                cmd.Parameters.Add(uaccno);

                SqlParameter utt = new SqlParameter("@UserTypeId", SqlDbType.Int);
                utt.Value = ocr.UserTypeId;
                cmd.Parameters.Add(utt);

                SqlParameter active = new SqlParameter("@Active", SqlDbType.Int);
                active.Value = ocr.Active;
                cmd.Parameters.Add(active);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                //[Mobileotp] ,[Emailotp]
                //send email otp\

//                #region email opt
//                string eotp = dt.Rows[0]["Emailotp"].ToString();
//                if (eotp != null)
//                {
//                    try
//                    {
//                        MailMessage mail = new MailMessage();
//                        string emailserver = System.Configuration.ConfigurationManager.AppSettings["emailserver"].ToString();

//                        string username = System.Configuration.ConfigurationManager.AppSettings["username"].ToString();
//                        string pwd = System.Configuration.ConfigurationManager.AppSettings["password"].ToString();
//                        string fromaddress = System.Configuration.ConfigurationManager.AppSettings["fromaddress"].ToString();
//                        string port = System.Configuration.ConfigurationManager.AppSettings["port"].ToString();

//                        SmtpClient SmtpServer = new SmtpClient(emailserver);

//                        mail.From = new MailAddress(fromaddress);
//                        mail.To.Add(ocr.Email);
//                        mail.Subject = "User registration - Email OTP";
//                        mail.IsBodyHtml = true;

//                        string verifcodeMail = @"<table>
//                                                        <tr>
//                                                            <td>
//                                                                <h2>Thank you for registering with PaySmart APP</h2>
//                                                                <table width=\""760\"" align=\""center\"">
//                                                                    <tbody style='background-color:#F0F8FF;'>
//                                                                        <tr>
//                                                                            <td style=\""font-family:'Zurich BT',Arial,Helvetica,sans-serif;font-size:15px;text-align:left;line-height:normal;background-color:#F0F8FF;\"" >
//<div style='padding:10px;border:#0000FF solid 2px;'>    <br /><br />
                                                                             
//                                                       Your email OTP is:<h3>" + eotp + @" </h3>

//                                                        If you didn't make this request, <a href='http://154.120.237.198:52800'>click here</a> to cancel.

//                                                                                <br/>
//                                                                                <br/>             
                                                                       
//                                                                                Warm regards,<br>
//                                                                                PAYSMART Customer Service Team<br/><br />
//</div>
//                                                                            </td>
//                                                                        </tr>

//                                                                    </tbody>
//                                                                </table>
//                                                            </td>
//                                                        </tr>

//                                                    </table>";


//                        mail.Body = verifcodeMail;
//                        //SmtpServer.Port = 465;
//                        //SmtpServer.Port = 587;
//                        SmtpServer.Port = Convert.ToInt32(port);
//                        SmtpServer.UseDefaultCredentials = false;

//                        SmtpServer.Credentials = new System.Net.NetworkCredential(username, pwd);
//                        SmtpServer.EnableSsl = true;
//                        //SmtpServer.TargetName = "STARTTLS/smtp.gmail.com";
//                        SmtpServer.Send(mail);

//                    }
//                    catch (Exception ex)
//                    {
//                        //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
//                    }

//                }

//                //send mobile otp


//                // return dt;

//                #endregion email otp

                //send mobile otp as SMS
//                #region Mobile OTP
//                string motp = dt.Rows[0]["Mobileotp"].ToString();
//                if (motp != null)
//                {
//                    try
//                    {
//                        MailMessage mail = new MailMessage();
//                        string emailserver = System.Configuration.ConfigurationManager.AppSettings["emailserver"].ToString();

//                        string username = System.Configuration.ConfigurationManager.AppSettings["username"].ToString();
//                        string pwd = System.Configuration.ConfigurationManager.AppSettings["password"].ToString();
//                        string fromaddress = System.Configuration.ConfigurationManager.AppSettings["fromaddress"].ToString();
//                        string port = System.Configuration.ConfigurationManager.AppSettings["port"].ToString();

//                        SmtpClient SmtpServer = new SmtpClient(emailserver);

//                        mail.From = new MailAddress(fromaddress);
//                        mail.To.Add(ocr.Email);
//                        mail.Subject = "User registration - Mobile OTP";
//                        mail.IsBodyHtml = true;

//                        string verifcodeMail = @"<table>
//                                                        <tr>
//                                                            <td>
//                                                                <h2>Thank you for registering with PaySmart APP</h2>
//                                                                <table width=\""760\"" align=\""center\"">
//                                                                    <tbody style='background-color:#F0F8FF;'>
//                                                                        <tr>
//                                                                            <td style=\""font-family:'Zurich BT',Arial,Helvetica,sans-serif;font-size:15px;text-align:left;line-height:normal;background-color:#F0F8FF;\"" >
//<div style='padding:10px;border:#0000FF solid 2px;'>    <br /><br />
                                                                             
//                                                       Your Mobile OTP is:<h3>" + motp + @" </h3>

//                                                        If you didn't make this request, <a href='http://154.120.237.198:52800'>click here</a> to cancel.

//                                                                                <br/>
//                                                                                <br/>             
                                                                       
//                                                                                Warm regards,<br>
//                                                                                PAYSMART Customer Service Team<br/><br />
//</div>
//                                                                            </td>
//                                                                        </tr>

//                                                                    </tbody>
//                                                                </table>
//                                                            </td>
//                                                        </tr>

//                                                    </table>";


//                        mail.Body = verifcodeMail;
//                        //SmtpServer.Port = 465;
//                        //SmtpServer.Port = 587;
//                        SmtpServer.Port = Convert.ToInt32(port);
//                        SmtpServer.UseDefaultCredentials = false;

//                        SmtpServer.Credentials = new System.Net.NetworkCredential(username, pwd);
//                        SmtpServer.EnableSsl = true;
//                        //SmtpServer.TargetName = "STARTTLS/smtp.gmail.com";
//                        SmtpServer.Send(mail);

//                    }
//                    catch (Exception ex)
//                    {
//                        //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
//                    }
//                }
//                #endregion Mobile OTP
                //traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "RegisterUser successful....");
            }
            catch (Exception ex)
            {
               // traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "RegisterUser...." + ex.Message.ToString());
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
        [Route("api/BusinessUsersStaff/UpdateBusinessUsersStaff")]
        public DataTable UpdateBusinessAppUser(BusinessUserStafff ocr)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            try
            {

                //traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "UpdateUser....");

                str.Append("Mobilenumber:" + ocr.Mobilenumber + ",");
                str.Append("Email:" + ocr.Email + ",");
                str.Append("Username:" + ocr.Username + ",");

                //traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSUpdateBusinessUsersStaff";

                cmd.Connection = conn;

                SqlParameter f = new SqlParameter("@flag", SqlDbType.VarChar);
                f.Value = ocr.flag;
                cmd.Parameters.Add(f);

                SqlParameter ii = new SqlParameter("@Id", SqlDbType.Int);
                ii.Value = ocr.Id;
                cmd.Parameters.Add(ii);

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

                SqlParameter ct = new SqlParameter("@CountryId", SqlDbType.Int);
                ct.Value = ocr.CountryId;
                cmd.Parameters.Add(ct);

                SqlParameter cts = new SqlParameter("@CurrentStateId", SqlDbType.Int);
                cts.Value = ocr.CurrentStateId;
                cmd.Parameters.Add(cts);

                SqlParameter paym = new SqlParameter("@PaymentModeId", SqlDbType.Int);
                paym.Value = ocr.PaymentModeId;
                cmd.Parameters.Add(paym);

                SqlParameter ccode = new SqlParameter("@CCode", SqlDbType.VarChar, 10);
                ccode.Value = ocr.CCode;
                cmd.Parameters.Add(ccode);


                SqlParameter uaccno = new SqlParameter("@UserAccountNo", SqlDbType.VarChar, 15);
                uaccno.Value = ocr.UserAccountNo;
                cmd.Parameters.Add(uaccno);

                SqlParameter utt = new SqlParameter("@UserTypeId", SqlDbType.Int);
                utt.Value = ocr.UserTypeId;
                cmd.Parameters.Add(utt);

                SqlParameter active = new SqlParameter("@Active", SqlDbType.Int);
                active.Value = ocr.Active;
                cmd.Parameters.Add(active);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

              //  traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "UpdateUser successful....");
            }
            catch (Exception ex)
            {
              //  traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "UpdateUser...." + ex.Message.ToString());
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
        [Route("api/BusinessUsersStaff/BusinessUsersStaffDetails")]
        public DataTable BusinessAppUserDetails(string UserAccountNo)
        {
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection(); try
            {
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
                SqlCommand cmd = new SqlCommand();

                SqlParameter UId = new SqlParameter("@UserAccountNo", SqlDbType.VarChar, 50);
                UId.Value = UserAccountNo;
                cmd.Parameters.Add(UId);

                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSGetBusinessUsersStaffdetails";
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
                dt = ds.Tables[0];

                //traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "BusinessAppUserdetails successful....");
                StringBuilder str = new StringBuilder();
                str.Append("@UserAccountNo:" + UserAccountNo + ",");


               // traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "BusinessAppUserdetails Input sent...." + str.ToString());

                //if (dt.Rows.Count > 0)
                //    traceWriter.Trace(Request, "0", System.Diagnostics.TraceLevel.Info, "{0}", "BusinessAppUserdetails Output...." + dt.Rows[0].ToString());
                //else
                //    traceWriter.Trace(Request, "0", System.Diagnostics.TraceLevel.Info, "{0}", "BusinessAppUserdetails Output....App User ");
            }
            catch (Exception ex)
            {
               // traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "BusinessAppUserdetails failed...." + ex.Message.ToString());
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
        [Route("api/login/BusinessUserStafffValidateCredentials")]
        public DataTable BusinessAppUserValidateCredentials(UserLogin u)
        {
            DataTable Tbl = new DataTable();

            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();

            try
            {
                //traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "ValidateCredentials....");
                str.Append("UserAccountNo:" + u.UserAccountNo + ",");
                str.Append("Password:" + u.Password + ",");

               // traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSBusinessUsersStaffValidatecred";

                cmd.Connection = conn;

                SqlParameter lUserName = new SqlParameter("@UserAccountNo", SqlDbType.VarChar, 20);
                lUserName.Value = u.UserAccountNo;
                lUserName.Direction = ParameterDirection.Input;
                cmd.Parameters.Add(lUserName);


                SqlParameter lPassword = new SqlParameter("@Password", SqlDbType.VarChar, 50);
                lPassword.Value = u.Password;
                lPassword.Direction = ParameterDirection.Input;
                cmd.Parameters.Add(lPassword);
                //System.Threading.Thread.Sleep(10000);              

                SqlParameter cnty = new SqlParameter("@CountryId", SqlDbType.Int);
                cnty.Value = u.CountryId;
                cnty.Direction = ParameterDirection.Input;
                cmd.Parameters.Add(cnty);
                //System.Threading.Thread.Sleep(10000);

                SqlDataAdapter da = new SqlDataAdapter(cmd);


                da.Fill(Tbl);
               // traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "ValidateCredentials successful....");

            }
            catch (Exception ex)
            {
              //  traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "ValidateCredentials...." + ex.Message.ToString());
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                Tbl.Columns.Add("Code");
                Tbl.Columns.Add("description");
                DataRow dr = Tbl.NewRow();
                dr[0] = "ERR001";
                dr[1] = ex.Message;
                Tbl.Rows.Add(dr);
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return Tbl;

        }

        [HttpGet]
        [Route("api/BusinessUsersStaff/BusinessUsersStaffDetails_Getlist")]
        public DataTable BusinessAppUserlsit(string fid)
        {
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection(); try
            {
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
                SqlCommand cmd = new SqlCommand();

                SqlParameter UId = new SqlParameter("@fid", SqlDbType.VarChar, 50);
                UId.Value = fid;
                cmd.Parameters.Add(UId);

                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSGetBusinessUsersStaff_Getlist";
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
                dt = ds.Tables[0];

                //traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "BusinessAppUserdetails successful....");
                StringBuilder str = new StringBuilder();
                //str.Append("@UserAccountNo:" + UserAccountNo + ",");


                // traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "BusinessAppUserdetails Input sent...." + str.ToString());

                //if (dt.Rows.Count > 0)
                //    traceWriter.Trace(Request, "0", System.Diagnostics.TraceLevel.Info, "{0}", "BusinessAppUserdetails Output...." + dt.Rows[0].ToString());
                //else
                //    traceWriter.Trace(Request, "0", System.Diagnostics.TraceLevel.Info, "{0}", "BusinessAppUserdetails Output....App User ");
            }
            catch (Exception ex)
            {
                // traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "BusinessAppUserdetails failed...." + ex.Message.ToString());
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
