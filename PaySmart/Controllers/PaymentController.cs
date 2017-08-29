using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Paysmart.Models;
using System.Configuration;

namespace Paysmart.Controllers
{
    public class PaymentController : ApiController
    {

        [HttpGet]
        [Route("api/Payment/Getpayment")]
        public DataTable Getpayment()
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSGetPayments";

            cmd.Connection = conn;

            DataTable dt = new DataTable();
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(dt);

            return dt;

        }

        [HttpPost]
        [Route("api/Payment/Pay")]
        public DataTable Pay(paymentdetails s)
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSInsUpdPayments";

            cmd.Connection = conn;


            SqlParameter T = new SqlParameter("@flag", SqlDbType.VarChar);
            T.Value = s.flag;
            cmd.Parameters.Add(T);

            SqlParameter q = new SqlParameter("@ServiceType", SqlDbType.VarChar, 50);
            q.Value = s.servicetype;
            cmd.Parameters.Add(q);
            
            SqlParameter e = new SqlParameter("@Status", SqlDbType.VarChar,50);
            e.Value = s.status;
            cmd.Parameters.Add(e);

            SqlParameter q1 = new SqlParameter("@Amount", SqlDbType.Decimal);
            q1.Value = s.Amount;
            cmd.Parameters.Add(q1);

                      
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            return (dt);

            
        }
    }
}
