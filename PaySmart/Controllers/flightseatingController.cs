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
    public class flightseatingController : ApiController
    {
        [HttpGet]
        [Route("api/flightseating/getflightseating")]
        public DataTable getflightseating()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Getflightseating";
            cmd.Connection = conn;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;

        }
        [HttpPost]
        [Route("api/flightseating/saveflightseating")]
        public DataTable saveflightseating(flightseating n)
        {
            DataTable dt = new DataTable();
            LogTraceWriter tracer = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            try
            {
                tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", "flightseating....");
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "InsUpdDelflightseating";
                cmd.Connection = conn;

                SqlParameter id = new SqlParameter("@Id", SqlDbType.Int);
                id.Value = n.Id;
                cmd.Parameters.Add(id);

                SqlParameter na = new SqlParameter("@flightid", SqlDbType.VarChar, 50);
                na.Value = n.flightid;
                cmd.Parameters.Add(na);

                SqlParameter dee = new SqlParameter("@rowid", SqlDbType.VarChar, 50);
                dee.Value = n.rowid;
                cmd.Parameters.Add(dee);

                SqlParameter lon = new SqlParameter("@columnid", SqlDbType.VarChar, 50);
                lon.Value = n.columnid;
                cmd.Parameters.Add(lon);
                SqlParameter lal = new SqlParameter("@seatno", SqlDbType.VarChar,50);
                lal.Value = n.seatno;
                cmd.Parameters.Add(lal);

                SqlParameter acc = new SqlParameter("@seattype", SqlDbType.VarChar,50);
                acc.Value = n.seattype;
                cmd.Parameters.Add(acc);

                SqlParameter fla = new SqlParameter("@flag", SqlDbType.VarChar);
                fla.Value = n.flag;
                cmd.Parameters.Add(fla);

                SqlParameter cod = new SqlParameter("@category", SqlDbType.VarChar, 50);
                cod.Value = n.category;
                cmd.Parameters.Add(cod);

                //SqlParameter cou = new SqlParameter("@cols", SqlDbType.Int);
                //cou.Value = n.cols;
                //cmd.Parameters.Add(cou);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", "flightseating....");
            }
            catch (Exception ex)
            {
                throw ex;

            }
            return dt;
        }
    }
}
