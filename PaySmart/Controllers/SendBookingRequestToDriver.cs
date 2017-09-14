using Paysmart.Models;
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
    public class SendBookingRequestToDriver : ApiController
    {
        [HttpPost]
        [Route("api/SendBookingRequestToDriver/GetSendBookingRequestToDriver")]
        public DataTable GetSendBookingRequestToDriver(VehicleBooking b)
        {
            DataTable Tbl = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetSendBookingRequestToDriver....");

                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSSendBookingRequestToDriver";

                cmd.Connection = conn;
             

                SqlParameter ba = new SqlParameter("@BookingId", SqlDbType.VarChar, 50);
                ba.Value = b.BookingId;
                cmd.Parameters.Add(ba);

                SqlParameter src = new SqlParameter("@Src", SqlDbType.VarChar, 50);
                src.Value = b.Src;
                cmd.Parameters.Add(src);

                SqlParameter dest = new SqlParameter("@Dest", SqlDbType.VarChar, 50);
                dest.Value = b.Dest;
                cmd.Parameters.Add(dest);

                SqlParameter t = new SqlParameter("@Time", SqlDbType.Time);
                t.Value = b.Time;
                cmd.Parameters.Add(t);

                SqlParameter eta = new SqlParameter("@ETA", SqlDbType.Time);
                eta.Value = b.Time;
                cmd.Parameters.Add(eta);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetSendBookingRequestToDriver successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetSendBookingRequestToDriver...." + ex.Message.ToString());
                throw ex;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return Tbl;

        }
    }
}
