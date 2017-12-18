using Paysmart;
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

namespace Paysmart.Controllers
{
    public class AppUsersController : ApiController
    {

        [Route("api/AppUsers/AppUserDetails")]
        public DataTable GetUserById(int id)
        {
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection(); try
            {
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
                SqlCommand cmd = new SqlCommand();

                SqlParameter UId = new SqlParameter("@id", SqlDbType.Int);
                UId.Value = id;
                cmd.Parameters.Add(UId);

                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSGetAppUserdetails";
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
                dt = ds.Tables[0];
                
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "AppUserDetails successful....");
                StringBuilder str = new StringBuilder();
                str.Append("@id:" + id + ",");


                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "AppUserDetails Input sent...." + str.ToString());

                if (dt.Rows.Count > 0)
                    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "AppUserDetails Output...." + dt.Rows[0].ToString());
                else
                    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "AppUserDetails Output....App User ");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "AppUserDetails failed...." + ex.Message.ToString());
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

        [HttpPost]
        [Route("api/UserAccount/UpdateAppUser")]
        public DataTable RegisterUser(UserAccount ocr)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSInsUpdAppusers";

                cmd.Connection = conn;

                SqlParameter f = new SqlParameter("@flag", SqlDbType.VarChar);
                f.Value = ocr.flag;
                cmd.Parameters.Add(f);

                SqlParameter c = new SqlParameter("@Username", SqlDbType.VarChar, 20);
                c.Value = ocr.Username;
                cmd.Parameters.Add(c);

                SqlParameter ce = new SqlParameter("@Email", SqlDbType.VarChar, 50);
                ce.Value = ocr.Email;
                cmd.Parameters.Add(ce);


                SqlParameter cm = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
                cm.Value = ocr.Mobilenumber;
                cmd.Parameters.Add(cm);

                SqlParameter q1 = new SqlParameter("@Password", SqlDbType.VarChar, 50);
                q1.Value = ocr.Password;
                cmd.Parameters.Add(q1);

                SqlParameter v = new SqlParameter("@Firstname", SqlDbType.VarChar, 50);
                v.Value = ocr.Firstname;
                cmd.Parameters.Add(v);

                SqlParameter v1 = new SqlParameter("@lastname", SqlDbType.VarChar, 50);
                v1.Value = ocr.lastname;
                cmd.Parameters.Add(v1);

                SqlParameter v2 = new SqlParameter("@AuthTypeId", SqlDbType.VarChar, 50);
                v2.Value = ocr.AuthTypeId;
                cmd.Parameters.Add(v2);

                SqlParameter u = new SqlParameter("@AltPhonenumber", SqlDbType.VarChar, 50);
                u.Value = ocr.AltPhonenumber;
                cmd.Parameters.Add(u);

                SqlParameter u1 = new SqlParameter("@Altemail", SqlDbType.VarChar, 50);
                u1.Value = ocr.Altemail;
                cmd.Parameters.Add(u1);

                SqlParameter i = new SqlParameter("@AccountNo", SqlDbType.VarChar, 50);
                i.Value = ocr.AccountNo;
                cmd.Parameters.Add(i);

                SqlParameter amt = new SqlParameter("@Amount", SqlDbType.Decimal);
                amt.Value = ocr.Amount;
                cmd.Parameters.Add(amt);

                SqlParameter photo = new SqlParameter("@UserPhoto", SqlDbType.VarChar);
                photo.Value = ocr.UserPhoto;
                cmd.Parameters.Add(photo);

                SqlParameter gender = new SqlParameter("@Gender", SqlDbType.Int);
                gender.Value = ocr.Gender;
                cmd.Parameters.Add(gender);


                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "UpdateAppUser successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "UpdateAppUser failed...." + ex.Message.ToString());
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

        [Route("api/GetFileContent")]
        public DataTable GetFileContent(int id, int cat)
        {
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection(); 
            try
            {
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
                SqlCommand cmd = new SqlCommand();

                SqlParameter Id = new SqlParameter("@FileId", SqlDbType.Int);
                Id.Value = id;
                cmd.Parameters.Add(Id);

                SqlParameter c = new SqlParameter("@Category", SqlDbType.Int);
                c.Value = cat;
                cmd.Parameters.Add(c);

                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSGetFileContent";
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
                dt = ds.Tables[0];

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetFileContent successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetFileContent failed...." + ex.Message.ToString());
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
