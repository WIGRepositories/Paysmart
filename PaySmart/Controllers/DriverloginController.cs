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
using System.Diagnostics;

namespace Paysmart.Controllers
{
    public class DriverloginController : ApiController
    {

        [HttpGet]
        [Route("api/Driverlogin/Getdrivers")]
        public DataTable Getdrivers(string DriverNo)
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSGetDriverLogin";
            cmd.Connection = conn;
            cmd.Parameters.Add("@DriverNo", SqlDbType.VarChar,20).Value = DriverNo;


            DataTable dt = new DataTable();
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(dt);

            return dt;

        }


        [HttpPost]
        [Route("api/Driverlogin/Driverlogin")]

        public DataTable Driverinn(drivers dl)
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSInsUpdDriverLogin";
            cmd.Connection = conn;

            SqlParameter ff = new SqlParameter("@loginlogout", SqlDbType.Int);
            ff.Value = dl.loginlogout;
            cmd.Parameters.Add(ff);

           
            SqlParameter n = new SqlParameter("@DriverNo", SqlDbType.VarChar,20);
            n.Value = dl.DriverNo;
            cmd.Parameters.Add(n);           

            SqlParameter j2 = new SqlParameter("@Reason", SqlDbType.VarChar,500);
            j2.Value = dl.Reason;
            cmd.Parameters.Add(j2);
           

            SqlParameter h = new SqlParameter("@LoginLatitude", SqlDbType.Float);
            h.Value = dl.LoginLatitude;
            cmd.Parameters.Add(h);

            SqlParameter j = new SqlParameter("@LoginLongitude", SqlDbType.Float);
            j.Value = dl.LoginLongitude;
            cmd.Parameters.Add(j);

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            return dt;
        }




        [HttpPost]
        public DataTable ValidateDriverCredentials(DriverLogin b)
        {
           
            //connect to database
            SqlConnection conn = new SqlConnection();
           
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "drivercredentials";
                cmd.Connection = conn;
                conn.Open();
              
                SqlParameter ss = new SqlParameter();
                ss.ParameterName = "@DriverNo";
                ss.SqlDbType = SqlDbType.VarChar;
                ss.Value = b.Mobilenumber;
                cmd.Parameters.Add(ss);
                SqlParameter dd = new SqlParameter();
                dd.ParameterName = "@Password";
                dd.SqlDbType = SqlDbType.VarChar;
                dd.Value = b.Password;
                cmd.Parameters.Add(dd);
               

                
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                return dt;
            }
        
    }
}
