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
    public class StopsController : ApiController
    {
        [HttpGet]
        [Route("api/Stops/Getstops")]
        public DataTable Getstops()
        {
            DataTable Tbl = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            StringBuilder str = new StringBuilder();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getstops....");
               
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSGetstops";
                cmd.Connection = conn;

                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(Tbl);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getstops successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Getstops...." + ex.Message.ToString());
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
    }
}
