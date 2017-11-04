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

namespace Paysmart.Controllers
{
    public class CustomerAccountDetailsController : ApiController
    {

        [HttpGet]
        [Route("api/CustomerAccountDetails/GetCustomerAccount")]
        public DataTable GetCustomerAccount()
        {
            DataTable Tbl = new DataTable();

            LogTraceWriter traceWriter = new LogTraceWriter();
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "CustomerAccount credentials....");
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSGetCustomerAccountDetails";
            cmd.Connection = conn;
            DataSet ds = new DataSet();
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(ds);
            Tbl = ds.Tables[0];
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "CustomerAccount Credentials completed.");
            // int found = 0;
            return Tbl;

        }

        [HttpPost]
        [Route("api/CustomerAccountDetails/CustomerAccount")]
        public DataTable Vehicles(CustomerAccounts v)
        {
            SqlConnection conn = new SqlConnection();

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

            SqlParameter pmi = new SqlParameter("@PaymentModeId", SqlDbType.Int);
            pmi.Value = v.PaymentModeId;
            cmd.Parameters.Add(pmi);

            SqlParameter an = new SqlParameter("@AccountNumber", SqlDbType.VarChar, 250);
            an.Value = v.AccountNumber;
            cmd.Parameters.Add(an);

            SqlParameter t = new SqlParameter("@Type", SqlDbType.Int);
            t.Value = v.Type;
            cmd.Parameters.Add(t);

            SqlParameter hn = new SqlParameter("@HolderName", SqlDbType.VarChar, 250);
            hn.Value = v.HolderName;
            cmd.Parameters.Add(hn);

            SqlParameter c = new SqlParameter("@code", SqlDbType.VarChar, 50);
            c.Value = v.code;
            cmd.Parameters.Add(c);

            SqlParameter em = new SqlParameter("@ExpMonth", SqlDbType.VarChar, 150);
            em.Value = v.ExpMonth;
            cmd.Parameters.Add(em);

            SqlParameter ey = new SqlParameter("@ExpYear", SqlDbType.VarChar, 50);
            ey.Value = v.ExpYear;
            cmd.Parameters.Add(ey);

            SqlParameter ac = new SqlParameter("@AccountCode", SqlDbType.VarChar, 50);
            ac.Value = v.AccountCode;
            cmd.Parameters.Add(ac);

            SqlParameter at = new SqlParameter("@AccountType", SqlDbType.VarChar, 150);
            at.Value = v.AccountType;
            cmd.Parameters.Add(at);

            SqlParameter ip = new SqlParameter("@IsPrimary", SqlDbType.VarChar, 15);
            ip.Value = v.IsPrimary;
            cmd.Parameters.Add(ip);

            SqlParameter iv = new SqlParameter("@IsVerified", System.Data.SqlDbType.VarChar, 15);
            iv.Value = v.IsVerified;
            cmd.Parameters.Add(iv);

            SqlParameter co = new SqlParameter("@CreatedOn", SqlDbType.Date);
            co.Value = v.CreatedOn;
            cmd.Parameters.Add(co);

            SqlParameter uo = new SqlParameter("@UpdatedOn", SqlDbType.Date);
            uo.Value = v.UpdatedOn;
            cmd.Parameters.Add(uo);
            SqlParameter o = new SqlParameter("@Otp", SqlDbType.VarChar, 50);
            o.Value = v.BVerificationCode;
            cmd.Parameters.Add(o);
            SqlParameter ov = new SqlParameter("@OtpVerfied", SqlDbType.VarChar, 50);
            ov.Value = v.OtpVerfied;
            cmd.Parameters.Add(ov);
            SqlParameter act = new SqlParameter("@Active", SqlDbType.VarChar, 50);
            act.Value = v.Active;
            cmd.Parameters.Add(act);

            SqlParameter ci = new SqlParameter("@CountryId", SqlDbType.VarChar, 50);
            ci.Value = v.CountryId;
            cmd.Parameters.Add(ci);

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            return dt;
        }

        [HttpGet]
        [Route("api/CustomerAccountDetails/GetPaymentModes")]
        public DataTable GetPaymentModes()
        {
            DataTable Tbl = new DataTable();

            LogTraceWriter traceWriter = new LogTraceWriter();
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetPaymentModes credentials....");
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSgetPaymentModes";
            cmd.Connection = conn;
            DataSet ds = new DataSet();
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(ds);
            Tbl = ds.Tables[0];
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetPaymentModes Credentials completed.");
            // int found = 0;
            return Tbl;

        }


        [HttpPost]
        [Route("api/CustomerAccountDetails/AccountVerification")]
        public int AccountVerification(CustomerAccounts b)
        {

            int status = 0;
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "AccountVerification....");

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

                try
                {
                    conn.Open();
                    object statusres = cmd.ExecuteScalar();
                    conn.Close();
                    if (statusres != null)
                    {
                        if (conn.State == ConnectionState.Open)
                        {
                            conn.Close();
                        }
                        return Convert.ToInt32(statusres);
                    }
                    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "AccountVerification successful....");
                }
                catch (Exception ex)
                {
                    traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "AccountVerification...." + ex.Message.ToString());
                    throw ex;
                }
                //Verify mobile otp
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "AccountVerification...." + ex.Message.ToString());
                throw ex;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }

            return status;

        }

    }
}
