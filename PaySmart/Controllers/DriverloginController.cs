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
    public class DriverloginController : ApiController
    {

        [HttpGet]
        [Route("api/Driverlogin/Getdrivers")]
        public DataTable Getdrivers(int DId)
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSGetDriverLogin";
            cmd.Connection = conn;
            cmd.Parameters.Add("@DId", SqlDbType.Int).Value = DId;


            DataTable dt = new DataTable();
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(dt);

            return dt;

        }


        [HttpPost]
        [Route("api/Driverlogin/Driverinn")]

        public DataTable Driverinn(drivers dl)
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSInsUpdDriverLogin";
            cmd.Connection = conn;

            SqlParameter ff = new SqlParameter("@flag", SqlDbType.VarChar);
            ff.Value = dl.flag;
            cmd.Parameters.Add(ff);

            SqlParameter i = new SqlParameter("@Id", SqlDbType.Int);
            i.Value = dl.Id;
            cmd.Parameters.Add(i);

            SqlParameter di = new SqlParameter("@DId", SqlDbType.Int);
            di.Value = dl.DId;
            cmd.Parameters.Add(di);

            SqlParameter dic = new SqlParameter("@CompanyId", SqlDbType.Int);
            dic.Value = dl.CompanyId;
            cmd.Parameters.Add(dic);

            SqlParameter n = new SqlParameter("@VId", SqlDbType.Int);
            n.Value = dl.VId;
            cmd.Parameters.Add(n);           

            SqlParameter j2 = new SqlParameter("@Reason", SqlDbType.VarChar,500);
            j2.Value = dl.Reason;
            cmd.Parameters.Add(j2);

            SqlParameter g = new SqlParameter("@Status", SqlDbType.VarChar,50);
            g.Value = dl.Status;
            cmd.Parameters.Add(g);

            SqlParameter h = new SqlParameter("@LoginLatitude", SqlDbType.Float);
            h.Value = dl.LoginLatitude;
            cmd.Parameters.Add(h);

            SqlParameter j = new SqlParameter("@LoginLongitude", SqlDbType.Float);
            j.Value = dl.LoginLongitude;
            cmd.Parameters.Add(j);

            SqlParameter k = new SqlParameter("@LogoutLatitude", SqlDbType.Float);
            k.Value = dl.LogoutLatitude;
            cmd.Parameters.Add(k);

            SqlParameter y = new SqlParameter("@LogoutLongitude", SqlDbType.Float);
            y.Value = dl.LogoutLongitude;
            cmd.Parameters.Add(y);           


            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            return dt;
        }
    }
}
