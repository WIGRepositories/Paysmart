﻿using System;
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
    public class UpdatePaymentController : ApiController
    {
        [HttpGet]
        [Route("api/UpdatePayment/GetUpdatePayment")]

        public DataTable GetUpdatePayment(string BookingId)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetUpdatePayment....");

                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HVGetallocatedriver";
                cmd.Connection = conn;
                cmd.Parameters.Add("@BookingId", SqlDbType.VarChar, 50).Value = BookingId;


                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetUpdatePayment successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetUpdatePayment...." + ex.Message.ToString());
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
