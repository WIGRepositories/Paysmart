﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Paysmart.Models;

namespace Paysmart.Controllers
{
    public class RateTheTripController : ApiController
    {
        [HttpPost]

        [Route("api/RateTheTrip/TripRating")]
        public int TripRating(VehicleBooking b)
        {
            int status = 1;
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSTrackVehicleHistory";

            cmd.Connection = conn;
            conn.Open();

            SqlParameter bb = new SqlParameter("@BookingId", SqlDbType.VarChar,50);
            bb.Value = b.BookingId;
            cmd.Parameters.Add(bb);

            SqlParameter sr = new SqlParameter("@Rating", SqlDbType.Int);
            sr.Value = b.Rating;
            cmd.Parameters.Add(sr);

            SqlParameter sb = new SqlParameter("@RatedBy", SqlDbType.VarChar,50);
            sb.Value = b.RatedBy;
            cmd.Parameters.Add(sb);

            SqlParameter sc = new SqlParameter("@Comments", SqlDbType.VarChar,50);
            sc.Value = b.Comments;
            cmd.Parameters.Add(sc);


            return status;
        }
    }
}