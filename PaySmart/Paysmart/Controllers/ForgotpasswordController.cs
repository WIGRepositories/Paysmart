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
    public class ForgotpasswordController : ApiController
    {

        [HttpPost]
        [Route("api/Appusers/SavePostforgotpassword")]
        public DataTable SavePostforgotpassword(Model2 ocr)
        {


            SqlConnection conn = new SqlConnection();


            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsUpdDelPasswordverification";

            cmd.Connection = conn;


            SqlParameter f = new SqlParameter("@flag", SqlDbType.VarChar);
            f.Value = ocr.flag;
            cmd.Parameters.Add(f);

            SqlParameter i = new SqlParameter("@id", SqlDbType.Int);
            i.Value = ocr.id;
            cmd.Parameters.Add(i);

            SqlParameter q1 = new SqlParameter("@Password", SqlDbType.VarChar, 50);
            q1.Value = ocr.Password;
            cmd.Parameters.Add(q1);           

            SqlParameter c = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
            c.Value = ocr.Mobilenumber;
            cmd.Parameters.Add(c);

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            da.Fill(dt);


            return (dt);
        }
    }
}
