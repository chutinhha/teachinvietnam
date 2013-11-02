using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using TeachingJob.Data;
using System.Web.Security;
using BusinessLogic.Facade.Candidate;

namespace TeachingJob.memberArea.CV
{
    public partial class JobAlert : System.Web.UI.Page
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade = null;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                MembershipUser mu = Membership.GetUser();
                Username = mu.UserName;
                UserId = mu.ProviderUserKey.ToString();

                if (!IsPostBack)
                {
                    //Already exist CV.
                    if ((Boolean)Context.Profile.GetPropertyValue("Employee.AllowCreateCV") == false)
                    {
                        JobAlertLogic jobAlertLogic = new JobAlertLogic(myConn);
                        if (jobAlertLogic.IsRegisterJobAlert(Username))
                        {
                            if (jobAlertLogic.IsActiveJobAlert(Username))
                            {
                                hpl_CreateCV.Visible = false;
                                facade = new BusinessFacade(myConn);

                                string cate1 = Context.Profile.GetPropertyValue("CV.DesiredEmployment").ToString();
                                string cate2 = Context.Profile.GetPropertyValue("CV.DesiredEmployment2").ToString();
                                string cate3 = Context.Profile.GetPropertyValue("CV.DesiredEmployment3").ToString();

                                string lo1 = Context.Profile.GetPropertyValue("CV.DesiredLocations").ToString();
                                string lo2 = Context.Profile.GetPropertyValue("CV.DesiredLocations2").ToString();
                                string lo3 = Context.Profile.GetPropertyValue("CV.DesiredLocations3").ToString();

                                CollectionPager1.PageSize = General.PAGE_SIZE;
                                CollectionPager1.MaxPages = General.MAX_PAGE;

                                CollectionPager1.DataSource = facade.getJobAlert(cate1, cate2, cate3, lo1, lo2, lo3);
                                CollectionPager1.BindToControl = Repeater1;
                                Repeater1.DataSource = CollectionPager1.DataSourcePaged;
                                Repeater1.DataBind();

                                if (Repeater1.Items.Count == 0)
                                {
                                    Panel_NoJobsInList.Visible = true;
                                    Repeater1.Visible = false;
                                }
                                else
                                {
                                    panel_headingmodule.Visible = true;
                                    string jobLabel = "jobs";
                                    if (Repeater1.Items.Count == 1 || Repeater1.Items.Count == 0)
                                    {
                                        jobLabel = "job";
                                    }
                                    Literal1.Text = string.Format("We found {0} {1} that may fit your expectation. Wish you a great career ahead!", Repeater1.Items.Count,jobLabel);
                                }
                            }
                            else
                            {
                                Panel_IsActive.Visible = true;
                            }
                        }
                        else
                        {
                            Panel_IsRegister.Visible = true;
                        }
                    }
                    else
                    {
                        Panel_NotCreateCV.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void JobAlert_DataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Label lbl_JobTitle = (Label)e.Item.FindControl("lbl_JobTitle");
                    Label lbl_Closing = (Label)e.Item.FindControl("lbl_Closing");
                    Label lbl_PostedDate = (Label)e.Item.FindControl("lbl_PostedDate");
                    HyperLink hpl_View = (HyperLink)e.Item.FindControl("hpl_View");
                    HyperLink hpl_JobTitle = (HyperLink)e.Item.FindControl("hpl_JobTitle");
                    LinkButton lbtn_Save = (LinkButton)e.Item.FindControl("lbtn_Save");

                    string title = DataBinder.Eval(e.Item.DataItem, "Title").ToString();
                    string id = DataBinder.Eval(e.Item.DataItem, "Id").ToString();

                    hpl_JobTitle.NavigateUrl = "~/publicArea/JobDetails.aspx?jid=" + id;
                    lbl_JobTitle.Text = title;
                    lbl_JobTitle.ToolTip = title;

                    lbl_Closing.Text = Convert.ToDateTime(DataBinder.Eval(e.Item.DataItem, "ClosingDate").ToString()).ToShortDateString();
                    lbl_PostedDate.Text = Convert.ToDateTime(DataBinder.Eval(e.Item.DataItem, "UploadDate").ToString()).ToShortDateString();

                    hpl_View.NavigateUrl = "~/publicArea/JobDetails.aspx?jid=" + id;

                    lbtn_Save.CommandArgument = id;
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void ItemCommander(object sender, RepeaterCommandEventArgs e)
        {
            if (Page.IsValid)
            {
                if (e.CommandName == "Save")
                {
                    if (User.IsInRole("Employee"))
                    {
                        try
                        {
                            MembershipUser mu = Membership.GetUser();
                            facade.SaveJob2(mu.ProviderUserKey.ToString(), Convert.ToInt16(e.CommandArgument));
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('You have successfully saved this job.');</script>");
                        }
                        catch (Exception ex)
                        {
                            throw ex;
                        }
                    }
                    else if (User.IsInRole("organization"))
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('Sorry, recruiter can not save this job.\\nPlease login as job seeker.');</script>");
                    }
                    else
                    {
                        FormsAuthentication.RedirectToLoginPage("authen=false");
                    }
                }
            }
        }
        protected void btn_Register_Click(object sender, EventArgs e)
        {
            if (Username != "" && Username.Length != 0)
            {
                try
                {
                    JobAlertLogic jobAlertLogic = new JobAlertLogic(myConn);
                    jobAlertLogic.RegisterJobAlert(Username);
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('You have successfully registered job alert. Wish you get your dream job.');window.location.href='JobAlert.aspx';</script>");
                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('Please login again. \nIf there is any problem, please contact us.');</script>");
            }
        }
    }
}