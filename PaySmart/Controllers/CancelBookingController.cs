using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Paysmart.Models;

namespace Paysmart.Controllers
{
    public class CancelBookingController : ApiController
    {
        [HttpPost]

        [Route("api/CancelBooking/CancelBooking")]
        public DataTable cncelbkng(cancel c)
        {
            DataTable dt = new DataTable();

            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HVcancelbooking";

            SqlParameter i = new SqlParameter("@BNo", SqlDbType.Int);
            i.Value = c.BNo;
            cmd.Parameters.Add(i);

            SqlParameter n = new SqlParameter("@cancellationType", SqlDbType.Int);
            n.Value = c.BookingStatus;
            cmd.Parameters.Add(n);

            SqlParameter r = new SqlParameter("@CancelReason", SqlDbType.VarChar,255);
            r.Value = c.CancelReason;
            cmd.Parameters.Add(r);


            SqlParameter a = new SqlParameter("@CancelBy", SqlDbType.VarChar,255);
            a.Value = c.CancelBy;
            cmd.Parameters.Add(a);

            cmd.Connection = conn;
            DataSet ds = new DataSet();
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(ds);
            dt = ds.Tables[0];

            return dt;

        }

        [Route("api/CancelBooking/BookingExpiry")]
        public int BookingExpiry(VehicleBooking vb) 
        {
            int status = 0;
            SqlConnection conn = new SqlConnection();

            try
            {               

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HVInsUpdcancelbooking";

                SqlParameter i = new SqlParameter("@BNo", SqlDbType.VarChar,20);
                i.Value = vb.BNo;
                cmd.Parameters.Add(i);

                SqlParameter n = new SqlParameter("@cancellationType", SqlDbType.Int);
                n.Value = 2;
                cmd.Parameters.Add(n);

                SqlParameter r = new SqlParameter("@CancelReason", SqlDbType.VarChar, 255);
                r.Value = "No reponse";
                cmd.Parameters.Add(r);


                SqlParameter a = new SqlParameter("@CancelledBy", SqlDbType.VarChar, 50);
                a.Value = vb.CustomerPhoneNo;
                cmd.Parameters.Add(a);

                cmd.Connection = conn;
                conn.Open();
                object result = cmd.ExecuteScalar();
                conn.Close();
                if (result.ToString() == "1")
                {
                    status = 1;
                }
                return status;
            }
            catch (Exception ex) {
                if (conn.State == ConnectionState.Open) {
                    conn.Close();
                }
                return status;
            }
        }

    }
}
