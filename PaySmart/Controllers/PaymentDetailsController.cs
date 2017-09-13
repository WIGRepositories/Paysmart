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
    public class PaymentDetailsController : ApiController
    {

        [HttpGet]
        [Route("api/Payment/Getpayments")]
        public DataTable Getpayments()
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSGetPaymentdetails";

            cmd.Connection = conn;

            DataTable dt = new DataTable();
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(dt);

            return dt;

        }

        [HttpPost]
        [Route("api/Payment/Paydetails")]
        public DataTable Paydetails(paymentdetails s)
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSInsUpdPaymentDetails";

            cmd.Connection = conn;


            SqlParameter T = new SqlParameter("@flag", SqlDbType.VarChar);
            T.Value = s.flag;
            cmd.Parameters.Add(T);

            SqlParameter q = new SqlParameter("@PaymentId", SqlDbType.Int);
            q.Value = s.PaymentId;
            cmd.Parameters.Add(q);

            SqlParameter e = new SqlParameter("@ServiceTypeId", SqlDbType.Int);
            e.Value = s.servicetypeid;
            cmd.Parameters.Add(e);

            SqlParameter q1 = new SqlParameter("@Status", SqlDbType.VarChar,50);
            q1.Value = s.status;
            cmd.Parameters.Add(q1);

            SqlParameter qq = new SqlParameter("@GatewayId", SqlDbType.Int);
            qq.Value = s.gatewayid;
            cmd.Parameters.Add(qq);

            SqlParameter ss = new SqlParameter("@TransactionType", SqlDbType.VarChar,50);
            ss.Value = s.transactiontype;
            cmd.Parameters.Add(ss);


            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            return (dt);

            //Verify Passwordotp

        }
    }
}
