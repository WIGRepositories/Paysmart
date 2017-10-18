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
        [Route("api/DriverMaster/GetVehicleApproval")]
        public DataTable GetVehicleApproval(String RegNo)
        {
            DataTable dt = new DataTable();

            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSGetVehicleApproval";
            cmd.Parameters.Add("@RegistrationNo", SqlDbType.VarChar).Value = RegNo;
            cmd.Connection = conn;
            DataSet ds = new DataSet();
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(ds);
            dt = ds.Tables[0];

            return dt;

        }


        [HttpGet]
        [Route("api/VehicleMaster/GetVehcileList")]
        public DataTable GetVehcileList()
        {
            DataTable dt = new DataTable();

            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSGetVehicleList";
            cmd.Connection = conn;

            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(dt);
            return dt;
        }

        [HttpGet]
        [Route("api/VehicleMaster/GetVehicleDetails")]
        public DataSet GetVehicleDetails(int VID)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataSet dt = new DataSet();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetVehicleDetails....");

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSgetvehicleDetails";
                cmd.Parameters.Add("@VID", SqlDbType.Int).Value = VID;
                cmd.Connection = conn;
                
                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(dt);
               
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

                SqlParameter cn = new SqlParameter("@ChasisNo", SqlDbType.VarChar, 50);
                cn.Value = v.ChasisNo;
                cmd.Parameters.Add(cn);

                SqlParameter en = new SqlParameter("@Engineno", SqlDbType.VarChar, 50);
                en.Value = v.Engineno;
                cmd.Parameters.Add(en);

                SqlParameter oid = new SqlParameter("@FleetOwnerId", SqlDbType.Int);
                oid.Value = v.FleetOwnerCode;
                cmd.Parameters.Add(oid);

                SqlParameter vt = new SqlParameter("@VehicleType", SqlDbType.VarChar);
                vt.Value = v.VehicleType;
                cmd.Parameters.Add(vt);

                SqlParameter vv = new SqlParameter("@VehicleModelId", SqlDbType.VarChar);
                vv.Value = v.VehicleModel;
                cmd.Parameters.Add(vv);

                SqlParameter vg = new SqlParameter("@VehicleGroupId", SqlDbType.VarChar);
                vg.Value = v.VehicleGroup;
                cmd.Parameters.Add(vg);

                SqlParameter wg = new SqlParameter("@ModelYear", SqlDbType.VarChar, 5);
                wg.Value = v.ModelYear;
                cmd.Parameters.Add(wg);

                SqlParameter ac = new SqlParameter("@HasAC", SqlDbType.Int);
                ac.Value = v.HasAC;
                cmd.Parameters.Add(ac);

                SqlParameter sid = new SqlParameter("@StatusId", SqlDbType.Int);
                sid.Value = v.StatusId;
                cmd.Parameters.Add(sid);

                SqlParameter isv = new SqlParameter("@IsVerified", SqlDbType.Int);
                isv.Value = v.IsVerified;
                cmd.Parameters.Add(isv);

                SqlParameter isDriverOwned = new SqlParameter("@isDriverOwned", SqlDbType.Int);
                isDriverOwned.Value = v.isDriverOwned;
                cmd.Parameters.Add(isDriverOwned);


                SqlParameter vcode = new SqlParameter("@VehicleCode ", SqlDbType.VarChar, 10);
                vcode.Value = v.VehicleCode;
                cmd.Parameters.Add(vcode);

                SqlParameter ctr = new SqlParameter("@Country", SqlDbType.VarChar, 10);
                ctr.Value = v.CountryId;
                cmd.Parameters.Add(ctr);

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
            LogTraceWriter traceWriter = new LogTraceWriter();
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


                SqlParameter doc = new SqlParameter("@DocumentNo", SqlDbType.VarChar, 50);
                doc.Value = vd.DocumentNo;
                cmd.Parameters.Add(doc);

                SqlParameter doc2 = new SqlParameter("@DocumentNo2", SqlDbType.VarChar, 50);
                doc2.Value = vd.DocumentNo2;
                cmd.Parameters.Add(doc2);

                SqlParameter ver = new SqlParameter("@IsVerified", SqlDbType.Int);
                ver.Value = vd.isVerified;
                cmd.Parameters.Add(ver);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveVehicleDoc successful....");
            }
            catch(Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "SaveVehicleDoc....failed" + ex.Message.ToString());
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

        [HttpPost]
        [Route("api/DriverMaster/SaveVehicleApprovals")]
        public DataTable SaveVehicleApprovals(Approvals a)
        {
            //connect to database
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSinsupdVehicleApprovals";
                cmd.Connection = conn;


                SqlParameter LocationId = new SqlParameter("@Change", SqlDbType.VarChar);
                LocationId.Value = a.change;
                cmd.Parameters.Add(LocationId);

                SqlParameter parentid = new SqlParameter("@IsApproved", SqlDbType.Int);
                parentid.Value = a.IsApproved;
                cmd.Parameters.Add(parentid);

                SqlParameter flag = new SqlParameter("@RegistrationNo", SqlDbType.VarChar);
                flag.Value = a.RegistrationNo;
                cmd.Parameters.Add(flag);


                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);


                return dt;
            }
            catch (Exception ex)
            {
                if (conn != null && conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
                throw ex;
            }
        }

    }
}
