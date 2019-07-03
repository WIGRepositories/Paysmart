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
    public class FBTaxesDiscountsController : ApiController
    {
        [HttpGet]
        [Route("api/FBTaxesDiscounts/getFBTaxesDiscounts")]
        public DataTable getFBTaxesDiscounts()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "GetFBTaxesDiscounts";
            cmd.Connection = conn;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;

        }
        [HttpPost]
        [Route("api/FBTaxesDiscounts/saveFBTaxesDiscounts")]
        public DataTable saveFBPricing(fbtax n)
        {
            DataTable dt = new DataTable();
          //  LogTraceWriter tracer = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            try
            {
              //  tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", "FBTaxesDiscounts....");
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "InsUpdDelFBTaxesDiscounts";
                cmd.Connection = conn;

                SqlParameter id = new SqlParameter("@Id", SqlDbType.Int);
                id.Value = n.Id;
                cmd.Parameters.Add(id);

                SqlParameter na = new SqlParameter("@routeid", SqlDbType.VarChar, 50);
                na.Value = n.routeid;
                cmd.Parameters.Add(na);

                SqlParameter dee = new SqlParameter("@airlineid", SqlDbType.VarChar, 50);
                dee.Value = n.airlineid;
                cmd.Parameters.Add(dee);

                SqlParameter lon = new SqlParameter("@amount", SqlDbType.Decimal);
                lon.Value = n.amount;
                cmd.Parameters.Add(lon);
                SqlParameter lal = new SqlParameter("@ChargeType", SqlDbType.VarChar,50);
                lal.Value = n.ChargeType;
                cmd.Parameters.Add(lal);

                //SqlParameter acc = new SqlParameter("@fromdate", SqlDbType.DateTime);
                //acc.Value = n.fromdate;
                //cmd.Parameters.Add(acc);

                SqlParameter fla = new SqlParameter("@flag", SqlDbType.VarChar);
                fla.Value = n.flag;
                cmd.Parameters.Add(fla);

                SqlParameter cod = new SqlParameter("@fromdate", SqlDbType.DateTime);
                cod.Value = n.fromdate;
                cmd.Parameters.Add(cod);

                SqlParameter cou = new SqlParameter("@todate", SqlDbType.DateTime);
                cou.Value = n.todate;
                cmd.Parameters.Add(cou);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

              //  tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", "FBTaxesDiscounts....");
            }
            catch (Exception ex)
            {
                throw ex;

            }
            return dt;
        }
    }
}
