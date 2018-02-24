using Paysmart.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;
using System.Web.Http.Tracing;

namespace Paysmart.Controllers
{
    public class CommonController : ApiController
    {
        [HttpPost]
        [Route("api/Common/ConfigData")]
        public DataSet ConfigData(ConfigData vc)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "ConfigData....");
            DataSet ds = new DataSet();

            //connect to database
            SqlConnection conn = new SqlConnection();
            try
            {
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "GetConfigurationData";
                cmd.Connection = conn;

                SqlParameter gsaa = new SqlParameter();
                gsaa.ParameterName = "@includeStatus";
                gsaa.SqlDbType = SqlDbType.Int;
                gsaa.Value = vc.includeStatus;
                cmd.Parameters.Add(gsaa);

                SqlParameter gsab = new SqlParameter();
                gsab.ParameterName = "@includeCategories";
                gsab.SqlDbType = SqlDbType.Int;
                gsab.Value = vc.includeCategories;
                cmd.Parameters.Add(gsab);

                SqlParameter gsac = new SqlParameter();
                gsac.ParameterName = "@includeLicenseCategories";
                gsac.SqlDbType = SqlDbType.Int;
                gsac.Value = vc.includeLicenseCategories;
                cmd.Parameters.Add(gsac);

                SqlParameter nvr = new SqlParameter();
                nvr.ParameterName = "@includeVehicleGroup";
                nvr.SqlDbType = SqlDbType.Int;
                nvr.Value = vc.includeVehicleGroup;
                cmd.Parameters.Add(nvr);

                SqlParameter nvl = new SqlParameter();
                nvl.ParameterName = "@includeGender";
                nvl.SqlDbType = SqlDbType.Int;
                nvl.Value = vc.includeGender;
                cmd.Parameters.Add(nvl);

                SqlParameter nst = new SqlParameter();
                nst.ParameterName = "@includeFrequency";
                nst.SqlDbType = SqlDbType.Int;
                nst.Value = vc.includeFrequency;
                cmd.Parameters.Add(nst);

                SqlParameter ncn = new SqlParameter();
                ncn.ParameterName = "@includePricingType";
                ncn.SqlDbType = SqlDbType.Int;
                ncn.Value = vc.includePricingType;
                cmd.Parameters.Add(ncn);

                SqlParameter gsk = new SqlParameter();
                gsk.ParameterName = "@includeTransactionType";
                gsk.SqlDbType = SqlDbType.Int;
                gsk.Value = vc.includeTransactionType;
                cmd.Parameters.Add(gsk);

                //@needHireVehicle
                SqlParameter nhv = new SqlParameter();
                nhv.ParameterName = "@includeApplicability";
                nhv.SqlDbType = SqlDbType.Int;
                nhv.Value = vc.includeApplicability;
                cmd.Parameters.Add(nhv);

                //@needbtpos
                SqlParameter nbtpos = new SqlParameter();
                nbtpos.ParameterName = "@includeFeeCategory";
                nbtpos.SqlDbType = SqlDbType.Int;
                nbtpos.Value = vc.includeFeeCategory;
                cmd.Parameters.Add(nbtpos);

                //@cmpId
                SqlParameter cmpId = new SqlParameter();
                cmpId.ParameterName = "@includeTransChargeType";
                cmpId.SqlDbType = SqlDbType.Int;
                cmpId.Value = vc.includeTransChargeType;
                cmd.Parameters.Add(cmpId);

                //@fleetownerId
                SqlParameter foid = new SqlParameter();
                foid.ParameterName = "@includeVehicleType";
                foid.SqlDbType = SqlDbType.Int;
                foid.Value = vc.includeVehicleType;
                cmd.Parameters.Add(foid);

                //needfleetownerroutes
                SqlParameter forid = new SqlParameter();
                forid.ParameterName = "@includeVehicleModel";
                forid.SqlDbType = SqlDbType.Int;
                forid.Value = vc.includeVehicleModel;
                cmd.Parameters.Add(forid);

                SqlParameter vmid = new SqlParameter();
                vmid.ParameterName = "@includeVehicleMake";
                vmid.SqlDbType = SqlDbType.Int;
                vmid.Value = vc.includeVehicleMake;
                cmd.Parameters.Add(vmid);

                SqlParameter vgid = new SqlParameter();
                vgid.ParameterName = "@includeDocumentType";
                vgid.SqlDbType = SqlDbType.Int;
                vgid.Value = vc.includeDocumentType;
                cmd.Parameters.Add(vgid);

                SqlParameter vdid = new SqlParameter();
                vdid.ParameterName = "@includePaymentType";
                vdid.SqlDbType = SqlDbType.Int;
                vdid.Value = vc.includePaymentType;
                cmd.Parameters.Add(vdid);

                SqlParameter vmid1 = new SqlParameter();
                vmid1.ParameterName = "@includeMiscellaneousTypes";
                vmid1.SqlDbType = SqlDbType.Int;
                vmid1.Value = vc.includeMiscellaneousTypes;
                cmd.Parameters.Add(vmid1);

                SqlParameter vgid1 = new SqlParameter();
                vgid1.ParameterName = "@includeCardCategories";
                vgid1.SqlDbType = SqlDbType.Int;
                vgid1.Value = vc.includeCardCategories;
                cmd.Parameters.Add(vgid1);

                SqlParameter vdid1 = new SqlParameter();
                vdid1.ParameterName = "@includeCardTypes";
                vdid1.SqlDbType = SqlDbType.Int;
                vdid1.Value = vc.includeCardTypes;
                cmd.Parameters.Add(vdid1);


                SqlParameter vmid11 = new SqlParameter();
                vmid11.ParameterName = "@includeVehicleLayoutType";
                vmid11.SqlDbType = SqlDbType.Int;
                vmid11.Value = vc.includeVehicleLayoutType;
                cmd.Parameters.Add(vmid11);

                SqlParameter vgid11 = new SqlParameter();
                vgid11.ParameterName = "@includeLicenseFeatures";
                vgid11.SqlDbType = SqlDbType.Int;
                vgid11.Value = vc.includeLicenseFeatures;
                cmd.Parameters.Add(vgid11);

                SqlParameter vdid11 = new SqlParameter();
                vdid11.ParameterName = "@includeCardModels";
                vdid11.SqlDbType = SqlDbType.Int;
                vdid11.Value = vc.includeCardModels;
                cmd.Parameters.Add(vdid11);


                SqlParameter vmid2 = new SqlParameter();
                vmid2.ParameterName = "@includeCards";
                vmid2.SqlDbType = SqlDbType.Int;
                vmid2.Value = vc.includeCards;
                cmd.Parameters.Add(vmid2);

                SqlParameter vgid2 = new SqlParameter();
                vgid2.ParameterName = "@includeCountry";
                vgid2.SqlDbType = SqlDbType.Int;
                vgid2.Value = vc.includeCountry;
                cmd.Parameters.Add(vgid2);

                SqlParameter vdid2 = new SqlParameter();
                vdid2.ParameterName = "@includeActiveCountry";
                vdid2.SqlDbType = SqlDbType.Int;
                vdid2.Value = vc.includeActiveCountry;
                cmd.Parameters.Add(vdid2);


                SqlParameter vdid3 = new SqlParameter();
                vdid3.ParameterName = "@includeFleetOwner";
                vdid3.SqlDbType = SqlDbType.Int;
                vdid3.Value = vc.includeFleetOwner;
                cmd.Parameters.Add(vdid3);

                SqlParameter vdid4 = new SqlParameter();
                vdid4.ParameterName = "@includeUserType";
                vdid4.SqlDbType = SqlDbType.Int;
                vdid4.Value = vc.includeUserType;
                cmd.Parameters.Add(vdid4);


                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(ds);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "ConfigData completed.");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "ConfigData...." + ex.Message.ToString());
                throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.OK, ex.Message));
            }

            return ds;

        }

        [HttpGet]
        [Route("api/Common/PendingDocs")]
        public DataSet PendingDocs(int userid)
        {

            LogTraceWriter traceWriter = new LogTraceWriter();
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "PendingDocs....");
            DataSet ds = new DataSet();

            //connect to database
            SqlConnection conn = new SqlConnection();
            try
            {
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSGetPendingDocs";
                cmd.Connection = conn;

                SqlParameter gsaa = new SqlParameter("@userId", SqlDbType.Int);
                gsaa.Value = userid;
                cmd.Parameters.Add(gsaa);

                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(ds);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "PendingDocs completed.");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "PendingDocs...." + ex.Message.ToString());
                throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.OK, ex.Message));
            }

            return ds;
        }

        [HttpGet]
        [Route("api/Common/PendingVehicleDocs")]
        public DataSet PendingVehicleDocs(int VId)
        {

            LogTraceWriter traceWriter = new LogTraceWriter();
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "PendingVehicleDocs....");
            DataSet ds = new DataSet();

            //connect to database
            SqlConnection conn = new SqlConnection();
            try
            {
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSGetPendingVehicleDocs";
                cmd.Connection = conn;

                SqlParameter gsaa = new SqlParameter("@VId", SqlDbType.Int);
                gsaa.Value = VId;
                cmd.Parameters.Add(gsaa);

                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(ds);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "PendingVehicleDocs completed.");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "PendingVehicleDocs...." + ex.Message.ToString());
                throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.OK, ex.Message));
            }

            return ds;
        }

        [HttpGet]
        [Route("api/Common/CurrentState")]
        public DataTable CurrentState(int UserId, int UserTypeId)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "CurrentState....");
                StringBuilder str = new StringBuilder();
                str.Append("@UserId" + UserId + ",");
                str.Append("@UserTypeId" + UserTypeId + ",");
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "CurrentState Input sent...." + str.ToString());
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSGetCurrentDriverStatus";
                cmd.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
                cmd.Parameters.Add("@UserTypeId", SqlDbType.Int).Value = UserTypeId;
                cmd.Connection = conn;
                DataSet ds = new DataSet();
                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(dt);

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "CurrentState successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "CurrentState...." + ex.Message.ToString());
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


        [HttpGet]
        [Route("api/Sostemplates/Gettemplates")]
        public DataTable Gettemplates(int Usertypeid)
        {
            DataTable Tbl = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Gettemplates credentials....");
            StringBuilder str = new StringBuilder();
            str.Append("@usertypeid" + Usertypeid + ",");
           
            //connect to database
            SqlConnection conn = new SqlConnection();
            try
            {
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "GetSostemplates";
                cmd.Connection = conn;

                cmd.Parameters.Add("@usertypeid", SqlDbType.Int).Value = Usertypeid;


                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(Tbl);

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Gettemplates Credentials completed.");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Gettemplates...." + ex.Message.ToString());
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
            // int found = 0;
            return Tbl;

        }


    }
}

