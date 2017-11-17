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
using System.Text;

namespace Paysmart.Controllers
{
    public class pricedetailsController : ApiController
    {
        [HttpPost]

        [Route("api/pricedetailse/GetPricing")]
        public int GetPricing(VehicleBooking b)
        {
            int status = 1;
           
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetPricing....");

                str.Append("Mobilenumber:" + b.PMobNo + ",");
                str.Append("Latitude:" + b.latitude + ",");
                str.Append("Longitude:" + b.longitude + ",");
                str.Append("VehicleTypeId:" + b.VehicleTypeId + ",");
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

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

            SqlParameter src = new SqlParameter("@SrcId", SqlDbType.Int);
            src.Value = b.SrcId;
            cmd.Parameters.Add(src);

            SqlParameter dest = new SqlParameter("@DestId", SqlDbType.Int);
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

            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetPricing successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetPricing...." + ex.Message.ToString());
                throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
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
