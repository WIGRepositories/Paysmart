using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Paysmart.Models;
using System.Configuration;

namespace Paysmart.Controllers
{
    public class TransactionController : ApiController
    {
        [HttpPost]
        [Route("api/Transactions/TransactionMaster")]
        public DataTable TransactionMaster(Transmaster tr)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            try
            {
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();
               
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "InsUpdDelTransactionMaster";
                cmd.Connection = conn;

                SqlParameter mn = new SqlParameter("@Id",SqlDbType.Int);
                mn.Value = tr.Id;
                cmd.Parameters.Add(mn);

                SqlParameter am = new SqlParameter("@Amount",SqlDbType.Decimal);
                am.Value = tr.Amount;
                cmd.Parameters.Add(am);

                SqlParameter si = new SqlParameter("@StatusId",SqlDbType.Int);
                si.Value = tr.StatusId;
                cmd.Parameters.Add(si);

                SqlParameter cg = new SqlParameter("@Charges",SqlDbType.Decimal);
                cg.Value = tr.Charges;
                cmd.Parameters.Add(cg);

                SqlParameter dc = new SqlParameter("@Discount",SqlDbType.Decimal);
                dc.Value = tr.Discount;
                cmd.Parameters.Add(dc);

                SqlParameter tm = new SqlParameter("@TotalAmount",SqlDbType.Decimal);
                tm.Value = tr.TotalAmount;
                cmd.Parameters.Add(tm);

                SqlParameter tf = new SqlParameter("@tranrefId", SqlDbType.Int);
                tf.Value = tr.TransferId;
                cmd.Parameters.Add(tf);

                SqlParameter tg = new SqlParameter("TransGatewayId",SqlDbType.VarChar,50);
                tg.Value = tr.TransGatewayId;
                cmd.Parameters.Add(tg);

                SqlParameter tc = new SqlParameter("@TransCatId",SqlDbType.Int);
                tc.Value = tr.TransCatId;
                cmd.Parameters.Add(tc);

                SqlParameter tz = new SqlParameter("@TransModeId",SqlDbType.Int);
                tz.Value = tr.TransModeId;
                cmd.Parameters.Add(tz);

                SqlParameter tt = new SqlParameter("@TransactionTypeId",SqlDbType.Int);
                tt.Value = tr.TransactionTypeId;
                cmd.Parameters.Add(tt);

                SqlParameter an = new SqlParameter("@AccountNumber",SqlDbType.VarChar,50);
                an.Value = tr.AccountNumber;
                cmd.Parameters.Add(an);

                SqlParameter hn = new SqlParameter("@HolderName",SqlDbType.VarChar,50);
                hn.Value = tr.HolderName;
                cmd.Parameters.Add(hn);

                SqlParameter cd = new SqlParameter("@Code",SqlDbType.VarChar,50);
                cd.Value = tr.Code;
                cmd.Parameters.Add(cd);

                SqlParameter em = new SqlParameter("@ExpMonth",SqlDbType.VarChar,10);
                em.Value = tr.ExpMonth;
                cmd.Parameters.Add(em);

                SqlParameter ey = new SqlParameter("@ExpYear",SqlDbType.VarChar,10);
                ey.Value = tr.ExpYear;
                cmd.Parameters.Add(ey);

                SqlParameter ac = new SqlParameter("@AccountCode",SqlDbType.VarChar,50);
                ac.Value = tr.AccountCode;
                cmd.Parameters.Add(ac);

                SqlParameter tl = new SqlParameter("@TransCode",SqlDbType.VarChar,50);
                tl.Value = tr.TransCode;
                cmd.Parameters.Add(tl);

                SqlParameter mm = new SqlParameter("@Mobileno",SqlDbType.VarChar,50);
                mm.Value = tr.Mobileno;
                cmd.Parameters.Add(mm);

               
                SqlDataAdapter ds = new SqlDataAdapter(cmd);
                ds.Fill(dt);

            }
            catch(Exception ex)
            {
                if(conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
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
                if(conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }

            return dt;
        }
    }
}
   