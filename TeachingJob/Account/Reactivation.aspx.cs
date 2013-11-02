using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using TeachingJob.Data;
using System.Text;

namespace TeachingJob.Account
{
    public partial class Reactivation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Form.DefaultFocus = UserName.ClientID;
            Form.DefaultButton = SubmitButton.UniqueID;
        }
        protected void PwdReactivate_SendingMail(object sender, EventArgs e)
        {
            try
            {
                MembershipUser mu = Membership.GetUser(UserName.Text.Trim());
                Roles.GetRolesForUser(UserName.Text.Trim());
                
                StringBuilder emailMessage = new StringBuilder();

                emailMessage.Append(String.Format("Dear {0},<br /><br />", UserName.Text));
                emailMessage.Append("You’ve just request for TeachinVietnam account reactivation mail.<br />Here are the login details:<br />");
                emailMessage.Append(String.Format("<table style='margin-left:25px;'><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>User ID:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{0}</td></tr></table><br />", UserName.Text.Trim()));
                emailMessage.Append(String.Format("To reactivate your account, please <a href='{2}/publicArea/ActivateUser.aspx?userName={0}&Id={1}&lang=en'>click here</a>.<br />", UserName.Text.Trim(), mu.ProviderUserKey.ToString(), Request.Url.GetLeftPart(UriPartial.Authority)));
                emailMessage.Append(String.Format("Please <a href='{0}/ContactUs.aspx'>contact us</a> if you have any problem with the website.", Request.Url.GetLeftPart(UriPartial.Authority)));

                StringBuilder strBuilder = new StringBuilder();
                MailUtils mailUtil = new MailUtils(Request);
                strBuilder.Append(mailUtil.MailHeader());
                strBuilder.Append(mailUtil.Body(emailMessage.ToString(), null, false, null, null, "en-US"));
                strBuilder.Append(mailUtil.MailFooter());

                TeachingJob.Data.Utils.SendMail(UserName.Text.Trim(), "TeachinVietnam account activation.", strBuilder.ToString());

                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('An activation email has been sent to your email address.\\nPlease follow the instruction to activate your account.');window.location.href='login.aspx';</script>");
            }
            catch (Exception)
            {
                FailureText.Text = "Your account does not exist. Please check it again!";
                //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Account/Login.aspx");
        }
    }
}