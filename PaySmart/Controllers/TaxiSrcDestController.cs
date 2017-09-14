using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Tracing;
using Paysmart.Models;

namespace Paysmart.Controllers
{
    public class TaxiSrcDestController : ApiController
    {
        [HttpPost]
        [Route("api/TaxiSrcDest/SaveTaxiSrcDest")]

        public DataTable SaveTaxiSrcDest(Taxi A)
        {

            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveTaxiSrcDest....");


                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSTaxiSrcDest";
                cmd.Connection = conn;


                SqlParameter f = new SqlParameter("@flag", SqlDbType.VarChar);
                f.Value = A.flag;
                cmd.Parameters.Add(f);

                SqlParameter ff = new SqlParameter("@Id", SqlDbType.Int);
                ff.Value = A.Id;
                cmd.Parameters.Add(ff);


                SqlParameter mn = new SqlParameter("@Name", SqlDbType.VarChar,50);
                mn.Value = A.Name;
                cmd.Parameters.Add(mn);

                SqlParameter em = new SqlParameter("@Description", SqlDbType.VarChar,50);
                em.Value = A.Description;
                cmd.Parameters.Add(em);


                SqlParameter St = new SqlParameter("@Latitude", SqlDbType.Decimal);
                St.Value = A.latitude;
                cmd.Parameters.Add(St);

                SqlParameter lk = new SqlParameter("@Longitude", SqlDbType.Decimal);
                lk.Value = A.longitude;
                cmd.Parameters.Add(lk);


                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveTaxiSrcDest successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "SaveTaxiSrcDest...." + ex.Message.ToString());

            }
            return dt;
        }
    }
}
