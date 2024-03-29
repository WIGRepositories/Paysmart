﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Paysmart.Models;
using System.Web.Http.Tracing;
using System.Text;

namespace Paysmart.Controllers
{
    public class HourBasedPricingController : ApiController
    {

        [HttpGet]
        [Route("api/HourBasedPricing/GetHourBasePricing")]
        public DataTable GetHourBasePricing(int ctryId, int vgId)
        {
            DataTable Tbl = new DataTable();

            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            StringBuilder str = new StringBuilder();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetHourBasePricing....");
                str.Append("ctryId:" + ctryId + ",");
                str.Append("vgId:" + vgId + ",");
              
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSGetHourBasePricing";
                cmd.Connection = conn;

                cmd.Parameters.Add("@ctryId", SqlDbType.Int).Value = ctryId;
                cmd.Parameters.Add("@vgId", SqlDbType.Int).Value = vgId;

                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(Tbl);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetHourBasePricing successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetHourBasePricing...." + ex.Message.ToString());
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                Tbl.Columns.Add("Code");
                Tbl.Columns.Add("description");
                DataRow dr = Tbl.NewRow();
                dr[0] = "ERR001";
                dr[1] = ex.Message;
                Tbl.Rows.Add(dr);
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return Tbl;

        }

        [HttpPost]
        [Route("api/HourBasedPricing/SaveHourBasePricing")]
        public DataTable SaveHourBasePricing(HourBase c)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveHourBasePricing....");

                str.Append("CountryId:" + c.CountryId + ",");
                str.Append("VehicleGroupId:" + c.VehicleGroupId + ",");
                str.Append("Hours:" + c.Hours + ",");
                str.Append("price:" + c.price + ",");
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSInsUpdDelHourBasePricing";

                cmd.Connection = conn;

                SqlParameter insupddelflag = new SqlParameter("@insupddelflag", SqlDbType.VarChar, 10);
                insupddelflag.Value = c.insupddelflag;
                cmd.Parameters.Add(insupddelflag);

                SqlParameter q = new SqlParameter("@Id", SqlDbType.Int);
                q.Value = c.Id;
                cmd.Parameters.Add(q);

                SqlParameter q1 = new SqlParameter("@VehicleTypeId", SqlDbType.Int);
                q1.Value = c.VehicleTypeId;
                cmd.Parameters.Add(q1);

                SqlParameter e = new SqlParameter("@FromTime", SqlDbType.DateTime);
                e.Value = c.FromTime;
                cmd.Parameters.Add(e);

                SqlParameter t = new SqlParameter("@ToTime", SqlDbType.DateTime);
                t.Value = c.ToTime;
                cmd.Parameters.Add(t);

                SqlParameter c1 = new SqlParameter("@PricingType", SqlDbType.Int);
                c1.Value = c.PricingType;
                cmd.Parameters.Add(c1);

                SqlParameter ft = new SqlParameter("@FromDate", SqlDbType.DateTime);
                ft.Value = c.FromDate;
                cmd.Parameters.Add(ft);

                SqlParameter tf = new SqlParameter("@ToDate", SqlDbType.DateTime);
                tf.Value = c.ToDate;
                cmd.Parameters.Add(tf);


                SqlParameter cd = new SqlParameter("@Createdby", SqlDbType.Int);
                cd.Value = c.CreatedBy;
                cmd.Parameters.Add(cd);

                SqlParameter up = new SqlParameter("@Hours", SqlDbType.Int);
                up.Value = c.Hours;
                cmd.Parameters.Add(up);

                SqlParameter cc = new SqlParameter("@CountryId", SqlDbType.Int);
                cc.Value = c.CountryId;
                cmd.Parameters.Add(cc);

                SqlParameter vc = new SqlParameter("@VehicleGroupId", SqlDbType.Int);
                vc.Value = c.VehicleGroupId;
                cmd.Parameters.Add(vc);

                SqlParameter uo = new SqlParameter("@price", SqlDbType.Decimal);
                uo.Value = c.price;
                cmd.Parameters.Add(uo);



                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveHourBasePricing successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "SaveHourBasePricing...." + ex.Message.ToString());
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
            return (dt);



        }
    }
}
