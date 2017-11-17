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
    public class loginController : ApiController
    {
        [HttpPost]
        [Route("api/login/ValidateCredentials")]
        public DataTable ValidateCredentials(UserLogin u)
        {
            DataTable Tbl = new DataTable();

            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "ValidateCredentials....");
                str.Append("Mobilenumber:" + u.Mobilenumber + ",");
                str.Append("Password:" + u.Password + ",");
                
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSValidatecred";

                cmd.Connection = conn;

                SqlParameter lUserName = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
                lUserName.Value = u.Mobilenumber;
                lUserName.Direction = ParameterDirection.Input;
                cmd.Parameters.Add(lUserName);


                SqlParameter lPassword = new SqlParameter("@Password", SqlDbType.VarChar, 50);
                lPassword.Value = u.Password;
                lPassword.Direction = ParameterDirection.Input;
                cmd.Parameters.Add(lPassword);
                //System.Threading.Thread.Sleep(10000);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(Tbl);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "ValidateCredentials successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "ValidateCredentials...." + ex.Message.ToString());
                throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return Tbl;

        }
        //[HttpGet]
        //public DataTable RetrivePassword(string email)
        //{

        //    DataTable Tbl = new DataTable();
        //    SqlConnection conn = new SqlConnection();
        //    LogTraceWriter traceWriter = new LogTraceWriter();

        //    try
        //    {
        //        traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Retriving password....");

        //        //connect to database

        //        //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
        //        conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

        //        SqlCommand cmd = new SqlCommand();
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.CommandText = "dbo.RetrivePassword";

        //        cmd.Connection = conn;

        //        SqlParameter lUserName = new SqlParameter("@email", SqlDbType.VarChar, 50);
        //        lUserName.Value = email;
        //        lUserName.Direction = ParameterDirection.Input;
        //        cmd.Parameters.Add(lUserName);

        //        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //        da.Fill(Tbl);

        //        traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Retrive password completed.");
        //        if (Tbl.Rows.Count == 1)
        //        {
        //            //send the email and return success
        //        }
        //        if (Tbl.Rows.Count > 1)
        //        {
        //            throw new Exception("Multiple users found");
        //        }
        //        return Tbl;
        //    }
        //    catch (Exception ex)
        //    {
        //        if (conn.State == ConnectionState.Open)
        //        {
        //            conn.Close();
        //        }
        //        traceWriter.Trace(Request, "1", TraceLevel.Info, "{0}", "Error during retrive password:." + ex.Message);
        //        // return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
        //        throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
        //    }

        //}

    }
}
