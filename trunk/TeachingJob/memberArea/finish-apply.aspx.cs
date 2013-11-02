using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeachingJob.Data;

namespace TeachingJob.memberArea
{
    public partial class finish_apply : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["org"] == null)
            {
                Response.Redirect("~/publicArea/errorpages/Error404.aspx");
            }
            else
            {
                lbl_org.Text = " " + Request.Params["org"].ToString();
            }
            try
            {
                if (Context.Profile.GetProfileGroup("Employee").GetPropertyValue("FirstName").ToString() != "" && Context.Profile.GetProfileGroup("Employee").GetPropertyValue("FirstName").ToString() != null && Context.Profile.GetProfileGroup("Employee").GetPropertyValue("FirstName").ToString().Length != 0)
                {
                    lbl_Username.Text = Context.Profile.GetProfileGroup("Employee").GetPropertyValue("FirstName").ToString();
                }
                else
                {
                    lbl_Username.Text = "candidate";
                }
            }
            catch (Exception)
            {
                Response.Redirect("~/publicArea/errorpages/Error404.aspx");
            }
        }
    }
}