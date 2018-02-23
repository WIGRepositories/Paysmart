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
    public class CancellationController : ApiController
    {
        [HttpGet]
        public DataTable RetriveTicketDetails(string ticketNo, string emailid, string mobileno)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "RetriveTicketDetails....");
            //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "GetAvailableServices";
            cmd.Parameters.Add("@ticketNo", SqlDbType.VarChar, 15).Value = ticketNo;
            cmd.Parameters.Add("@emailid", SqlDbType.VarChar, 15).Value = (emailid == null) ? "-1" : emailid;
            cmd.Parameters.Add("@mobileno", SqlDbType.VarChar, 15).Value = (mobileno == null) ? "-1" : mobileno;

            cmd.Connection = conn;
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(dt);

            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "RetriveTicketDetails successful....");
            StringBuilder str = new StringBuilder();
            str.Append("@ticketNo" + ticketNo + ",");
            str.Append("@emailid" + emailid + ",");
            str.Append("@mobileno" + mobileno + ",");



            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "RetriveTicketDetails Input sent...." + str.ToString());

            if (dt.Rows.Count > 0)
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "RetriveTicketDetails Output...." + dt.Rows[0].ToString());
            else
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "RetriveTicketDetails Output....Ticket Details ");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "RetriveTicketDetails....failed" + ex.Message.ToString());
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                dt.Columns.Add("Code");
                dt.Columns.Add("description");
                DataRow dr = dt.NewRow();
                dr[0] = "SCC001";
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
