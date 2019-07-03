
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
    public class passengerControllerFlight : ApiController
    {
        [HttpGet]
        [Route("api/passenger/getpassenger")]
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
        [Route("api/passenger/savepassenger")]
        public DataTable savepassenger(passengerfight n)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();
           // LogTraceWriter tracer = new LogTraceWriter();

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            try
            {
               // tracer.Trace(Request, "0",System.Web.Http.Tracing.TraceLevel.Info,"{0}", "passenger....");
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "InsUpdDelpassenger";
                cmd.Connection = conn;

                SqlParameter id = new SqlParameter("@Id", SqlDbType.Int);
                id.Value = n.Id;
                cmd.Parameters.Add(id);

                SqlParameter na = new SqlParameter("@name", SqlDbType.VarChar, 50);
                na.Value = n.name;
                cmd.Parameters.Add(na);

                SqlParameter dee = new SqlParameter("@age", SqlDbType.Int);
                dee.Value = n.age;
                cmd.Parameters.Add(dee);

                SqlParameter lon = new SqlParameter("@gender", SqlDbType.VarChar, 50);
                lon.Value = n.gender;
                cmd.Parameters.Add(lon);
                SqlParameter lal = new SqlParameter("@appuserid", SqlDbType.VarChar, 50);
                lal.Value = n.appuserid;
                cmd.Parameters.Add(lal);

                SqlParameter acc = new SqlParameter("@passengercode", SqlDbType.VarChar, 50);
                acc.Value = n.passengercode;
                cmd.Parameters.Add(acc);

                SqlParameter fla = new SqlParameter("@flag", SqlDbType.VarChar);
                fla.Value = n.flag;
                cmd.Parameters.Add(fla);

               SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

              //  tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", "passenger info end ....");
            }
            catch (Exception ex)
            {
                throw ex;

            }
            return dt;
        }
    }
}
