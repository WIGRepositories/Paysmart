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
using System.Web.Http.Tracing;

namespace Paysmart.Controllers
{
    public class WalletBalanceController : ApiController
    {
        [HttpGet]
        [Route("api/WalletBalance/Getcurrentbalance")]

        public DataTable Getcurrentbalance(string mobileno)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getcurrentbalance....");
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSGetCurrentBalance";
            cmd.Connection = conn;

            SqlParameter cmpid = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
            cmpid.Value = mobileno;
            cmd.Parameters.Add(cmpid);

            
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(dt);


            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getcurrentbalance successful....");
            }
             catch (Exception ex)
             {
                 traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Getcurrentbalance...." + ex.Message.ToString());
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
        [Route("api/WalletBalance/WalletBalance")]

        public DataTable WalletBalance(Appusers A)
        {

            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "WalletBalance....");


                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "EWInsUpdWalletBalance";
                cmd.Connection = conn;

                SqlParameter f = new SqlParameter("@flag", SqlDbType.VarChar);
                f.Value = A.flag;
                cmd.Parameters.Add(f);


                SqlParameter mn = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
                mn.Value = A.Mobilenumber;
                cmd.Parameters.Add(mn);

                SqlParameter em = new SqlParameter("@Amount", SqlDbType.Decimal);
                em.Value = A.Amount;
                cmd.Parameters.Add(em);


                SqlParameter St = new SqlParameter("@StatusId", SqlDbType.Int);
                St.Value = A.Status;
                cmd.Parameters.Add(St);
          
           
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "WalletBalance successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "WalletBalance...." + ex.Message.ToString());
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
    }
}
