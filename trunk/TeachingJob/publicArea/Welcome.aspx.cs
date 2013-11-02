using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Reflection;
using System.Resources;
using TeachingJob.Data;

namespace TeachingJob.publicArea
{
    public partial class Welcome : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (User.IsInRole("Employee"))
                {
                    lbl_Username.Text = Context.Profile.GetProfileGroup("Employee").GetPropertyValue("FirstName").ToString();
                }
                else if (User.IsInRole("Organization"))
                {
                    Assembly ass = Assembly.Load("App_GlobalResources");
                    ResourceManager rm = new ResourceManager("Resources.Resource", ass);

                    lbl_Username.Text = Context.Profile.GetPropertyValue("Employer.FirstName").ToString();
                    HyperLink2.Text = rm.GetString("Pleaseclickheretoyourmanagement");
                    HyperLink2.NavigateUrl = "~/Employer/EmployerSite.aspx";
                    HyperLink1.Text = rm.GetString("Pleaseclickheretopostajob");
                    HyperLink1.NavigateUrl = "~/memberArea/AdsAJob.aspx";
                }
                else
                {
                    lbl_Username.Visible = false;
                    HyperLink1.Visible = false;
                    HyperLink2.Visible = false;
                }
            }
            catch (Exception)
            {
                Response.Redirect("~/publicArea/errorpages/Error404.aspx");
            }
        }
    }
}