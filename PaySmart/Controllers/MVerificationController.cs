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
    public class MVerificationController : ApiController
    {
        [HttpPost]
        [Route("api/MVerification/MOTPverification")]
        public DataTable MOTPverification(VehicleBooking ocr)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "MOTPverification....");
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HVMOTPverification";

                cmd.Connection = conn;


                SqlParameter q1 = new SqlParameter("@PhoneNo", SqlDbType.VarChar, 50);
                q1.Value = ocr.PhoneNo;
                cmd.Parameters.Add(q1);

                SqlParameter e = new SqlParameter("@Mobileotp", SqlDbType.VarChar, 10);
                e.Value = ocr.Mobileotp;
                cmd.Parameters.Add(e);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "MOTPverification successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "MOTPverification...." + ex.Message.ToString());
                throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            //Verify mobile otp

            return dt;

        }
    }
}
