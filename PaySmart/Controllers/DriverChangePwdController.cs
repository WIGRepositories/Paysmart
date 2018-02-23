using Paysmart.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Tracing;
using System.Text; 

namespace Paysmart.Controllers
{
    public class DriverChangePwdController : ApiController
    {
        [HttpPost]
        [Route("api/DriverChangePwd/ChangePassword")]
        public int ChangePassword(DriverAccount U)
        {
            int status=0;
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "ChangePassword....");
                StringBuilder str = new StringBuilder();
                str.Append("@Mobilenumber" + U.Mobilenumber + ",");
                str.Append("@Email" + U.Email + ",");
                str.Append("@Password" + U.Password + ",");
                str.Append("@NewPassword" + U.NewPassword + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "ChangePassword Input sent...." + str.ToString());

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSDriversChangePwd";

            cmd.Connection = conn;

            SqlParameter b1 = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
            b1.Value = U.Mobilenumber;
            cmd.Parameters.Add(b1);

            SqlParameter e = new SqlParameter("@Email", SqlDbType.VarChar, 50);
            e.Value = U.Email;
            cmd.Parameters.Add(e);


            SqlParameter m = new SqlParameter("@Password", SqlDbType.VarChar, 50);
            m.Value = U.Password;
            cmd.Parameters.Add(m);

            SqlParameter m1 = new SqlParameter("@NewPassword", SqlDbType.VarChar, 50);
            m1.Value = U.NewPassword;
            cmd.Parameters.Add(m1);

            conn.Open();
             status = cmd.ExecuteNonQuery();
            conn.Close();
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "ChangePassword successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "ChangePassword...." + ex.Message.ToString());
                throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.OK, ex.Message));
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
