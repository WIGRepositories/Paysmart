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
    public class TaxiPriceController : ApiController
    {
        [HttpGet]
        [Route("api/TaxiPrice/TaxiPrice")]

        public DataTable TaxiPrice(int SrcId, int DestId)
        {

            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            StringBuilder str = new StringBuilder();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "TaxiPrice....");

                str.Append("SrcId:" + SrcId + ",");
                str.Append("DestId:" + DestId + ",");
                
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());


                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "GetTaxiprice";
                cmd.Connection = conn;

                cmd.Parameters.Add("@SrcId", SqlDbType.Int).Value = SrcId;
                cmd.Parameters.Add("@DestId", SqlDbType.Int).Value = DestId;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "TaxiPrice successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "TaxiPrice...." + ex.Message.ToString());
                dt.Columns.Add("Code");
                dt.Columns.Add("description");
                DataRow dr = dt.NewRow();
                dr[0] = "ERR001";
                dr[1] = ex.Message;
                dt.Rows.Add(dr);

            }
            return dt;
        }
    }
}
