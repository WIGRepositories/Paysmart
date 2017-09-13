using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Paysmart.Controllers
{
    public class BookedHistoryController : ApiController
    {
        [HttpGet]
        [Route("api/BookedHistory/GetBookedHistory")]
        public DataTable GetBookedHistory(string emailid = "", string MobileNo = "")
        {
            DataTable dt = new DataTable();

            //connect to database
            SqlConnection conn = new SqlConnection();
            //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSGetBookedHistory";
            cmd.Parameters.Add("@emailAddress", SqlDbType.VarChar, 50).Value = (emailid == null) ? "-1" : emailid;
           // cmd.Parameters.Add("@emailAddress", SqlDbType.VarChar,50).Value = emailid;
            cmd.Parameters.Add("@mobileno", SqlDbType.VarChar, 15).Value = MobileNo;
            cmd.Connection = conn;
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(dt);


            return dt;
        }
    }
}
