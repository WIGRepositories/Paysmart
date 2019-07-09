
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
        public DataTable savepassenger(List<passengerfight> n)
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

                foreach (passengerfight p in n) {
                    try
                    {
 
                        tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", "passenger Name: ...."+p.name);
                        SqlParameter id = new SqlParameter("@Id", SqlDbType.Int);
                        id.Value = p.Id;
                        cmd.Parameters.Add(id);

                        SqlParameter na = new SqlParameter("@name", SqlDbType.VarChar, 50);
                        na.Value = p.name;
                        cmd.Parameters.Add(na);

                        SqlParameter dee = new SqlParameter("@age", SqlDbType.Int);
                        dee.Value = p.age;
                        cmd.Parameters.Add(dee);

                        SqlParameter lon = new SqlParameter("@gender", SqlDbType.VarChar, 50);
                        lon.Value = p.gender;
                        cmd.Parameters.Add(lon);
                        SqlParameter lal = new SqlParameter("@appuserid", SqlDbType.Int);
                        lal.Value = p.appuserid;
                        cmd.Parameters.Add(lal);

                        SqlParameter acc = new SqlParameter("@passengercode", SqlDbType.VarChar, 50);
                        acc.Value = p.passengercode;
                        cmd.Parameters.Add(acc);

                        SqlParameter fla = new SqlParameter("@flag", SqlDbType.VarChar);
                        fla.Value = p.flag;
                        cmd.Parameters.Add(fla);

                        cmd.ExecuteScalar();

                        tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", p.name+"Passenger is created");
                    }
                    catch (Exception ex) {
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
            return dt;
        }
    }
}
