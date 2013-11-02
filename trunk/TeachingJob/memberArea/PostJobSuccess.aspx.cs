using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeachingJob.Data;

namespace TeachingJob.memberArea
{
    public partial class PostJobSuccess : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.IsInRole("Organization"))
            {
                lbl_Username.Text = Context.Profile.GetPropertyValue("Employer.FirstName").ToString() + " " + Context.Profile.GetPropertyValue("Employer.LastName").ToString();
            }
        }
    }
}