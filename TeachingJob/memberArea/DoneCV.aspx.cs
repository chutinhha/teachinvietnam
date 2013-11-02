using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using TeachingJob.Data;

namespace TeachingJob.memberArea
{
    public partial class DoneCV : BasePage
    {
        string cvname;

        public string Cvname
        {
            get { return cvname; }
            set { cvname = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                MembershipUser mu = Membership.GetUser();
                lbl_Username.Text = Context.Profile.GetPropertyValue("Employee.FirstName").ToString();
                Cvname = mu.UserName;
                hpl.NavigateUrl = "~/publicArea/CV/Detail.aspx?cvname=" + mu.ProviderUserKey.ToString();
            }
            catch(Exception)
            {

            }
        }
    }
}