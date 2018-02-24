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
    public class BookingHistoryController : ApiController
    {
        [HttpGet]

        [Route("api/BookingHistory/GetBookingHistory")]
        public DataTable GetBookingHistory(string PhoneNo)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetBookingHistory....");

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HVGetBookingHistory";
                cmd.Parameters.Add("@PhoneNo", SqlDbType.VarChar, 50).Value = PhoneNo;
                //cmd.Parameters.Add("@EmailId", SqlDbType.VarChar, 50).Value = EmailId;
                cmd.Connection = conn;
                DataSet ds = new DataSet();
                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(ds);
                dt = ds.Tables[0];

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetBookingHistory successful....");
                StringBuilder str = new StringBuilder();
                str.Append("@PhoneNo" + PhoneNo + ",");
               

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetBookedHistory Input sent...." + str.ToString());

                if (dt.Rows.Count > 0)
                    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetBookedHistory Output...." + dt.Rows[0].ToString());
                else
                    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetBookedHistory Output....BookedHistory ");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetBookingHistory...." + ex.Message.ToString());
                //
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
    }
}
