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

namespace paysmart.Controllers
{
    public class flightbookingController : ApiController
    {
        [HttpGet]
        [Route("api/flightbooking/getflightbooking")]
        public DataTable getflightbooking()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Getflightbooking";
            cmd.Connection = conn;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;

        }
        [HttpPost]
        [Route("api/flightbooking/saveflightbooking")]
        public void saveflightbooking(List<flight> n)
        {
            DataTable dt = new DataTable();
            LogTraceWriter tracer = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            try
            {
                tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", "flightbooking....");
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "InsUpdDelflightbooking";
                cmd.Connection = conn;

                foreach (flight m in n)
                {
                    try
                    {
                        SqlParameter id = new SqlParameter("@Id", SqlDbType.Int);
                        id.Value = m.Id;
                        cmd.Parameters.Add(id);

                        SqlParameter na = new SqlParameter("@flightseatingid", SqlDbType.VarChar, 50);
                        na.Value = m.flightseatingid;
                        cmd.Parameters.Add(na);

                        SqlParameter dee = new SqlParameter("@flightscheduleid", SqlDbType.VarChar, 50);
                        dee.Value = m.flightscheduleid;
                        cmd.Parameters.Add(dee);

                        SqlParameter lon = new SqlParameter("@passengerid", SqlDbType.Int);
                        lon.Value = m.passengerid;
                        cmd.Parameters.Add(lon);
                        SqlParameter lal = new SqlParameter("@fbTransMasterid", SqlDbType.Int);
                        lal.Value = m.fbTransMasterid;
                        cmd.Parameters.Add(lal);

                        //SqlParameter acc = new SqlParameter("@fromdate", SqlDbType.DateTime);
                        //acc.Value = n.fromdate;
                        //cmd.Parameters.Add(acc);

                        SqlParameter fla = new SqlParameter("@flag", SqlDbType.VarChar);
                        fla.Value = m.flag;
                        cmd.Parameters.Add(fla);

                        SqlParameter cod = new SqlParameter("@SentSMS", SqlDbType.VarChar, 500);
                        cod.Value = m.SentSMS;
                        cmd.Parameters.Add(cod);

                        SqlParameter cou = new SqlParameter("@SentEmail", SqlDbType.VarChar, 500);
                        cou.Value = m.SentEmail;
                        cmd.Parameters.Add(cou);

                        cmd.ExecuteScalar();
                        //cmd.Parameters.Clear();

                        //SqlDataAdapter da = new SqlDataAdapter(cmd);
                        //da.Fill(dt);

                        tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", "flightbooking closed....");
                    }
                    catch (Exception ex)
                    {
                        throw ex;

                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;

            }
            //return dt;
        }
    }
}
