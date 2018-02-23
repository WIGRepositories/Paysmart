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
    public class DriverMasterController : ApiController
    {
        [HttpGet]
        [Route("api/DriverMaster/Master")]
        public DataTable Master(int DId)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Master....");
                StringBuilder str = new StringBuilder();
                str.Append("@DId" + DId + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Master Input sent...." + str.ToString());

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HVgetdrivermaster";
                cmd.Parameters.Add("@DId", SqlDbType.Int).Value = DId;
                cmd.Connection = conn;
                DataSet ds = new DataSet();
                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(ds);
                dt = ds.Tables[0];

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Master successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Master...." + ex.Message.ToString());
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
        [HttpGet]
        [Route("api/DriverMaster/GetMaster")]
        public DataTable GetMaster(int DId)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetMaster....");
            StringBuilder str = new StringBuilder();
            str.Append("@DId" + DId + ",");

            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetMaster Input sent...." + str.ToString());
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSgetdrivermaster";
            cmd.Parameters.Add("@DId", SqlDbType.Int).Value = DId;
            cmd.Connection = conn;
            DataSet ds = new DataSet();
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(ds);
            dt = ds.Tables[0];

            return dt;

        }


        [HttpGet]
        [Route("api/DriverMaster/GetDriverApproval")]
        public DataTable GetDriverApproval(String MobileNo)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetDriverApproval....");
            StringBuilder str = new StringBuilder();
            str.Append("@MobileNumber" + MobileNo + ",");

            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetDriverApproval Input sent...." + str.ToString());

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSGetDriverApproval";
            cmd.Parameters.Add("@MobileNumber", SqlDbType.VarChar).Value = MobileNo;
            cmd.Connection = conn;
            DataSet ds = new DataSet();
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(ds);
            dt = ds.Tables[0];

            return dt;

        }



        [HttpGet]
        [Route("api/DriverMaster/GetDriverDetails")]
        public DataSet GetDriverDetails(int DID)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataSet dt = new DataSet();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetDriverDetails....");
                StringBuilder str = new StringBuilder();
                str.Append("@DID" + DID + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetDriverDetails Input sent...." + str.ToString());
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HVgetDriverDetails";
                cmd.Parameters.Add("@DID", SqlDbType.Int).Value = DID;
                cmd.Connection = conn;

                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(dt);

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetDriverDetails successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetDriverDetails...." + ex.Message.ToString());
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
        [Route("api/DriverMaster/Driver")]
        public DataTable Driver(driverdetails d)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Driver....");
                StringBuilder str = new StringBuilder();
                str.Append("@CompanyId" + d.Company + ",");
                str.Append("@NAme" + d.Name + ",");
                str.Append("@PAddress" + d.PermanentAddress + ",");
                str.Append("@PMobNo" + d.Mobilenumber + ",");
                str.Append("@DriverCode" + d.drivercode + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Driver Input sent...." + str.ToString());
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HVInsUpddrivers";
                cmd.Connection = conn;


                SqlParameter ff = new SqlParameter("@flag", SqlDbType.VarChar);
                ff.Value = d.flag;
                cmd.Parameters.Add(ff);

                SqlParameter i = new SqlParameter("@DId", SqlDbType.Int);
                i.Value = d.DId;
                cmd.Parameters.Add(i);

                SqlParameter di = new SqlParameter("@CompanyId", SqlDbType.VarChar,50);
                di.Value = d.Company;
                cmd.Parameters.Add(di);

                SqlParameter n = new SqlParameter("@NAme", SqlDbType.VarChar, 50);
                n.Value = d.Name;
                cmd.Parameters.Add(n);

                SqlParameter r = new SqlParameter("@Address", SqlDbType.VarChar, 50);
                r.Value = d.Address;
                cmd.Parameters.Add(r);

                SqlParameter f = new SqlParameter("@PAddress", SqlDbType.VarChar, 50);
                f.Value = d.PermanentAddress;
                cmd.Parameters.Add(f);

                SqlParameter s = new SqlParameter("@Pin", SqlDbType.VarChar, 50);
                s.Value = d.Pin;
                cmd.Parameters.Add(s);

                SqlParameter g = new SqlParameter("@PPin", SqlDbType.VarChar, 50);
                g.Value = d.PermanentPin;
                cmd.Parameters.Add(g); 

                SqlParameter j = new SqlParameter("@PMobNo", SqlDbType.VarChar, 255);
                j.Value = d.Mobilenumber;
                cmd.Parameters.Add(j);

                SqlParameter fr = new SqlParameter("@FirstName", SqlDbType.VarChar,50);
                fr.Value = d.FirstName;
                cmd.Parameters.Add(fr);

                SqlParameter lk = new SqlParameter("@LastName", SqlDbType.VarChar,50);
                lk.Value = d.LastName;
                cmd.Parameters.Add(lk);              


                SqlParameter ed = new SqlParameter("@EmailId", SqlDbType.VarChar,50);
                ed.Value = d.EmailId;
                cmd.Parameters.Add(ed);

                SqlParameter dc = new SqlParameter("@DriverCode", SqlDbType.VarChar);
                dc.Value = d.drivercode;
                cmd.Parameters.Add(dc);

                SqlParameter pr = new SqlParameter("@Photo", SqlDbType.VarChar,-1);
                pr.Value = d.Photo;
                cmd.Parameters.Add(pr);

                SqlParameter cs = new SqlParameter("@CurrentStateId", SqlDbType.Int);
                cs.Value = d.CurrentStateId;
                cmd.Parameters.Add(cs);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Driver successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Driver...." + ex.Message.ToString());
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                dt.Columns.Add("Code");
                dt.Columns.Add("description");
                DataRow dr = dt.NewRow();
                dr[0] = "SCC001";
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
        [Route("api/DriverMaster/SaveDriverDocuments")]
        public int SaveDriverDoc(DriverDocuments dd)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            int status = 1;
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveDriverDocuments....");

                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSInsUpdDelDriverDocs";
                cmd.Connection = conn;
                SqlParameter did = new SqlParameter("@Id", SqlDbType.Int);
                did.Value = dd.Id;
                cmd.Parameters.Add(did);

                SqlParameter drId = new SqlParameter("@DriverId", SqlDbType.Int);
                drId.Value = dd.DriverId;
                cmd.Parameters.Add(drId);

                SqlParameter Gid = new SqlParameter("@FileName", SqlDbType.VarChar, 100);
                Gid.Value = dd.FileName;
                cmd.Parameters.Add(Gid);

                SqlParameter type = new SqlParameter("@DocTypeId", SqlDbType.Int);
                type.Value = dd.DocTypeId;
                cmd.Parameters.Add(type);

                SqlParameter exp = new SqlParameter("@ExpiryDate", SqlDbType.Date);
                exp.Value = dd.ExpiryDate;
                cmd.Parameters.Add(exp);


                //SqlParameter create= new SqlParameter("@CreatedById", SqlDbType.Int);
                //create.Value = dd.CreatedById;
                //cmd.Parameters.Add(create);

                SqlParameter update = new SqlParameter("@UpdatedById", SqlDbType.Int);
                update.Value = dd.UpdatedById;
                cmd.Parameters.Add(update);

                SqlParameter due = new SqlParameter("@DueDate", SqlDbType.Date);
                due.Value = dd.DueDate;
                cmd.Parameters.Add(due);

                SqlParameter cont = new SqlParameter("@FileContent", SqlDbType.VarChar);
                cont.Value = dd.FileContent;
                cmd.Parameters.Add(cont);

                SqlParameter flag = new SqlParameter("@change", SqlDbType.VarChar);
                flag.Value = dd.change;
                cmd.Parameters.Add(flag);

                SqlParameter luid = new SqlParameter("@loggedinUserId", SqlDbType.Int);
                luid.Value = dd.loggedinUserId;
                cmd.Parameters.Add(luid);

                SqlParameter doc = new SqlParameter("@DocumentNo", SqlDbType.VarChar, 50);
                doc.Value = dd.DocumentNo;
                cmd.Parameters.Add(doc);

                SqlParameter doc2 = new SqlParameter("@DocumentNo2", SqlDbType.VarChar, 50);
                doc2.Value = dd.DocumentNo2;
                cmd.Parameters.Add(doc2);

                SqlParameter ver = new SqlParameter("@IsVerified", SqlDbType.Int);
                ver.Value = dd.isVerified;
                cmd.Parameters.Add(ver);

                str.Append("DocTypeId:" + dd.DocTypeId + ",");
                str.Append("Id:" + dd.Id + ",");
                str.Append("DriverId:" + dd.DriverId + ",");
                str.Append("change:" + dd.change);
                str.Append("filename:" + dd.FileName);

                str.Append(Environment.NewLine);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveDriverDocuments Input sent...." + str.ToString());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveDriverDocuments successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "SaveDriverDocuments...." + ex.Message.ToString());
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                dt.Columns.Add("Code");
                dt.Columns.Add("description");
                DataRow dr = dt.NewRow();
                dr[0] = "SCC001";
                dr[1] = ex.Message;
                dt.Rows.Add(dr);
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return status;
        }
        
        [HttpPost]
        [Route("api/DriverMaster/SaveBankingdetails")]
        public DataTable SaveBankingdetails(bankdetails b)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveBankingdetails....");
                StringBuilder str = new StringBuilder();
                str.Append("@Accountnumber" + b.Accountnumber + ",");
                str.Append("@BankName" + b.BankName + ",");
                str.Append("@BankCode" + b.Bankcode + ",");
                str.Append("@BranchAddress" + b.BranchAddress + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveBankingdetails Input sent...." + str.ToString());
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HVInsUpdBankdetails";
                cmd.Connection = conn;

                SqlParameter ff = new SqlParameter("@flag", SqlDbType.VarChar);
                ff.Value = b.flag;
                cmd.Parameters.Add(ff);

                SqlParameter i = new SqlParameter("@Id", SqlDbType.Int);
                i.Value = b.Id;
                cmd.Parameters.Add(i);

                SqlParameter n = new SqlParameter("@Accountnumber", SqlDbType.VarChar, 50);
                n.Value = b.Accountnumber;
                cmd.Parameters.Add(n);

                SqlParameter r = new SqlParameter("@BankName", SqlDbType.VarChar, 50);
                r.Value = b.BankName;
                cmd.Parameters.Add(r);


                SqlParameter a = new SqlParameter("@BankCode", SqlDbType.VarChar, 50);
                a.Value = b.Bankcode;
                cmd.Parameters.Add(a);

                SqlParameter s = new SqlParameter("@BranchAddress", SqlDbType.VarChar, 50);
                s.Value = b.BranchAddress;
                cmd.Parameters.Add(s);

                SqlParameter j2 = new SqlParameter("@CountryId", SqlDbType.VarChar,50);
                j2.Value = b.Country;
                cmd.Parameters.Add(j2);

                SqlParameter did = new SqlParameter("@DriverId", SqlDbType.Int);
                did.Value = b.DriverId;
                cmd.Parameters.Add(did);

                SqlParameter f = new SqlParameter("@IsActive", SqlDbType.Int);
                f.Value = b.IsActive;
                cmd.Parameters.Add(f);

                //SqlParameter code = new SqlParameter("@Code", SqlDbType.VarChar,20);
                //code.Value = b.Code;
                //cmd.Parameters.Add(code);

                //SqlParameter Qrcode = new SqlParameter("@QRCode", SqlDbType.VarChar,20);
                //Qrcode.Value = b.QRCode;
                //cmd.Parameters.Add(Qrcode);


                //SqlParameter ip = new SqlParameter("@IsPrimary", SqlDbType.Int);
                //ip.Value = b.IsPrimary;
                //cmd.Parameters.Add(ip);                


                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveBankingdetails successful....");

               
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "SaveBankingdetails...." + ex.Message.ToString());
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                dt.Columns.Add("Code");
                dt.Columns.Add("description");
                DataRow dr = dt.NewRow();
                dr[0] = "SCC001";
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
        [Route("api/DriverMaster/GetBankingDetails")]
        public DataTable GetBankingDetails(int DId)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetBankingDetails....");
                StringBuilder str = new StringBuilder();
                str.Append("@DId" + DId + ",");
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetBankingDetails Input sent...." + str.ToString());
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HVGetbankingdetails";
                cmd.Connection = conn;
                cmd.Parameters.Add("@DId", SqlDbType.Int).Value = DId;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetBankingDetails successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetBankingDetails...." + ex.Message.ToString());
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

        [HttpGet]
        [Route("api/DriverMaster/GetQrCode")]
        public DataTable GetQrCode(int DId)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetQrCode....");
                StringBuilder str = new StringBuilder();
                str.Append("@DId" + DId + ",");
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetQrCode Input sent...." + str.ToString());
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HvGetQrCode";
                cmd.Connection = conn;
                cmd.Parameters.Add("@DId", SqlDbType.Int).Value = DId;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetQrCode successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetQrCode...." + ex.Message.ToString());
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


       
        //[HttpGet]
        //[Route("api/DriverMaster/Master")]
        //public DataTable Master(int DId)
        //{
        //    DataTable dt = new DataTable();
        //    LogTraceWriter traceWriter = new LogTraceWriter();
        //    SqlConnection conn = new SqlConnection();

        //    try
        //    {
        //        traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Master....");

        //        conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

        //        SqlCommand cmd = new SqlCommand();
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.CommandText = "HVgetdrivermaster";
        //        cmd.Parameters.Add("@DId", SqlDbType.Int).Value = DId;
        //        cmd.Connection = conn;
        //        DataSet ds = new DataSet();
        //        SqlDataAdapter db = new SqlDataAdapter(cmd);
        //        db.Fill(ds);
        //        dt = ds.Tables[0];

        //        traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Master successful....");

        //    }
        //    catch (Exception ex)
        //    {
        //        traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Master...." + ex.Message.ToString());
        //        throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
        //    }
        //    finally
        //    {
        //        conn.Close();
        //        conn.Dispose();
        //        SqlConnection.ClearPool(conn);
        //    }
        //    return dt;

        //}

        [HttpPost]
        [Route("api/DriverMaster/SaveDriverApprovals")]
        public DataTable SaveDriverApprovals(Approvals a)
        {
            //connect to database
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveDriverApprovals....");
                StringBuilder str = new StringBuilder();
                str.Append("@Change" + a.change + ",");
                str.Append("@IsApproved" + a.IsApproved + ",");
                str.Append("@MobileNo" + a.MobileNo + ",");
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveDriverApprovals Input sent...." + str.ToString());
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSinsupddriverApprovals";
                cmd.Connection = conn;


                SqlParameter LocationId = new SqlParameter("@Change", SqlDbType.VarChar);
                LocationId.Value = a.change;
                cmd.Parameters.Add(LocationId);

                SqlParameter parentid = new SqlParameter("@IsApproved", SqlDbType.Int);
                parentid.Value = a.IsApproved;
                cmd.Parameters.Add(parentid);

                SqlParameter flag = new SqlParameter("@MobileNo", SqlDbType.VarChar);
                flag.Value = a.MobileNo;
                cmd.Parameters.Add(flag);


                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                #region Mobile OTP
                string motp = dt.Rows[0]["Mobileotp"].ToString();
                if (motp != null)
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
                        mail.Subject = "Driver registration - Mobile OTP";
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
                                                                             
                                                       Your Driver is Approved:<h3>" + motp + @" </h3>

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
                        
                        throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                    }
                }
                #endregion Mobile OTP

                
            }
            catch (Exception ex)
            {
                if (conn != null && conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                dt.Columns.Add("Code");
                dt.Columns.Add("description");
                DataRow dr = dt.NewRow();
                dr[0] = "SCC001";
                dr[1] = ex.Message;
                dt.Rows.Add(dr);
            }
            return dt;
        }

    }

}
