using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Paysmart.Models;

namespace Paysmart.Controllers
{
    public class MVerificationController : ApiController
    {
        [HttpPost]
        [Route("api/MVerification/MOTPverification")]
        public DataTable MOTPverification(UserLocation ocr)
        {


            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HVMOTPverification";

            cmd.Connection = conn;


            SqlParameter q1 = new SqlParameter("@PhoneNo", SqlDbType.VarChar,50);
            q1.Value = ocr.PhoneNo;
            cmd.Parameters.Add(q1);

            SqlParameter e = new SqlParameter("@Mobileotp", SqlDbType.VarChar,10);
            e.Value = ocr.Mobileotp;
            cmd.Parameters.Add(e);




            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            //Verify mobile otp

            return dt;

        }
    }
}
