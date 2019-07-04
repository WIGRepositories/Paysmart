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
    public class flightscheduleController : ApiController
    {
        [HttpPost]
        [Route("api/flightschedule/getflightschedule")]
        public DataTable getflightschedule(flightschedule fl)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            try {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "Getflightschedule";
                cmd.Connection = conn;
                cmd.Parameters.Add(new SqlParameter("@srcid", SqlDbType.Int)).Value = fl.srcid;
                cmd.Parameters.Add(new SqlParameter("@destId", SqlDbType.Int)).Value = fl.destid;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                }
            catch (Exception ex) { 
            dt.Columns.Add("Code");
            dt.Columns.Add("description");
            DataRow dr = dt.NewRow();
            dr[0] = "ERR001";
            dr[1] = ex.Message;
            dt.Rows.Add(dr);
            }
            return dt;
        }
        [HttpPost]
        [Route("api/flightschedule/saveflightschedule")]
        public DataTable saveflightschedule(flightschedule n)
        {
            DataTable dt = new DataTable();
            LogTraceWriter tracer = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            try
            {
                tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", "flightschedule....");
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "InsUpdDelflightschedule";
                cmd.Connection = conn;

                SqlParameter id = new SqlParameter("@Id", SqlDbType.Int);
                id.Value = n.Id;
                cmd.Parameters.Add(id);

                SqlParameter na = new SqlParameter("@flightid", SqlDbType.VarChar, 50);
                na.Value = n.flightid;
                cmd.Parameters.Add(na);

                SqlParameter dee = new SqlParameter("@FBRoutingId", SqlDbType.VarChar, 50);
                dee.Value = n.FBRoutingId;
                cmd.Parameters.Add(dee);

                SqlParameter lon = new SqlParameter("@arrivaltime", SqlDbType.DateTime);
                lon.Value = n.arrivaltime;
                cmd.Parameters.Add(lon);
                SqlParameter lal = new SqlParameter("@depttime", SqlDbType.DateTime);
                lal.Value = n.depttime;
                cmd.Parameters.Add(lal);

                SqlParameter acc = new SqlParameter("@interval", SqlDbType.DateTime);
                acc.Value = n.interval;
                cmd.Parameters.Add(acc);

                SqlParameter fla = new SqlParameter("@flag", SqlDbType.VarChar);
                fla.Value = n.flag;
                cmd.Parameters.Add(fla);

                SqlParameter cod = new SqlParameter("@weekdays", SqlDbType.VarChar,50);
                cod.Value = n.weekdays;
                cmd.Parameters.Add(cod);

                //SqlParameter cou = new SqlParameter("@cols", SqlDbType.Int);
                //cou.Value = n.cols;
                //cmd.Parameters.Add(cou);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", "flightschedule....");
            }
            catch (Exception ex)
            {
                throw ex;

            }
            return dt;
        }
    }
}
