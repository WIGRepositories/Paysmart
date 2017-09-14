using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Paysmart.Models;
using System.Configuration;
using System.Web.Http.Tracing;

namespace Paysmart.Controllers
{
    public class VehicleDistPricingController : ApiController
    {

        [HttpPost]
        [Route("api/VehicleDistPricing/VehicleDistanceConfig")]
        public DataTable VehicleDistanceConfig(VehicleDistancePriceConfiguration vdpc)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();


             try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "TaxiPrice....");


            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsUpdDelVehicleDistancePrice";
            cmd.Connection = conn;

            SqlParameter vdpcSourceLoc = new SqlParameter("@SourceLoc", SqlDbType.VarChar, 200);
            vdpcSourceLoc.Value = vdpc.SourceLoc;
            cmd.Parameters.Add(vdpcSourceLoc);

            SqlParameter vdpcDestinationLoc = new SqlParameter("@DestinationLoc", SqlDbType.VarChar, 200);
            vdpcDestinationLoc.Value = vdpc.DestinationLoc;
            cmd.Parameters.Add(vdpcDestinationLoc);

            SqlParameter vdpcSourceLat = new SqlParameter("@SourceLat", SqlDbType.Float);
            vdpcSourceLat.Value = vdpc.SourceLat;
            cmd.Parameters.Add(vdpcSourceLat);

            SqlParameter vdpcSourceLng = new SqlParameter("@SourceLng", SqlDbType.Float);
            vdpcSourceLng.Value = vdpc.SourceLng;
            cmd.Parameters.Add(vdpcSourceLng);

            SqlParameter vdpcDestinationLat = new SqlParameter("@DestinationLat", SqlDbType.Float);
            vdpcDestinationLat.Value = vdpc.DestinationLat;
            cmd.Parameters.Add(vdpcDestinationLat);

            SqlParameter vdpcDestinationLng = new SqlParameter("@DestinationLng", SqlDbType.Float);
            vdpcDestinationLng.Value = vdpc.DestinationLng;
            cmd.Parameters.Add(vdpcDestinationLng);

            SqlParameter vdpcVehicleModelId = new SqlParameter("@VehicleModelId", SqlDbType.Int);
            vdpcVehicleModelId.Value = vdpc.VehicleModelId;
            cmd.Parameters.Add(vdpcVehicleModelId);

            SqlParameter vdpcVehicleTypeId = new SqlParameter("@VehicleTypeId", SqlDbType.Int);
            vdpcVehicleTypeId.Value = vdpc.VehicleTypeId;
            cmd.Parameters.Add(vdpcVehicleTypeId);

            SqlParameter vdpcPricingTypeId = new SqlParameter("@PricingTypeId", SqlDbType.Int);
            vdpcPricingTypeId.Value = vdpc.PricingTypeId;
            cmd.Parameters.Add(vdpcPricingTypeId);

            SqlParameter vdpcUnitPrice = new SqlParameter("@UnitPrice", SqlDbType.Float);
            vdpcUnitPrice.Value = vdpc.UnitPrice;
            cmd.Parameters.Add(vdpcUnitPrice);

            SqlParameter vdpcAmount = new SqlParameter("@Amount", SqlDbType.Float);
            vdpcAmount.Value = vdpc.Amount;
            cmd.Parameters.Add(vdpcAmount);

            SqlParameter flag = new SqlParameter("@flag", SqlDbType.VarChar);
            flag.Value = vdpc.flag;
            cmd.Parameters.Add(flag);

            SqlParameter src = new SqlParameter("@SrcId", SqlDbType.Int);
            src.Value = vdpc.srcid;
            cmd.Parameters.Add(src);

            SqlParameter dest = new SqlParameter("@DestId", SqlDbType.Int);
            dest.Value = vdpc.destid;
            cmd.Parameters.Add(dest);

            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "TaxiPrice successful....");
            }
             catch (Exception ex)
             {
                 traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "TaxiPrice...." + ex.Message.ToString());
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
    }
}
