using Paysmart.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Web.Http;
using System.Web.Http.Tracing;
using System.Text;

namespace Paysmart.Controllers
{
    public class VehicleBookingController : ApiController
    {
        [HttpPost]
        [Route("api/VehicleBooking/SaveBookingDetails")]
        public DataTable SaveBookingDetails(VehicleBooking b)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveBookingDetails....");

                str.Append("BNo:" + b.BNo + ",");
                str.Append("Src:" + b.Src + ",");
                str.Append("Dest:" + b.Dest + ",");
                //str.Append("VechId:" + b.VechId + ",");

                //str.Append("DriverPhoneNo:" + b.DriverPhoneNo + ",");
                str.Append("CustomerPhoneNo:" + b.CustomerPhoneNo + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSInsUpdVehicleBookingDetails";

                cmd.Connection = conn;

                SqlParameter i = new SqlParameter("@flag", SqlDbType.VarChar);
                i.Value = b.flag;
                cmd.Parameters.Add(i);

                SqlParameter ie = new SqlParameter("@Id", SqlDbType.Int);
                ie.Value = b.Id;
                cmd.Parameters.Add(ie);

                //SqlParameter co = new SqlParameter("@CompanyId", SqlDbType.Int);
                //co.Value = b.CompanyId;
                //cmd.Parameters.Add(co);

                //SqlParameter cm = new SqlParameter("@BNo", SqlDbType.VarChar, 20);
                //cm.Value = b.BNo;
                //cmd.Parameters.Add(cm);

                SqlParameter bd = new SqlParameter("@BookedDate", SqlDbType.Date);
                bd.Value = b.TravelDate;
                cmd.Parameters.Add(bd);

                SqlParameter bt = new SqlParameter("@BookedTime", System.Data.SqlDbType.DateTime);
                bt.Value = b.TravelTime;
                cmd.Parameters.Add(bt);

                //SqlParameter dd = new SqlParameter("@DepartureDate", SqlDbType.Date);
                //dd.Value = b.DepartueDate;
                //cmd.Parameters.Add(dd);

                //SqlParameter dt1 = new SqlParameter("@DepartureTime", System.Data.SqlDbType.DateTime);
                //dt1.Value = b.DepartureTime;
                //cmd.Parameters.Add(dt1);

                //SqlParameter q1 = new SqlParameter("@BookingType", SqlDbType.VarChar, 50);
                //q1.Value = b.BookingType;
                //cmd.Parameters.Add(q1);

                SqlParameter src = new SqlParameter("@Src", SqlDbType.VarChar, 50);
                src.Value = b.Src;
                cmd.Parameters.Add(src);

                SqlParameter dest = new SqlParameter("@Dest", SqlDbType.VarChar, 50);
                dest.Value = b.Dest;
                cmd.Parameters.Add(dest);

                //SqlParameter sr = new SqlParameter("@SrcId", SqlDbType.Int);
                //sr.Value = b.SrcId;
                //cmd.Parameters.Add(sr);

                //SqlParameter des = new SqlParameter("@DestId", SqlDbType.Int);
                //des.Value = b.DestId;
                //cmd.Parameters.Add(des);

                SqlParameter sl = new SqlParameter("@SrcLatitude", SqlDbType.Float);
                sl.Value = b.SrcLatitude;
                cmd.Parameters.Add(sl);

                SqlParameter so = new SqlParameter("@SrcLongitude", SqlDbType.Float);
                so.Value = b.SrcLongitude;
                cmd.Parameters.Add(so);

                SqlParameter dl = new SqlParameter("@DestLatitude", SqlDbType.Float);
                dl.Value = b.DestLatitude;
                cmd.Parameters.Add(dl);

                SqlParameter d = new SqlParameter("@DestLongitude", SqlDbType.Float);
                d.Value = b.DestLongitude;
                cmd.Parameters.Add(d);

                //SqlParameter vi = new SqlParameter("@VechId", SqlDbType.Int);
                //vi.Value = b.VechId;
                //cmd.Parameters.Add(vi);

                SqlParameter p = new SqlParameter("@PackageId", SqlDbType.Int);
                p.Value = b.PackageId;
                cmd.Parameters.Add(p);

                SqlParameter pa = new SqlParameter("@Pricing", SqlDbType.Decimal);
                pa.Value = b.Pricing;
                cmd.Parameters.Add(pa);

                //SqlParameter di = new SqlParameter("@DriverId", SqlDbType.Int);
                //di.Value = b.DriverId;
                //cmd.Parameters.Add(di);

                //SqlParameter dp = new SqlParameter("@DriverPhoneNo", SqlDbType.VarChar, 20);
                //dp.Value = b.DriverPhoneNo;
                //cmd.Parameters.Add(dp);

                SqlParameter cp = new SqlParameter("@CustomerPhoneNo", SqlDbType.VarChar, 20);
                cp.Value = b.CustomerPhoneNo;
                cmd.Parameters.Add(cp);

                //SqlParameter c = new SqlParameter("@CustomerId", SqlDbType.Int);
                //c.Value = b.CustomerId;
                //cmd.Parameters.Add(c);

                //SqlParameter bs = new SqlParameter("@BookingStatus", SqlDbType.VarChar, 50);
                //bs.Value = b.BookingStatus;
                //cmd.Parameters.Add(bs);

                //SqlParameter n = new SqlParameter("@NoofVehicles", SqlDbType.Int);
                //n.Value = b.NoofVehicles;
                //cmd.Parameters.Add(n);

                SqlParameter ns = new SqlParameter("@NoofSeats", SqlDbType.Int);
                ns.Value = b.NoofSeats;
                cmd.Parameters.Add(ns);

                //SqlParameter cd = new SqlParameter("@ClosingDate", SqlDbType.Date);
                //cd.Value = b.ClosingDate;
                //cmd.Parameters.Add(cd);

                //SqlParameter ct = new SqlParameter("@ClosingTime", System.Data.SqlDbType.DateTime);
                //ct.Value = b.ClosingDate;
                //cmd.Parameters.Add(ct);

                //SqlParameter cto = new SqlParameter("@CancelledOn", SqlDbType.DateTime);
                //cto.Value = b.CancelledOn;
                //cmd.Parameters.Add(cto);

                //SqlParameter cb = new SqlParameter("@CancelledBy", SqlDbType.VarChar, 50);
                //cb.Value = b.CancelledBy;
                //cmd.Parameters.Add(cb);

                SqlParameter bc = new SqlParameter("@BookingChannel", SqlDbType.VarChar, 50);
                bc.Value = b.BookingChannel;
                cmd.Parameters.Add(bc);

                SqlParameter r = new SqlParameter("@withluggage", SqlDbType.Int);
                r.Value = b.withluggage;
                cmd.Parameters.Add(r);

                SqlParameter a = new SqlParameter("@luggageweight", SqlDbType.Int);
                a.Value = b.luggageweight;
                cmd.Parameters.Add(a);

                SqlParameter ps = new SqlParameter("@VehicleGroupId", SqlDbType.Int);
                ps.Value = b.VehicleGroupId;
                cmd.Parameters.Add(ps);

                SqlParameter pty = new SqlParameter("@distance", SqlDbType.Decimal);
                pty.Value = b.distance;
                cmd.Parameters.Add(pty);




                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);


