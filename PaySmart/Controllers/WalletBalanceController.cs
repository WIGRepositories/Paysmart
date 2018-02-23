using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Paysmart.Models;
using System.Web.Http.Tracing;
using System.Net.Mail;
using System.Text;

namespace Paysmart.Controllers
{
    public class WalletBalanceController : ApiController
    {
        [HttpGet]
        [Route("api/WalletBalance/Getcurrentbalance")]

        public DataTable Getcurrentbalance(string mobileno)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getcurrentbalance....");

                str.Append("Mobilenumber:" + mobileno + ",");
                
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());


            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSGetCurrentBalance";
            cmd.Connection = conn;

            SqlParameter cmpid = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
            cmpid.Value = mobileno;
            cmd.Parameters.Add(cmpid);

            
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(dt);


            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getcurrentbalance successful....");
            }
             catch (Exception ex)
             {
                 traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Getcurrentbalance...." + ex.Message.ToString());
                 //throw ex;
                // throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                 dt.Columns.Add("Code");
                 dt.Columns.Add("description");
                 DataRow dr = dt.NewRow();
                 dr[0] = "SCC001";
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
        [Route("api/WalletBalance/WalletBalance")]

        public DataTable WalletBalance(Appusers A)
        {

            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            SqlCommand cmd = new SqlCommand();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "WalletBalance....");

                str.Append("Mobilenumber:" + A.Mobilenumber + ",");
                str.Append("Amount:" + A.Amount + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "EWInsUpdWalletBalance";
                cmd.Connection = conn;

                SqlParameter f = new SqlParameter("@flag", SqlDbType.VarChar);
                f.Value = A.flag;
                cmd.Parameters.Add(f);


                SqlParameter mn = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
                mn.Value = A.Mobilenumber;
                cmd.Parameters.Add(mn);

                SqlParameter em = new SqlParameter("@Amount", SqlDbType.Decimal);
                em.Value = A.Amount;
                cmd.Parameters.Add(em);


                SqlParameter St = new SqlParameter("@StatusId", SqlDbType.Int);
                St.Value = A.Status;
                cmd.Parameters.Add(St);
          
           
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            #region Email OTP
            string eotp = dt.Rows[0]["Amount"].ToString();
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
                    mail.To.Add(fromaddress);
                    mail.Subject = "Balance";
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
                                                                             
                                                       Your Balance:<h3>" + eotp + @" </h3>

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
                    //throw ex;
                    throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                }
            }
            #endregion Email OTP
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "WalletBalance successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "WalletBalance...." + ex.Message.ToString());
                //throw ex;
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                dt.Columns.Add("Code");
                dt.Columns.Add("description");
                DataRow dr = dt.NewRow();
                dr[0] = "SCC001";
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
