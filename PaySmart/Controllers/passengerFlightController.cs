
using HtmlAgilityPack;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
using Paysmart;
using Paysmart.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Http;
using System.Web.Http.Tracing;

namespace paysmart.Controllers
{
    public class ityextEvents : IPdfPageEvent
    {

        //Create object of PdfContentByte
        PdfContentByte pdfContent;

        public void OnChapter(PdfWriter writer, Document document, float paragraphPosition, Paragraph title)
        {
            throw new NotImplementedException();
        }

        public void OnChapterEnd(PdfWriter writer, Document document, float paragraphPosition)
        {
            throw new NotImplementedException();
        }

        public void OnCloseDocument(PdfWriter writer, Document document)
        {
            //throw new NotImplementedException();
        }

        public void OnEndPage(iTextSharp.text.pdf.PdfWriter writer, iTextSharp.text.Document document)
        {

            //create iTextSharp.text Image object using local image path
            //iTextSharp.text.Image imgPDF = iTextSharp.text.Image.GetInstance(HttpContext.Current.Server.MapPath(@"\UI\images\ees-logo.jpg"));

            //Create PdfTable object
            //PdfPTable pdfTab = new PdfPTable(2);

            //We will have to create separate cells to include image logo and 2 separate strings
            //PdfPCell pdfCell1 = new PdfPCell(imgPDF);
            //pdfCell1.Border = 0;
            //pdfCell1.FixedHeight = 50f;
            //pdfCell1.VerticalAlignment = Element.ALIGN_TOP;
            //pdfCell1.Rowspan = 3;
            //BaseFont bfHelvetica = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, false);
            //PdfPTable pdfTab = new PdfPTable(3);
            //PdfPCell cell = new PdfPCell(new Phrase("Extreme Energy Services",new Font(bfHelvetica,20,Font.ITALIC,BaseColor.BLACK)));
            //cell.Colspan = 3;
            //cell.HorizontalAlignment = Element.ALIGN_CENTER;
            //cell.Border = 0;
            //pdfTab.AddCell(cell);

            //PdfPCell cell1 = new PdfPCell(new Phrase("Thru Tubing Fishing & Milling ", new Font(bfHelvetica, 12, Font.ITALIC, BaseColor.BLACK)));
            //cell1.Colspan = 3;
            //cell1.HorizontalAlignment = Element.ALIGN_CENTER;
            //cell1.Border = 0;
            //pdfTab.AddCell(cell1);

            //PdfPCell cell2 = new PdfPCell(new Phrase("1016 QCP Park Dr.  Broussard, La 70518", new Font(bfHelvetica, 12, Font.ITALIC, BaseColor.BLACK)));
            //cell2.Colspan = 3;
            //cell2.HorizontalAlignment = Element.ALIGN_CENTER;
            //cell2.Border = 0;
            //pdfTab.AddCell(cell2);

            //PdfPCell cell4 = new PdfPCell(new Phrase("Phone # 1-337-837-5600 / Fax # 1-337-837-5608", new Font(bfHelvetica, 12, Font.NORMAL, BaseColor.BLACK)));
            //cell4.Colspan = 3;
            //cell4.HorizontalAlignment = Element.ALIGN_CENTER;
            //cell4.Border = 0;
            //pdfTab.AddCell(cell4);

            //PdfPCell blankCell = new PdfPCell(new Phrase(Chunk.NEWLINE));
            //blankCell.Border = PdfPCell.NO_BORDER;
            //pdfTab.AddCell(blankCell);

            //BaseFont bfHelvetica = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, false);
            //Font times = new Font(bfHelvetica, 14, Font.BOLD, BaseColor.BLACK);

            //PdfPCell pdfCell2 = new PdfPCell(new Phrase("Delivery Ticket", times));
            //pdfCell2.HorizontalAlignment = Element.ALIGN_CENTER;
            //pdfCell2.Rowspan = 1;
            //pdfCell2.Border = 0;

            //PdfPCell pdfCell4 = new PdfPCell(new Phrase("", times));
            //pdfCell4.HorizontalAlignment = Element.ALIGN_CENTER;
            //pdfCell2.Rowspan = 3;
            //pdfCell4.Border = 0;

            //Font times6 = new Font(bfHelvetica, 8, Font.BOLD, BaseColor.DARK_GRAY);
            //PdfPCell pdfCell3 = new PdfPCell(new Phrase("1016 QCP Park Drive Broussard La. 70518 (337) 837-5600 Fax (337) 837-5608", times6));
            //pdfCell3.HorizontalAlignment = Element.ALIGN_LEFT;
            //pdfCell3.PaddingRight = 40f;
            //pdfCell3.Border = 0;

            //add all three cells into PdfTable
            //pdfTab.AddCell(pdfCell1);
            //pdfTab.AddCell(pdfCell2);
            //pdfTab.AddCell(pdfCell3);
            //pdfTab.AddCell(pdfCell4);

            //pdfTab.TotalWidth = document.PageSize.Width - 20;
            //call WriteSelectedRows of PdfTable. This writes rows from PdfWriter in PdfTable
            //first param is start row. -1 indicates there is no end row and all the rows to be included to write
            //Third and fourth param is x and y position to start writing
            //pdfTab.WriteSelectedRows(0, -1, document.Left, document.PageSize.Height - 15, writer.DirectContent);

            //pdfTab.WriteSelectedRows(0, -1, document.Left, 820,writer.DirectContent);
            //set pdfContent value
            //pdfContent = writer.DirectContent;
            //Move the pointer and draw line to separate header section from rest of page

        }

