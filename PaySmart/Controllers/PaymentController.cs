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
using System.Web.Http.Tracing;
using System.Text;
//using Payengine;
//using Payengine.Controllers;


namespace Paysmart.Controllers
{
    public class PaymentController : ApiController
    {


        [HttpPost]
        [Route("api/Payment/SaveCardsGroup")]
        public DataTable SaveCardsGroup(CardsGroup cg)
        {
            LogTraceWriter traceWriter = new LogTraceWriter();
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveVehicleGroups credentials....");
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();

            try
            {
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "InsUpdCardsGroup";
                cmd.Connection = conn;

                    conn.Open();
                
                    SqlParameter cgCardNumber = new SqlParameter("@CardNumber", SqlDbType.VarChar);
                    cgCardNumber.Value = cg.CardNumber;
                    cmd.Parameters.Add(cgCardNumber);

                    SqlParameter cgCardModel = new SqlParameter();
                    cgCardModel.ParameterName = "@CardModel";
                    cgCardModel.SqlDbType = SqlDbType.VarChar;
                    cgCardModel.Value = cg.CardModel;
                    cmd.Parameters.Add(cgCardModel);

                    SqlParameter cgCardType = new SqlParameter();
                    cgCardType.ParameterName = "@CardType";
                    cgCardType.SqlDbType = SqlDbType.VarChar;
                    cgCardType.Value = cg.CardType;
                    cmd.Parameters.Add(cgCardType);

                    SqlParameter cgCardCategory = new SqlParameter();
                    cgCardCategory.ParameterName = "@CardCategory";
                    cgCardCategory.SqlDbType = SqlDbType.VarChar;
                    cgCardCategory.Value = cg.CardCategory;
                    cmd.Parameters.Add(cgCardCategory);

                    SqlParameter cgStatusId = new SqlParameter();
                    cgStatusId.ParameterName = "@StatusId";
                    cgStatusId.SqlDbType = SqlDbType.VarChar;
                    cgStatusId.Value = cg.Status;
                    cmd.Parameters.Add(cgStatusId);

                    SqlParameter cgUserId = new SqlParameter();
                    cgUserId.ParameterName = "@UserId";
                    cgUserId.SqlDbType = SqlDbType.Int;
                    cgUserId.Value = cg.UserId;
                    cmd.Parameters.Add(cgUserId);

                    SqlParameter cgCustomer = new SqlParameter();
                    cgCustomer.ParameterName = "@Customer";
                    cgCustomer.SqlDbType = SqlDbType.VarChar;
                    cgCustomer.Value = cg.Customer;
                    cmd.Parameters.Add(cgCustomer);

                    SqlParameter cgEffectiveFrom = new SqlParameter();
                    cgEffectiveFrom.ParameterName = "@EffectiveFrom";
                    cgEffectiveFrom.SqlDbType = SqlDbType.DateTime;
                    cgEffectiveFrom.Value = cg.EffectiveFrom;
                    cmd.Parameters.Add(cgEffectiveFrom);

                    SqlParameter cgEffectiveTo = new SqlParameter();
                    cgEffectiveTo.ParameterName = "@EffectiveTo";
                    cgEffectiveTo.SqlDbType = SqlDbType.DateTime;
                    cgEffectiveTo.Value = cg.EffectiveTo;
                    cmd.Parameters.Add(cgEffectiveTo);

                    SqlParameter insupdflag1 = new SqlParameter("@insupdflag", SqlDbType.VarChar, 1);
                    insupdflag1.Value = cg.insupdflag;
                    cmd.Parameters.Add(insupdflag1);

                    SqlDataAdapter db = new SqlDataAdapter(cmd);
                    db.Fill(dt);

                conn.Close();
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveCardGroups Credentials completed.");
               
            }
            catch (Exception ex)
            {
                if (conn != null && conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }

                string str = ex.Message;
                traceWriter.Trace(Request, "1", TraceLevel.Info, "{0}", "Error in SaveCardsGroups:" + ex.Message);
                ///return Request.CreateErrorResponse(HttpStatusCode.NotFound, ex);
              
            }
            return dt;
        }

        [HttpGet]
        [Route("api/Payment/Getpayment")]
        public DataTable Getpayment()
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();

            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getpayment....");

                conn.ConnectionString = ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSGetPayments";

                cmd.Connection = conn;

                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Getpayment successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Getpayment...." + ex.Message.ToString());
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
        [Route("api/Payment/Pay")]
        public DataTable Pay(paymentdetails s)
        {
            DataTable dt = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            SqlConnection conn = new SqlConnection();
            StringBuilder str = new StringBuilder();
            try
            {
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Pay....");

                
                str.Append("CardCategories:" + s.cardcategory + ",");
                str.Append("Status:" + s.status + ",");
                str.Append("Amount:" + s.Amount + ",");
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Input sent...." + str.ToString());

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PSInsUpdPayments";

                cmd.Connection = conn;


                SqlParameter T = new SqlParameter("@flag", SqlDbType.VarChar);
                T.Value = s.flag;
                cmd.Parameters.Add(T);

                SqlParameter q = new SqlParameter("@CardCategories", SqlDbType.VarChar, 50);
                q.Value = s.cardcategory;
                cmd.Parameters.Add(q);

                SqlParameter e = new SqlParameter("@Status", SqlDbType.VarChar, 50);
                e.Value = s.status;
                cmd.Parameters.Add(e);

                SqlParameter q1 = new SqlParameter("@Amount", SqlDbType.Decimal);
                q1.Value = s.Amount;
                cmd.Parameters.Add(q1);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "Pay successful....");

            }
            catch (Exception ex)
            {
                traceWriter.Trace(Request, "0", TraceLevel.Error, "{0}", "Pay...." + ex.Message.ToString());
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
            return (dt);


        }

        //[HttpGet]
        //[Route("api/Payment/PostilionTest")]
        //public Messages.Core.Message.Default PostilionTest()
        //{
        //    Class1 c = new Class1();
        //    return c.GetPositionMssg();
        //}
    }
}
