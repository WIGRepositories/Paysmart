using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Tracing;
using Paysmart.Models;
using Payengine;
using System.Text; 

namespace Paysmart.Controllers
{
    public class CustomerAccountDetailsController : ApiController
    {

        [HttpGet]
        [Route("api/CustomerAccountDetails/GetCustomerAccount")]
        public DataTable GetCustomerAccount(int userid)
        {
            DataTable Tbl = new DataTable();
            SqlConnection conn = new SqlConnection();
            LogTraceWriter traceWriter = new LogTraceWriter();
            try
            {
                
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "CustomerAccount credentials....");

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "GetCustomerAccountDetails";
                cmd.Connection = conn;

                cmd.Parameters.Add("@userid", SqlDbType.Int).Value = userid;
                DataSet ds = new DataSet();
                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(ds);
                Tbl = ds.Tables[0];
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "CustomerAccount Credentials completed.");
            }
            catch (Exception ex)
            {
                Tbl.Columns.Add("Code");
                Tbl.Columns.Add("description");
                DataRow dr = Tbl.NewRow();
                dr[0] = "ERR001";
                dr[1] = ex.Message;
                Tbl.Rows.Add(dr);
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "CustomerAccount...." + ex.Message.ToString());
            }
            // int found = 0;
            return Tbl;

        }

        [HttpPost]
        [Route("api/CustomerAccountDetails/CustomerAccount")]
        public DataTable CustomerAccount(CustomerAccounts v)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();
            LogTraceWriter traceWriter = new LogTraceWriter();
            try
            {
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "CustomerAccount....");
            StringBuilder str = new StringBuilder();
            str.Append("@UserId" + v.UserId + ",");
            str.Append("@PaymentModeId" + v.PaymentModeId + ",");
            str.Append("@AccountNumber" + v.AccountNumber + ",");
            str.Append("@AccountType" + v.AccountType + ",");

            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "CustomerAccount Input sent...." + str.ToString());

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSInsUpdCustomerAccountDetails";
            cmd.Connection = conn;


            SqlParameter se = new SqlParameter("@insUpdDelflag", SqlDbType.VarChar);
            se.Value = v.insUpdDelflag;
            cmd.Parameters.Add(se);


            SqlParameter s = new SqlParameter("@Id", SqlDbType.Int);
            s.Value = v.Id;
            cmd.Parameters.Add(s);

            SqlParameter i = new SqlParameter("@UserId", SqlDbType.Int);
            i.Value = v.UserId;
            cmd.Parameters.Add(i);

            SqlParameter ui = new SqlParameter("@UserTypeId", SqlDbType.Int);
            ui.Value = v.UserTypeId;
            cmd.Parameters.Add(ui);

            SqlParameter pmi = new SqlParameter("@PaymentModeId", SqlDbType.Int);
            pmi.Value = v.PaymentModeId;
            cmd.Parameters.Add(pmi);

            SqlParameter an = new SqlParameter("@AccountNumber", SqlDbType.VarChar, 250);
            an.Value = v.AccountNumber;
            cmd.Parameters.Add(an);            

            SqlParameter hn = new SqlParameter("@HolderName", SqlDbType.VarChar, 250);
            hn.Value = v.HolderName;
            cmd.Parameters.Add(hn);          

            SqlParameter em = new SqlParameter("@ExpMonth", SqlDbType.VarChar,50);
            em.Value = v.ExpMonth;
            cmd.Parameters.Add(em);

            SqlParameter ey = new SqlParameter("@ExpYear", SqlDbType.VarChar,50);
            ey.Value = v.ExpYear;
            cmd.Parameters.Add(ey);

            SqlParameter ac = new SqlParameter("@AccountCode", SqlDbType.VarChar, 50);
            ac.Value = v.AccountCode;
            cmd.Parameters.Add(ac);

            SqlParameter at = new SqlParameter("@AccountType", SqlDbType.VarChar,50);
            at.Value = v.AccountType;
            cmd.Parameters.Add(at);

            SqlParameter ip = new SqlParameter("@IsPrimary", SqlDbType.Int);
            ip.Value = v.IsPrimary;
            cmd.Parameters.Add(ip);

            SqlParameter iv = new SqlParameter("@IsVerified",SqlDbType.Int);
            iv.Value = v.IsVerified;
            cmd.Parameters.Add(iv);                     
           
            SqlParameter act = new SqlParameter("@Active", SqlDbType.Int);
            act.Value = v.Active;
            cmd.Parameters.Add(act);

            SqlParameter ci = new SqlParameter("@CountryId", SqlDbType.Int);
            ci.Value = v.CountryId;
            cmd.Parameters.Add(ci);

           
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "CustomerAccount completed.");
            }
            catch(Exception ex)
            {
                dt.Columns.Add("Code");
                dt.Columns.Add("description");
                DataRow dr = dt.NewRow();
                dr[0] = "ERR001";
                dr[1] = ex.Message;
                dt.Rows.Add(dr);
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "CustomerAccount...." + ex.Message.ToString());
            }
            return dt;
        }

        [HttpGet]
        [Route("api/CustomerAccountDetails/GetPaymentModes")]
        public DataTable GetPaymentModes()
        {
            DataTable Tbl = new DataTable();
            SqlConnection conn = new SqlConnection();
            LogTraceWriter traceWriter = new LogTraceWriter();
            try
            {
                
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetPaymentModes credentials....");
                
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSgetPaymentModes";
                cmd.Connection = conn;
                DataSet ds = new DataSet();
                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(ds);
                Tbl = ds.Tables[0];
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetPaymentModes completed.");
                // int found = 0;
            }
            catch(Exception ex)
            {
                Tbl.Columns.Add("Code");
                Tbl.Columns.Add("description");
                DataRow dr = Tbl.NewRow();
                dr[0] = "ERR001";
                dr[1] = ex.Message;
                Tbl.Rows.Add(dr);
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetPaymentModes...." + ex.Message.ToString());
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
        [Route("api/CustomerAccountDetails/AccountVerification")]
        public DataTable AccountVerification(CustomerAccounts b)
        {

            int status = 0;
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "AccountVerification....");
                StringBuilder str = new StringBuilder();
                str.Append("@Mobilenumber" +b. Mobilenumber + ",");
                str.Append("@Otp" + b.BVerificationCode + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "AccountVerification Input sent...." + str.ToString());

                if (dt.Rows.Count > 0)
                    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "AccountVerification Output...." + dt.Rows[0].ToString());
                else
                    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "AccountVerification Output....BookedHistory ");

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "CustomerAccountOTPverification";
                cmd.Connection = conn;


                SqlParameter d1 = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
                d1.Value = b.Mobilenumber;
                cmd.Parameters.Add(d1);

                SqlParameter e = new SqlParameter("@Otp", SqlDbType.VarChar, 5);
                e.Value = b.BVerificationCode;
                cmd.Parameters.Add(e);

                SqlDataAdapter ds = new SqlDataAdapter(cmd);
                ds.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "AccountVerification completed.");
                //Verify mobile otp
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "AccountVerification...." + ex.Message.ToString());
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                dt.Columns.Add("Code");
                dt.Columns.Add("description");
                DataRow dr = dt.NewRow();
                dr[0] = "ERR001";
                dr[1] = ex.Message;
                dt.Rows.Add(dr);
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
        [Route("api/CustomerAccountDetails/MakePayment")]
        public DataTable MakePayment(TripPayment t)
        {

            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlCommand cmd = new SqlCommand();
           
            {
                SqlConnection conn = new SqlConnection();
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "MakePayment....");
                StringBuilder str = new StringBuilder();
                str.Append("@flag" + t.flag + ",");
                str.Append("@BNo" + t.BNo + ",");
                str.Append("@Amount" + t.Amount + ",");
                str.Append("@GatewayTransId" + t.GatewayTransId + ",");
                str.Append("@TransDate" + t.TransDate + ",");
                str.Append("@AppUserId" + t.AppUserId + ",");
            
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "MakePayment Input sent...." + str.ToString());

                if (dt.Rows.Count > 0)
                    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "MakePayment Output...." + dt.Rows[0].ToString());
                else
                    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "MakePayment Output....BookedHistory ");
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "InsupdTripPayments";
                cmd.Connection = conn;


                SqlParameter f = new SqlParameter("@flag", SqlDbType.VarChar);
                f.Value = t.flag;
                cmd.Parameters.Add(f);

                SqlParameter s = new SqlParameter("@Id", SqlDbType.Int);
                s.Value = t.Id;
                cmd.Parameters.Add(s);

                SqlParameter BNo = new SqlParameter("@BNo", SqlDbType.Int);
                BNo.Value = t.BNo;
                cmd.Parameters.Add(BNo);

                SqlParameter am = new SqlParameter("@Amount", SqlDbType.Decimal);
                am.Value = t.Amount;
                cmd.Parameters.Add(am);

                SqlParameter si = new SqlParameter("@StatusId", SqlDbType.Int);
                si.Value = t.StatusId;
                cmd.Parameters.Add(si);

                SqlParameter gti = new SqlParameter("@GatewayTransId", SqlDbType.VarChar);
                gti.Value = t.GatewayTransId;
                cmd.Parameters.Add(gti);
               

                SqlParameter pmi = new SqlParameter("@PaymentModeId", SqlDbType.Int);
                pmi.Value = t.PaymentModeId;
                cmd.Parameters.Add(pmi);

                SqlParameter co = new SqlParameter("@Comments", SqlDbType.VarChar, 250);
                co.Value = t.Comments;
                cmd.Parameters.Add(co);

                SqlParameter ci = new SqlParameter("@CustAccountId", SqlDbType.Int);
                ci.Value = t.CustAccountId;
                cmd.Parameters.Add(ci);

                SqlParameter ai = new SqlParameter("@AppUserId", SqlDbType.Int);
                ai.Value = t.AppUserId;
                cmd.Parameters.Add(ai);



                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                //return 1;


                Payengine.Controllers.Payengine e = new Payengine.Controllers.Payengine();
                string transId = e.ProcessPayment();

                if (dt.Rows.Count >= 0)
                {
                    
                    
                    //var GatewayTransId = dt.Rows[0]["GatewayTransId"].ToString();
                    if (transId != "")
                    {
                        f.Value = "U";
                        s.Value = dt.Rows[0]["Id"].ToString();
                        var GateTransId = transId;

                        gti.Value = transId;
                        dt = new DataTable();
                        da.Fill(dt);
                    }
                }
                //1) insert the details with status as new/inprogess into trippayments table

                //2) once the id is obtained call the payment gateway

                //3) get the success/failure status from gateway

                //4) update the table again with status and gateway id

                //5) let the customer know the status

            }


            return dt;
        }

        [HttpGet]
        [Route("api/CustomerAccountDetails/GetTripPayments")]
        public DataTable GetTripPayments(int id)
        {
            
            DataTable Tbl = new DataTable();
            SqlConnection conn = new SqlConnection();
            LogTraceWriter traceWriter = new LogTraceWriter();
            try
            {


                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetTripPayments credentials....");
                StringBuilder str = new StringBuilder();
                str.Append("@id" + id + ",");


                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetTripPayments Input sent...." + str.ToString());

                if (Tbl.Rows.Count > 0)
                    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetTripPayments Output...." + Tbl.Rows[0].ToString());
                else
                    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetTripPayments Output....BookedHistory ");
                
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSGetTripPayments";
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;
                cmd.Connection = conn;
                DataSet ds = new DataSet();
                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(ds);
                Tbl = ds.Tables[0];

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetTripPayments Credentials completed.");
            }
            catch(Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetTripPayments...." + ex.Message.ToString());
                Tbl.Columns.Add("Code");
                Tbl.Columns.Add("description");
                DataRow dr = Tbl.NewRow();
                dr[0] = "ERR001";
                dr[1] = ex.Message;
                Tbl.Rows.Add(dr);

            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }

            // int found = 0;
            return Tbl;

        }
    }
}
