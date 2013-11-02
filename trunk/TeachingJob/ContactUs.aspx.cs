using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Configuration;
using System.Net.Configuration;
using System.Net.Mail;
using System.Net;
using System.Text;
using TeachingJob.Data;
using System.Resources;
using System.Reflection;

namespace TeachingJob
{
    public partial class ContactUs : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Form.DefaultButton = btn_Submit.UniqueID;
            //try
            //{
            //    ViewState["PreviousPage"] = Request.UrlReferrer.ToString();
            //    hpl_Cancel.NavigateUrl = ViewState["PreviousPage"].ToString();
            //}
            //catch (Exception ex)
            //{
            //    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            //}
        }

        protected void ContactUs_Click(object sender, EventArgs e)
        {
            recaptcha.Validate();
            if (recaptcha.IsValid)
            {
                if (Page.IsValid && recaptcha.IsValid)
                {
                    try
                    {
                        Configuration config = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
                        MailSettingsSectionGroup settings = (MailSettingsSectionGroup)config.GetSectionGroup("system.net/mailSettings");

                        SmtpClient smtp = new SmtpClient();
                        //bkns webmail hosting
                        //smtp.Host = "208.91.199.231";
                        smtp.Host = settings.Smtp.Network.Host;
                        //smtp.EnableSsl = true;

                        NetworkCredential credentials = new NetworkCredential(settings.Smtp.Network.UserName, settings.Smtp.Network.Password);
                        smtp.Credentials = credentials;

                        MailMessage mail = new MailMessage(credentials.UserName, General.MAIL_TO_CONTACT, "Feedback from Teach in Vietnam", GetBody());
                        mail.IsBodyHtml = true;

                        smtp.Send(mail);

                        mail.Dispose();
                        smtp.Dispose();

                        //Utils.SendMail(txt_email.Text.Trim(), "Feedback from Teach in Vietnam", GetBody());
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('Thank you for contacting us.\\nWe will consider your feedback and contact you as soon as possible.');window.location.href='ContactUs.aspx';</script>");
                    }
                    catch (Exception ex)
                    {
                        Page.ClientScript.RegisterClientScriptBlock(GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
                    }
                }
            }
            else
            {
                Assembly ass = Assembly.Load("App_GlobalResources");
                ResourceManager rm = new ResourceManager("Resources.Resource", ass);
                lbl_captStt.Text = rm.GetString("Pleaseentercorrectcaptcha");
            }
        }
        public String GetBody()
        {
            StringBuilder sb = new StringBuilder();

            sb.Append("Hi Admin,<br /><br /> ");
            sb.Append("You have got a feed back.<br /><br />");
            sb.Append(String.Format("<table><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>Reason for contact:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{0}</td></tr><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>Name:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{1}</td></tr><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>Email:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{2}</td></tr><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>Telephone:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{3}</td></tr><tr><td valign='top' style='padding: 8px; border-bottom: 1px solid #fff;border-top: 1px solid transparent;'><b>Message:</b></td><td style='padding: 8px; border-bottom: 1px solid #fff;border-top: 1px solid transparent;'>{4}</td></tr></table><br /><br />", ddl_Subject.SelectedValue, txt_name.Text.Trim(), txt_email.Text.Trim(), txt_Phone.Text.Trim(), HttpUtility.HtmlDecode(txt_Message.Text.Trim().Replace(Environment.NewLine, "<br />"))));

            //sb.Append("<hr /><i>This e-mail is generated automatically. Please do not reply to it.</i><br />");
            //sb.Append("Best regards,<br /><br />Customer Care Department<br />TeachinVietnam");
            //sb.AppendLine();

            StringBuilder strBuilder = new StringBuilder();
            MailUtils mailUtils = new MailUtils(Request);

            strBuilder.Append(mailUtils.MailHeader());
            strBuilder.Append(mailUtils.Body(sb.ToString(), null, false, null, null, "en-US"));
            strBuilder.Append(mailUtils.MailFooter());

            return sb.ToString();
        }
    }
}