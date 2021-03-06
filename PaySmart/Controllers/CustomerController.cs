﻿using HireAVehicle.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace HireAVehicle.Controllers
{
    public class CustomerController : ApiController
    {
        [HttpPost]
        [Route("api/Customer/CustomerDetails")]
        public DataTable CustomerDetails(Customer y)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "change....");

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HVsp_InsCustomerDetails";

            cmd.Connection = conn;

            SqlParameter q = new SqlParameter("@Fname", SqlDbType.VarChar, 30);
            q.Value = y.Fname;
            cmd.Parameters.Add(q);

            SqlParameter q1 = new SqlParameter("@Lname", SqlDbType.VarChar, 30);
            q1.Value = y.Lname;
            cmd.Parameters.Add(q1);

            SqlParameter e = new SqlParameter("@Age", SqlDbType.Int);
            e.Value = y.Age;
            cmd.Parameters.Add(e);

            SqlParameter c = new SqlParameter("@Sex", SqlDbType.Int);
            c.Value = y.Sex;
            cmd.Parameters.Add(c);

            SqlParameter b = new SqlParameter("@datetime", SqlDbType.VarChar, 30);
            b.Value = y.datetime;
            cmd.Parameters.Add(b);

            SqlParameter p = new SqlParameter("@Pnr_Id", SqlDbType.Int);
            p.Value = y.Pnr_Id;
            cmd.Parameters.Add(p);

            SqlParameter m = new SqlParameter("@Pnr_No", SqlDbType.VarChar, 20);
            m.Value = y.Pnr_No;
            cmd.Parameters.Add(m);

            SqlParameter t = new SqlParameter("@Identityproof", SqlDbType.VarChar, 30);
            t.Value = y.Identityproof;
            cmd.Parameters.Add(t);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "change successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "change...." + ex.Message.ToString());
                throw ex;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return (dt);

            //Verify Passwordotp

        }
    }
}
