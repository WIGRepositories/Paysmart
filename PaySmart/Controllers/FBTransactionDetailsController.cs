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
    public class FBTransactionDetailsController : ApiController
    {
        [HttpGet]
        [Route("api/FBTransactionDetails/getFBTransactionDetails")]
        public DataTable getFBTransactionDetails()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "GetFBTransactionDetails";
            cmd.Connection = conn;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;

        }
        [HttpPost]
        [Route("api/FBTransactionDetails/saveFBTransactionDetails")]
        public DataTable saveFBTransactionDetails(FBTra n)
        {
            DataTable dt = new DataTable();
           LogTraceWriter tracer = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            try
            {
                tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", "FBTransactionDetails....");

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "InsUpdDelFBTransactionDetails";
                cmd.Connection = conn;

                SqlParameter id = new SqlParameter("@Id", SqlDbType.Int);
                id.Value = n.Id;
                cmd.Parameters.Add(id);

                SqlParameter na = new SqlParameter("@TransId", SqlDbType.VarChar, 50);
                na.Value = n.TransId;
                cmd.Parameters.Add(na);

                SqlParameter dee = new SqlParameter("@TotalAmt", SqlDbType.Decimal);
                dee.Value = n.TotalAmt;
                cmd.Parameters.Add(dee);

                SqlParameter lon = new SqlParameter("@PaymentId", SqlDbType.VarChar, 50);
                lon.Value = n.PaymentId;
                cmd.Parameters.Add(lon);
                SqlParameter lal = new SqlParameter("@BTPOSid", SqlDbType.VarChar, 50);
                lal.Value = n.BTPOSid;
                cmd.Parameters.Add(lal);

                SqlParameter fla = new SqlParameter("@flag", SqlDbType.VarChar);
                fla.Value = n.flag;
                cmd.Parameters.Add(fla);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", "FBTransactionDetails closed ...");


            }
            catch (Exception ex)
            {
                throw ex;

            }
            return dt;
        }


    }
}
