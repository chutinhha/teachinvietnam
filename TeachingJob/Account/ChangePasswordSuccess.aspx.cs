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
    public partial class ChangePasswordSuccess : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                MembershipUser mu = Membership.GetUser();
                if (User.IsInRole("Organization"))
                {
                    lbl_Username.Text = Context.Profile.GetPropertyValue("Employer.FirstName").ToString() + " " + Context.Profile.GetPropertyValue("Employer.LastName").ToString();
                    hpl_appManagement.NavigateUrl = "~/Employer/EmployerSite.aspx";
                }
                else if (User.IsInRole("Employee"))
                {
                    lbl_Username.Text = Context.Profile.GetPropertyValue("Employee.FirstName").ToString() + " " + Context.Profile.GetPropertyValue("Employee.LastName").ToString();
                }
                else
                {
                    lbl_Username.Text = mu.UserName;
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
