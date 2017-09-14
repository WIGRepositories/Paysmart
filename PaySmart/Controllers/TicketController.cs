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
namespace Paysmart.Controllers
{



    public class TicketController : ApiController
    {

        [HttpPost]
        [Route("api/Ticket/TroubleTicket")]
        public DataTable TroubleTicket(Tickets ocr)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "TroubleTicket....");

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSInsupdTroubleTicket";

                cmd.Connection = conn;


                SqlParameter f = new SqlParameter("@flag", SqlDbType.VarChar);
                f.Value = ocr.flag;
                cmd.Parameters.Add(f);

                SqlParameter q = new SqlParameter("@Id", SqlDbType.Int);
                q.Value = ocr.id;
                cmd.Parameters.Add(q);

                SqlParameter q1 = new SqlParameter("@Userid", SqlDbType.Int);
                q1.Value = ocr.Userid;
                cmd.Parameters.Add(q1);

                SqlParameter e = new SqlParameter("@EmailId", SqlDbType.VarChar, 50);
                e.Value = ocr.EmailId;
                cmd.Parameters.Add(e);

                SqlParameter c = new SqlParameter("@CreatedOn", SqlDbType.Date);
                c.Value = ocr.CreatedOn;
                cmd.Parameters.Add(c);

                SqlParameter b = new SqlParameter("@Onbehalfofph", SqlDbType.VarChar, 20);
                b.Value = ocr.Onbehalfofph;
                cmd.Parameters.Add(b);

                SqlParameter t = new SqlParameter("@Catid", SqlDbType.Int);
                t.Value = ocr.Catid;
                cmd.Parameters.Add(t);

                SqlParameter e2 = new SqlParameter("@Description", SqlDbType.VarChar, 250);
                e2.Value = ocr.Description;
                cmd.Parameters.Add(e2);

                SqlParameter e1 = new SqlParameter("@Emailsent", SqlDbType.Int);
                e1.Value = ocr.Emailsent;
                cmd.Parameters.Add(e1);

                SqlParameter s1 = new SqlParameter("@Smssent", SqlDbType.Int);
                s1.Value = ocr.Smssent;
                cmd.Parameters.Add(s1);

                SqlParameter n = new SqlParameter("@TicketTypeId", SqlDbType.Int);
                n.Value = ocr.TicketTypeId;
                cmd.Parameters.Add(n);

                SqlParameter p = new SqlParameter("@PhoneNumber", SqlDbType.VarChar, 20);
                p.Value = ocr.PhoneNumber;
                cmd.Parameters.Add(p);

                SqlParameter s = new SqlParameter("@StatusId", SqlDbType.Int);
                s.Value = ocr.StatusId;
                cmd.Parameters.Add(s);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "TroubleTicket successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "TroubleTicket...." + ex.Message.ToString());
                throw ex;
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

        [HttpGet]
        [Route("api/Ticket/GetTicketDetails")]
        public DataTable TicketDetails(int TicketId)
        {
            DataTable Tbl = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetTicketDetails....");
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSGetTicketDetails";

                cmd.Parameters.Add("@TicketId", SqlDbType.Int).Value = TicketId;

                cmd.Connection = conn;

                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(Tbl);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetTicketDetails successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetTicketDetails...." + ex.Message.ToString());
                throw ex;
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
        [Route("api/Ticket/GetTicketHistory")]
        public DataTable GetTicketHistory(string TicketId)
        {
            DataTable Tbl = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetTicketHistory....");
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "GetTickets";

                cmd.Parameters.Add("@TicketId", SqlDbType.VarChar, 20).Value = TicketId;
                cmd.Connection = conn;

                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(Tbl);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetTicketHistory successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetTicketHistory...." + ex.Message.ToString());
                throw ex;
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
        [Route("api/Ticket/GetFilecontent")]
        public DataTable GetFilecontent(int fileid)
        {
            DataTable Tbl = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetFilecontent....");
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "getfilecontent";
                cmd.Parameters.Add("@fileid", SqlDbType.Int).Value = fileid;
                cmd.Connection = conn;

                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(Tbl);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetFilecontent successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetFilecontent...." + ex.Message.ToString());
                throw ex;
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
        [Route("api/Ticket/GetAllTickets")]
        public DataTable GetAllTickets(DateTime CreatedOn)
        {
            DataTable Tbl = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetAllTickets....");
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "GetAllTickets";
                cmd.Parameters.Add("@CreatedOn", SqlDbType.Date).Value = CreatedOn;
                cmd.Connection = conn;

                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(Tbl);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetAllTickets successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetAllTickets...." + ex.Message.ToString());
                throw ex;
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
        [Route("api/Ticket/GetAllUserTickets")]
        public DataTable GetAllUserTickets(int Userid)
        {
            DataTable Tbl = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetAllUserTickets....");
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "GetAllUserTickets";
                cmd.Parameters.Add("@Userid", SqlDbType.Int).Value = Userid;
                cmd.Connection = conn;

                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(Tbl);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetAllUserTickets successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetAllUserTickets...." + ex.Message.ToString());
                throw ex;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return Tbl;

        }
    }
}

