
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
    public class TicketBookingController : ApiController
    {
        [HttpGet]
        [Route("api/TicketBooking/GetAvailableServices")]
        public DataTable GetAvailableServices(int srcId, int destId)
        {
            DataTable Tbl = new DataTable();


            //connect to database
            SqlConnection conn = new SqlConnection();
            //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSGetAvailableServices";
            cmd.Parameters.Add("@srcId", SqlDbType.Int).Value = srcId;
            cmd.Parameters.Add("@destId", SqlDbType.Int).Value = destId;
            cmd.Connection = conn;

            DataSet ds = new DataSet();
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(ds);
            Tbl = ds.Tables[0];
            int a = Tbl.Rows.Count;

            return Tbl;
        }
       [HttpGet]
       [Route("api/TicketBooking/GetAvailableSeats")]
        public DataTable GetAvailableSeats()
        {
            DataTable Tbl = new DataTable();

            DataColumn dc = new DataColumn("Id", typeof(int));
            Tbl.Columns.Add("seatno", typeof(String));
            Tbl.Columns.Add("status", typeof(int));
            Tbl.Columns.Add("type", typeof(int));



            //SqlCommand cmd = new SqlCommand();
           

            //SqlParameter Gid = new SqlParameter();
            //Gid.ParameterName = "vid";
            //Gid.SqlDbType = SqlDbType.Int;
            //Gid.Value = vid;
            //cmd.Parameters.Add(Gid);

            //SqlParameter bid = new SqlParameter();
            //bid.ParameterName = "dt";
            //bid.SqlDbType = SqlDbType.DateTime;
            //bid.Value = vid;
            //cmd.Parameters.Add(bid);

            //SqlParameter cid = new SqlParameter();
            //cid.ParameterName = "srcId";
            //cid.SqlDbType = SqlDbType.Int;
            //cid.Value = vid;
            //cmd.Parameters.Add(cid);

            //SqlParameter nid = new SqlParameter();
            //nid.ParameterName = "destId";
            //nid.SqlDbType = SqlDbType.Int;
            //nid.Value = vid;
            //cmd.Parameters.Add(nid);


            DataRow dr = Tbl.NewRow();
            dr[0] = "9";
            dr[1] = "1";
            dr[2] = "1";
            Tbl.Rows.Add(dr);

            dr = Tbl.NewRow();
            dr[0] = "18";
            dr[1] = "0";
            dr[2] = "2";
            Tbl.Rows.Add(dr);

            dr = Tbl.NewRow();
            dr[0] = "23";
            dr[1] = "0";
            dr[2] = "1";
            Tbl.Rows.Add(dr);

            dr = Tbl.NewRow();
            dr[0] = "15";
            dr[1] = "1";
            dr[2] = "2";
            Tbl.Rows.Add(dr);

            

            return Tbl;
        }
    }
}
