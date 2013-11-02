using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Web.Security;
using System.Text;
using System.Net;
using System.Web.Configuration;
using System.Net.Configuration;
using TeachingJob.Data;

namespace TeachingJob.Account
{
    public partial class RecoveryPassword : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button btn_Recovery = PasswordRecovery1.UserNameTemplateContainer.FindControl("SubmitButton") as Button;
            Form.DefaultButton = btn_Recovery.UniqueID;

            WebControl control = PasswordRecovery1.UserNameTemplateContainer.FindControl("UserName") as WebControl;
            if (control != null) { Page.Form.DefaultFocus = control.ClientID; }

            if (!IsPostBack)
            {
                try
                {
                    ViewState["PreviousPageUrl"] = Request.UrlReferrer.ToString();
                }
                catch (NullReferenceException)
                {
                    ViewState["PreviousPageUrl"] = "~/Account/Login.aspx";
                }
            }
            if (IsPostBack) { Literal1.Visible = false; }
        }
        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(ViewState["PreviousPageUrl"].ToString());
        }
        protected void PwdRecovery_SendingMail(object sender, EventArgs e)
        {
            try
            {
                MembershipUser mu = Membership.GetUser(PasswordRecovery1.UserName);
                //string resetPwd = mu.ResetPassword();
                string emailAddress = mu.Email;
                // Lets get the user's id
                Guid userId = (Guid)Membership.GetUser(PasswordRecovery1.UserName).ProviderUserKey;

                MailUtils mailUtils = new MailUtils(Request);
                StringBuilder strBuilder = new StringBuilder();
                
                // Now lets create an email message
                StringBuilder emailMessage = new StringBuilder();

                if (User.IsInRole("Employee"))
                {
                    emailMessage.Append(String.Format("Dear {0},", Context.Profile.GetPropertyValue("Employee.FirstName") + " " + Context.Profile.GetPropertyValue("Employee.LastName")));
                }
                else if (User.IsInRole("Organization"))
                {
                    emailMessage.Append(String.Format("Dear {0},", Context.Profile.GetPropertyValue("Employer.FirstName") + " " + Context.Profile.GetPropertyValue("Employer.LastName")));
                }
                else
                {
                    emailMessage.Append(String.Format("Dear {0},",PasswordRecovery1.UserName));
                }
                emailMessage.Append("<br /><br />");
                emailMessage.Append(string.Format("You have recently requested to reset your password on <b>teachinVietnam.org</b>.<br /> Please click <a href='{1}/Account/RecoveryPwd.aspx?userName={0}&lang=en'>here</a> to reset your password.<br />", PasswordRecovery1.UserName, Request.Url.GetLeftPart(UriPartial.Authority)));
                emailMessage.Append("If you did not require a new password, just disregard this message and continue using your current one.");


                strBuilder.Append(mailUtils.MailHeader());
                strBuilder.Append(mailUtils.Body(emailMessage.ToString(), null, false, null, null, "en-US"));
                strBuilder.Append(mailUtils.Seperator());

                emailMessage.Clear();
                if (User.IsInRole("Employee"))
                {
                    emailMessage.Append(String.Format("Xin chào {0},", Context.Profile.GetPropertyValue("Employee.FirstName") + " " + Context.Profile.GetPropertyValue("Employee.LastName")));
                }
                else if (User.IsInRole("Organization"))
                {
                    emailMessage.Append(String.Format("Xin chào {0},", Context.Profile.GetPropertyValue("Employer.FirstName") + " " + Context.Profile.GetPropertyValue("Employer.LastName")));
                }
                else
                {
                    emailMessage.Append(String.Format("Xin chào {0},", PasswordRecovery1.UserName));
                }

                emailMessage.Append("<br /><br />");
                emailMessage.Append(string.Format("Bạn đã yêu cầu khôi phục mật khẩu trên <b>teachinVietnam.org</b>.<br /> Mời click vào <a href='{1}/Account/RecoveryPwd.aspx?userName={0}&lang=vi'>đây</a> để khôi phục lại mật khẩu.<br />", PasswordRecovery1.UserName, Request.Url.GetLeftPart(UriPartial.Authority)));
                emailMessage.Append("Nếu bạn không yêu cầu khôi phục mật khẩu, hãy bỏ qua thư này và tiếp tục sử dụng mật khẩu cũ của bạn.");

                strBuilder.Append(mailUtils.Body(emailMessage.ToString(), null, false, null, null, "vi-VN"));
                strBuilder.Append(mailUtils.MailFooter());

                Utils.SendMail(emailAddress, "TeachinVietnam - Recovery Password Confirmation", strBuilder.ToString());
            }
            catch (Exception ex)
            {
                //Response.Redirect("~/publicArea/errorpages/ErrorNetworkNotFound.aspx");
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('Please go to your email and follow the directions to get back your password!');</script>");
        }
    }
}