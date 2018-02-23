using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Paysmart.Models;
using System.Data;
using System.Web.Http.Tracing;
using System.Text;

namespace Paysmart.Controllers
{
    public class PasswordverificationController : ApiController
    {
        [HttpPost]
        [Route("api/Appusers/SavePostlist2")]
        public int SavePostlist2(UserAccount ocr)
        {
            int status = 0;
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SavePostlist2....");
                str.Append("Password:" + ocr.Password + ",");
                str.Append("Passwordotp:" + ocr.Passwordotp + ",");
                str.Append("Mobilenumber:" + ocr.Mobilenumber + ",");
                
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());


                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSInsUpdDelPasswordverification";

                cmd.Connection = conn;


                SqlParameter f = new SqlParameter("@flag", SqlDbType.VarChar);
                f.Value = ocr.flag;
                cmd.Parameters.Add(f);

                SqlParameter i = new SqlParameter("@id", SqlDbType.Int);
                i.Value = ocr.id;
                cmd.Parameters.Add(i);

                SqlParameter q1 = new SqlParameter("@Password", SqlDbType.VarChar, 50);
                q1.Value = ocr.Password;
                cmd.Parameters.Add(q1);

                SqlParameter e = new SqlParameter("@Passwordotp", SqlDbType.VarChar, 10);
                e.Value = ocr.Passwordotp;
                cmd.Parameters.Add(e);

                SqlParameter c = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
                c.Value = ocr.Mobilenumber;
                cmd.Parameters.Add(c);

                conn.Open();
                status = cmd.ExecuteNonQuery();

                conn.Close();
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SavePostlist2 successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "SavePostlist2...." + ex.Message.ToString());
                throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.OK, ex.Message));
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
