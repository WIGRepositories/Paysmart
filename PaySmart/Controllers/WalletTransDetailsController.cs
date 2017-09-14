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
        [Route("api/WalletTransDetails/GetWalletTransDetails")]
        public DataTable GetWalletTransDetails(string MobileNo)
        {
            DataTable Tbl = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();


            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetWalletTransDetails....");
            
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "EWGetTransDetails";
            cmd.Parameters.Add("@MobileNo", SqlDbType.VarChar).Value = MobileNo;
            cmd.Connection = conn;

            DataSet ds = new DataSet();
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(ds);
            Tbl = ds.Tables[0];
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetWalletTransDetails successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetWalletTransDetails...." + ex.Message.ToString());

            }

            // int found = 0;
            return Tbl;
        }

        [HttpPost]
        [Route("api/WalletTransDetails/savewalletTransdetails")]
        public DataTable savewalletTransdetails(ewallet r)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();


             try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "savewalletTransdetails....");


            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "EWInsUpdTransHistory";

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
                        

            SqlParameter de = new SqlParameter("@Details", SqlDbType.VarChar, 50);
            de.Value = r.Details;
            cmd.Parameters.Add(de);


            SqlParameter d = new SqlParameter("@MobileNo", SqlDbType.VarChar, 20);
            d.Value = r.MobileNo;
            cmd.Parameters.Add(d);

            SqlParameter td = new SqlParameter("@TransactionId", SqlDbType.VarChar,50);
            td.Value = r.TransactionId;
            cmd.Parameters.Add(td);

            SqlParameter tm = new SqlParameter("@TransactionMode", SqlDbType.VarChar,50);
            tm.Value = r.TransactionMode;
            cmd.Parameters.Add(tm);



           
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "savewalletTransdetails successful....");
            }
             catch (Exception ex)
             {
                 traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "savewalletTransdetails...." + ex.Message.ToString());

             }

            return dt;
        }
    }
}
