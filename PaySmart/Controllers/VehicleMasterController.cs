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
namespace Paysmart.Controllers
{
    public class VehicleMasterController : ApiController
    {
        [HttpGet]

        [Route("api/VehicleMaster/GetVehcileMaster")]
        public DataTable GetVehcileMaster(int VID)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetVehcileMaster....");

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSgetvehilcetypes";
                cmd.Parameters.Add("@VID", SqlDbType.Int).Value = VID;
                cmd.Connection = conn;
                DataSet ds = new DataSet();
                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(ds);
                dt = ds.Tables[0];
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetVehcileMaster successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetVehcileMaster...." + ex.Message.ToString());
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

        [HttpGet]

        [Route("api/VehicleMaster/GetVehicleDetails")]
        public DataTable GetVehicleDetails(int VID)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetVehicleDetails....");

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSgetvehicleDetails";
                cmd.Parameters.Add("@VID", SqlDbType.Int).Value = VID;
                cmd.Connection = conn;
                DataSet ds = new DataSet();
                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(ds);
                dt = ds.Tables[0];
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetVehicleDetails successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetVehicleDetails...." + ex.Message.ToString());
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

        [HttpPost]
        [Route("api/VehicleMaster/VehicleCreation")]
        public DataTable VehicleCreation(vehicledetails v)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Vehicles....");

                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HVInsUpdVehicles";
                cmd.Connection = conn;


                SqlParameter se = new SqlParameter("@flag", SqlDbType.VarChar);
                se.Value = v.flag;
                cmd.Parameters.Add(se);


                SqlParameter s = new SqlParameter("@Id", SqlDbType.Int);
                s.Value = v.Id;
                cmd.Parameters.Add(s);

                SqlParameter i = new SqlParameter("@VID", SqlDbType.Int);
                i.Value = v.VID;
                cmd.Parameters.Add(i);

                SqlParameter cd = new SqlParameter("@CompanyId", SqlDbType.Int);
                cd.Value = v.CompanyId;
                cmd.Parameters.Add(cd);

                SqlParameter n = new SqlParameter("@RegistrationNo", SqlDbType.VarChar, 50);
                n.Value = v.RegistrationNo;
                cmd.Parameters.Add(n);

                SqlParameter r = new SqlParameter("@Type", SqlDbType.VarChar, 50);
                r.Value = v.Type;
                cmd.Parameters.Add(r);

                SqlParameter a = new SqlParameter("@OwnerName", SqlDbType.VarChar, 50);
                a.Value = v.OwnerName;
                cmd.Parameters.Add(a);

                //SqlParameter sn = new SqlParameter("@ChasisNo", SqlDbType.VarChar, 50);
                //sn.Value = v.ChasisNo;
                //cmd.Parameters.Add(sn);

                //SqlParameter f = new SqlParameter("@Engineno", SqlDbType.VarChar, 50);
                //f.Value = v.Engineno;
                //cmd.Parameters.Add(f);


                //SqlParameter k = new SqlParameter("@RoadTaxDate", System.Data.SqlDbType.Date);
                //k.Value = v.RoadTaxDate;
                //cmd.Parameters.Add(k);

                //SqlParameter y = new SqlParameter("@InsuranceNo", SqlDbType.VarChar, 50);
                //y.Value = v.InsuranceNo;
                //cmd.Parameters.Add(y);

                //SqlParameter r1 = new SqlParameter("@InsDate", System.Data.SqlDbType.Date);
                //r1.Value = v.InsDate;
                //cmd.Parameters.Add(r1);

                //SqlParameter t = new SqlParameter("@PolutionNo", SqlDbType.VarChar, 50);
                //t.Value = v.PolutionNo;
                //cmd.Parameters.Add(t);

                //SqlParameter u = new SqlParameter("@PolExpDate", System.Data.SqlDbType.Date);
                //u.Value = v.PolExpDate;
                //cmd.Parameters.Add(u);

                //SqlParameter o = new SqlParameter("@RCBookNo", SqlDbType.VarChar, 50);
                //o.Value = v.RCBookNo;
                //cmd.Parameters.Add(o);

                //SqlParameter p = new SqlParameter("@RCExpDate", System.Data.SqlDbType.Date);
                //p.Value = v.RCExpDate;
                //cmd.Parameters.Add(p);

                SqlParameter jw = new SqlParameter("@CompanyVechile", SqlDbType.Int);
                jw.Value = v.CompanyVechile;
                cmd.Parameters.Add(jw);

                SqlParameter wj = new SqlParameter("@OwnerPhoneNo", SqlDbType.VarChar, 50);
                wj.Value = v.OwnerPhoneNo;
                cmd.Parameters.Add(wj);

                SqlParameter wh = new SqlParameter("@HomeLandmark", SqlDbType.VarChar, 50);
                wh.Value = v.HomeLandmark;
                cmd.Parameters.Add(wh);

                SqlParameter wg = new SqlParameter("@ModelYear", System.Data.SqlDbType.Date);
                wg.Value = v.ModelYear;
                cmd.Parameters.Add(wg);

