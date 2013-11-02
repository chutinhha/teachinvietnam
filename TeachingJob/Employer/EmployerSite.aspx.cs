using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using System.Web.Security;
using TeachingJob.Data;
using System.Reflection;
using System.Resources;

namespace TeachingJob.Employer
{
    public partial class EmployerSite : BasePage
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;
        protected void Page_Load(object sender, EventArgs e)
        {
            facade = new BusinessFacade(myConn);
            int noOfUnread = 0;
            try
            {
                MembershipUser mu = Membership.GetUser();
                string employerId = mu.ProviderUserKey.ToString();

                noOfUnread = facade.NoOfUnread(employerId);
            }
            catch (NullReferenceException)
            {
                FormsAuthentication.SignOut();
            }
            Assembly ass = Assembly.Load("App_GlobalResources");
            ResourceManager rm = new ResourceManager("Resources.Resource", ass);

            if (noOfUnread == 0)
            {
                lbl_NewApply.Text = rm.GetString("Nonewapply");
            }
            else if (noOfUnread > 0)
            {
                lbl_NewApply.Text = noOfUnread + " "+rm.GetString("newapply");
            }

            lbl_firstname.Text = Context.Profile.GetPropertyValue("Employer.Salutation").ToString() + " " + HttpContext.Current.Profile.GetPropertyValue("Employer.FirstName").ToString() + " " + HttpContext.Current.Profile.GetPropertyValue("Employer.LastName").ToString();
        }
    }
}