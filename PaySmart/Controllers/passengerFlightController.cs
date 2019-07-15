
using Paysmart;
using Paysmart.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Http;
using System.Web.Http.Tracing;

namespace paysmart.Controllers
{
    public class passengerFlightController : ApiController
    {
        [HttpGet]
        [Route("api/passengerFlight/getpassenger")]
        public DataTable getpassenger()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Getpassenger";
            cmd.Connection = conn;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;

        }
        [HttpPost]
        [Route("api/passengerFlight/savepassenger")]
        public DataTable savepassenger(List<passengerfight> list)
        {
            int status;
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();
            LogTraceWriter tracer = new LogTraceWriter();
            StringBuilder passangersList = new StringBuilder();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            try
            {
                //tracer.Trace(Request, "0",System.Web.Http.Tracing.TraceLevel.Info,"{0}", "passenger....");
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "InsUpdDelpassenger";
                cmd.Connection = conn;
                conn.Open();
                foreach (passengerfight p in list)
                {
                    try
                    {

                        tracer.Trace(Request, "0", TraceLevel.Info, "{0}", "passenger Name: ...." + p.name);
                        cmd.Parameters.Add(new SqlParameter("@Id", SqlDbType.Int)).SqlValue = p.Id;
                        cmd.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar, 50)).SqlValue = p.name;
                        cmd.Parameters.Add(new SqlParameter("@age", SqlDbType.Int)).SqlValue = p.age;
                        cmd.Parameters.Add(new SqlParameter("@gender", SqlDbType.VarChar, 50)).SqlValue = p.gender;
                        cmd.Parameters.Add(new SqlParameter("@appuserid", SqlDbType.Int)).SqlValue = p.appuserid;
                        cmd.Parameters.Add(new SqlParameter("@passengercode", SqlDbType.VarChar, 50)).SqlValue = p.passengercode;
                        cmd.Parameters.Add(new SqlParameter("@flag", SqlDbType.VarChar)).SqlValue = p.flag;
                        cmd.Parameters.Add(new SqlParameter("@seatno", SqlDbType.VarChar,20)).SqlValue = p.seatno;
                        cmd.Parameters.Add(new SqlParameter("@EmailId", SqlDbType.VarChar,50)).SqlValue = p.emailid;
                        cmd.Parameters.Add(new SqlParameter("@ContactNo", SqlDbType.VarChar,50)).SqlValue = p.Mobileno;
   
                        cmd.ExecuteScalar();
                        string pTd = string.Format("<tr width='100%' style='text-align:left;background:#f7f9ff;padding-left:8px'><td align='center'>{0}</td><td align='center'>{1}</td><td align='center'>{2}</td><td align='center'>{3}</td><td align='center'>{4}</td></tr>", p.name, p.name, p.seatno,"Hyderabad","Banglore");

                        passangersList.Append(pTd);
                        cmd.Parameters.Clear();
                        tracer.Trace(Request, "0", TraceLevel.Info, "{0}", p.name + "Passenger is created");
                    }

                    catch (Exception ex)
                    {
                        tracer.Trace(Request, "0", TraceLevel.Info, "{0}", ex.Message);
                        throw ex;
                    }
                }
                #region save ticket information

                string root = HttpContext.Current.Server.MapPath("~/ui/emailtemplates/FlightTicket1.txt");

                string mailContent = System.IO.File.ReadAllText(root);


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
                    mail.To.Add(list[0].emailid);
                    mail.Subject = "Flight Ticket details";
                    mail.IsBodyHtml = true;

                    //{0} - Ticket No
                    //{1} - transId
                    //{2} - from
                    //{3} - to
                    //{4} - departure Data and time
                    //{5} - arrival Date and time
                    //{6} - No of seats
                    //{7} - Seats list
                    //{8} - Vehicle reg number
                    //{9} - Provider name
                    //{10} - distance
                    //{11} - Total amount
                    //{12} - MobileNo 
                    //{13} - Email Address
                    //{14} - Address
                    //{15} - Base fare
                    //{16} - Sub total
                    //{17} - passenger Details

                    mailContent = String.Format(mailContent,passangersList.ToString()); ;
                    mail.Body = mailContent;

                    //SmtpServer.Port = 465;
                    //SmtpServer.Port = 587;
                    SmtpServer.Port = Convert.ToInt32(port);
                    SmtpServer.UseDefaultCredentials = false;

                    SmtpServer.Credentials = new System.Net.NetworkCredential(username, pwd);
                    SmtpServer.EnableSsl = true;
                    //SmtpServer.TargetName = "STARTTLS/smtp.gmail.com";
                    SmtpServer.Send(mail);
                    status = 1;



                }
                catch (Exception ex)
                {
                    //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                    status = 0;
                    dt.Columns.Add("Code");
                    dt.Columns.Add("description");
                    DataRow dr = dt.NewRow();
                    dr[0] = "ERR001";
                    dr[1] = ex.Message;
                    dt.Rows.Add(dr);

                }

                #endregion 
            }
            catch (Exception ex)
            {

                tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", ex.Message);
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
