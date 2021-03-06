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
    public class vehicletypesController : ApiController
    {
        [HttpGet]

        [Route("api/vehicletype/vehicle")]
        public DataTable vehicle(int VID)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            StringBuilder str = new StringBuilder();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "vehicle....");

                str.Append("VID:" + VID + ",");
                
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HVgetvehilcetypes";
                cmd.Parameters.Add("@VID", SqlDbType.Int).Value = VID;
                cmd.Connection = conn;
                cmd.Connection = conn;
                DataSet ds = new DataSet();
                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(ds);
                dt = ds.Tables[0];
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "vehicle successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "vehicle...." + ex.Message.ToString());
                //throw ex;
                throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
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
