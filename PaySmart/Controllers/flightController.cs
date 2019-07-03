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

namespace paysmart.Controllers
{
    public class flightController : ApiController
    {
        [HttpGet]
        [Route("api/flight/getflight")]
        public DataTable getflight()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Getflights";
            cmd.Connection = conn;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;

        }
        [HttpPost]
        [Route("api/flight/saveflight")]
        public DataTable saveflight(fly n)
        {
            DataTable dt = new DataTable();
           // LogTraceWriter tracer = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            try
            {
              //  tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", "flight....");
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "InsUpdDelflights";
                cmd.Connection = conn;

                SqlParameter id = new SqlParameter("@Id", SqlDbType.Int);
                id.Value = n.Id;
                cmd.Parameters.Add(id);

                SqlParameter na = new SqlParameter("@code", SqlDbType.VarChar, 50);
                na.Value = n.code;
                cmd.Parameters.Add(na);

                SqlParameter dee = new SqlParameter("@type", SqlDbType.VarChar, 50);
                dee.Value = n.type;
                cmd.Parameters.Add(dee);

                SqlParameter lon = new SqlParameter("@airlineid", SqlDbType.Int);
                lon.Value = n.airlineid;
                cmd.Parameters.Add(lon);
                SqlParameter lal = new SqlParameter("@capacity", SqlDbType.Int);
                lal.Value = n.capacity;
                cmd.Parameters.Add(lal);

                //SqlParameter acc = new SqlParameter("@fromdate", SqlDbType.DateTime);
                //acc.Value = n.fromdate;
                //cmd.Parameters.Add(acc);

                SqlParameter fla = new SqlParameter("@flag", SqlDbType.VarChar);
                fla.Value = n.flag;
                cmd.Parameters.Add(fla);

                SqlParameter cod = new SqlParameter("@rows", SqlDbType.Int);
                cod.Value = n.rows;
                cmd.Parameters.Add(cod);

                SqlParameter cou = new SqlParameter("@cols", SqlDbType.Int);
                cou.Value = n.cols;
                cmd.Parameters.Add(cou);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
               // tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", "flight....");

            }
            catch (Exception ex)
            {
                throw ex;

            }
            return dt;
        }
    }
}
