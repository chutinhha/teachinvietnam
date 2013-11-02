using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace TeachingJob.memberArea
{
    public partial class directive : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (User.IsInRole("Organization"))
                {
                    Response.Redirect("~/Employer/EmployerSite.aspx?r=e");
                }
                else if (User.IsInRole("Employee"))
                {
                    Response.Redirect("~/Account/my-jobs.aspx");
                }
                else if (User.IsInRole("superadmin"))
                {
                    Response.Redirect("~/admintj/User.aspx");
                }
                else if (User.IsInRole("admin"))
                {
                    Response.Redirect("~/admintj/User.aspx");
                }
                else
                {
                    Response.Redirect("~/");
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}