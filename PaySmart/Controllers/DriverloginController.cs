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
using System.Text; 
using System.Web.Http.Tracing;

namespace Paysmart.Controllers
{
    public class DriverloginController : ApiController
    {

        [HttpGet]
        [Route("api/Driverlogin/Getdrivers")]
        public DataTable Getdrivers(int DId)
        {
           
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getdrivers....");
                StringBuilder str = new StringBuilder();
                str.Append("@DId" + DId + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getdrivers Input sent...." + str.ToString());

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSGetDriverLogin";
            cmd.Connection = conn;
            cmd.Parameters.Add("@DId", SqlDbType.VarChar,20).Value = DId;

            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(dt);

            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getdrivers successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Getdrivers...." + ex.Message.ToString());
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
        [Route("api/Driverlogin/Driverlogin")]
        public DataTable Driverinn(drivers dl)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Driverlogin....");

                StringBuilder str = new StringBuilder();
                str.Append("@loginlogout" + dl.loginlogout + ",");
                str.Append("@DriverNo" + dl.DriverNo + ",");
                str.Append("@Reason" + dl.Reason + ",");
                str.Append("@LoginLatitude" + dl.LoginLatitude + ",");
                str.Append("@LoginLongitude" + dl.LoginLongitude + ",");

           traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Driverlogin Input sent...." + str.ToString());               

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSInsUpdDriverLogin";
            cmd.Connection = conn;

            SqlParameter ff = new SqlParameter("@loginlogout", SqlDbType.Int);
            ff.Value = dl.loginlogout;
            cmd.Parameters.Add(ff);

           
            SqlParameter n = new SqlParameter("@DriverNo", SqlDbType.VarChar,20);
            n.Value = dl.DriverNo;
            cmd.Parameters.Add(n);           

            SqlParameter j2 = new SqlParameter("@Reason", SqlDbType.VarChar,500);
            j2.Value = dl.Reason;
            cmd.Parameters.Add(j2);
           

            SqlParameter h = new SqlParameter("@LoginLatitude", SqlDbType.Float);
            h.Value = dl.LoginLatitude;
            cmd.Parameters.Add(h);

            SqlParameter j = new SqlParameter("@LoginLongitude", SqlDbType.Float);
            j.Value = dl.LoginLongitude;
            cmd.Parameters.Add(j);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Driverlogin successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Driverlogin...." + ex.Message.ToString());
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
        [Route("api/Driverlogin/ValidateDriverCredentials")]
        public DataTable ValidateDriverCredentials(DriverLogin b)
        {
           LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "ValidateDriverCredentials....");


                StringBuilder str = new StringBuilder();
                str.Append("@DriverNo" + b.Mobilenumber + ",");
                str.Append("@Password" + b.Password + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "ValidateDriverCredentials Input sent...." + str.ToString());
                
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "drivercredentials";
                cmd.Connection = conn;
                            
                SqlParameter ss = new SqlParameter();
                ss.ParameterName = "@DriverNo";
                ss.SqlDbType = SqlDbType.VarChar;
                ss.Value = b.Mobilenumber;
                cmd.Parameters.Add(ss);
                SqlParameter dd = new SqlParameter();
                dd.ParameterName = "@Password";
                dd.SqlDbType = SqlDbType.VarChar;
                dd.Value = b.Password;
                cmd.Parameters.Add(dd);
               
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "ValidateDriverCredentials successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "ValidateDriverCredentials...." + ex.Message.ToString());
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
