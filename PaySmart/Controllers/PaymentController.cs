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
using System.Web.Http.Tracing;

//using Payengine;
//using Payengine.Controllers;


namespace Paysmart.Controllers
{
    public class PaymentController : ApiController
    {

        [HttpGet]
        [Route("api/Payment/Getpayment")]
        public DataTable Getpayment()
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getpayment....");

                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSGetPayments";

                cmd.Connection = conn;

                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getpayment successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Getpayment...." + ex.Message.ToString());
                throw ex;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return dt;

        }

        [HttpPost]
        [Route("api/Payment/Pay")]
        public DataTable Pay(paymentdetails s)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Pay....");

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSInsUpdPayments";

                cmd.Connection = conn;


                SqlParameter T = new SqlParameter("@flag", SqlDbType.VarChar);
                T.Value = s.flag;
                cmd.Parameters.Add(T);

                SqlParameter q = new SqlParameter("@CardCategories", SqlDbType.VarChar, 50);
                q.Value = s.cardcategory;
                cmd.Parameters.Add(q);

                SqlParameter e = new SqlParameter("@Status", SqlDbType.VarChar, 50);
                e.Value = s.status;
                cmd.Parameters.Add(e);

                SqlParameter q1 = new SqlParameter("@Amount", SqlDbType.Decimal);
                q1.Value = s.Amount;
                cmd.Parameters.Add(q1);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Pay successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Pay...." + ex.Message.ToString());
                throw ex;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return (dt);


        }

        //[HttpGet]
        //[Route("api/Payment/PostilionTest")]
        //public Messages.Core.Message.Default PostilionTest()
        //{
        //    Class1 c = new Class1();
        //    return c.GetPositionMssg();
        //}
    }
}
