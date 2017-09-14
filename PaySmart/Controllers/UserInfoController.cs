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
    public class UserInfoController : ApiController
    {
        [HttpPost]
        [Route("api/UserInfo/Infodetails")]
        public DataTable Infodetails(UserInfo U)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Infodetails....");

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSInsupdUserinfo";

                cmd.Connection = conn;

                SqlParameter q = new SqlParameter("@Id", SqlDbType.Int);
                q.Value = U.Id;
                cmd.Parameters.Add(q);

                SqlParameter q1 = new SqlParameter("@Firstname", SqlDbType.VarChar, 20);
                q1.Value = U.Firstname;
                cmd.Parameters.Add(q1);

                SqlParameter e = new SqlParameter("@lastname", SqlDbType.VarChar, 20);
                e.Value = U.lastname;
                cmd.Parameters.Add(e);

                SqlParameter t = new SqlParameter("@username", SqlDbType.VarChar, 20);
                t.Value = U.username;
                cmd.Parameters.Add(t);

                SqlParameter c = new SqlParameter("@Emailid", SqlDbType.VarChar, 50);
                c.Value = U.Emailid;
                cmd.Parameters.Add(c);

                SqlParameter b = new SqlParameter("@Phonenumber", SqlDbType.VarChar, 20);
                b.Value = U.Phonenumber;
                cmd.Parameters.Add(b);

                SqlParameter b1 = new SqlParameter("@Mobileotp", SqlDbType.VarChar, 5);
                b1.Value = U.Mobileotp;
                cmd.Parameters.Add(b1);

                SqlParameter b2 = new SqlParameter("@Emailotp", SqlDbType.VarChar, 5);
                b2.Value = U.Emailotp;
                cmd.Parameters.Add(b2);

                SqlParameter b3 = new SqlParameter("@Pwdotp", SqlDbType.VarChar, 5);
                b3.Value = U.Pwdotp;
                cmd.Parameters.Add(b3);

                SqlParameter m = new SqlParameter("@Password", SqlDbType.VarChar, 20);
                m.Value = U.Password;
                cmd.Parameters.Add(m);

                SqlParameter m1 = new SqlParameter("@statusId", SqlDbType.Int);
                m1.Value = U.statusId;
                cmd.Parameters.Add(m1);

                SqlParameter m2 = new SqlParameter("@AccountNo", SqlDbType.VarChar, 50);
                m2.Value = U.AccountNo;
                cmd.Parameters.Add(m2);

                SqlParameter bt = new SqlParameter("@AuthTypeId", SqlDbType.Int);
                bt.Value = U.AuthTypeId;
                cmd.Parameters.Add(bt);


                SqlParameter be = new SqlParameter("@AltPhonenumber", SqlDbType.VarChar, 20);
                be.Value = U.AltPhonenumber;
                cmd.Parameters.Add(be);

                SqlParameter bm = new SqlParameter("@Altemail", SqlDbType.VarChar, 50);
                bm.Value = U.Altemail;
                cmd.Parameters.Add(bm);


                SqlParameter f1 = new SqlParameter("@flag", SqlDbType.VarChar);
                f1.Value = U.flag;
                cmd.Parameters.Add(f1);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Infodetails successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Infodetails...." + ex.Message.ToString());
                throw ex;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return (dt);



        }


        [HttpGet]
        [Route("api/UserInfo/Getinfo")]
        public DataTable Getinfo()
        {
            DataTable Tbl = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getinfo....");
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "GetUserinfo";
                cmd.Connection = conn;

                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(Tbl);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getinfo successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Getinfo...." + ex.Message.ToString());
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
        [Route("api/UserInfo/GetCount")]
        public DataTable GetCount()
        {
            DataTable Tbl = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetCount....");
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "GetDownloadCount";
                cmd.Connection = conn;

                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(Tbl);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetCount successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetCount...." + ex.Message.ToString());
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

        [HttpPost]
        [Route("api/UserInfo/Downloads")]
        public DataTable Downloads(UserDownloads m)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Downloads....");

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "InsupdUserdownloads";

                cmd.Connection = conn;



                SqlParameter q = new SqlParameter("@Id", SqlDbType.Int);
                q.Value = m.Id;
                cmd.Parameters.Add(q);

                SqlParameter q1 = new SqlParameter("@Android", SqlDbType.VarChar, 50);
                q1.Value = m.Android;
                cmd.Parameters.Add(q1);

                SqlParameter e = new SqlParameter("@Win", SqlDbType.VarChar, 50);
                e.Value = m.Win;
                cmd.Parameters.Add(e);

                SqlParameter t = new SqlParameter("@Ios", SqlDbType.VarChar, 50);
                t.Value = m.Ios;
                cmd.Parameters.Add(t);

                SqlParameter c1 = new SqlParameter("@Websitedown", SqlDbType.VarChar, 50);
                c1.Value = m.Websitedown;
                cmd.Parameters.Add(c1);

                SqlParameter b = new SqlParameter("@Iosdown", SqlDbType.VarChar, 50);
                b.Value = m.Iosdown;
                cmd.Parameters.Add(b);

                SqlParameter b1 = new SqlParameter("@Wincount", SqlDbType.VarChar, 50);
                b1.Value = m.Wincount;
                cmd.Parameters.Add(b1);


                SqlParameter f1 = new SqlParameter("@flag", SqlDbType.VarChar);
                f1.Value = m.flag;
                cmd.Parameters.Add(f1);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Downloads successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Downloads...." + ex.Message.ToString());
                throw ex;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return (dt);



        }
    }
}
