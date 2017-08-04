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

namespace Paysmart.Controllers
{
    public class UpdateBookingRequestController : ApiController
    {
        [HttpPost]

        [Route("api/UpdateBookingRequest/confirmation")]
        public int confirmation(VehicleBooking b)
        {
            int status = 1;
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSTrackVehicleHistory";

            cmd.Connection = conn;
            conn.Open();

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


            return status;

        }
    }
}