                SqlParameter wf = new SqlParameter("@DayOnly", SqlDbType.VarChar, 50);
                wf.Value = v.DayOnly;
                cmd.Parameters.Add(wf);

                SqlParameter ca = new SqlParameter("@VechMobileNo", SqlDbType.VarChar, 50);
                ca.Value = v.VechMobileNo;
                cmd.Parameters.Add(ca);

                SqlParameter ws = new SqlParameter("@EntryDate", System.Data.SqlDbType.Date);
                ws.Value = v.EntryDate;
                cmd.Parameters.Add(ws);

                SqlParameter wsd = new SqlParameter("@NewEntry", SqlDbType.VarChar, 50);
                wsd.Value = v.NewEntry;
                cmd.Parameters.Add(wsd);

                SqlParameter vv = new SqlParameter("@VehicleModelId", SqlDbType.Int);
                vv.Value = v.VehicleModelId;
                cmd.Parameters.Add(vv);

                SqlParameter vf = new SqlParameter("@ServiceTypeId", SqlDbType.Int);
                vf.Value = v.ServiceTypeId;
                cmd.Parameters.Add(vf);

                SqlParameter vg = new SqlParameter("@VehicleGroupId", SqlDbType.Int);
                vg.Value = v.VehicleGroupId;
                cmd.Parameters.Add(vg);

                SqlParameter photo = new SqlParameter("@Photo", SqlDbType.VarChar);
                photo.Value = v.Photo;
                cmd.Parameters.Add(photo);

                SqlParameter status = new SqlParameter("@Status", SqlDbType.VarChar );
                status.Value = v.Status;
                cmd.Parameters.Add(status);

                SqlParameter foc = new SqlParameter("@FleetOwnerCode", SqlDbType.VarChar);
                foc.Value = v.FleetOwnerCode;
                cmd.Parameters.Add(foc);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Vehicles successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Vehicles...." + ex.Message.ToString());
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


        [HttpPost]
        [Route("api/VehicleMaster/SaveVehicleDoc")]
        public int SaveVehicleDoc(VehicleDocuments vd)
        {
            //connect to database
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            int status = 1;
            try
            {
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSInsUpdDelVehicleDocs";
                cmd.Connection = conn;

                SqlParameter did = new SqlParameter("@Id", SqlDbType.Int);
                did.Value = vd.Id;
                cmd.Parameters.Add(did);

                SqlParameter vId = new SqlParameter("@VehicleId", SqlDbType.Int);
                vId.Value = vd.VehicleId;
                cmd.Parameters.Add(vId);

                SqlParameter Gid = new SqlParameter("@FileName", SqlDbType.VarChar, 100);
                Gid.Value = vd.FileName;
                cmd.Parameters.Add(Gid);

                SqlParameter type = new SqlParameter("@DocTypeId", SqlDbType.Int);
                type.Value = vd.DocTypeId;
                cmd.Parameters.Add(type);

                SqlParameter exp = new SqlParameter("@ExpiryDate", SqlDbType.Date);
                exp.Value = vd.ExpiryDate;
                cmd.Parameters.Add(exp);

                SqlParameter update = new SqlParameter("@UpdatedById", SqlDbType.Int);
                update.Value = vd.UpdatedById;
                cmd.Parameters.Add(update);

                SqlParameter due = new SqlParameter("@DueDate", SqlDbType.Date);
                due.Value = vd.DueDate;
                cmd.Parameters.Add(due);

                SqlParameter cont = new SqlParameter("@FileContent", SqlDbType.VarChar);
                cont.Value = vd.FileContent;
                cmd.Parameters.Add(cont);

                SqlParameter flag = new SqlParameter("@change", SqlDbType.VarChar);
                flag.Value = vd.change;
                cmd.Parameters.Add(flag);

                SqlParameter luid = new SqlParameter("@loggedinUserId", SqlDbType.Int);
                luid.Value = vd.loggedinUserId;
                cmd.Parameters.Add(luid);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            catch(Exception ex)
            {
                throw ex;
            }
            return status;
        }

        [HttpPost]
        [Route("api/VehicleMaster/TrackVehicle")]

        public DataTable TrackVehicle(vehicledetails l)
        {

            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable currTripList = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "TrackVehicle....");

                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSTrackVehicleHistory";

                cmd.Connection = conn;
               

                SqlParameter MobileNumber = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 50);
                MobileNumber.Value = l.PMobNo;
                cmd.Parameters.Add(MobileNumber);

                SqlParameter Lat = new SqlParameter("@Latitude", SqlDbType.Float);
                Lat.Value = l.latitude;
                cmd.Parameters.Add(Lat);

                SqlParameter Lng = new SqlParameter("@Longitude", SqlDbType.Float);
                Lng.Value = l.longitude;
                cmd.Parameters.Add(Lng);


                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(currTripList);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "TrackVehicle successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "TrackVehicle...." + ex.Message.ToString());
                throw ex;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return currTripList;
            //return (dt);
        }

        public SqlParameter id { get; set; }

        public SqlParameter did { get; set; }
    }
}
