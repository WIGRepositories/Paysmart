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

namespace Paysmart.Controllers
{
    public class EOTPverficationController : ApiController
    {
        [HttpPost]
        [Route("api/Appusers/SavePostlist1")]
        public int SavePostlist1(Appusers ocr)
        {
            int status = 0;
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SavePostlist1....");

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSInsUpdDelEOTPverification";

                cmd.Connection = conn;


                SqlParameter f = new SqlParameter("@flag", SqlDbType.VarChar);
                f.Value = ocr.flag;
                cmd.Parameters.Add(f);

                SqlParameter i = new SqlParameter("@id", SqlDbType.Int);
                i.Value = ocr.id;
                cmd.Parameters.Add(i);

                SqlParameter q1 = new SqlParameter("@Email", SqlDbType.VarChar, 50);
                q1.Value = ocr.Email;
                cmd.Parameters.Add(q1);

                SqlParameter e = new SqlParameter("@Emailotp", SqlDbType.VarChar, 10);
                e.Value = ocr.Emailotp;
                cmd.Parameters.Add(e);

                SqlParameter c = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
                c.Value = ocr.Mobilenumber;
                cmd.Parameters.Add(c);

                conn.Open();
                status = cmd.ExecuteNonQuery();

                conn.Close();
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SavePostlist1 successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "SavePostlist1...." + ex.Message.ToString());
                throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
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
