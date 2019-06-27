using System;
using System.Collections.Generic;
using System.Configuration;
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
    public class allocatedriverController : ApiController
    {

        [HttpGet]
        [Route("api/allocatedriver/Getallocatedriver")]
        public DataTable Getallocatedriver(int VID)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getallocatedriver....");

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HVGetallocatedriver";
            cmd.Connection = conn;
            cmd.Parameters.Add("@VID", SqlDbType.Int).Value = VID;

            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(dt);

            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getallocatedriver successful....");
            StringBuilder str = new StringBuilder();
            str.Append("@VID:" + VID + ",");


            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getallocatedriver Input sent...." + str.ToString());

            if (dt.Rows.Count > 0)
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getallocatedriver Output...." + dt.Rows[0].ToString());
            else
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getallocatedriver Output....Assign Driver Details");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Getallocatedriver...." + ex.Message.ToString());
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
        
        [HttpPost]
        [Route("api/allocatedriver/AllocateDriver")]
        public DataTable drivers(allocatedriver A)
        {
          
            SqlCommand cmd = new SqlCommand();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "AllocateDriver....");
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSInsUpdallocatedriver";
                cmd.Connection = conn;

                SqlParameter f = new SqlParameter("@flag", SqlDbType.VarChar);
                f.Value = A.flag;
                cmd.Parameters.Add(f);

                SqlParameter i = new SqlParameter("@Id", SqlDbType.Int);
                i.Value = A.Id;
                cmd.Parameters.Add(i);

                SqlParameter dd = new SqlParameter("@CompanyId", SqlDbType.Int);
                dd.Value = A.CompanyId;
                cmd.Parameters.Add(dd);

                SqlParameter BookingNo = new SqlParameter("@BookingNo", SqlDbType.Int);
                BookingNo.Value = A.BookingNo;
                cmd.Parameters.Add(BookingNo);



                SqlParameter CustomerName = new SqlParameter("@CustomerName", SqlDbType.NVarChar, 255);
                CustomerName.Value = A.CustomerName;
                cmd.Parameters.Add(CustomerName);

                SqlParameter CusID = new SqlParameter("@CusID", SqlDbType.NVarChar, 255);
                CusID.Value = A.CusID;
                cmd.Parameters.Add(CusID);

                SqlParameter PhoneNo = new SqlParameter("@PhoneNo", SqlDbType.NVarChar, 255);
                PhoneNo.Value = A.PhoneNo;
                cmd.Parameters.Add(PhoneNo);

                SqlParameter AltPhoneNo = new SqlParameter("@AltPhoneNo", SqlDbType.NVarChar, 255);
                AltPhoneNo.Value = A.AltPhoneNo;
                cmd.Parameters.Add(AltPhoneNo);

                SqlParameter Address = new SqlParameter("@Address", SqlDbType.NVarChar, Max);
                Address.Value = A.Address;
                cmd.Parameters.Add(Address);

                SqlParameter PickupAddress = new SqlParameter("@PickupAddress", SqlDbType.NVarChar, Max);
                PickupAddress.Value = A.PickupAddress;
                cmd.Parameters.Add(PickupAddress);

                SqlParameter LandMark = new SqlParameter("@LandMark", SqlDbType.NVarChar, 255);
                LandMark.Value = A.LandMark;
                cmd.Parameters.Add(LandMark);

                SqlParameter PickupPlace = new SqlParameter("@PickupPlace", SqlDbType.NVarChar, 255);
                PickupPlace.Value = A.PickupPlace;
                cmd.Parameters.Add(PickupPlace);

                SqlParameter DropPlace = new SqlParameter("@DropPlace", SqlDbType.NVarChar, 255);
                DropPlace.Value = A.DropPlace;
                cmd.Parameters.Add(DropPlace);

                SqlParameter Package = new SqlParameter("@Package", SqlDbType.NVarChar, 255);
                Package.Value = A.Package;
                cmd.Parameters.Add(Package);

                SqlParameter VehicleType = new SqlParameter("@VehicleType", SqlDbType.NVarChar, 255);
                VehicleType.Value = A.VehicleType;
                cmd.Parameters.Add(VehicleType);

                SqlParameter NoofVehicle = new SqlParameter("@NoofVehicle", SqlDbType.Int);
                NoofVehicle.Value = A.NoofVehicle;
                cmd.Parameters.Add(NoofVehicle);

                SqlParameter VechID = new SqlParameter("@VechID", SqlDbType.Int);
                VechID.Value = A.VechID;
                cmd.Parameters.Add(VechID);

                SqlParameter RegistrationNo = new SqlParameter("@RegistrationNo", SqlDbType.NVarChar, 255);
                RegistrationNo.Value = A.RegistrationNo;
                cmd.Parameters.Add(RegistrationNo);

                SqlParameter DriverName = new SqlParameter("@DriverName", SqlDbType.NVarChar, 255);
                DriverName.Value = A.DriverName;
                cmd.Parameters.Add(DriverName);

                SqlParameter Did = new SqlParameter("@DriverId", SqlDbType.Int);
                Did.Value = A.DriverId;
                cmd.Parameters.Add(Did);

                SqlParameter PresentDriverLandMark = new SqlParameter("@PresentDriverLandMark", SqlDbType.NVarChar, 255);
                PresentDriverLandMark.Value = A.PresentDriverLandMark;
                cmd.Parameters.Add(PresentDriverLandMark);

                SqlParameter ExecutiveName = new SqlParameter("@ExecutiveName", SqlDbType.NVarChar, 255);
                ExecutiveName.Value = A.ExecutiveName;
                cmd.Parameters.Add(ExecutiveName);

                SqlParameter ed = new SqlParameter("@EffectiveDate", SqlDbType.Date);
                ed.Value = A.EffectiveDate;
                cmd.Parameters.Add(ed);

                SqlParameter de = new SqlParameter("@EffectiveTill", SqlDbType.Date);
                de.Value = A.EffectiveTill;
                cmd.Parameters.Add(de);

                SqlParameter d = new SqlParameter("@VehicleModelId", SqlDbType.Int);
                d.Value = A.ServiceTypeId;
                cmd.Parameters.Add(d);

                SqlParameter ds = new SqlParameter("@ServiceTypeId", SqlDbType.Int);
                ds.Value = A.ServiceTypeId;
                cmd.Parameters.Add(ds);

                SqlParameter dg = new SqlParameter("@VehicleGroupId", SqlDbType.Int);
                dg.Value = A.VehicleGroupId;
                cmd.Parameters.Add(dg);


                SqlParameter fleet = new SqlParameter("@fleetId", SqlDbType.Int);
                fleet.Value = A.fleetId;
                cmd.Parameters.Add(fleet);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getallocatedriver successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "AllocateDriver...." + ex.Message.ToString());
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
        public int Max { get; set; }

    }
}