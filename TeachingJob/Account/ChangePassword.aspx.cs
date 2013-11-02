using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeachingJob.Data;

namespace TeachingJob.Account
{
    public partial class ChangePassword : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button ChangePasswordPushButton = ChangeUserPassword.ChangePasswordTemplateContainer.FindControl("ChangePasswordPushButton") as Button;
            Page.Form.DefaultButton = ChangePasswordPushButton.UniqueID;

            WebControl control = ChangeUserPassword.ChangePasswordTemplateContainer.FindControl("CurrentPassword") as WebControl;
            if (control != null) { Page.Form.DefaultFocus = control.ClientID; }

            if (!IsPostBack)
            {
                try
                {
                    ViewState["PreviousPageUrl"] = Request.UrlReferrer.ToString();
                }
                catch (Exception)
                {
                    
                }
            }
        }
        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(ViewState["PreviousPageUrl"].ToString());
        }
    }
}
