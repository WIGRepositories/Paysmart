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
using System.Text;

namespace Paysmart.Controllers
{
    public class WalletTransDetailsController : ApiController
    {
        [HttpGet]
        [Route("api/WalletTransDetails/GetWalletTransDetails")]
        public DataTable GetWalletTransDetails(string MobileNo)
        {
            DataTable Tbl = new DataTable();
            StringBuilder str = new StringBuilder();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();


            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetWalletTransDetails....");

                str.Append("MobileNo:" + MobileNo + ",");               

             traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());
            
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
                //throw ex;
                throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
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
            StringBuilder str = new StringBuilder();
            SqlConnection conn = new SqlConnection();


            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "savewalletTransdetails....");

                str.Append("MobileNo:" + r.MobileNo + ",");
                str.Append("TransactionType:" + r.TransactionType + ",");
                str.Append("TransactionMode:" + r.TransactionMode + ",");
                str.Append("Amount:" + r.Amount + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());
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

               
                SqlParameter q1 = new SqlParameter("@Status", SqlDbType.Int);
                q1.Value = r.Status;
                cmd.Parameters.Add(q1);


                SqlParameter de = new SqlParameter("@Details", SqlDbType.VarChar, 50);
                de.Value = r.Details;
                cmd.Parameters.Add(de);


                SqlParameter d = new SqlParameter("@MobileNo", SqlDbType.VarChar, 20);
                d.Value = r.MobileNo;
                cmd.Parameters.Add(d);

                SqlParameter td = new SqlParameter("@TransactionId", SqlDbType.VarChar, 50);
                td.Value = r.TransactionId;
                cmd.Parameters.Add(td);

                SqlParameter tm = new SqlParameter("@TransactionMode", SqlDbType.VarChar, 50);
                tm.Value = r.TransactionMode;
                cmd.Parameters.Add(tm);

                SqlParameter gti = new SqlParameter("@GatewayId", SqlDbType.VarChar);
                gti.Value = r.GatewayTransId;
                cmd.Parameters.Add(gti);




                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "savewalletTransdetails successful....");

                Payengine.Controllers.Payengine e = new Payengine.Controllers.Payengine();
                string transId = e.ProcessPayment();

                if (dt.Rows.Count >= 0)
                {


                    //var GatewayTransId = dt.Rows[0]["GatewayTransId"].ToString();
                    if (transId != "")
                    {
                        f.Value = "U";
                        i.Value = dt.Rows[0]["Id"].ToString();
                        var GateTransId = transId;

                        gti.Value = transId;
                        dt = new DataTable();
                        da.Fill(dt);
                    }
                }
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "savewalletTransdetails...." + ex.Message.ToString());
                throw ex;
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
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
