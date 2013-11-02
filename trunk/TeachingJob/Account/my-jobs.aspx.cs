using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using BusinessLogic;
using System.Reflection;
using System.Resources;
using TeachingJob.Data;
namespace TeachingJob.Account
{
    public partial class my_jobs : BasePage
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;
        String userId;
        public string UserId
        {
            get { return userId; }
            set { userId = value; }
        }

        int sjCount;
        public int SjCount
        {
            get { return sjCount; }
            set { sjCount = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Neu da tao CV Thi chi co update
            if ((Boolean)Context.Profile.GetPropertyValue("Employee.AllowCreateCV") == false)
            {
                lbtn_AdsCv.Visible = false;
            }

            try
            {
                MembershipUser mu = Membership.GetUser();
                //Username = mu.UserName;
                userId = mu.ProviderUserKey.ToString();
            }
            catch (NullReferenceException)
            {
                Response.Redirect("~/publicArea/errorpages/Error404.aspx");
            }
            facade = new BusinessFacade(myConn);
            List<BusinessLogic.CV.SaveJobs> sjList =  facade.GetSaveJobs(userId);
            SjCount = sjList.Count;

            Assembly ass = Assembly.Load("App_GlobalResources");
            ResourceManager rm = new ResourceManager("Resources.Resource", ass);

            Literal1.Text = rm.GetString("Welcome") + String.Format(" {0}!", Context.Profile.GetPropertyValue("Employee.FirstName").ToString());
        }

        protected void lbtn_AdsCv_Click(object sender, EventArgs e)
        {
            //if ((Boolean)Context.Profile.GetPropertyValue("Employee.AllowCreateCV") == false)
            //{
            //    btn_PopUp.Click += new EventHandler(btn_PopUp_Click);
            //}
            //else
            //{
                Response.Redirect("~/memberArea/AdsCv.aspx");
            //}
        }
        //ko duoc delete su kien nay
        //void btn_PopUp_Click(object sender, EventArgs e)
        //{
            
        //}
    }
}