        public void OnGenericTag(PdfWriter writer, Document document, Rectangle rect, string text)
        {
            throw new NotImplementedException();
        }

        public void OnOpenDocument(PdfWriter writer, Document document)
        {
            //throw new NotImplementedException();
        }

        public void OnParagraph(PdfWriter writer, Document document, float paragraphPosition)
        {
            //throw new NotImplementedException();
        }

        public void OnParagraphEnd(PdfWriter writer, Document document, float paragraphPosition)
        {
            //throw new NotImplementedException();
        }

        public void OnSection(PdfWriter writer, Document document, float paragraphPosition, int depth, Paragraph title)
        {
            throw new NotImplementedException();
        }

        public void OnSectionEnd(PdfWriter writer, Document document, float paragraphPosition)
        {
            throw new NotImplementedException();
        }

        public void OnStartPage(PdfWriter writer, Document document)
        {
            //throw new NotImplementedException();
        }
    }
    public class passengerFlightController : ApiController
    {
        [HttpGet]
        [Route("api/passengerFlight/getpassenger")]
        public DataTable getpassenger()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Getpassenger";
            cmd.Connection = conn;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;

        }
        [HttpPost]
        [Route("api/passengerFlight/savepassenger")]
        public DataTable savepassenger(List<passengerfight> list)
        {
            string id=null;
            
            byte[] result = null;
            int status;
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection();
            LogTraceWriter tracer = new LogTraceWriter();
            StringBuilder passangersList = new StringBuilder();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            try
            {
                //tracer.Trace(Request, "0",System.Web.Http.Tracing.TraceLevel.Info,"{0}", "passenger....");
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "InsUpdDelpassenger";
                cmd.Connection = conn;
                conn.Open();
                foreach (passengerfight p in list)
                {
                    try
                    {

                        tracer.Trace(Request, "0", TraceLevel.Info, "{0}", "passenger Name: ...." + p.name);
                        cmd.Parameters.Add(new SqlParameter("@Id", SqlDbType.Int)).SqlValue = p.Id;
                        cmd.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar, 50)).SqlValue = p.name;
                        cmd.Parameters.Add(new SqlParameter("@age", SqlDbType.Int)).SqlValue = p.age;
                        cmd.Parameters.Add(new SqlParameter("@gender", SqlDbType.VarChar, 50)).SqlValue = p.gender;
                        cmd.Parameters.Add(new SqlParameter("@appuserid", SqlDbType.Int)).SqlValue = p.appuserid;
                        cmd.Parameters.Add(new SqlParameter("@passengercode", SqlDbType.VarChar, 50)).SqlValue = p.passengercode;
                        cmd.Parameters.Add(new SqlParameter("@flag", SqlDbType.VarChar)).SqlValue = p.flag;
                        cmd.Parameters.Add(new SqlParameter("@seatno", SqlDbType.VarChar,20)).SqlValue = p.seatno;
                        cmd.Parameters.Add(new SqlParameter("@EmailId", SqlDbType.VarChar,50)).SqlValue = p.emailid;
                        cmd.Parameters.Add(new SqlParameter("@ContactNo", SqlDbType.VarChar,50)).SqlValue = p.Mobileno;


                        var fi = cmd.ExecuteScalar();
                        id =Convert.ToString(fi);
                        string pTd = string.Format("<tr width='100%' style='text-align:left;background:#f7f9ff;padding-left:8px'><td align='center'>{0}</td><td align='center'>{1}</td><td align='center'>{2}</td><td align='center'>{3}</td><td align='center'>{4}</td></tr>", p.name, p.name, p.seatno,"Hyderabad","Banglore");

                        passangersList.Append(pTd);
                        cmd.Parameters.Clear();
                        tracer.Trace(Request, "0", TraceLevel.Info, "{0}", p.name + "Passenger is created");
                    }

                    catch (Exception ex)
                    {
                        tracer.Trace(Request, "0", TraceLevel.Info, "{0}", ex.Message);
                        throw ex;
                    }
                }
                result=GeneratePDF1(list);
                #region save ticket information

