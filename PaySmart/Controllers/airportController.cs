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
    public class airportController : ApiController
    {
        [HttpGet]
        [Route("api/airport/getairport")]
        public DataTable getairport()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "GetAirports";
            cmd.Connection = conn;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;

        }
        [HttpPost]
        [Route("api/airport/saveairport")]
        public DataTable saveairport(airport n)
        {
            DataTable dt = new DataTable();
            LogTraceWriter tracer = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            try
            {
                tracer.Trace(Request, "0", TraceLevel.Info, "{0}", "airport....");
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "InsUpdDelAirports";
                cmd.Connection = conn;

                SqlParameter id = new SqlParameter("@Id", SqlDbType.Int);
                id.Value = n.Id;
                cmd.Parameters.Add(id);

                SqlParameter na = new SqlParameter("@name", SqlDbType.VarChar, 50);
                na.Value = n.name;
                cmd.Parameters.Add(na);

                SqlParameter dee = new SqlParameter("@desce", SqlDbType.VarChar, 500);
                dee.Value = n.desc;
                cmd.Parameters.Add(dee);

                SqlParameter lon = new SqlParameter("@longitude", SqlDbType.Decimal);
                lon.Value = n.longitude;
                cmd.Parameters.Add(lon);
                SqlParameter lal = new SqlParameter("@latitude", SqlDbType.Decimal);
                lal.Value = n.latitude;
                cmd.Parameters.Add(lal);

                SqlParameter acc = new SqlParameter("@active", SqlDbType.Int);
                acc.Value = n.active;
                cmd.Parameters.Add(acc);

                SqlParameter fla = new SqlParameter("@flag", SqlDbType.VarChar);
                fla.Value = n.flag;
                cmd.Parameters.Add(fla);

                SqlParameter cod = new SqlParameter("@code", SqlDbType.VarChar,50);
                cod.Value = n.code;
                cmd.Parameters.Add(cod);

                SqlParameter cou = new SqlParameter("@countryid", SqlDbType.VarChar,50);
                cou.Value = n.countryid;
                cmd.Parameters.Add(cou);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                tracer.Trace(Request, "0",TraceLevel.Info, "{0}", "airport....");

            }
            catch (Exception ex)
            {
                throw ex;

            }
            return dt;
        }
    }
}
