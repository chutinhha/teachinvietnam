using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using TeachingJob.Data;
using BusinessLogic.Facade.Candidate;

namespace TeachingJob.memberArea.CV
{
    public partial class privacy_setting : BasePage
    {
        string username;
        public string Username
        {
            get { return username; }
            set { username = value; }
        }
        string userId;
        public string UserId
        {
            get { return userId; }
            set { userId = value; }
        }
        JobAlertLogic jobAlertLogic;
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.DefaultButton = btn_UpdatePrivacy_em.UniqueID;
            MembershipUser mu = Membership.GetUser();
            Username = mu.UserName;
            UserId = mu.ProviderUserKey.ToString();

            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            jobAlertLogic = new JobAlertLogic(connStr);

            isRegister = jobAlertLogic.IsRegisterJobAlert(Username);
            if (!isRegister)
            {
                Panel_JobAlert.Visible = false;
            }

            if ((Boolean)Context.Profile.GetPropertyValue("Employee.AllowCreateCV") == false)
            {
                lbtn_AdsCv.Visible = false;
            }
            if (!IsPostBack)
            {
                try
                {
                    ViewState["PreviousPageUrl"] = Request.UrlReferrer.ToString();
                }
                catch (Exception)
                {
                    Response.Redirect("~/Account/my-jobs.aspx");
                }
                if (isRegister)
                {
                    bool AlertActive = jobAlertLogic.GetActiveValue(Username);
                    if (AlertActive)
                    {
                        cb_EnableJobAlert.Checked = true;
                    }
                }
            }
            
            checkChanged = cb_EnableJobAlert.Checked;
        }

        protected void Return_Click(object sender, EventArgs e)
        {
            Response.Redirect(ViewState["PreviousPageUrl"].ToString());
        }
        protected void lbtn_AdsCv_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/memberArea/AdsCv.aspx");
        }

        protected void UpdatePrivacy_Click(object sender, EventArgs e)
        {
            try
            {
                if (cb_Resume.Checked == true) Context.Profile.SetPropertyValue("CV.Searchable", true);
                else Context.Profile.SetPropertyValue("CV.Searchable", false);

                if(cb_Email.Checked==true) Context.Profile.SetPropertyValue("CV.DisplayEmail",true);
                else Context.Profile.SetPropertyValue("CV.DisplayEmail",false);

                if (cb_Address.Checked == true) Context.Profile.SetPropertyValue("CV.DisplayAddress", true);
                else Context.Profile.SetPropertyValue("CV.DisplayAddress", false);

                if (cb_Phone.Checked == true) Context.Profile.SetPropertyValue("CV.DisplayPhone", true);
                else Context.Profile.SetPropertyValue("CV.DisplayPhone", false);

                //if (checkChanged != cb_EnableJobAlert.Checked && isRegister)
                //{
                    bool onoff = cb_EnableJobAlert.Checked;
                    jobAlertLogic.SetOnOff(Username, onoff);
                //}
                //lbl_Status.Text = "Your update is successful!";
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('Your update is successful!');window.location.href='privacy-setting.aspx';</script>");
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkChanged;
        bool isRegister;
    }
}