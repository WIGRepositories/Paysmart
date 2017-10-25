using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Tracing;

namespace Paysmart.Controllers
{
    public class BookingHistoryController : ApiController
    {
        [HttpGet]

        [Route("api/BookingHistory/GetBookingHistory")]
        public DataTable GetBookingHistory(string PhoneNo, string EmailId)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetBookingHistory....");

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HVGetBookingHistory";
                cmd.Parameters.Add("@PhoneNo", SqlDbType.VarChar, 50).Value = PhoneNo;
                //cmd.Parameters.Add("@EmailId", SqlDbType.VarChar, 50).Value = EmailId;
                cmd.Connection = conn;
                DataSet ds = new DataSet();
                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(ds);
                dt = ds.Tables[0];

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetBookingHistory successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetBookingHistory...." + ex.Message.ToString());
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
