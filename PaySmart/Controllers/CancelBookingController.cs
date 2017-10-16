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

namespace Paysmart.Controllers
{
    public class CancelBookingController : ApiController
    {
        [HttpPost]

        [Route("api/CancelBooking/CancelBooking")]
        public DataTable cncelbkng(cancel c)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "CancelBooking....");

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HVcancelbooking";

                SqlParameter i = new SqlParameter("@BNo", SqlDbType.Int);
                i.Value = c.BNo;
                cmd.Parameters.Add(i);

                SqlParameter n = new SqlParameter("@cancellationType", SqlDbType.Int);
                n.Value = c.BookingStatus;
                cmd.Parameters.Add(n);

                SqlParameter r = new SqlParameter("@CancelReason", SqlDbType.VarChar, 255);
                r.Value = c.CancelReason;
                cmd.Parameters.Add(r);


                SqlParameter a = new SqlParameter("@CancelBy", SqlDbType.VarChar, 255);
                a.Value = c.CancelBy;
                cmd.Parameters.Add(a);

                cmd.Connection = conn;
                DataSet ds = new DataSet();
                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(ds);
                dt = ds.Tables[0];
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "CancelBooking successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "CancelBooking.... failed" + ex.Message.ToString());
                throw ex;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return dt;

        }

        [Route("api/CancelBooking/BookingExpiry")]
        public int BookingExpiry(VehicleBooking vb)
        {
            int status = 0;
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
          
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "BookingExpiry....");
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HVInsUpdcancelbooking";

                SqlParameter i = new SqlParameter("@BNo", SqlDbType.VarChar, 20);
                i.Value = vb.BNo;
                cmd.Parameters.Add(i);

                SqlParameter n = new SqlParameter("@cancellationType", SqlDbType.Int);
                n.Value = 2;
                cmd.Parameters.Add(n);

                SqlParameter r = new SqlParameter("@CancelReason", SqlDbType.VarChar, 255);
                r.Value = "No reponse";
                cmd.Parameters.Add(r);


                SqlParameter a = new SqlParameter("@CancelledBy", SqlDbType.VarChar, 50);
                a.Value = vb.CancelledBy;
                cmd.Parameters.Add(a);


                cmd.Connection = conn;
                conn.Open();
                object result = cmd.ExecuteScalar();
                conn.Close();
                if (result.ToString() == "1")
                {
                    status = 1;
                    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "BookingExpiry successful....");
                }
               // return status;
            }
            catch (Exception ex)
            {
                
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "BookingExpiry.... failed" + ex.Message.ToString());
                throw ex;
                //return status;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return status;
        }

    }
}
