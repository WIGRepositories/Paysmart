﻿using System;
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
    public class BookedHistoryController : ApiController
    {
        [HttpGet]
        [Route("api/BookedHistory/GetBookedHistory")]
        public DataTable GetBookedHistory(string emailid = "", string MobileNo = "")
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetBookedHistory....");
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSGetBookedHistory";
                cmd.Parameters.Add("@emailAddress", SqlDbType.VarChar, 50).Value = (emailid == null) ? "-1" : emailid;
                // cmd.Parameters.Add("@emailAddress", SqlDbType.VarChar,50).Value = emailid;
                cmd.Parameters.Add("@mobileno", SqlDbType.VarChar, 15).Value = MobileNo;
                cmd.Connection = conn;
                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetBookedHistory successful....");
                StringBuilder str = new StringBuilder();
                str.Append("@emailAddress:" + emailid + ",");
                str.Append("@mobileno" + MobileNo + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetBookedHistory Input sent...." + str.ToString());

                if (dt.Rows.Count > 0)
                    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetBookedHistory Output...." + dt.Rows[0].ToString());
                else
                    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetBookedHistory Output....BookedHistory ");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetBookedHistory....failed" + ex.Message.ToString());
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
