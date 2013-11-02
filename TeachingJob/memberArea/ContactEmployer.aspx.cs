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
    public partial class ContactEmployer : BasePage
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        string userId;
        int jId;
        public string UserId
        {
            get { return userId; }
            set { userId = value; }
        }
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
            MembershipUser mu = Membership.GetUser();

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
            lbl_YourMail.Text = mu.Email;
            txt_Subject.Text = "Application for " + Dj.Title + " via TeachinVietnam";
            txt_FullName.Text = Context.Profile.GetPropertyValue("Employee.FirstName").ToString() + " " + Context.Profile.GetPropertyValue("Employee.LastName").ToString();

            userId = mu.ProviderUserKey.ToString();
            if (!IsPostBack)
            {
                if (!Directory.Exists(Server.MapPath("~/temp/" + UserId)))
                {
                    Directory.CreateDirectory(Server.MapPath("~/temp/" + UserId));
                }
                string[] filePaths = Directory.GetFiles(Server.MapPath("~/temp/" + UserId + "/"), "*.*",
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
            string[] filePaths = Directory.GetFiles(Server.MapPath("~/temp/" + UserId + "/"), "*.*",
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
                //String builder is the body
                StringBuilder sb = new StringBuilder();

                MailUtils mailUtils = new MailUtils(Request);
                StringBuilder strBuilder = new StringBuilder();
                strBuilder.Append(mailUtils.MailHeader());

                //english content
                String href = "publicarea/JobDetails.aspx?jid=" + Dj.Id + "&lang=en";
                String linkLabel = "Click here to view this job's details";
                sb.Append("Hi " + Context.Profile.GetPropertyValue("Employee.FirstName").ToString() + " " + Context.Profile.GetPropertyValue("Employee.LastName").ToString() + ",<br /><br /> ");
                sb.Append("You have successfully applied for the job.<br />");
                sb.Append(String.Format("<table style='margin-left:25px;'><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>Job Title:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{0}</td></tr><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>Organization:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{1}</td></tr><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>Job Details:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'><a style='text-decoration: none; color: #86ac3d;' href='{2}/{3}'> &raquo; {4}</a></td></tr></table>", Dj.Title, Dj.OrgName, Request.Url.GetLeftPart(UriPartial.Authority), href, linkLabel));

                strBuilder.Append(mailUtils.Body(sb.ToString(), null, false, href, linkLabel, "en-US"));
                strBuilder.Append(mailUtils.Seperator());
                //Vietnamese content.
                href = "publicarea/JobDetails.aspx?jid=" + Dj.Id + "&lang=vi";
                linkLabel = "Mời bạn click vào đây để xem thông tin công việc.";
                sb.Clear();
                sb.Append("Chào " + Context.Profile.GetPropertyValue("Employee.FirstName").ToString() + " " + Context.Profile.GetPropertyValue("Employee.LastName").ToString() + ",<br /><br /> ");
                sb.Append("Bạn vừa ứng tuyển thành công! <br />");
                sb.Append(String.Format("<table style='margin-left:25px;'><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>Vị trí:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{0}</td></tr><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>Tổ chức:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{1}</td></tr><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>Job Details:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'><a style='text-decoration: none; color: #86ac3d;' href='{2}/{3}'> &raquo; {4}</a></td></tr></table>", Dj.Title, Dj.OrgName, Request.Url.GetLeftPart(UriPartial.Authority), href, linkLabel));

                strBuilder.Append(mailUtils.Body(sb.ToString(), null, false, href, linkLabel, "vi-VN"));

                strBuilder.Append(mailUtils.MailFooter());

                //--- Employer side
                StringBuilder sr = new StringBuilder();
                sr.Append(mailUtils.MailHeader());

                String title = string.Format("Hi {0},<br />Here is {1}'s application for <b>{2}</b><br />", Dj.Contact, txt_FullName.Text, lbl_JobTitle.Text);
                title += string.Format("On {0:ddd, MMM dd, yyyy} at {1}, {2} &lt;{3}&gt; wrote:<hr />", DateTime.Now, DateTime.Now.ToShortTimeString(), txt_FullName.Text, lbl_YourMail.Text);

                String body = HttpUtility.HtmlDecode(txtMessage.Text.Replace(Environment.NewLine, "<br />"));
                sr.Append(mailUtils.Body(title, body, false));
                sr.Append(mailUtils.MailFooter());

                try
                {
                    //notify recruiter that this userid has applied for his job. Build the table like app managemt like candidate.
                    SendMail(Dj.EmailForEmployer, sr.ToString(), true);

                    //To the candidate
                    SendMail(lbl_YourMail.Text, strBuilder.ToString(), false);
                    facade.SaveAJob(UserId, JId, txt_FullName.Text);

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
                    string[] filePaths = Directory.GetFiles(Server.MapPath("~/temp/" + UserId + "/"), "*.*",
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
                email.From = new System.Net.Mail.MailAddress(settings.Smtp.Network.UserName, "Teachinvietnam.org");
                email.IsBodyHtml = true;                        //Allow css for body

                if (attach == true)
                {
                    //fileUploadName(AsyncFileUpload1);
                    files = Directory.GetFiles(Server.MapPath("~/temp/" + UserId + "/"), "*.*",
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
                    string fileUploadDir = Server.MapPath("~/temp/" + UserId + "/");
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