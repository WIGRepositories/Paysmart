using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Paysmart.Models;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Http.Tracing;

namespace Paysmart.Controllers
{
    public class UpdateBookingRequestController : ApiController
    {
        [HttpPost]

        [Route("api/UpdateBookingRequest/confirmation")]
        public int confirmation(VehicleBooking b)
        {
            int status = 1;
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "confirmation....");

                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSTrackVehicleHistory";

                cmd.Connection = conn;
                
                SqlParameter MobileNumber = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 50);
                MobileNumber.Value = b.PMobNo;
                cmd.Parameters.Add(MobileNumber);

                SqlParameter Lat = new SqlParameter("@Latitude", SqlDbType.Float);
                Lat.Value = b.latitude;
                cmd.Parameters.Add(Lat);

                SqlParameter Lng = new SqlParameter("@Longitude", SqlDbType.Float);
                Lng.Value = b.longitude;
                cmd.Parameters.Add(Lng);

                SqlParameter vv = new SqlParameter("@VehicleTypeId", SqlDbType.Int);
                vv.Value = b.VehicleTypeId;
                cmd.Parameters.Add(vv);

                SqlParameter src = new SqlParameter("@Src", SqlDbType.VarChar, 50);
                src.Value = b.SrcId;
                cmd.Parameters.Add(src);

                SqlParameter dest = new SqlParameter("@Dest", SqlDbType.VarChar, 50);
                dest.Value = b.DestId;
                cmd.Parameters.Add(dest);

                SqlParameter p = new SqlParameter("@PackageId", SqlDbType.Int);
                p.Value = b.DestId;
                cmd.Parameters.Add(p);

                SqlParameter t = new SqlParameter("@Time", SqlDbType.Time);
                t.Value = b.Time;
                cmd.Parameters.Add(t);

                SqlParameter d = new SqlParameter("@Date", SqlDbType.Time);
                d.Value = b.Date;
                cmd.Parameters.Add(d);

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "confirmation successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "confirmation...." + ex.Message.ToString());
                throw ex;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return status;

        }
    }
}
