
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
    public class airlineController : ApiController
    {
        [HttpGet]
        [Route("api/airline/getairline")]
        public DataTable getairline()
        {
            DataTable dt = new DataTable();

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Getairlines";
            cmd.Connection = conn;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;

        }
        [HttpPost]
        [Route("api/airline/saveairline")]
        public DataTable saveairline(airlines n)
        {
            DataTable dt = new DataTable();
            //LogTraceWriter tracer = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            try
            {
                //tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", "airline....");
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "InsUpdDelairlines";
                cmd.Connection = conn;

                SqlParameter id = new SqlParameter("@Id", SqlDbType.Int);
                id.Value = n.Id;
                cmd.Parameters.Add(id);

                SqlParameter na = new SqlParameter("@name", SqlDbType.VarChar,50);
                na.Value = n.name ;
                cmd.Parameters.Add(na);

                SqlParameter dee = new SqlParameter("@desce", SqlDbType.VarChar,500);
                dee.Value = n.desce;
                cmd.Parameters.Add(dee);

                SqlParameter cod = new SqlParameter("@code", SqlDbType.VarChar,50);
                cod.Value = n.code;
                cmd.Parameters.Add(cod);

                SqlParameter acc = new SqlParameter("@active", SqlDbType.Int);
                acc.Value = n.active;
                cmd.Parameters.Add(acc);

                SqlParameter fla = new SqlParameter("@flag", SqlDbType.VarChar);
                fla.Value = n.flag;
                cmd.Parameters.Add(fla);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

               // tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", "airline....");
            }
            catch (Exception ex)
            {
                throw ex;

            }
            return dt;
        }
    }
}
