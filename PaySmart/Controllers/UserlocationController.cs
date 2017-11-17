using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Paysmart.Models;
using System.Web.Http.Tracing;
using System.Text;

namespace Paysmart.Controllers
{
    public class UserlocationController : ApiController
    {

        [HttpPost]
        [Route("api/UserLocation/location")]

        public DataTable location(VehicleBooking l)
        {
             LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            StringBuilder str = new StringBuilder();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "location....");

                str.Append("Latitude:" + l.lat + ",");
                str.Append("Longitude:" + l.lng + ",");
                str.Append("PhoneNo:" + l.PhoneNo + ",");
               
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HVUserlocations";
            cmd.Connection = conn;
                      

            SqlParameter Latitude = new SqlParameter("@Latitude", SqlDbType.Float);
            Latitude.Value = l.lat;
            cmd.Parameters.Add(Latitude);

            SqlParameter Longitude = new SqlParameter("@Longitude", SqlDbType.Float);
            Longitude.Value = l.lng;
            cmd.Parameters.Add(Longitude);

            

            SqlParameter mn = new SqlParameter("@PhoneNo", SqlDbType.VarChar,20);
            mn.Value = l.PhoneNo;
            cmd.Parameters.Add(mn);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "location successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "location...." + ex.Message.ToString());
                //throw ex;
                throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
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
