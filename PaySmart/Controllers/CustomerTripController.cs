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
    public class CustomerTripController : ApiController
    {
        [HttpGet]
        [Route("api/CustomerTrip/Getcustomertrips")]
        public DataTable Getcustomertrips(string PhoneNo)
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HVGetBookingHistory";
            cmd.Connection = conn;
            cmd.Parameters.Add("@PhoneNo", SqlDbType.VarChar, 20).Value = PhoneNo;


            DataTable dt = new DataTable();
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(dt);

            return dt;

        }
    }
}
