﻿using Paysmart;
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
using System.Text;

namespace SmartTicketDashboard.Controllers
{
    public class SOSNumberController:ApiController
    {
        [HttpGet]
        [Route("api/GetSOSNumber")]
        public DataTable GetSOSNumber(int utypeId, int userId)
        {
            DataTable Tbl = new DataTable();
            StringBuilder str = new StringBuilder();

            LogTraceWriter traceWriter = new LogTraceWriter();
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetSOSNumber ....");
            str.Append("UserTypeId:" + utypeId + ",");
            str.Append("UserId:" + userId + ",");
            
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());
            //connect to database
            SqlConnection conn = new SqlConnection();
            try
            {
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "GetSOSNumber";
                cmd.Parameters.Add("@UserTypeId", SqlDbType.Int).Value = utypeId;
                cmd.Parameters.Add("@UserId", SqlDbType.Int).Value = userId;
                cmd.Connection = conn;

                //DataSet ds = new DataSet();
                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(Tbl);

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetSOSNumber completed.");
            }
            catch(Exception ex)
            {
                
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetSOSNumber...." + ex.Message.ToString());
                //throw ex;
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
        [Route("api/SaveSOSNumber")]
        public DataTable SaveSOSNumber(SOSNumber sos)
        {

            LogTraceWriter traceWriter = new LogTraceWriter();
            StringBuilder str = new StringBuilder();
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveSOSNumber ...");
            str.Append("UserId:" + sos.UserId + ",");
            str.Append("MobileNumber:" + sos.MobileNumber + ",");
            str.Append("MobiOrder:" + sos.MobiOrder + ",");
            str.Append("UserName:" + sos.Username + ",");
           
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

            //connect to database
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();
            try
            {
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "InsUpdDelSOSNumber";
                cmd.Connection = conn;
                conn.Open();

                    SqlParameter flag = new SqlParameter();
                    flag.ParameterName = "@flag";
                    flag.SqlDbType = SqlDbType.VarChar;
                    flag.Value = sos.flag;
                    cmd.Parameters.Add(flag);

                    SqlParameter id = new SqlParameter();
                    id.ParameterName = "@Id";
                    id.SqlDbType = SqlDbType.Int;
                    id.Value = sos.Id;
                    cmd.Parameters.Add(id);

                    SqlParameter UserId = new SqlParameter();
                    UserId.ParameterName = "@UserId";
                    UserId.SqlDbType = SqlDbType.Int;
                    UserId.Value = sos.UserId;
                    cmd.Parameters.Add(UserId);

                    SqlParameter mobile = new SqlParameter();
                    mobile.ParameterName = "@MobileNumber";
                    mobile.SqlDbType = SqlDbType.VarChar;
                    mobile.Value = sos.MobileNumber;
                    cmd.Parameters.Add(mobile);

                    SqlParameter ustid = new SqlParameter();
                    ustid.ParameterName = "@UserTypeId";
                    ustid.SqlDbType = SqlDbType.Int;
                    ustid.Value = sos.UserTypeId;
                    cmd.Parameters.Add(ustid);

                    SqlParameter CreatedOn = new SqlParameter();
                    CreatedOn.ParameterName = "@UserName";
                    CreatedOn.SqlDbType = SqlDbType.VarChar;
                    CreatedOn.Value = sos.Username;
                    cmd.Parameters.Add(CreatedOn);

                    SqlParameter Active = new SqlParameter();
                    Active.ParameterName = "@Active";
                    Active.SqlDbType = SqlDbType.Int;
                    Active.Value = sos.Active;
                    cmd.Parameters.Add(Active);

                
                    SqlParameter order = new SqlParameter();
                    order.ParameterName = "@MobiOrder";
                    order.SqlDbType = SqlDbType.Int;
                    order.Value = sos.MobiOrder;
                    cmd.Parameters.Add(order);
                    cmd.ExecuteScalar();
                   
                conn.Close();
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveSOSNumber  completed.");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "SaveSOSNumber...." + ex.Message.ToString());
                //throw ex;
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
