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

namespace Paysmart.Controllers
{
    public class EndTripController : ApiController
    {
        [HttpPost]

        [Route("api/EndTrip/closingtrip")]
        public int closingtrip(VehicleBooking b)
        {
            int status = 1;
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSTrackVehicleHistory";

            cmd.Connection = conn;
            conn.Open();

            SqlParameter bb = new SqlParameter("@BookingId", SqlDbType.VarChar, 50);
            bb.Value = b.BookingId;
            cmd.Parameters.Add(bb);

            SqlParameter s = new SqlParameter("@BookingStatus", SqlDbType.VarChar, 50);
            s.Value = b.BookingStatus;
            cmd.Parameters.Add(s);




            return status;
        }
    }
}
