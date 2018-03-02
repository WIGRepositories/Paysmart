using System;
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
    public class ChangePwdController : ApiController
    {

        [HttpPost]
        [Route("api/ChangePwd/change")]
        public DataTable change(UserAccount U)
        {
            int status = 0;
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "change....");

                StringBuilder str = new StringBuilder();
                str.Append("@Mobilenumber" + U.Mobilenumber + ",");
                str.Append("@Email" + U.Email + ",");
                str.Append("@Password" + U.Password + ",");
                str.Append("@NewPassword" + U.NewPassword + ",");


                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "change Input sent...." + str.ToString());

                
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSChangePwd";

            cmd.Connection = conn;

            SqlParameter b1 = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
            b1.Value = U.Mobilenumber;
            cmd.Parameters.Add(b1);

            SqlParameter e = new SqlParameter("@Email", SqlDbType.VarChar, 50);
            e.Value = U.Email;
            cmd.Parameters.Add(e);


            SqlParameter m = new SqlParameter("@Password", SqlDbType.VarChar, 50);
            m.Value = U.Password;
            cmd.Parameters.Add(m);

            SqlParameter m1 = new SqlParameter("@NewPassword", SqlDbType.VarChar, 50);
            m1.Value = U.NewPassword;
            cmd.Parameters.Add(m1);

            SqlDataAdapter ds = new SqlDataAdapter(cmd);
            ds.Fill(dt);
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "change successful....");
           
            if (dt.Rows.Count > 0)
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "change Output...." + dt.Rows[0].ToString());
            else
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "change Output....ChangePwd ");
            }
            catch (Exception ex)
            {
                
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.OK, ex.Message));
                dt.Columns.Add("Code");
                dt.Columns.Add("description");
                DataRow dr = dt.NewRow();
                dr[0] = "ERR001";
                dr[1] = ex.Message;
                dt.Rows.Add(dr);
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "change...." + ex.Message.ToString());
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return dt;

            //Verify Passwordotp

        }
    }
}