                #region Mobile OTP
                string eotp = dt.Rows[0]["bookingNumber"].ToString();
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
                        mail.To.Add(fromaddress);
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
                                                                             
                                                       Your Vehicle is Booked:<h3>" + eotp + @" </h3>

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


                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveBookingDetails successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "SaveBookingDetails...." + ex.Message.ToString());
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
        [Route("api/VehicleBooking/ConfirmBooking")]
        public DataTable ConfirmBooking(VehicleBooking b)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            DataTable dt = new DataTable();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "ConfirmBooking....");

                str.Append("BNo:" + b.BNo + ",");
                str.Append("EstPrice:" + b.EstPrice + ",");
                str.Append("PaymentModeId:" + b.PaymentModeId + ",");
                str.Append("CouponCode:" + b.CouponCode + ",");
               
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSInsUpdConfirmBooking";
                cmd.Connection = conn;

                SqlParameter cm = new SqlParameter("@BNo", SqlDbType.VarChar, 20);
                cm.Value = b.BNo;
                cmd.Parameters.Add(cm);              

                SqlParameter r = new SqlParameter("@EstPrice", SqlDbType.VarChar,20);
                r.Value = b.EstPrice;
                cmd.Parameters.Add(r);

                SqlParameter a = new SqlParameter("@PaymentModeId", SqlDbType.Int);
                a.Value = b.PaymentModeId;
                cmd.Parameters.Add(a);

                SqlParameter ps = new SqlParameter("@CouponCode", SqlDbType.VarChar,20);
                ps.Value = b.CouponCode;
                cmd.Parameters.Add(ps);


                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);               


                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "ConfirmBooking successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "ConfirmBooking...." + ex.Message.ToString());
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
        [Route("api/VehicleBooking/AdvanceBookingDetails")]
        public DataTable AdvanceBookingDetails(VehicleBooking b)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            DataTable dt = new DataTable();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "AdvanceBookingDetails....");
                str.Append("BNo:" + b.BNo + ",");
                str.Append("Src:" + b.Src + ",");
                str.Append("Dest:" + b.Dest + ",");
                str.Append("VechId:" + b.VechId + ",");
                str.Append("DriverPhoneNo:" + b.DriverPhoneNo + ",");
                str.Append("CustomerPhoneNo:" + b.CustomerPhoneNo + ",");
                
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());


            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSInsUpdVehicleAdvBookingDetails";

            cmd.Connection = conn;

            SqlParameter i = new SqlParameter("@flag", SqlDbType.VarChar);
            i.Value = b.flag;
            cmd.Parameters.Add(i);

            SqlParameter ie = new SqlParameter("@Id", SqlDbType.Int);
            ie.Value = b.Id;
            cmd.Parameters.Add(ie);

            SqlParameter co = new SqlParameter("@CompanyId", SqlDbType.Int);
            co.Value = b.CompanyId;
            cmd.Parameters.Add(co);

            SqlParameter cm = new SqlParameter("@BNo", SqlDbType.VarChar, 20);
            cm.Value = b.BNo;
            cmd.Parameters.Add(cm);

            SqlParameter bd = new SqlParameter("@BookedDate", SqlDbType.Date);
            bd.Value = b.BookedDate;
            cmd.Parameters.Add(bd);

            SqlParameter bt = new SqlParameter("@BookedTime", System.Data.SqlDbType.DateTime);
            bt.Value = b.BookedTime;
            cmd.Parameters.Add(bt);

            SqlParameter dd = new SqlParameter("@DepartureDate", SqlDbType.Date);
            dd.Value = b.DepartueDate;
            cmd.Parameters.Add(dd);

            SqlParameter dt1 = new SqlParameter("@DepartureTime", System.Data.SqlDbType.DateTime);
            dt1.Value = b.DepartureTime;
            cmd.Parameters.Add(dt1);

            SqlParameter q1 = new SqlParameter("@BookingType", SqlDbType.VarChar, 50);
            q1.Value = b.BookingType;
            cmd.Parameters.Add(q1);

            SqlParameter src = new SqlParameter("@Src", SqlDbType.VarChar, 50);
            src.Value = b.Src;
            cmd.Parameters.Add(src);

            SqlParameter dest = new SqlParameter("@Dest", SqlDbType.VarChar, 50);
            dest.Value = b.Dest;
            cmd.Parameters.Add(dest);

            SqlParameter sr = new SqlParameter("@SrcId", SqlDbType.Int);
            sr.Value = b.SrcId;
            cmd.Parameters.Add(sr);

            SqlParameter des = new SqlParameter("@DestId", SqlDbType.Int);
            des.Value = b.DestId;
            cmd.Parameters.Add(des);

            SqlParameter sl = new SqlParameter("@SrcLatitude", SqlDbType.Float);
            sl.Value = b.SrcLatitude;
            cmd.Parameters.Add(sl);

            SqlParameter so = new SqlParameter("@SrcLongitude", SqlDbType.Float);
            so.Value = b.SrcLongitude;
            cmd.Parameters.Add(so);

            SqlParameter dl = new SqlParameter("@DestLatitude", SqlDbType.Float);
            dl.Value = b.DestLatitude;
            cmd.Parameters.Add(dl);

            SqlParameter d = new SqlParameter("@DestLongitude", SqlDbType.Float);
            d.Value = b.DestLongitude;
            cmd.Parameters.Add(d);

            SqlParameter vi = new SqlParameter("@VechId", SqlDbType.Int);
            vi.Value = b.VechId;
            cmd.Parameters.Add(vi);

            SqlParameter p = new SqlParameter("@PackageId", SqlDbType.Int);
            p.Value = b.PackageId;
            cmd.Parameters.Add(p);

            SqlParameter pa = new SqlParameter("@Pricing", SqlDbType.Decimal);
            pa.Value = b.Pricing;
            cmd.Parameters.Add(pa);

            SqlParameter di = new SqlParameter("@DriverId", SqlDbType.Int);
            di.Value = b.DriverId;
            cmd.Parameters.Add(di);

            SqlParameter dp = new SqlParameter("@DriverPhoneNo", SqlDbType.VarChar, 20);
            dp.Value = b.DriverPhoneNo;
            cmd.Parameters.Add(dp);

            SqlParameter cp = new SqlParameter("@CustomerPhoneNo", SqlDbType.VarChar, 20);
            cp.Value = b.CustomerPhoneNo;
            cmd.Parameters.Add(cp);

            SqlParameter c = new SqlParameter("@CustomerId", SqlDbType.Int);
            c.Value = b.CustomerId;
            cmd.Parameters.Add(c);

            SqlParameter bs = new SqlParameter("@BookingStatus", SqlDbType.VarChar, 50);
            bs.Value = b.BookingStatus;
            cmd.Parameters.Add(bs);

            SqlParameter n = new SqlParameter("@NoofVehicles", SqlDbType.Int);
            n.Value = b.NoofVehicles;
            cmd.Parameters.Add(n);

            SqlParameter ns = new SqlParameter("@NoofSeats", SqlDbType.Int);
            ns.Value = b.NoofSeats;
            cmd.Parameters.Add(ns);

            SqlParameter cd = new SqlParameter("@ClosingDate", SqlDbType.Date);
            cd.Value = b.ClosingDate;
            cmd.Parameters.Add(cd);

            SqlParameter ct = new SqlParameter("@ClosingTime", System.Data.SqlDbType.DateTime);
            ct.Value = b.ClosingTime;
            cmd.Parameters.Add(ct);

            SqlParameter cto = new SqlParameter("@CancelledOn", SqlDbType.DateTime);
            cto.Value = b.CancelledOn;
            cmd.Parameters.Add(cto);

            SqlParameter cb = new SqlParameter("@CancelledBy", SqlDbType.VarChar, 50);
            cb.Value = b.CancelledBy;
            cmd.Parameters.Add(cb);

            SqlParameter bc = new SqlParameter("@BookingChannel", SqlDbType.VarChar, 50);
            bc.Value = b.BookingChannel;
            cmd.Parameters.Add(bc);

            SqlParameter r = new SqlParameter("@Reasons", SqlDbType.VarChar, 500);
            r.Value = b.Reasons;
            cmd.Parameters.Add(r);

            SqlParameter a = new SqlParameter("@Amount", SqlDbType.Decimal);
            a.Value = b.Amount;
            cmd.Parameters.Add(a);

            SqlParameter ps = new SqlParameter("@PaymentStatus", SqlDbType.VarChar, 50);
            ps.Value = b.PaymentStatus;
            cmd.Parameters.Add(ps);

            SqlParameter dist = new SqlParameter("@distance", SqlDbType.Decimal);
            dist.Value = b.distance;
            cmd.Parameters.Add(dist);
           
           
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);


            #region Mobile OTP
            //            string motp = dt.Rows[0]["bookingNumber"].ToString();
            //            if (motp != null)
            //            {
            //                try
            //                {
            //                    MailMessage mail = new MailMessage();
            //                    string emailserver = System.Configuration.ConfigurationManager.AppSettings["emailserver"].ToString();

            //                    string username = System.Configuration.ConfigurationManager.AppSettings["username"].ToString();
            //                    string pwd = System.Configuration.ConfigurationManager.AppSettings["password"].ToString();
            //                    string fromaddress = System.Configuration.ConfigurationManager.AppSettings["fromaddress"].ToString();
            //                    string port = System.Configuration.ConfigurationManager.AppSettings["port"].ToString();

            //                    SmtpClient SmtpServer = new SmtpClient(emailserver);

            //                    mail.From = new MailAddress(fromaddress);
            //                    // mail.To.Add(b.PhoneNo);
            //                    mail.To.Add(fromaddress);
            //                    mail.Subject = "User registration - Mobile OTP";
            //                    mail.IsBodyHtml = true;

            //                    string verifcodeMail = @"<table>
            //                                                        <tr>
            //                                                            <td>
            //                                                                <h2>Thank you for registering with PaySmart APP</h2>
            //                                                                <table width=\""760\"" align=\""center\"">
            //                                                                    <tbody style='background-color:#F0F8FF;'>
            //                                                                        <tr>
            //                                                                            <td style=\""font-family:'Zurich BT',Arial,Helvetica,sans-serif;font-size:15px;text-align:left;line-height:normal;background-color:#F0F8FF;\"" >
            //<div style='padding:10px;border:#0000FF solid 2px;'>    <br /><br />
            //                                                                             
            //                                                       Your booking number is:<h3>" + motp + @" </h3>
            //
            //                                                        If you didn't make this request, <a href='http://154.120.237.198:52800'>click here</a> to cancel.
            //
            //                                                                                <br/>
            //                                                                                <br/>             
            //                                                                       
            //                                                                                Warm regards,<br>
            //                                                                                PAYSMART Customer Service Team<br/><br />
            //</div>
            //                                                                            </td>
            //                                                                        </tr>
            //
            //                                                                    </tbody>
            //                                                                </table>
            //                                                            </td>
            //                                                        </tr>
            //
            //                                                    </table>";


            //                    mail.Body = verifcodeMail;
            //                    //SmtpServer.Port = 465;
            //                    //SmtpServer.Port = 587;
            //                    SmtpServer.Port = Convert.ToInt32(port);
            //                    SmtpServer.UseDefaultCredentials = false;

            //                    SmtpServer.Credentials = new System.Net.NetworkCredential(username, pwd);
            //                    SmtpServer.EnableSsl = true;
            //                    //SmtpServer.TargetName = "STARTTLS/smtp.gmail.com";
            //                    SmtpServer.Send(mail);


            //                }
            //                catch (Exception ex)
            //                {
            //                    // return Tbl;
            //                }
            //            }
            #endregion Mobile OTP
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "AdvanceBookingDetails successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "AdvanceBookingDetails...." + ex.Message.ToString());
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
        [Route("api/VehicleBooking/BookingStatus")]
        public DataTable BookingStatus(VehicleBooking b)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            DataTable dt = new DataTable();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "BookingStatus....");
                str.Append("BNo:" + b.BNo + ",");
                
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSGetbookingStatus";

            cmd.Connection = conn;

            SqlParameter cm = new SqlParameter("@BNo", SqlDbType.VarChar, 20);
            cm.Value = b.BNo;
            cmd.Parameters.Add(cm);

            SqlParameter m = new SqlParameter("@requestType", SqlDbType.Int);
            m.Value = 0;
            cmd.Parameters.Add(m);

            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "BookingStatus successful....");
               
            }
            catch (Exception ex) {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "BookingStatus...." + ex.Message.ToString());
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
        [Route("api/VehicleBooking/CalculatePrice")]
        public DataTable CalculatePrice(VehicleBooking b)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            DataTable dt = new DataTable();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "CalculatePrice....");

                str.Append("BNo:" + b.BNo + ",");
                str.Append("packageId:" + b.PackageId + ",");
                
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSTripCost";

            cmd.Connection = conn;

            SqlParameter cm = new SqlParameter("@BNo", SqlDbType.VarChar, 20);
            cm.Value = b.BNo;
            cmd.Parameters.Add(cm);

            SqlParameter m = new SqlParameter("@packageId", SqlDbType.Int);
            m.Value = b.PackageId;
            cmd.Parameters.Add(m);

           
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "CalculatePrice successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "CalculatePrice...." + ex.Message.ToString());
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
        [Route("api/VehicleBooking/AvailableVehicles")]
        public DataSet AvailableVehicles(VehicleBooking vb)
        {

            DataSet ds = new DataSet();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            DataTable dt = new DataTable();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "AvailableVehicles....");

                str.Append("UserId:" + vb.UserId + ",");
                str.Append("lat:" + vb.SrcLatitude + ",");
                str.Append("lng:" + vb.SrcLongitude + ",");
                str.Append("vehicleGroupId:" + vb.VehicleGroupId + ",");
                //str.Append("vehicleTypeId:" + vb.VehicleTypeId + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "HVgetnearestvehicles";

                cmd.Parameters.Add("@UserId", SqlDbType.VarChar, 50).Value = vb.UserId;
                cmd.Parameters.Add("@lat", SqlDbType.Float).Value = vb.SrcLatitude;
                cmd.Parameters.Add("@lng", SqlDbType.Float).Value = vb.SrcLongitude;
                cmd.Parameters.Add("@vehicleGroupId", SqlDbType.Int).Value = vb.VehicleGroupId;
                //cmd.Parameters.Add("@vehicleTypeId", SqlDbType.Int).Value = vb.VehicleTypeId;

                cmd.Connection = conn;

                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(ds);
                //dt = ds.Tables[0];
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "AvailableVehicles successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "AvailableVehicles...." + ex.Message.ToString());
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
            return ds;
        }

        [HttpPost]
        [Route("api/VehicleBooking/VehiclePosition")]
        public DataTable NearestVehicle(VehicleBooking vb)
        {
             LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            DataTable dt = new DataTable();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "VehiclePosition....");
                str.Append("bno:" + vb.BNo + ",");
                
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HVgetnearvehicle";
            
            cmd.Parameters.Add("@bno", SqlDbType.VarChar).Value = vb.BNo;            

            cmd.Connection = conn;
          
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(dt);

            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "VehiclePosition successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "VehiclePosition...." + ex.Message.ToString());
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
        [Route("api/VehicleBooking/RateTheRide")]
        public DataTable RateTheRide(VehicleBooking vb)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            DataTable dt = new DataTable();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "RateTheRide....");
                str.Append("MobileNo:" + vb.CustomerPhoneNo + ",");
                str.Append("BNo:" + vb.BNo + ",");
                str.Append("rating:" + vb.Rating + ",");
                str.Append("Comment:" + vb.Comments + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HVRateTheTrip";
            cmd.Parameters.Add("@Mobilenumber", SqlDbType.VarChar, 50).Value = vb.CustomerPhoneNo;
            cmd.Parameters.Add("@BNo", SqlDbType.VarChar, 50).Value = vb.BNo;
            cmd.Parameters.Add("@rating", SqlDbType.Decimal).Value = vb.Rating;
            cmd.Parameters.Add("@RatedBy", SqlDbType.Int).Value = vb.RatedBy;
            cmd.Parameters.Add("@Comment", SqlDbType.VarChar, 250).Value = vb.Comments;

            cmd.Connection = conn;
            DataSet ds = new DataSet();
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(ds);
            dt = ds.Tables[0];

            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "RateTheRide successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "RateTheRide...." + ex.Message.ToString());
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
        [Route("api/VehicleBooking/RideDetails")]
        public DataTable RideDetails(VehicleBooking vb)
        { 
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            DataTable ds = new DataTable();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "RideDetails....");
                str.Append("BNo:" + vb.BNo + ",");
               
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HVGetRideDetails";
            cmd.Parameters.Add("@BNo", SqlDbType.VarChar, 50).Value = vb.BNo;
            cmd.Connection = conn;
            
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(ds);


            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "RideDetails successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "RideDetails...." + ex.Message.ToString());
                //throw ex;
                //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                ds.Columns.Add("Code");
                ds.Columns.Add("description");
                DataRow dr = ds.NewRow();
                dr[0] = "ERR001";
                dr[1] = ex.Message;
                ds.Rows.Add(dr);
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                SqlConnection.ClearPool(conn);
            }
            return ds;
        }

        [HttpPost]
        [Route("api/VehicleBooking/RidesList")]
        public DataTable RidesList(VehicleBooking vb)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            DataTable dt = new DataTable();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "RidesList....");
                str.Append("MobileNo:" + vb.CustomerPhoneNo + ",");
                
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HVGetRidesList";
            cmd.Parameters.Add("@Mobilenumber", SqlDbType.VarChar, 50).Value = vb.CustomerPhoneNo;

            cmd.Connection = conn;

            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(dt);

            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "RidesList successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "RidesList...." + ex.Message.ToString());
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
        [Route("api/VehicleBooking/UpdateBookingStatus")]
        public DataTable UpdateBookingStatus(VehicleBooking vb)
        {
           LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            DataTable dt = new DataTable();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "UpdateBookingStatus....");
                str.Append("BNo:" + vb.BNo + ",");
                str.Append("BookingStatus:" + vb.BookingStatus + ",");
                str.Append("UpdatedBy:" + vb.UpdatedBy + ",");
                str.Append("UpdatedUserId:" + vb.UpdatedUserId + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HVUpdateBookingStatus";
            cmd.Parameters.Add("@BNo", SqlDbType.VarChar, 50).Value = vb.BNo;
            cmd.Parameters.Add("@BookingStatus", SqlDbType.VarChar, 50).Value = vb.BookingStatus;
            cmd.Parameters.Add("@UpdatedBy", SqlDbType.Int).Value = vb.UpdatedBy;
            cmd.Parameters.Add("@UpdatedUserId", SqlDbType.Int).Value = vb.UpdatedUserId;
            //cmd.Parameters.Add("@Comments", SqlDbType.VarChar,150).Value = vb.Comments;

            cmd.Connection = conn;
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(dt);

            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "UpdateBookingStatus successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "UpdateBookingStatus...." + ex.Message.ToString());
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
        [Route("api/VehicleBooking/AcceptRejectBooking")]
        public DataTable AcceptBooking(VehicleBooking b)
        {

             LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            //DataSet dt = new DataSet();
            DataTable dt = new DataTable();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "AcceptRejectBooking....");

                str.Append("BookingId:" + b.BookingId + ",");
                str.Append("BookingStatus:" + b.BookingStatus + ",");
                str.Append("Vid:" + b.VID + ",");
                str.Append("DID:" + b.DriverId + ",");

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSAcceptRejectBooking";

            cmd.Connection = conn;
            
            SqlParameter bb = new SqlParameter("@BookingId", SqlDbType.VarChar, 50);
            bb.Value = b.BookingId;
            cmd.Parameters.Add(bb);

            SqlParameter s = new SqlParameter("@BookingStatus", SqlDbType.VarChar, 50);
            s.Value = b.BookingStatus;
            cmd.Parameters.Add(s);

            SqlParameter dp = new SqlParameter("@Vid", SqlDbType.Int);
            dp.Value = b.VID;
            cmd.Parameters.Add(dp);

            SqlParameter drid = new SqlParameter("@DID", SqlDbType.Int);
            drid.Value = b.DriverId;
            cmd.Parameters.Add(drid);

            SqlParameter c = new SqlParameter("@comment", SqlDbType.VarChar, 150);
            c.Value = b.Reasons;
            cmd.Parameters.Add(c);
            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
           
            da.Fill(dt);

            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "AcceptRejectBooking successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "AcceptRejectBooking...." + ex.Message.ToString());
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
        [Route("api/VehicleBooking/StartTrip")]
        public DataTable StartTrip(VehicleBooking b)
        {

            DataTable dt = new DataTable();
             LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "StartTrip....");

                str.Append("BNo:" + b.BNo + ",");
                str.Append("DriverPhoneNo:" + b.DriverPhoneNo + ",");
                str.Append("BookingOTP:" + b.BVerificationCode + ",");


                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSStartTrip";
                cmd.Connection = conn;


                SqlParameter q1 = new SqlParameter("@BNo", SqlDbType.VarChar, 20);
                q1.Value = b.BNo;
                cmd.Parameters.Add(q1);

                SqlParameter d1 = new SqlParameter("@DriverPhoneNo", SqlDbType.VarChar, 20);
                d1.Value = b.DriverPhoneNo;
                cmd.Parameters.Add(d1);

                SqlParameter e = new SqlParameter("@BookingOTP", SqlDbType.VarChar, 5);
                e.Value = b.BVerificationCode;
                cmd.Parameters.Add(e);

                SqlDataAdapter ds = new SqlDataAdapter(cmd);
                ds.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "StartTrip successful....");
            }
                
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "StartTrip...." + ex.Message.ToString());
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
        [Route("api/VehicleBooking/EndTrip")]
        public DataTable EndTrip(VehicleBooking b)
        {

            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "EndTrip....");
                str.Append("BNo:" + b.BNo + ",");
                str.Append("DriverPhoneNo:" + b.DriverPhoneNo + ",");
                


                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSEndTrip";
            cmd.Connection = conn;


            SqlParameter q1 = new SqlParameter("@BNo", SqlDbType.VarChar, 20);
            q1.Value = b.BNo;
            cmd.Parameters.Add(q1);

            SqlParameter d1 = new SqlParameter("@DriverPhoneNo", SqlDbType.VarChar, 20);
            d1.Value = b.DriverPhoneNo;
            cmd.Parameters.Add(d1);

            SqlDataAdapter ds = new SqlDataAdapter(cmd);
            ds.Fill(dt);

            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "EndTrip successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "EndTrip...." + ex.Message.ToString());
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
        [Route("api/VehicleBooking/ProcessPayment")]
        public DataTable ProcessPayment(VehicleBooking b)
        {

            int status = 0;
            DataTable dt = new DataTable();
             LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "ProcessPayment....");

                str.Append("BNo:" + b.BNo + ",");
                str.Append("Amount:" + b.Amount + ",");                
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSProcessPayment";
            cmd.Connection = conn;


            SqlParameter q1 = new SqlParameter("@BNo", SqlDbType.VarChar, 20);
            q1.Value = b.BNo;
            cmd.Parameters.Add(q1);

            SqlParameter e = new SqlParameter("@Amount", SqlDbType.Decimal);
            e.Value = b.Amount;
            cmd.Parameters.Add(e);

            SqlParameter pmm = new SqlParameter("@PaymentModeId", SqlDbType.Int);
            pmm.Value = b.PaymentModeId;
            cmd.Parameters.Add(pmm);
           

            //try
            //{
            //    conn.Open();
            //    object statusres = cmd.ExecuteScalar();
            //    conn.Close();
            //    if (statusres != null)
            //    {
            //        if (conn.State == ConnectionState.Open)
            //        {
            //            conn.Close();
            //        }
            //        return Convert.ToInt32(statusres);
            //    }
            //    traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "ProcessPayment successful....");
            //}
            //catch (Exception ex)
            //{
            //    traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "ProcessPayment...." + ex.Message.ToString());
            //    //throw ex;
            //    throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.OK, ex.Message));
            //}
            //Verify mobile otp
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(dt);            
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "ProcessPayment successful....");
            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "ProcessPayment...." + ex.Message.ToString());
                //throw ex;
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
        [Route("api/VehicleBooking/DriverRatingToRide")]
        public DataTable DriverRatingToRide(VehicleBooking vb)
        {
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            try
            {

                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "DriverRatingToRide....");
                str.Append("Mobilenumber:" + vb.DriverPhoneNo + ",");
                str.Append("BNo:" + vb.BNo + ",");
               
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HVDriverRating";
            cmd.Parameters.Add("@Mobilenumber", SqlDbType.VarChar, 50).Value = vb.DriverPhoneNo;
            cmd.Parameters.Add("@BNo", SqlDbType.VarChar, 50).Value = vb.BNo;
            cmd.Parameters.Add("@DriverRating", SqlDbType.Decimal).Value = vb.DriverRating;
            cmd.Parameters.Add("@DriverRated", SqlDbType.Int).Value = vb.DriverRated;
            cmd.Parameters.Add("@DriverComments", SqlDbType.VarChar, 150).Value = vb.DriverComments;

            cmd.Connection = conn;
            
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(ds);
            dt = ds.Tables[0];

            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "DriverRatingToRide successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "DriverRatingToRide...." + ex.Message.ToString());
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
        [Route("api/VehicleBooking/OngoingTrips")]
        public DataTable OngoingTrips(string BNo)
        {
            DataTable Tbl = new DataTable();

            LogTraceWriter traceWriter = new LogTraceWriter();
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "OngoingTrips credentials....");
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            str.Append("BNo:" + BNo + ",");
            try
            {
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "GetTripStatus";
                cmd.Connection = conn;
                cmd.Parameters.Add("@BNo", SqlDbType.VarChar).Value = BNo;

                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(Tbl);

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "OngoingTrips...." + ex.Message.ToString());
                //throw ex;
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
            return Tbl;

        }
    
    
    
    }
}
