using System;
using System.Collections.Generic;
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
    public class WalletTransDetailsController : ApiController
    {
        [HttpGet]
        [Route("api/WalletTransDetails/GetWalletDetails")]
        public DataTable GetWalletDetails(int TransactionsId)
        {
            DataTable Tbl = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
           
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetWalletDetails....");

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "GetEWalletTransDetails";
            cmd.Parameters.Add("@TransactionId", SqlDbType.Int).Value = TransactionsId;
            cmd.Connection = conn;
            DataSet ds = new DataSet();
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(ds);
            Tbl = ds.Tables[0];
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetWalletDetails successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetWalletDetails...." + ex.Message.ToString());
                throw ex;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return Tbl;
        }

        [HttpPost]
        [Route("api/WalletTransDetails/savewalletdetails")]
        public DataTable savewalletdetails(ewallet r)
        {
           LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "savewalletdetails....");

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsUpdEwalletTransHistory";

            cmd.Connection = conn;
            SqlParameter f = new SqlParameter("@flag", SqlDbType.VarChar);
            f.Value = r.flag;
            cmd.Parameters.Add(f);


            SqlParameter i = new SqlParameter("@Id", SqlDbType.Int);
            i.Value = r.Id;
            cmd.Parameters.Add(i);

            SqlParameter cm = new SqlParameter("@Amount", SqlDbType.Decimal);
            cm.Value = r.Amount;
            cmd.Parameters.Add(cm);

            SqlParameter ce = new SqlParameter("@TransactionType", SqlDbType.VarChar, 50);
            ce.Value = r.TransactionType;
            cmd.Parameters.Add(ce);

            SqlParameter q1 = new SqlParameter("@Status", SqlDbType.Int);
            q1.Value = r.Status;
            cmd.Parameters.Add(q1);

            SqlParameter d = new SqlParameter("@Date", SqlDbType.Date);
            d.Value = r.Date;
            cmd.Parameters.Add(d);

            SqlParameter t = new SqlParameter("@Time", System.Data.SqlDbType.DateTime);
            t.Value = r.Time;
            cmd.Parameters.Add(t);

            SqlParameter de = new SqlParameter("@Details", SqlDbType.VarChar, 50);
            de.Value = r.Details;
            cmd.Parameters.Add(de);

            SqlParameter td = new SqlParameter("@TransactionId", SqlDbType.Int);
            td.Value = r.TransactionId;
            cmd.Parameters.Add(td);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "savewalletdetails successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "savewalletdetails...." + ex.Message.ToString());
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
