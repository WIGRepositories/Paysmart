using Paysmart;
using Paysmart.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Tracing;

namespace paysmart.Controllers
{
    public class FBTransactionMasterController : ApiController
    {
        [HttpGet]
        [Route("api/FBTransactionMaster/getFBTransactionMaster")]
        public DataTable getFBTransactionMaster()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "GetFBTransactionMaster";
            cmd.Connection = conn;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;

        }
        [HttpPost]
        [Route("api/FBTransactionMaster/saveFBTransactionMaster")]
        public DataTable saveFBTransactionMaster(FBTranMaster n)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();
            LogTraceWriter traceWriter = new LogTraceWriter();
           
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "FBTransactionMaster....");
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "InsUpdDelFBTransactionMaster";
                cmd.Connection = conn;

                SqlParameter id = new SqlParameter("@Id", SqlDbType.Int);
                id.Value = n.Id;
                cmd.Parameters.Add(id);

                SqlParameter na = new SqlParameter("@TransactionDate", SqlDbType.Date);
                na.Value = n.TransactionDate;
                cmd.Parameters.Add(na);

                SqlParameter dee = new SqlParameter("@TransactionTime", SqlDbType.DateTime);
                dee.Value = n.TransactionTime;
                cmd.Parameters.Add(dee);

                SqlParameter lon = new SqlParameter("@Amount", SqlDbType.Decimal);
                lon.Value = n.Amount;
                cmd.Parameters.Add(lon);
                SqlParameter lal = new SqlParameter("@StatusId", SqlDbType.Int);
                lal.Value = n.StatusId;
                cmd.Parameters.Add(lal);

                SqlParameter acc = new SqlParameter("@Charges", SqlDbType.Decimal);
                acc.Value = n.Charges;
                cmd.Parameters.Add(acc);

                SqlParameter fla = new SqlParameter("@flag", SqlDbType.VarChar);
                fla.Value = n.flag;
                cmd.Parameters.Add(fla);

                SqlParameter cod = new SqlParameter("@Discount", SqlDbType.Decimal);
                cod.Value = n.Discount;
                cmd.Parameters.Add(cod);

                SqlParameter cou = new SqlParameter("@TotalAmount", SqlDbType.Decimal);
                cou.Value = n.TotalAmount;
                cmd.Parameters.Add(cou);
                SqlParameter reff = new SqlParameter("@TransRefId", SqlDbType.Int);
                reff.Value = n.TransRefId;
                cmd.Parameters.Add(reff);

                SqlParameter tra = new SqlParameter("@TransGatewayId", SqlDbType.Int);
                tra.Value = n.TransGatewayId;
                cmd.Parameters.Add(tra);

                SqlParameter cat = new SqlParameter("@TransCatId", SqlDbType.Int);
                cat.Value = n.TransCatId;
                cmd.Parameters.Add(cat);

                SqlParameter mod = new SqlParameter("@TransModeId", SqlDbType.Int);
                mod.Value = n.TransModeId;
                cmd.Parameters.Add(mod);
                SqlParameter tt = new SqlParameter("@TransactionTypeId", SqlDbType.Int);
                tt.Value = n.TransactionTypeId;
                cmd.Parameters.Add(tt);

                SqlParameter acco = new SqlParameter("@AccountNumber", SqlDbType.VarChar,50);
                acco.Value = n.AccountNumber;
                cmd.Parameters.Add(acco);

                SqlParameter hol = new SqlParameter("@HolderName", SqlDbType.VarChar,50);
                hol.Value = n.HolderName;
                cmd.Parameters.Add(hol);

                SqlParameter codee = new SqlParameter("@Code", SqlDbType.VarChar,50);
                codee.Value = n.Code;
                cmd.Parameters.Add(codee);

                SqlParameter edd = new SqlParameter("@ExpMonth", SqlDbType.VarChar,50);
                edd.Value = n.ExpMonth;
                cmd.Parameters.Add(edd);
                SqlParameter yee = new SqlParameter("@ExpYear", SqlDbType.VarChar, 50);
                yee.Value = n.ExpYear;
                cmd.Parameters.Add(yee);

                SqlParameter aco = new SqlParameter("@AccountCode", SqlDbType.VarChar, 50);
                aco.Value = n.AccountCode;
                cmd.Parameters.Add(aco);

                SqlParameter tco = new SqlParameter("@TransCode", SqlDbType.VarChar, 50);
                tco.Value = n.TransCode;
                cmd.Parameters.Add(tco);
                
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "FBTransactionMaster closed....");

            }
            catch (Exception ex)
            {
                throw ex;

            }
            return dt;
        }
    }
}
