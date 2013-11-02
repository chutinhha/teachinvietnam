using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Text;
using System.Configuration;
using System.Net.Configuration;
using System.Web.Configuration;
using System.Net.Mail;
using System.Net;
using TeachingJob.Data;
using System.Reflection;
using System.Resources;

namespace TeachingJob.Account
{
    public partial class RecoveryPasswordSuccess : BasePage
    {
        //string pwd;
        //public string Pwd
        //{
        //    get { return pwd; }
        //    set { pwd = value; }
        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string username = Request.Params["username"];
                MembershipUser mu = Membership.GetUser(username);
                Assembly ass = Assembly.Load("App_GlobalResources");
                ResourceManager rm = new ResourceManager("Resources.Resource", ass);

                Literal1.Text = rm.GetString("hi") + " " + username + ",";

                if (Roles.IsUserInRole(username, "organization"))
                {
                    Literal3.Text = rm.GetString("ClickheretologinEmp");
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
            //Mail setting 
            //Configuration config = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
            //MailSettingsSectionGroup settings = (MailSettingsSectionGroup)config.GetSectionGroup("system.net/mailSettings");

            //if (String.IsNullOrEmpty(Request.Params["userName"]))
            //{
            //    Response.Redirect("~/publicArea/errorpages/Error404.aspx");
            //}
            //else
            //{
            //    try
            //    {
            //        string userName = Request.Params["userName"];
            //        MembershipUser mu = Membership.GetUser(userName);
            //        Pwd = mu.ResetPassword();
            //        Membership.UpdateUser(mu);

            //        StringBuilder sb = new StringBuilder();
            //        sb.Append(string.Format("Xin chào, <br /><br />"));
            //        sb.Append("Bạn vừa kích hoạt chức năng hồi phục mật khẩu trên TeachinVietnam.");
            //        sb.Append("<br /><br />");
            //        sb.Append("Đây là thông tin mới của bạn để truy cập vào trang web TeachinVietnam.<br /><br />");
            //        sb.Append(String.Format("<table><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>Tài khoản truy cập:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{0}</td></tr><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>Mật khẩu:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{1}</td></tr></table><br /><br />", mu.UserName, Pwd));
            //        sb.Append("<i>Lưu ý: Bạn nên thay đổi lại mật khẩu để thuận tiện cho việc sử dụng về sau.</i><br /><br /> ");
            //        sb.Append("Vui lòng liên hệ nếu bạn có bất kì thắc mắc nào liên quan đến tài khoản.<br /><br />");
            //        sb.Append("<i>Đây là email tự động, vui lòng không trả lời (reply) email này. </i><br /><br /> ");
            //        sb.Append("Cảm ơn bạn đã sử dụng dịch vụ của TeachinVietnam.<br /><br />Thân mến,<br /><br />Phòng Dịch Vụ Khách Hàng<br />TeachinVietnam");

            //        SmtpClient smtpClient = new SmtpClient();
            //        smtpClient.Host = settings.Smtp.Network.Host;
            //        smtpClient.EnableSsl = settings.Smtp.Network.EnableSsl;
            //        NetworkCredential credential = new NetworkCredential(settings.Smtp.Network.UserName, settings.Smtp.Network.Password);
            //        smtpClient.Credentials = credential;

            //        MailMessage email = new MailMessage();
            //        email.From = new MailAddress(settings.Smtp.Network.UserName);
            //        email.To.Add(new MailAddress(mu.UserName));
            //        email.Subject = "TeachinVN - get restored password";
            //        email.IsBodyHtml = true;
            //        email.Body = sb.ToString();
            //        try
            //        {
            //            // Send the email
            //            smtpClient.Send(email);
            //        }
            //        catch (Exception wex)
            //        {
            //            Response.Redirect("~/publicArea/errorpages/ErrorNetworkNotFound.aspx");
            //        }
            //    }
            //    catch (Exception ex)
            //    {

            //    }
            //}
        }
    }
}