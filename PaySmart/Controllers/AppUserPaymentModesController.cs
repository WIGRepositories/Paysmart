using Paysmart.Models;
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

namespace Paysmart.Controllers
{

    public class AppUserPaymentModesController : ApiController
    {
        [HttpPost]
        [Route("api/AppUserPaymentModes/SaveUserPaymentModes")]
        public DataTable SaveUserPaymentModes(PaymentModes p)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveUserPaymentModes....");
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "InsUpdDelAppUserPaymentModes";
                cmd.Connection = conn;

                SqlParameter ff = new SqlParameter("@flag", SqlDbType.VarChar);
                ff.Value = p.flag;
                cmd.Parameters.Add(ff);

                SqlParameter i = new SqlParameter("@Id", SqlDbType.Int);
                i.Value = p.Id;
                cmd.Parameters.Add(i);

                SqlParameter n = new SqlParameter("@Accountnumber", SqlDbType.VarChar, 50);
                n.Value = p.Accountnumber;
                cmd.Parameters.Add(n);

                SqlParameter In = new SqlParameter("@InstitutionName", SqlDbType.VarChar, 50);
                In.Value = p.InstitutionName;
                cmd.Parameters.Add(In);


                SqlParameter Ic = new SqlParameter("@InstituteCode", SqlDbType.VarChar, 60);
                Ic.Value = p.InstituteCode;
                cmd.Parameters.Add(Ic);

                SqlParameter Cc = new SqlParameter("@CustomerCode", SqlDbType.VarChar, 60);
                Cc.Value = p.CustomerCode;
                cmd.Parameters.Add(Cc);



                SqlParameter ip = new SqlParameter("@IsPrimary", SqlDbType.Int);
                ip.Value = p.IsPrimary;
                cmd.Parameters.Add(ip);

                SqlParameter pt = new SqlParameter("@PymentType", SqlDbType.Int);
                pt.Value = p.PymentType;
                cmd.Parameters.Add(pt);

                SqlParameter Ci = new SqlParameter("@CustomerId", SqlDbType.Int);
                Ci.Value = p.CustomerId;
                cmd.Parameters.Add(Ci);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveUserPaymentModes successful....");


            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "SaveUserPaymentModes...." + ex.Message.ToString());
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
        [HttpGet]
        [Route("api/GetUserPaymentModes")]
        public DataTable GetUserPaymentModes(string Accountnumber)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetUserPaymentModes....");
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "GetAppUserPaymentModes";
                cmd.Connection = conn;
                cmd.Parameters.Add("@Accountnumber", SqlDbType.VarChar ).Value = Accountnumber;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetUserPaymentModes successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetUserPaymentModes...." + ex.Message.ToString());
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
