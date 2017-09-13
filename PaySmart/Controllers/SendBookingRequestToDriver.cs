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

namespace Paysmart.Controllers
{
    public class SendBookingRequestToDriver : ApiController
    {
        [HttpPost]
         [Route("api/SendBookingRequestToDriver/GetSendBookingRequestToDriver")]
        public DataTable GetSendBookingRequestToDriver(VehicleBooking b)
        {
            DataTable Tbl = new DataTable();

            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSSendBookingRequestToDriver";

            cmd.Connection = conn;
            conn.Open();

            SqlParameter ba = new SqlParameter("@BookingId", SqlDbType.VarChar,50);
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

            return Tbl;

        }
    }
}
