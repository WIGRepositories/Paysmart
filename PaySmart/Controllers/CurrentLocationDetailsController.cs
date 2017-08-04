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

namespace Paysmart.Controllers
{
    public class CurrentLocationDetailsController : ApiController
    {
        [Route("api/CurrentLocatonDetails/GetCurrentLocationDetails")]

        public int GetCurrentLocationDetails(VehicleBooking b)
        {
         int status = 1;
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSGetCurrentLocationDetails";

            cmd.Connection = conn;
            conn.Open();

            SqlParameter MobileNumber = new SqlParameter("@Mobilenumber", SqlDbType.VarChar,50);
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
                //conn.Open();
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

            }
            catch (Exception ex)
            {

                throw ex;
            }

            return status;
            //return (dt);
        }
    }
}
