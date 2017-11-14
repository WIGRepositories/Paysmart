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
    public class ResetPwdController : ApiController
    {

        [HttpPost]
        [Route("api/ResetPwd/reset")]
        public int reset(UserAccount U)
        {
            int status = 0;
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "reset....");

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSPasswordreset";

                cmd.Connection = conn;

                SqlParameter b = new SqlParameter("@Passwordotp", SqlDbType.VarChar, 10);
                b.Value = U.Passwordotp;
                cmd.Parameters.Add(b);

                SqlParameter b1 = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
                b1.Value = U.Mobilenumber;
                cmd.Parameters.Add(b1);

                SqlParameter e = new SqlParameter("@Email", SqlDbType.VarChar, 50);
                e.Value = U.Email;
                cmd.Parameters.Add(e);


                SqlParameter m = new SqlParameter("@Password", SqlDbType.VarChar, 10);
                m.Value = U.Password;
                cmd.Parameters.Add(m);

                conn.Open();
                status = cmd.ExecuteNonQuery();

                conn.Close();
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "reset successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "reset...." + ex.Message.ToString());
                throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return status;

            //Verify Passwordotp

        }
    }
}
