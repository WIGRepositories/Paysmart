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
using System.Text; 

namespace Paysmart.Controllers
{
    public class DriverTripController : ApiController
    {
        [HttpGet]
        [Route("api/Driverlogin/Getdrivertrips")]
        public DataTable Getdrivertrips(string DriverNo,int status)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getdrivertrips....");
                StringBuilder str = new StringBuilder();
                str.Append("@PhoneNo" + DriverNo + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getdrivertrips Input sent...." + str.ToString());
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HVTripsList";
                cmd.Connection = conn;
                cmd.Parameters.Add("@PhoneNo", SqlDbType.VarChar, 20).Value = DriverNo;
                cmd.Parameters.Add("@status", SqlDbType.Int).Value = status;
                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getdrivertrips successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Getdrivertrips...." + ex.Message.ToString());
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

        [HttpGet]
        [Route("api/Driverlogin/GetdrivertripsBookingno")]
        public DataTable GetdrivertripsBookingno(string DriverNo, string bno)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getdrivertrips....");
                StringBuilder str = new StringBuilder();
                str.Append("@PhoneNo" + DriverNo + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getdrivertrips Input sent...." + str.ToString());
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HVGetTripsbyBooknoHistory";
                cmd.Connection = conn;
                cmd.Parameters.Add("@PhoneNo", SqlDbType.VarChar, 20).Value = DriverNo;
                cmd.Parameters.Add("@bno", SqlDbType.VarChar,20).Value = bno;
                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getdrivertrips successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Getdrivertrips...." + ex.Message.ToString());
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
