using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using TeachingJob.Data;

namespace TeachingJob.Account
{
    public partial class RecoveryPwd : BasePage
    {
        MembershipUser mu;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string username = Request.Params["userName"];
                mu = Membership.GetUser(username);
                lbl_Username.Text = mu.UserName;
            }
            catch (ArgumentNullException)
            {
                Response.Redirect("~/");
            }
        }
        protected void Update_Click(object sender, EventArgs e)
        {
            try
            {
                string newPwd = mu.ResetPassword();
                mu.ChangePassword(newPwd, NewPassword.Text);
                //Membership.UpdateUser(mu);
                Response.Redirect("RecoveryPasswordSuccess.aspx?username=" + mu.UserName);
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + ". Please contact administration.');</script>");
                //throw ex;
            }
        }
        protected void Cancel_Click(object sender, EventArgs e)
        {
            NewPassword.Text = "";
            ConfirmNewPassword.Text = "";
        }
    }
}