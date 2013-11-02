using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using TeachingJob.Data;

namespace TeachingJob.publicArea.CV
{
    public partial class RequestSuccess : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.IsInRole("Employee"))
            {
                HyperLink2.NavigateUrl = "~/Account/my-jobs.aspx";
                HyperLink2.Text = "Please click here to return your management site!";
                Literal1.Text = Context.Profile.GetPropertyValue("Employee.FirstName").ToString() + " " + Context.Profile.GetPropertyValue("Employee.LastName").ToString();
                Literal4.Visible = false;
            }
            else if (User.IsInRole("Organization"))
            {
                Literal1.Text = Context.Profile.GetPropertyValue("Employer.FirstName").ToString() + " " + Context.Profile.GetPropertyValue("Employer.LastName").ToString();
            }
            else
            {
                Literal1.Text = "";
                HyperLink2.NavigateUrl = "~/";
                HyperLink2.Text = "Please click here to return home page";
            }
        }
    }
}