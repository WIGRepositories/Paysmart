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
using System.Net.Mail;
using System.Text;
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
            StringBuilder str = new StringBuilder();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetVehcileMaster....");
                str.Append("VID:" + VID + ",");
                
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());


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

        [HttpGet]
        [Route("api/VehicleMaster/GetVehicleApproval")]
        public DataTable GetVehicleApproval(String RegNo)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();

          try
            {
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetVehicleApproval....");
            str.Append("RegistrationNo:" + RegNo + ",");
           

            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

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

            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetVehicleApproval successful....");
            }
          catch (Exception ex)
          {
              traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetVehicleApproval...." + ex.Message.ToString());
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


        [HttpGet]
        [Route("api/VehicleMaster/GetVehcileList")]
        public DataTable GetVehcileList()
        {
            DataTable dt = new DataTable();

            SqlConnection conn = new SqlConnection();
            LogTraceWriter traceWriter = new LogTraceWriter();

            try
            {

            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetVehcileList....");
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSGetVehicleList";
            cmd.Connection = conn;

            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(dt);

            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetVehcileList successful....");
            }
          catch (Exception ex)
          {
              traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetVehcileList...." + ex.Message.ToString());
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

        [HttpGet]
        [Route("api/VehicleMaster/GetVehicleDetails")]
        public DataSet GetVehicleDetails(int VID)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            DataSet dt = new DataSet();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetVehicleDetails....");

                str.Append("VID:" + VID + ",");


                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());


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
                //throw ex;
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.OK, ex.Message));

                DataTable dt1 = new DataTable();
                dt1.Columns.Add("Code");
                dt1.Columns.Add("description");
                DataRow dr = dt1.NewRow();
                dr[0] = "ERR001";
                dr[1] = ex.Message;
                dt1.Rows.Add(dr);

                dt.Tables.Add(dt1);
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
            StringBuilder str = new StringBuilder();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Vehicles....");

                str.Append("RegistrationNo:" + v.RegistrationNo + ",");
                str.Append("VehicleGroupId:" + v.VehicleGroupId + ",");
                str.Append("CountryId:" + v.CountryId + ",");
                str.Append("FleetOwnerId:" + v.FleetOwnerCode + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

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

                SqlParameter vt = new SqlParameter("@VehicleTypeId", SqlDbType.Int);
                vt.Value = v.VehicleTypeId;
                cmd.Parameters.Add(vt);

                SqlParameter vv = new SqlParameter("@VehicleModelId", SqlDbType.Int);
                vv.Value = v.VehicleModelId;
                cmd.Parameters.Add(vv);

                SqlParameter vg = new SqlParameter("@VehicleGroupId", SqlDbType.Int);
                vg.Value = v.VehicleGroupId;
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

                SqlParameter ctr = new SqlParameter("@CountryId", SqlDbType.Int);
                ctr.Value = v.CountryId;
                cmd.Parameters.Add(ctr);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Vehicles successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Vehicles...." + ex.Message.ToString());
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
        [Route("api/VehicleMaster/SaveVehicleDoc")]
        public int SaveVehicleDoc(VehicleDocuments vd)
        {
            //connect to database
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            StringBuilder str = new StringBuilder();
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

                str.Append("DocTypeId:" + vd.DocTypeId + ",");
                str.Append("Id:" + vd.Id + ",");
                str.Append("VehicleId:" + vd.VehicleId + ",");
                str.Append("change:" + vd.change);
                str.Append("filename:" + vd.FileName);
                str.Append(Environment.NewLine);

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveVehicleDoc Input sent...." + str.ToString());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveVehicleDoc successful....");
            }
            catch(Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "SaveVehicleDoc....failed" + ex.Message.ToString());
                //throw ex;
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                dt.Columns.Add("Code");
                dt.Columns.Add("description");
                DataRow dr = dt.NewRow();
                dr[0] = "ERR001";
                dr[1] = ex.Message;
                dt.Rows.Add(dr);
            }
            return status;
        }

        [HttpPost]
        [Route("api/VehicleMaster/TrackVehicle")]

        public DataTable TrackVehicle(vehicledetails l)
        {
           // int Status = 1;
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable currTripList = new DataTable();
            StringBuilder str = new StringBuilder();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "TrackVehicle....");

                str.Append("Mobilenumber:" + l.PMobNo + ",");
                str.Append("Latitude:" + l.latitude + ",");
                str.Append("Longitude:" + l.longitude + ",");
                

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());
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
                

                if (currTripList.Rows.Count > 0)
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "TrackVehicle Output...." + currTripList.Rows[0]["BNo"].ToString());
                else
                    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "TrackVehicle Output....No bookings found");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "TrackVehicle...." + ex.Message.ToString());
                //throw ex;
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                currTripList.Columns.Add("Code");
                currTripList.Columns.Add("description");
                DataRow dr = currTripList.NewRow();
                dr[0] = "ERR001";
                dr[1] = ex.Message;
                currTripList.Rows.Add(dr);
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }

            return currTripList;
        }

        [HttpPost]
        [Route("api/VehicleMaster/SaveVehicleApprovals")]
        public DataTable SaveVehicleApprovals(Approvals a)
        {
            //connect to database
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            StringBuilder str = new StringBuilder();
            LogTraceWriter traceWriter = new LogTraceWriter();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveVehicleApprovals....");
                str.Append("RegistrationNo:" + a.RegistrationNo + ",");
                str.Append("IsApproved:" + a.IsApproved + ",");
                


                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());
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
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveVehicleApprovals successful....");

                #region Mobile OTP
                string eotp = dt.Rows[0]["VehicleCode"].ToString();
                if (eotp != null)
                {
                    try
                    {
                        MailMessage mail = new MailMessage();
                        string emailserver = System.Configuration.ConfigurationManager.AppSettings["emailserver"].ToString();

                        string username = System.Configuration.ConfigurationManager.AppSettings["username"].ToString();
                        string pwd = System.Configuration.ConfigurationManager.AppSettings["password"].ToString();
                        string fromaddress = System.Configuration.ConfigurationManager.AppSettings["fromaddress"].ToString();
                        string port = System.Configuration.ConfigurationManager.AppSettings["port"].ToString();

                        SmtpClient SmtpServer = new SmtpClient(emailserver);

                        mail.From = new MailAddress(fromaddress);
                        mail.To.Add(a.Email);
                        mail.Subject = "Vehicle Registration - Email OTP";
                        mail.IsBodyHtml = true;

                        string verifcodeMail = @"<table>
                                                        <tr>
                                                            <td>
                                                                <h2>Thank you for registering with PaySmart APP</h2>
                                                                <table width=\""760\"" align=\""center\"">
                                                                    <tbody style='background-color:#F0F8FF;'>
                                                                        <tr>
                                                                            <td style=\""font-family:'Zurich BT',Arial,Helvetica,sans-serif;font-size:15px;text-align:left;line-height:normal;background-color:#F0F8FF;\"" >
<div style='padding:10px;border:#0000FF solid 2px;'>    <br /><br />
                                                                             
                                                       Your Vehicle is Approved:<h3>" + eotp + @" </h3>

                                                        If you didn't make this request, <a href='http://154.120.237.198:52800'>click here</a> to cancel.

                                                                                <br/>
                                                                                <br/>             
                                                                       
                                                                                Warm regards,<br>
                                                                                PAYSMART Customer Service Team<br/><br />
</div>
                                                                            </td>
                                                                        </tr>

                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>

                                                    </table>";


                        mail.Body = verifcodeMail;
                        //SmtpServer.Port = 465;
                        //SmtpServer.Port = 587;
                        SmtpServer.Port = Convert.ToInt32(port);
                        SmtpServer.UseDefaultCredentials = false;

                        SmtpServer.Credentials = new System.Net.NetworkCredential(username, pwd);
                        SmtpServer.EnableSsl = true;
                        //SmtpServer.TargetName = "STARTTLS/smtp.gmail.com";
                        SmtpServer.Send(mail);

                    }
                    catch (Exception ex)
                    {
                        //throw ex;
                        throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                    }
                }
                #endregion Mobile OTP
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "SaveVehicleApprovals...." + ex.Message.ToString());
                if (conn != null && conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
                //throw ex;
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                dt.Columns.Add("Code");
                dt.Columns.Add("description");
                DataRow dr = dt.NewRow();
                dr[0] = "ERR001";
                dr[1] = ex.Message;
                dt.Rows.Add(dr);
            }
            return dt;
        }

    }
}