                string root = HttpContext.Current.Server.MapPath("~/ui/emailtemplates/FlightTicket1.txt");

                string mailContent = System.IO.File.ReadAllText(root);


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
                    mail.To.Add(list[0].emailid);
                    mail.Subject = "Flight Ticket details";
                    mail.Attachments.Add(new Attachment(new MemoryStream(result), "Flight Ticket.pdf")); 
                    mail.IsBodyHtml = true;

                    //{0} - Ticket No
                    //{1} - transId
                    //{2} - from
                    //{3} - to
                    //{4} - departure Data and time
                    //{5} - arrival Date and time
                    //{6} - No of seats
                    //{7} - Seats list
                    //{8} - Vehicle reg number
                    //{9} - Provider name
                    //{10} - distance
                    //{11} - Total amount
                    //{12} - MobileNo 
                    //{13} - Email Address
                    //{14} - Address
                    //{15} - Base fare
                    //{16} - Sub total
                    //{17} - passenger Details

                    mailContent = String.Format(mailContent,passangersList.ToString()); ;
                    mail.Body = mailContent;

                    //SmtpServer.Port = 465;
                    //SmtpServer.Port = 587;
                    SmtpServer.Port = Convert.ToInt32(port);
                    SmtpServer.UseDefaultCredentials = false;

                    SmtpServer.Credentials = new System.Net.NetworkCredential(username, pwd);
                    SmtpServer.EnableSsl = true;
                    //SmtpServer.TargetName = "STARTTLS/smtp.gmail.com";
                    SmtpServer.Send(mail);
                    status = 1;
                    dt.Columns.Add("Pdf");
                    dt.Columns.Add("description", typeof(byte[]));

                    dt.Columns.Add("pid");
                    dt.Columns.Add("PasssengerId");

                    DataRow dr1 = dt.NewRow();
                    dr1[0] = "pdfformat";
                    dr1[1] = result.ToArray();
                    //dr[1] = mailContent;

                    dr1[2] = 1;
                    dr1[3] = id.ToString() ;
                    dt.Rows.Add(dr1);
                }
                catch (Exception ex)
                {
                    //throw new HttpResponseException(Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message));
                    status = 0;
                    dt.Columns.Add("Code");
                    dt.Columns.Add("description");
                   
                    DataRow dr = dt.NewRow();
                    dr[0] = "ERR001";
                    dr[1] = ex.Message;
                    dt.Rows.Add(dr);
                }
                #endregion 
            }
            catch (Exception ex)
            {
                tracer.Trace(Request, "0", System.Web.Http.Tracing.TraceLevel.Info, "{0}", ex.Message);
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

        private byte[] GeneratePDF1(List<passengerfight> list)
        {            
            using (MemoryStream memoryStream = new MemoryStream())
            {
                StringBuilder sb = new StringBuilder();
                HtmlDocument htmlDocument = new HtmlDocument();
                byte[] bytes = null;
               
                htmlDocument.Load(@"" + HttpContext.Current.Server.MapPath("/UI/EmailTemplates/FBoardPass.html"));
                //relplace all column values

                if (list.Count > 0)
                {
                   
                   String pattern = @"\{\{name\}\}";
                    htmlDocument.DocumentNode.InnerHtml = Regex.Replace(htmlDocument.DocumentNode.InnerHtml, pattern, list[0].name + "");


                    HtmlNode tblBody = htmlDocument.GetElementbyId("passenger-body");

                    //  var hrRow = "<tr><td colspan = \"10\"><hr/></td></tr>";

                    for (int count = 0; count < list.Count; count++)
                    {
                        tblBody.InnerHtml += "<tr width=\"100%\" style=\"text-align:center;background:#f7f9ff;padding-left:8px;\"><td>AirIndia520</td><td>" + list[count].name+"</td><td>"+ list[count].seatno+ "</td><td>Hyderabad</td><td>Banglore</td></tr>";
                        tblBody.InnerHtml += "<tr><td colspan = \"5\" style=\"border-bottom:1px solid black;\"></td></tr>";
                    }

                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 25f, 10f);
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, memoryStream);

                    writer.PageEvent = new ityextEvents();
                    // open the document for writing  
                    pdfDoc.Open();
                    // read html data to StringReader  
                    using (var html = new StringReader(htmlDocument.DocumentNode.InnerHtml.ToString()))
                    {
                        XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, html);
                    }

                    // close document  
                    pdfDoc.Close();

                    bytes = memoryStream.ToArray();
                    memoryStream.Close();
                }
                return bytes;
            }
        }
    }
}
