using System;
using System.Collections.Generic;
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
    public class CancelBookingController : ApiController
    {
        [HttpPost]

        [Route("api/CancelBooking/CancelBooking")]
        public DataTable cncelbkng(cancel c)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "CancelBooking....");

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HVInsUpdcancelbooking";

                SqlParameter i = new SqlParameter("@BNo", SqlDbType.Int);
                i.Value = c.BNo;
                cmd.Parameters.Add(i);

                SqlParameter n = new SqlParameter("@BookingStatus", SqlDbType.Int);
                n.Value = c.BookingStatus;
                cmd.Parameters.Add(n);

                SqlParameter r = new SqlParameter("@CancelReason", SqlDbType.VarChar, 255);
                r.Value = c.CancelReason;
                cmd.Parameters.Add(r);


                SqlParameter a = new SqlParameter("@CancelBy", SqlDbType.VarChar, 255);
                a.Value = c.CancelBy;
                cmd.Parameters.Add(a);

                cmd.Connection = conn;
                DataSet ds = new DataSet();
                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(ds);
                dt = ds.Tables[0];

                #region Mobile OTP
                string eotp = dt.Rows[0]["bookingNumber"].ToString();
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
                        mail.Subject = "Vehicle Registration - Email OTP";
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
                                                                             
                                                       Your Vehicle is Booked:<h3>" + eotp + @" </h3>

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

                        throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.OK, ex.Message));
                    }
                }
                #endregion Mobile OTP

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "CancelBooking successful....");
                StringBuilder str = new StringBuilder();
                str.Append("@BNo" + c.BNo + ",");
                str.Append("@BookingStatus" + c.BookingStatus + ",");
                str.Append("@CancelReason" + c.CancelReason + ",");
                str.Append("@CancelBy" + c.CancelBy + ",");


                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "CancelBooking Input sent...." + str.ToString());

                if (dt.Rows.Count > 0)
                    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "CancelBooking Output...." + dt.Rows[0].ToString());
                else
                    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "CancelBooking Output....CancelBooking ");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "CancelBooking.... failed" + ex.Message.ToString());
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

        [Route("api/CancelBooking/BookingExpiry")]
        public int BookingExpiry(VehicleBooking vb)
        {
            int status = 0;
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
          
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "BookingExpiry....");
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HVInsUpdcancelbooking";

                SqlParameter i = new SqlParameter("@BNo", SqlDbType.VarChar, 20);
                i.Value = vb.BNo;
                cmd.Parameters.Add(i);

                SqlParameter n = new SqlParameter("@cancellationType", SqlDbType.Int);
                n.Value = 2;
                cmd.Parameters.Add(n);

                SqlParameter r = new SqlParameter("@CancelReason", SqlDbType.VarChar, 255);
                r.Value = "No reponse";
                cmd.Parameters.Add(r);


                SqlParameter a = new SqlParameter("@CancelledBy", SqlDbType.VarChar, 50);
                a.Value = vb.CancelledBy;
                cmd.Parameters.Add(a);


                cmd.Connection = conn;
                conn.Open();
                object result = cmd.ExecuteScalar();
                conn.Close();
                if (result.ToString() == "1")
                {
                    status = 1;
                    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "BookingExpiry successful....");
                }
               // return status;
            }
            catch (Exception ex)
            {
                
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "BookingExpiry.... failed" + ex.Message.ToString());
                throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                //return status;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return status;
        }

    }
}
