using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Web.Security;
using TeachingJob.Data;
using System.Reflection;
using System.Resources;
using System.Data.SqlClient;
using BusinessLogic;
using System.Globalization;
using System.Collections.Specialized;

namespace TeachingJob.publicArea.CV
{
    public partial class Detail : BasePage
    {
        string mailTo;

        public string MailTo
        {
            get { return mailTo; }
            set { mailTo = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //Limit input characters
            txt_Message.Attributes.Add("onkeydown", "textCounter(this,'" + Label2.ClientID + "', 5000)");
            txt_Message.Attributes.Add("onkeyup", "textCounter(this,'" + Label2.ClientID + "', 5000)");
            txt_Message.Attributes.Add("onmousedown", "textCounter(this,'" + Label2.ClientID + "', 5000)");
            txt_Message.Attributes.Add("onmouseup", "textCounter(this,'" + Label2.ClientID + "', 5000)");
            txt_Message.Attributes.Add("onblur", "textCounter(this,'" + Label2.ClientID + "', 5000)");
        }
        protected void Contact_Click(object sender, EventArgs e)
        {
            Response.Redirect("Detail.aspx?contact=send");
        }

        protected void SendContact_Click(object sender, EventArgs e)
        {
            try
            {
                String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
                BusinessFacade facade = new BusinessFacade(myConn);
                string latestJobId = "";

                if (Page.User.Identity.IsAuthenticated)
                {
                    if (User.IsInRole("Organization"))
                    {
                        MembershipUser mu = Membership.GetUser();
                        //Neu ma co job.
                        if (facade.GetLastestJobIdByGuid(mu.ProviderUserKey.ToString()) != null)
                        {
                            latestJobId = facade.GetLastestJobIdByGuid(mu.ProviderUserKey.ToString());
                        }
                    }
                }

                StringBuilder sb = new StringBuilder();
                string subject = txt_OrgName.Text.Trim() + " " + txt_Subject.Text.Trim();

                if (lbl_CandidateName.Text == null || lbl_CandidateName.Text == "")
                {
                    lbl_CandidateName.Text = "candidate";
                }
                MailUtils mailUtils = new MailUtils(Request);
                //header
                sb.Append(mailUtils.MailHeader());

                String title = "Dear " + lbl_CandidateName.Text + ",<br />A new message has just come from " + txt_OrgName.Text.Trim() + " via TeachinVietnam.org:";
                String body = txt_Message.Text.Trim();
                String href = "publicArea/JobDetails.aspx?jId=" + latestJobId + "&lang=en";
                String linkLabel = "Click here to examine your online resume before responding!";
                //body_en
                if (latestJobId != "")
                {
                    sb.Append(mailUtils.Body(title, body, true, href, linkLabel, "en-US"));
                }
                else
                {
                    sb.Append(mailUtils.Body(title, body, false, href, linkLabel, "en-US"));
                }
                sb.Append(mailUtils.Seperator());
                string ntd = "";
                if (User.IsInRole("Organization"))
                {
                    ntd = " nhà tuyển dụng ";
                }
                title = "Chào " + lbl_CandidateName.Text + ",<br />Bạn có thư từ " + ntd + txt_OrgName.Text.Trim() + " thông qua hệ thống TeachinVietnam:";
                href = "publicArea/JobDetails.aspx?jId=" + latestJobId + "&lang=vi";
                linkLabel = "Click vào đây để kiểm tra Hồ sơ của bạn trước khi ứng tuyển!";
                //body vi
                if (latestJobId != "")
                {
                    sb.Append(mailUtils.Body(title, body, true, href, linkLabel, "vi-VN"));
                }
                else
                {
                    sb.Append(mailUtils.Body(title, body, false, href, linkLabel, "vi-VN"));
                }

                //footer
                sb.Append(mailUtils.MailFooter());
                Guid userProviderKey = new Guid(Request.Params["cvname"].ToString());
                MembershipUser candidateMembership = Membership.GetUser(userProviderKey);

                Utils.SendMail(candidateMembership.Email, subject, sb.ToString());

                Response.Redirect("~/publicArea/CV/RequestSuccess.aspx", false);
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            Assembly ass = Assembly.Load("App_GlobalResources");
            ResourceManager rm = new ResourceManager("Resources.Resource", ass);
            if (!User.IsInRole("Organization"))
            {

                Page.ClientScript.RegisterClientScriptBlock(GetType(), "PopupScript", "<script>alert('" + rm.GetString("JobseekerscannotsavethisCV") + "');</script>");
            }
            else
            {
                String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

                MembershipUser cv_mu = Membership.GetUser(Request.Params["cvname"].ToString());
                MembershipUser currentUser = Membership.GetUser();

                BusinessFacade facade = new BusinessFacade(myConn);
                facade.SaveCv(currentUser.ProviderUserKey.ToString(), cv_mu.ProviderUserKey.ToString());
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + rm.GetString("Thisresumesavedinto") + "');</script>");

            }

        }
        protected void lbtn_Click(object sender, EventArgs e)
        {

        }
    }
}