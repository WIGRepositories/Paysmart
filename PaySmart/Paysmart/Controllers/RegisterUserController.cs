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
    public class RegisterUserController : ApiController
    {
        [HttpPost]
        [Route("api/Appusers/SavePostRegister")]
        public DataTable SavePostRegister(Register ocr)
        {


            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsUpdAppusers";

            cmd.Connection = conn;


            SqlParameter f = new SqlParameter("@flag", SqlDbType.VarChar);
            f.Value = ocr.flag;
            cmd.Parameters.Add(f);

            //SqlParameter i = new SqlParameter("@id", SqlDbType.Int);
            //i.Value = ocr.id;
            //cmd.Parameters.Add(i);

            SqlParameter c = new SqlParameter("@Username", SqlDbType.VarChar, 20);
            c.Value = ocr.Username;
            cmd.Parameters.Add(c);

            SqlParameter ce = new SqlParameter("@Email", SqlDbType.VarChar, 20);
            ce.Value = ocr.Email;
            cmd.Parameters.Add(ce);


            SqlParameter cm = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
            cm.Value = ocr.Mobilenumber;
            cmd.Parameters.Add(cm);

            SqlParameter q1 = new SqlParameter("@Password", SqlDbType.VarChar, 50);
            q1.Value = ocr.Password;
            cmd.Parameters.Add(q1);

          
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            //send email otp

            //send mobile otp

        
            return dt;

        }

        [HttpPost]
        [Route("api/Appusers/SavePostm")]
        public DataTable SavePostm(Model ocr)
        {


            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsUpdDelMOTPverification";

            cmd.Connection = conn;


            SqlParameter f = new SqlParameter("@flag", SqlDbType.VarChar);
            f.Value = ocr.flag;
            cmd.Parameters.Add(f);

            SqlParameter i = new SqlParameter("@id", SqlDbType.Int);
            i.Value = ocr.id;
            cmd.Parameters.Add(i);

            SqlParameter q1 = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
            q1.Value = ocr.Mobilenumber;
            cmd.Parameters.Add(q1);

            SqlParameter e = new SqlParameter("@Mobileotp", SqlDbType.VarChar, 10);
            e.Value = ocr.Mobileotp;
            cmd.Parameters.Add(e);




            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            
            //Verify mobile otp

            return dt;

        }


        [HttpPost]
        [Route("api/Appusers/SavePoste")]
        public DataTable SavePoste(Model1 ocr)
        {


            SqlConnection conn = new SqlConnection();


            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsUpdDelEOTPverification";

            cmd.Connection = conn;


            SqlParameter f = new SqlParameter("@flag", SqlDbType.VarChar);
            f.Value = ocr.flag;
            cmd.Parameters.Add(f);

            SqlParameter i = new SqlParameter("@id", SqlDbType.Int);
            i.Value = ocr.id;
            cmd.Parameters.Add(i);

            SqlParameter q1 = new SqlParameter("@Email", SqlDbType.VarChar, 50);
            q1.Value = ocr.Email;
            cmd.Parameters.Add(q1);

            SqlParameter e = new SqlParameter("@Emailotp", SqlDbType.VarChar, 10);
            e.Value = ocr.Emailotp;
            cmd.Parameters.Add(e);

            SqlParameter c = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
            c.Value = ocr.Mobilenumber;
            cmd.Parameters.Add(c);

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            da.Fill(dt);


            return (dt);

            //Verify Emailotp


        }

        [HttpPost]
        [Route("api/Appusers/SavePostp")]
        public DataTable SavePostlist2(Model2 ocr)
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

            SqlParameter e = new SqlParameter("@Passwordotp", SqlDbType.VarChar, 10);
            e.Value = ocr.Passwordotp;
            cmd.Parameters.Add(e);

            SqlParameter c = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
            c.Value = ocr.Mobilenumber;
            cmd.Parameters.Add(c);


            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            da.Fill(dt);

            return (dt);

            //Verify Passwordotp

        }
    }
}
