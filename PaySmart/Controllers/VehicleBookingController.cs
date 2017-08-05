using Paysmart.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Paysmart.Controllers
{
    public class VehicleBookingController : ApiController
    {
        [HttpPost]

        [Route("api/VehicleBooking/SaveBookingDetails")]

        public DataTable SaveBookingDetails(VehicleBooking b)
        {
            DataTable Tbl = new DataTable();

            SqlConnection conn = new SqlConnection();

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

            SqlParameter co = new SqlParameter("@CompanyId", SqlDbType.Int);
            co.Value = b.CompanyId;
            cmd.Parameters.Add(co);

            SqlParameter cm = new SqlParameter("@BNo", SqlDbType.VarChar,20);
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

            SqlParameter dt = new SqlParameter("@DepartureTime", System.Data.SqlDbType.DateTime);
            dt.Value = b.DepartueTime;
            cmd.Parameters.Add(dt);

            SqlParameter q1 = new SqlParameter("@BookingType", SqlDbType.VarChar, 50);
            q1.Value = b.BookingType;
            cmd.Parameters.Add(q1);

            SqlParameter src = new SqlParameter("@Src", SqlDbType.VarChar,50);
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

            SqlParameter dp = new SqlParameter("@DriverPhoneNo", SqlDbType.VarChar,20);
            dp.Value = b.DriverPhoneNo;
            cmd.Parameters.Add(dp);

            SqlParameter cp = new SqlParameter("@CustomerPhoneNo", SqlDbType.VarChar,20);
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
            ct.Value = b.ClosingDate;
            cmd.Parameters.Add(ct);

            SqlParameter cto = new SqlParameter("@CancelledOn", SqlDbType.DateTime);
            cto.Value = b.CancelledOn;
            cmd.Parameters.Add(cto);

            SqlParameter cb = new SqlParameter("@CancelledBy", SqlDbType.VarChar,50);
            cb.Value = b.CancelledBy;
            cmd.Parameters.Add(cb);

            SqlParameter bc = new SqlParameter("@BookingChannel", SqlDbType.VarChar, 50);
            bc.Value = b.BookingChannel;
            cmd.Parameters.Add(bc);

            SqlParameter r = new SqlParameter("@Reasons", SqlDbType.VarChar, 500);
            r.Value = b.Reasons;
            cmd.Parameters.Add(r);

            SqlParameter bo = new SqlParameter("@BooKingOTP", SqlDbType.VarChar,20);
            bo.Value = b.BookingOTP;
            cmd.Parameters.Add(bo);
            SqlParameter o = new SqlParameter("@OTPVerification", SqlDbType.VarChar,20);
            o.Value = b.OTPVerification;
            cmd.Parameters.Add(o);
            SqlParameter a = new SqlParameter("@Amount", SqlDbType.Decimal);
            a.Value = b.Amount;
            cmd.Parameters.Add(a);
            SqlParameter ps = new SqlParameter("@PaymentStatus", SqlDbType.VarChar,50);
            ps.Value = b.PaymentStatus;
            cmd.Parameters.Add(ps);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(Tbl);

            return Tbl;
        }

    }
}
