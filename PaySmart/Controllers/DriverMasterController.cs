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
        [Route("api/DriverMaster/GetDriverDetails")]
        public DataSet GetDriverDetails(int DID)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            DataSet dt = new DataSet();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetDriverDetails....");

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSgetDriverDetails";
                cmd.Parameters.Add("@DID", SqlDbType.Int).Value = DID;
                cmd.Connection = conn;

                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(dt);

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetDriverDetails successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "GetDriverDetails...." + ex.Message.ToString());
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
        [Route("api/DriverMaster/Driver")]

        public DataTable Driver(driverdetails d)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Driver....");

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

                SqlParameter pr = new SqlParameter("@Photo", SqlDbType.VarChar);
                pr.Value = d.Photo;
                cmd.Parameters.Add(pr);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Driver successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Driver...." + ex.Message.ToString());
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
        [Route("api/DriverMaster/SaveDriverDocuments")]
        public int SaveDriverDoc(DriverDocuments dd)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            int status = 1;
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Driver....");

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

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Driver successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Driver...." + ex.Message.ToString());
                throw ex;
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
        [Route("api/DriverMaster/Bankingdetails")]
        public DataTable Bankingdetails(bankdetails b)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Bankingdetails....");
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HVInsUpdBankingdetails";
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

                SqlParameter f = new SqlParameter("@IsActive", SqlDbType.Int);
                f.Value = b.IsActive;
                cmd.Parameters.Add(f);


                
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Driver successful....");

               
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Driver...." + ex.Message.ToString());
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
