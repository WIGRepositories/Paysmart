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
    public class nearestvehiclesController : ApiController
    {
        [HttpGet]

        [Route("api/nearestvehiclese/Getvehicles")]
        public DataTable Getvehicles(string Mobilenumber,float lat,float lng)
        {
            DataTable dt = new DataTable();

            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HVgetnearestvehicles";
            cmd.Parameters.Add("@Mobilenumber", SqlDbType.VarChar, 50).Value = Mobilenumber;
            cmd.Parameters.Add("@lat", SqlDbType.Float).Value = lat;
            cmd.Parameters.Add("@lng", SqlDbType.Float).Value = lng;
            cmd.Connection = conn;
            DataSet ds = new DataSet();
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(ds);
            dt = ds.Tables[0];

            return dt;
        }
    }
}