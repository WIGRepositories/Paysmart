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
    public class WalletDetailsController : ApiController
    {
        [HttpGet]
        public DataTable GetEWalletDetails(string MobileNo)
        {
            DataTable Tbl = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
           
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetEWalletDetails....");

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "GetEWalletDetails";
            cmd.Parameters.Add("@MobileNo", SqlDbType.VarChar, 20).Value = MobileNo;
            cmd.Connection = conn;
            DataSet ds = new DataSet();
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(ds);
            Tbl = ds.Tables[0];
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetEWalletDetails successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetEWalletDetails...." + ex.Message.ToString());
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
        [Route("api/WalletDetails/SaveTransactions")]
        public DataTable SaveTransactions(ewallet r)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveTransactions....");

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsUpdEwalletTransaction";

            cmd.Connection = conn;
            SqlParameter f = new SqlParameter("@flag", SqlDbType.VarChar);
            f.Value = r.flag;
            cmd.Parameters.Add(f);


            SqlParameter i = new SqlParameter("@Id", SqlDbType.Int);
            i.Value = r.Id;
            cmd.Parameters.Add(i);

            SqlParameter c = new SqlParameter("@MobileNo", SqlDbType.VarChar, 20);
            c.Value = r.MobileNo;
            cmd.Parameters.Add(c);

            SqlParameter ce = new SqlParameter("@AccountNo", SqlDbType.VarChar, 50);
            ce.Value = r.AccountNo;
            cmd.Parameters.Add(ce);

            SqlParameter cm = new SqlParameter("@Amount", SqlDbType.Decimal);
            cm.Value = r.Amount;
            cmd.Parameters.Add(cm);



            SqlParameter q1 = new SqlParameter("@Status", SqlDbType.Int);
            q1.Value = r.Status;
            cmd.Parameters.Add(q1);


            SqlParameter d = new SqlParameter("@UpdatedOn", SqlDbType.DateTime);
            d.Value = r.UpdatedOn;
            cmd.Parameters.Add(d);

            SqlParameter t = new SqlParameter("@CreatedOn", System.Data.SqlDbType.DateTime);
            t.Value = r.CreatedOn;
            cmd.Parameters.Add(t);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveTransactions successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "SaveTransactions...." + ex.Message.ToString());
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
