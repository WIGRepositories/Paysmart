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
    public class PaymentController : ApiController
    {

        [HttpPost]
        [Route("api/Payment/Pay")]
        public DataTable Pay(payments s)
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSInsUpdDelPayments";

            cmd.Connection = conn;



            SqlParameter T = new SqlParameter("@TransactionId", SqlDbType.Int);
            T.Value = s.Transactionid;
            cmd.Parameters.Add(T);


            SqlParameter q = new SqlParameter("@Transaction_Num", SqlDbType.VarChar, 50);
            q.Value = s.Transaction_Number;
            cmd.Parameters.Add(q);

            SqlParameter q1 = new SqlParameter("@amount", SqlDbType.Decimal);
            q1.Value = s.Amount;
            cmd.Parameters.Add(q1);

            SqlParameter e = new SqlParameter("@PaymentMode", SqlDbType.Int);
            e.Value = s.Paymentmode;
            cmd.Parameters.Add(e);

            SqlParameter t = new SqlParameter("@TransactionStatus", SqlDbType.Int);
            t.Value = s.TransactionStatus;
            cmd.Parameters.Add(t);

          
            SqlParameter m = new SqlParameter("@Gateway_transId", SqlDbType.VarChar, 50);
            m.Value = s.Gateway_transId;
            cmd.Parameters.Add(m);

           

                      

         


            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            return (dt);

            //Verify Passwordotp

        }
    }
}
