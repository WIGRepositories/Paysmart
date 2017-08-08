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
using System.Net.Mail;
namespace Paysmart.Controllers
{
    public class StartTripController : ApiController
    {
        [HttpPost]

        [Route("api/StartTrip/AcceptBooking")]
        public DataTable AcceptBooking(VehicleBooking b)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSAcceptRejectBooking";

            cmd.Connection = conn;
            conn.Open();


            SqlParameter bb = new SqlParameter("@BookingId", SqlDbType.VarChar, 50);
            bb.Value = b.BookingId;
            cmd.Parameters.Add(bb);

            SqlParameter s = new SqlParameter("@BookingStatus", SqlDbType.VarChar, 50);
            s.Value = b.BookingStatus;
            cmd.Parameters.Add(s);

            SqlParameter dp = new SqlParameter("@Vid", SqlDbType.Int);
            dp.Value = b.VID;
            cmd.Parameters.Add(dp);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            
            return dt;

        }


        [HttpPost]
        [Route("api/StartTrip/OTPverification")]
        public int OTPverification(VehicleBooking b)
        {

            int status = 0;
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSBookingOTP";
            cmd.Connection = conn;


            SqlParameter q1 = new SqlParameter("@DriverPhoneNo", SqlDbType.VarChar, 20);
            q1.Value = b.DriverPhoneNo;
            cmd.Parameters.Add(q1);

            SqlParameter e = new SqlParameter("@BookingOTP", SqlDbType.VarChar, 20);
            e.Value = b.BVerificationCode;
            cmd.Parameters.Add(e);

            try
            {
                conn.Open();
                object statusres = cmd.ExecuteScalar();
                conn.Close();
                if (statusres != null)
                {
                    if (conn.State == ConnectionState.Open)
                    {
                        conn.Close();
                    }
                    return Convert.ToInt32(statusres);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            //Verify mobile otp

            return status;

        }
    }
}
