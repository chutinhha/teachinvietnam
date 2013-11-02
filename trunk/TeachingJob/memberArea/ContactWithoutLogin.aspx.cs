using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;
using System.Web.Security;
using Subgurim.Controles;
using BusinessLogic;
using System.Configuration;
using System.Net.Configuration;
using System.Web.Configuration;
using AjaxControlToolkit;
using com.flajaxian;
using TeachingJob.Data;

namespace TeachingJob.memberArea
{
    public partial class ContactWithoutLogin : System.Web.UI.Page
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        
        int jId;
        public int JId
        {
            get { return jId; }
            set { jId = value; }
        }
        DetailJob dj;

        public DetailJob Dj
        {
            get { return dj; }
            set { dj = value; }
        }
        BusinessFacade facade;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    ViewState["PreviousPageUrl"] = Request.UrlReferrer.ToString();
                }
                catch (Exception)
                {
                    Response.Redirect("~/");
                }
            }
            facade = new BusinessFacade(myConn);
            Form.DefaultButton = btn_SendMail.UniqueID;

            if (string.IsNullOrEmpty(Request.Params["jId"]))
            {
                Response.Redirect("~/publicArea/errorpages/Error404.aspx");
            }
            else
            {
                JId = Convert.ToInt16(Request.Params["jId"]);
            }

            Dj = facade.GetDetailJobById(JId);
            //Job detail
            lbl_JobTitle.Text = Dj.Title;
            lbl_OrgName.Text = Dj.OrgName;
            txt_Subject.Text = "Application for " + Dj.Title + " via TeachinVietnam";

            if (!IsPostBack)
            {
                if (!Directory.Exists(Server.MapPath("~/temp/anonymous")))
                {
                    Directory.CreateDirectory(Server.MapPath("~/temp/anonymous"));
                }
                string[] filePaths = Directory.GetFiles(Server.MapPath("~/temp/anonymous/"), "*.*",
                                            SearchOption.AllDirectories);
                foreach (string path in filePaths)
                {
                    File.Delete(path);
                }
            }
            //Limit characters
            txtMessage.Attributes.Add("onkeydown", "textCounter(this,'" + Label1.ClientID + "', 5000)");
            txtMessage.Attributes.Add("onkeyup", "textCounter(this,'" + Label1.ClientID + "', 5000)");
            txtMessage.Attributes.Add("onmousedown", "textCounter(this,'" + Label1.ClientID + "', 5000)");
            txtMessage.Attributes.Add("onmouseup", "textCounter(this,'" + Label1.ClientID + "', 5000)");
            txtMessage.Attributes.Add("onblur", "textCounter(this,'" + Label1.ClientID + "', 5000)");
        }
        protected void lbtn_Cancel_Click(object sender, EventArgs e)
        {
            string[] filePaths = Directory.GetFiles(Server.MapPath("~/temp/anonymous/"), "*.*",
                                            SearchOption.AllDirectories);
            foreach (string path in filePaths)
            {
                File.Delete(path);
            }
            Response.Redirect(ViewState["PreviousPageUrl"].ToString());
        }
        protected void SendMail_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                MailUtils mailUtils = new MailUtils(Request);
                
                //--- Employer side
                StringBuilder sr = new StringBuilder();
                sr.Append(mailUtils.MailHeader());

                String title = string.Format("Dear {0},<br />You have an application for <b>{1}</b><br />", Dj.Contact, lbl_JobTitle.Text);
                title += string.Format("This message was sent on {0:ddd, MMM dd, yyyy} at {1}.<hr />", DateTime.Now, DateTime.Now.ToShortTimeString());

                String body = HttpUtility.HtmlDecode(txtMessage.Text.Replace(Environment.NewLine, "<br />"));
                sr.Append(mailUtils.Body(title, body, false));
                sr.Append(mailUtils.MailFooter());

                try
                {
                    //notify recruiter that this userid has applied for his job. Build the table like app managemt like candidate.
                    SendMail(Dj.EmailForEmployer, sr.ToString(), true);

                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "PopupScript", "<script>window.location.href='finish-apply.aspx?org="+Dj.OrgName+"';</script>");
                    if (sent)
                    {
                        Response.Redirect("finish-apply.aspx?org=" + Dj.OrgName);
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('Your application is not sent.\nPlease try again.');</script>");
                    }
                }
                catch (SmtpException)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('Your email is not existed or there would be problem with your internet connection.\nPlease try again.');</script>");
                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
                }
                finally
                {
                    string[] filePaths = Directory.GetFiles(Server.MapPath("~/temp/anonymous/"), "*.*",
                                            SearchOption.AllDirectories);
                    foreach (string path in filePaths)
                    {
                        File.Delete(path);
                    }
                }
            }
        }
        private bool sent = false;
        protected void SendMail(string Mailto, string body, Boolean attach)
        {
            SmtpClient smtpClient = null;
            MailMessage email = null;
            string[] files = null;
            try
            {
                //Mail setting 
                Configuration config = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
                MailSettingsSectionGroup settings = (MailSettingsSectionGroup)config.GetSectionGroup("system.net/mailSettings");

                //--
                smtpClient = new SmtpClient();
                smtpClient.Host = settings.Smtp.Network.Host;
                smtpClient.EnableSsl = settings.Smtp.Network.EnableSsl;
                System.Net.NetworkCredential credentials = new System.Net.NetworkCredential(settings.Smtp.Network.UserName, settings.Smtp.Network.Password);
                smtpClient.Credentials = credentials;


                email = new MailMessage(credentials.UserName, Mailto, txt_Subject.Text.Trim(), body);
                email.IsBodyHtml = true;                        //Allow css for body


                if (attach == true)
                {
                    //fileUploadName(AsyncFileUpload1);
                    files = Directory.GetFiles(Server.MapPath("~/temp/anonymous/"), "*.*",
                                                 SearchOption.AllDirectories);
                    foreach (string file in files)
                    {
                        Attachment att = new Attachment(file);
                        email.Attachments.Add(att);
                    }
                }

                smtpClient.Send(email);
                sent = true;
            }
            catch (SmtpException smtpEx)
            {
                //day len phuong thuc goi no'
                throw smtpEx;
                //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('Your email is not existed or there would be problem with your internet connection.\nPlease try again.');</script>");
            }
            catch (Exception ex)
            {
                throw ex;
                //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                email.Dispose();
                smtpClient.Dispose();
                if (attach == true)
                {
                    foreach (string path in files)
                    {
                        File.Delete(path);
                    }
                }
                if (AsyncFileUpload1.HasFile)
                {
                    AsyncFileUpload1.ClearAllFilesFromPersistedStore();
                }
            }
        }
        public bool IsValidImage(string fileName)
        {
            Regex regex = new Regex(@"(.*?)\.(jpg|JPG|jpeg|JPEG|png|PNG|gif|GIF|bmp|BMP|PDF|pdf|doc|DOC|DOCX|docx|ppt|PPT|rar|RAR|zip|ZIP)$");
            return regex.IsMatch(fileName);
        }
        protected void AsyncFileUpload1_UploadedComplete(object sender, AsyncFileUploadEventArgs e)
        {
            if (AsyncFileUpload1.HasFile)
            {
                if (!IsValidImage(AsyncFileUpload1.PostedFile.FileName))
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('You have upload an invalid file. Please select another one.');</script>");
                }
                else
                {
                    string fileUploadDir = Server.MapPath("~/temp/anonymous/");
                    if (!System.IO.Directory.Exists(fileUploadDir))
                    {
                        System.IO.Directory.CreateDirectory(fileUploadDir);
                    }
                    AsyncFileUpload1.SaveAs(fileUploadDir + AsyncFileUpload1.PostedFile.FileName);
                }
            }
        }
    }
}