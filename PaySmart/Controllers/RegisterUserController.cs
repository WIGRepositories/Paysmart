using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Web.Http;
using Paysmart.Models;
using System.Web.Http.Tracing;
using System.Text;
using System.Web;


namespace Paysmart.Controllers
{
    public class UserAccountController : ApiController
    {
        [HttpPost]
        [Route("api/UserAccount/RegisterUser")]
        public DataTable RegisterUser(UserAccount ocr)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "RegisterUser....");

                str.Append("Mobilenumber:" + ocr.Mobilenumber + ",");
                str.Append("Email:" + ocr.Email + ",");
                str.Append("Username:" + ocr.Username + ",");
                
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

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

                SqlParameter active = new SqlParameter("@Active", SqlDbType.Int);
                active.Value = ocr.Active;
                cmd.Parameters.Add(active);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                //[Mobileotp] ,[Emailotp]
                //send email otp\
                #region email opt
                string eotp = dt.Rows[0]["Emailotp"].ToString();
                if (eotp != null)
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
                        mail.To.Add(ocr.Email);
                        mail.Subject = "User registration - Email OTP";
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
                                                                             
                                                       Your email OTP is:<h3>" + eotp + @" </h3>

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

                //send mobile otp


                // return dt;

                #endregion email otp

                //send mobile otp as SMS
                #region Mobile OTP
                string motp = dt.Rows[0]["Mobileotp"].ToString();
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
                        mail.To.Add(ocr.Email);
                        mail.Subject = "User registration - Mobile OTP";
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
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "RegisterUser successful....");
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
        [Route("api/UserAccount/MOTPverifications")]
        public DataTable MOTPverifications(UserAccount ocr)
        {

            int status = 0;
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "MOTPverifications....");
                str.Append("Mobilenumber:" + ocr.Mobilenumber + ",");
                str.Append("Mobileotp:" + ocr.Email + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());


                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSMOTPverifying";

                cmd.Connection = conn; 


                 SqlParameter q1 = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
                q1.Value = ocr.Mobilenumber;
                cmd.Parameters.Add(q1);

                SqlParameter uu = new SqlParameter("@UserId", SqlDbType.VarChar, 20);
                uu.Value = ocr.userId;
                cmd.Parameters.Add(uu);

                SqlParameter e = new SqlParameter("@Mobileotp", SqlDbType.VarChar, 10);
                e.Value = ocr.MVerificationCode;
                cmd.Parameters.Add(e);

                //try
                //{
                //    conn.Open();
                //    object statusres = cmd.ExecuteScalar();
                //    conn.Close();
                //    if (statusres != null)
                //    {
                //        if (conn.State == ConnectionState.Open)
                //        {
                //            conn.Close();
                //        }
                //        return Convert.ToInt32(statusres);
                //    }
                //}
                //catch (Exception ex)
                //{
                //    throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.OK, ex.Message));
                //}
                //Verify mobile otp
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "MOTPverifications successful....");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "MOTPverifications...." + ex.Message.ToString());
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.OK, ex.Message));
                throw ex;
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
        [Route("api/UserAccount/EOTPVerification")]
        public DataTable EOTPVerification(UserAccount ocr)
        {
            //int status = 0;
            DataTable tbl = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();           
            StringBuilder str = new StringBuilder();
            DataSet ds = new DataSet();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "EOTPverifications....");
                str.Append("Mobileno:" + ocr.Mobilenumber + ",");
                str.Append("Email:" + ocr.Email + ",");
                str.Append("Emailotp:" + ocr.EVerificationCode + ",");
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());


                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSEOTPverification";

                cmd.Connection = conn;


                SqlParameter m = new SqlParameter("@UserId", SqlDbType.Int);
                m.Value = ocr.userId;
                cmd.Parameters.Add(m);

                SqlParameter q1 = new SqlParameter("@Email", SqlDbType.VarChar, 50);
                q1.Value = ocr.Email;
                cmd.Parameters.Add(q1);

                SqlParameter e = new SqlParameter("@Emailotp", SqlDbType.VarChar, 10);
                e.Value = ocr.EVerificationCode;
                cmd.Parameters.Add(e);

                //try
                //{
                //    conn.Open();
                //    object statusres = cmd.ExecuteScalar();
                //    conn.Close();
                //    if (statusres != null)
                //    {
                //        if (conn.State == ConnectionState.Open)
                //        {
                //            conn.Close();
                //        }
                //        //return Convert.ToInt32(statusres);
                //    }
                //}
                //catch (Exception ex)
                //{
                //    throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.OK, ex.Message));
                //}
                //Verify mobile otp
               
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "EOTPVerification successful....");
                //statustbl = GetStatusTbl("200", "Success");
                //ds.Tables.Add(statustbl);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(tbl);
               

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "EOTPVerification...." + ex.Message.ToString());
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.OK, ex.Message));
                throw ex;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return tbl;

            //return status;
            //Verify Emailotp
        }
        private DataTable GetStatusTbl(string status, string mssg) {
            DataTable tbl = new DataTable();
            tbl.Columns.Add("Code");
            tbl.Columns.Add("description");

            DataRow dr = tbl.NewRow();
            dr[0] = status;
            dr[1] = mssg;
            tbl.Rows.Add(dr);
            return tbl;
        }

        [HttpPost]
        [Route("api/UserAccount/Addbalance")]
        public DataTable Addbalance(balance ocr)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();

            try
            {
                traceWriter.Trace(Request, "0", System.Diagnostics.TraceLevel.Info, "{0}", "Addbalance....");
                str.Append("Mobileno:" + ocr.mobileno + ",");
                str.Append("Amount:" + ocr.Amount + ",");
                
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSInsUpdAddbalance";

                cmd.Connection = conn;

                SqlParameter f = new SqlParameter("@flag", SqlDbType.VarChar);
                f.Value = ocr.flag;
                cmd.Parameters.Add(f);

                SqlParameter q1 = new SqlParameter("@Mobileno", SqlDbType.VarChar, 20);
                q1.Value = ocr.mobileno;
                cmd.Parameters.Add(q1);

                SqlParameter e = new SqlParameter("@Amount", SqlDbType.Decimal);
                e.Value = ocr.Amount;
                cmd.Parameters.Add(e);


                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Addbalance successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Addbalance...." + ex.Message.ToString());
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
            return (dt);

            //Verify Passwordotp

        }

        [HttpPost]
        [Route("api/UserAccount/Passwordverification")]
        public DataTable Passwordverification(UserAccount ocr)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            try
            {
                
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Passwordverification....");

                str.Append("Mobileno:" + ocr.Mobilenumber + ",");
                str.Append("Email:" + ocr.Email + ",");
                str.Append("Password:" + ocr.Password + ",");
                str.Append("Passwordotp:" + ocr.Passwordotp + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSPasswordverification";

                cmd.Connection = conn;

                SqlParameter q1 = new SqlParameter("@UserAccountNo", SqlDbType.VarChar, 50);
                q1.Value = ocr.UserAccountNo;
                cmd.Parameters.Add(q1);

                //SqlParameter ee = new SqlParameter("@Email", SqlDbType.VarChar, 50);
                //ee.Value = ocr.Email;
                //cmd.Parameters.Add(ee);

                SqlParameter po = new SqlParameter("@Password", SqlDbType.VarChar, 50);
                po.Value = ocr.Password;
                cmd.Parameters.Add(po);

                SqlParameter e = new SqlParameter("@Passwordotp", SqlDbType.VarChar, 10);
                e.Value = ocr.Passwordotp;
                cmd.Parameters.Add(e);


                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Passwordverification successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Passwordverification...." + ex.Message.ToString());
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
            return (dt);

            //Verify Passwordotp

        }

        [HttpPost]
        [Route("api/UserAccount/ResendOtp")]
        public DataTable ResendOtp(UserAccount ocr)
        {
            int Status = 0;
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "ResendOTP....");
                str.Append("UserAccountNo:" + ocr.UserAccountNo + ",");
                // str.Append("Email:" + ocr.Email + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSInsUpdDelResendOTP";

                cmd.Connection = conn;

                SqlParameter c = new SqlParameter("@UserAccountNo", SqlDbType.VarChar, 20);
                c.Value = ocr.UserAccountNo;
                cmd.Parameters.Add(c);

                SqlParameter chag = new SqlParameter("@change", SqlDbType.Int);
                chag.Value = ocr.change;
                cmd.Parameters.Add(chag);

                SqlDataAdapter ds = new SqlDataAdapter(cmd);
                ds.Fill(dt);

               
                string potp = dt.Rows[0]["passwordotp"].ToString();
                string eotp = dt.Rows[0]["Emailotp"].ToString();
                string motp = dt.Rows[0]["passwordotp"].ToString();
                string emailAddrss = dt.Rows[0]["Email"].ToString();
                //send pwd otp
                #region password otp
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
                        mail.Subject = "User registration - Password OTP";
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
                                                                             
                                                       Your email OTP is:<h3>" + potp + @" </h3>

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

                    //send email otp\
                    #region email opt                    
                    if (eotp != null)
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
                            mail.Subject = "User registration - Email OTP";
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
                                                                             
                                                       Your email OTP is:<h3>" + eotp + @" </h3>

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

                    //send mobile otp


                    // return dt;

                    #endregion email otp

                    //send mobile otp as SMS
                    #region Mobile OTP                    
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
                            mail.To.Add(emailAddrss);
                            mail.Subject = "User registration - Mobile OTP";
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


                }
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "ResendOTP successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "ResendOTP...." + ex.Message.ToString());
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
