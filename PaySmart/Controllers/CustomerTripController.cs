using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Tracing;

namespace Paysmart.Controllers
{
    public class CustomerTripController : ApiController
    {
        [HttpGet]
        [Route("api/CustomerTrip/Getcustomertrips")]
        public DataTable Getcustomertrips(string PhoneNo)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getcustomertrips....");

                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HVGetBookingHistory";
                cmd.Connection = conn;
                cmd.Parameters.Add("@PhoneNo", SqlDbType.VarChar, 20).Value = PhoneNo;

                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getcustomertrips successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Getcustomertrips...." + ex.Message.ToString());
                throw ex;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }

            return dt;

        }
    }
}
