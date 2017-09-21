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

                SqlParameter di = new SqlParameter("@CompanyId", SqlDbType.Int);
                di.Value = d.CompanyId;
                cmd.Parameters.Add(di);

                SqlParameter n = new SqlParameter("@NAme", SqlDbType.VarChar, 50);
                n.Value = d.Name;
                cmd.Parameters.Add(n);

                SqlParameter r = new SqlParameter("@Address", SqlDbType.VarChar, 50);
                r.Value = d.Address;
                cmd.Parameters.Add(r);



                SqlParameter a = new SqlParameter("@City", SqlDbType.VarChar, 50);
                a.Value = d.City;
                cmd.Parameters.Add(a);

                SqlParameter s = new SqlParameter("@Pin", SqlDbType.VarChar, 50);
                s.Value = d.Pin;
                cmd.Parameters.Add(s);

                SqlParameter f = new SqlParameter("@PAddress", SqlDbType.VarChar, 50);
                f.Value = d.PAddress;
                cmd.Parameters.Add(f);

                SqlParameter j2 = new SqlParameter("@PCity", SqlDbType.VarChar, 255);
                j2.Value = d.PCity;
                cmd.Parameters.Add(j2);

                SqlParameter g = new SqlParameter("@PPin", SqlDbType.VarChar, 50);
                g.Value = d.PPin;
                cmd.Parameters.Add(g);

                SqlParameter h = new SqlParameter("@OffMobileNo", SqlDbType.Float);
                h.Value = d.OffMobileNo;
                cmd.Parameters.Add(h);

                SqlParameter j = new SqlParameter("@PMobNo", SqlDbType.VarChar, 255);
                j.Value = d.PMobNo;
                cmd.Parameters.Add(j);

                SqlParameter k = new SqlParameter("@DOB", SqlDbType.Date);
                k.Value = d.DOB;
                cmd.Parameters.Add(k);

                SqlParameter y = new SqlParameter("@DOJ", SqlDbType.Date);
                y.Value = d.DOJ;
                cmd.Parameters.Add(y);

                SqlParameter rj = new SqlParameter("@BloodGroup", SqlDbType.VarChar, 50);
                rj.Value = d.BloodGroup;
                cmd.Parameters.Add(rj);

                SqlParameter w = new SqlParameter("@Remarks", SqlDbType.VarChar, 50);
                w.Value = d.Remarks;
                cmd.Parameters.Add(w);

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
             SqlConnection conn = new SqlConnection();
            DataTable dt = new DataTable();
            int status = 1;
            try
            {
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
             
             SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return status;
        }


    }

}
