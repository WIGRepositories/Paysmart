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
    public class UpdatePaymentController : ApiController
    {
        [HttpGet]
        [Route("api/UpdatePayment/GetUpdatePayment")]

        public DataTable GetUpdatePayment(string BookingId)
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HVGetallocatedriver";
            cmd.Connection = conn;
            cmd.Parameters.Add("@BookingId", SqlDbType.VarChar, 50).Value = BookingId;


            DataTable dt = new DataTable();
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(dt);

            return dt;

        }
    }
}
