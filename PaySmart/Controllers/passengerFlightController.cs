
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
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();
            LogTraceWriter tracer = new LogTraceWriter();

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

                        tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", "passenger Name: ...." + p.name);
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
                        tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", p.name + "Passenger is created");
                    }
                    catch (Exception ex)
                    {
                        tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", ex.Message);
                        throw ex;
                    }
                }
            }
            catch (Exception ex)
            {

                tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", ex.Message);
                throw ex;

            }
            finally{
              
            }
            return dt;
        }
    }
}
