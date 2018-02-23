using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Paysmart.Models;
using System.Data;
using System.Web.Http.Tracing;
using System.Text; 

namespace Paysmart.Controllers
{
    public class CurrentLocationDetailsController : ApiController
    {
        [Route("api/CurrentLocatonDetails/GetCurrentLocationDetails")]

        public int GetCurrentLocationDetails(VehicleBooking b)
        {
            int status = 1;
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
          
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetCurrentLocationDetails....");

                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSGetCurrentLocationDetails";

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

                SqlParameter vg = new SqlParameter("@VechicleGroupId", SqlDbType.Float);
                vg.Value = b.VehicleGroupId;
                cmd.Parameters.Add(vg);

                try
                {
                    conn.Open();
                    object userstat = cmd.ExecuteScalar();
                    conn.Close();

                    if (userstat != null)
                    {
                        if (conn.State == ConnectionState.Open)
                        {
                            conn.Close();
                        }
                        return Convert.ToInt32(userstat);
                    }

                    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetCurrentLocationDetails successful....");
                    StringBuilder str = new StringBuilder();
                    str.Append("@Mobilenumber" + b.PMobNo + ",");


                    str.Append("@Latitude" + b.latitude + ",");
                    str.Append("@Longitude" + b.longitude + ",");
                    str.Append("@VechicleGroupId" + b.VehicleGroupId + ",");


                    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetCurrentLocationDetails Input sent...." + str.ToString());
                }

                catch (Exception ex)
                {
                    traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetCurrentLocationDetails...." + ex.Message.ToString());
                    throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                }


            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetCurrentLocationDetails...." + ex.Message.ToString());
                throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.OK, ex.Message));
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return status;
            //return (dt);
        }
    }
}
