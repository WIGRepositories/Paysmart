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
    public class FBRoutingController : ApiController
    {
        [HttpGet]
        [Route("api/FBRouting/getFBRouting")]
        public DataTable getFBRouting()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "GetFBRouting";
            cmd.Connection = conn;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;

        }
        [HttpPost]
        [Route("api/FBRouting/saveFBRouting")]
        public DataTable saveFBPricing(fbrouting n)
        {
            DataTable dt = new DataTable();
            LogTraceWriter tracer = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            try
            {
                tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", "FBRouting....");
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "InsUpdDelFBRouting";
                cmd.Connection = conn;

                SqlParameter id = new SqlParameter("@Id", SqlDbType.Int);
                id.Value = n.Id;
                cmd.Parameters.Add(id);

                SqlParameter na = new SqlParameter("@srcPortid", SqlDbType.VarChar, 50);
                na.Value = n.srcPortid;
                cmd.Parameters.Add(na);

                SqlParameter dee = new SqlParameter("@destPortid", SqlDbType.VarChar, 50);
                dee.Value = n.destPortid;
                cmd.Parameters.Add(dee);

                SqlParameter lon = new SqlParameter("@RouteCode", SqlDbType.VarChar,50);
                lon.Value = n.RouteCode;
                cmd.Parameters.Add(lon);
                SqlParameter lal = new SqlParameter("@distance", SqlDbType.Decimal);
                lal.Value = n.distance;
                cmd.Parameters.Add(lal);

                //SqlParameter acc = new SqlParameter("@discounts", SqlDbType.Decimal);
                //acc.Value = n.discounts;
                //cmd.Parameters.Add(acc);

                SqlParameter fla = new SqlParameter("@flag", SqlDbType.VarChar);
                fla.Value = n.flag;
                cmd.Parameters.Add(fla);

                //SqlParameter cod = new SqlParameter("@fromdate", SqlDbType.DateTime);
                //cod.Value = n.fromdate;
                //cmd.Parameters.Add(cod);

                //SqlParameter cou = new SqlParameter("@todate", SqlDbType.DateTime);
                //cou.Value = n.todate;
                //cmd.Parameters.Add(cou);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", "FBRouting closed....");
            }
            catch (Exception ex)
            {
                throw ex;

            }
            return dt;
        }

    }
}
