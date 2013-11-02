using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using System.Web.Security;
using TeachingJob.Data;
using System.Web.UI.HtmlControls;

namespace TeachingJob.publicArea
{
    public partial class JobDetails : BasePage
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;
        DetailJob job = new DetailJob();

        public DetailJob Job
        {
            get { return job; }
            set { job = value; }
        }
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            facade = new BusinessFacade(myConn);
            if (!IsPostBack)
            {
                try
                {
                    if (Request.Params["view"] == "preview")
                    {
                        Job = (DetailJob)Session["Preview"];
                        ViewState["dj"] = Job;
                        if (Session["execJob"] != null)
                        {
                            ViewState["execJob"] = Session["execJob"];
                        }
                        btn_Apply.Visible = false;
                        hpl_PreviousUrl.Visible = false;
                        btn_SaveJob.Visible = false;
                        btn_Edit.Visible = true;
                        Panel_Additional.Visible = false;
                    }
                    else
                    {
                        id = Convert.ToInt16(Request.QueryString["jId"]);
                        Job = facade.GetDetailJobById(id);

                        Repeater_SameEmployerJob.DataSource = facade.GetJobByEmployer(facade.GetGuidByJobId(id));
                        Repeater_SameEmployerJob.DataBind();
                        Repeater_InterestedJob.DataSource = facade.GetJobBySameCate(Job.Category, Job.Category2, Job.Category3);
                        Repeater_InterestedJob.DataBind();

                        ViewState["detailedJob"] = Job;
                        ViewState["jid"] = id;
                        facade.PlusView(id);            //Plus 1 for viewcount
                    }
                }
                catch (NullReferenceException ex)
                {
                    Page.ClientScript.RegisterClientScriptBlock(GetType(), "PopupScript", "<script>alert('"+ex.Message+"');</script>");
                    //Response.Redirect("~/publicArea/errorpages/Error404.aspx");
                }
                catch (IndexOutOfRangeException outofrange)
                {
                    Page.ClientScript.RegisterClientScriptBlock(GetType(), "PopupScript", "<script>alert('" + outofrange.Message + "');</script>");
                    //Response.Redirect("~/publicArea/errorpages/Error404.aspx");
                }
            }
            if (!IsPostBack)
            {
                try
                {
                    if (Job.OrgLogo != "" && Job.OrgLogo != null)
                    {
                        OrgLogo_img.ImageUrl = General.EMP_LOGO + Job.Username + "/" + Job.OrgLogo;
                    }
                    else
                    {
                        OrgLogo_img.ImageUrl = "~/images/companyLogo/no_image.jpg";
                    }

                    TimeSpan addago = DateTime.Now.Subtract(Job.UploadDate);
                    if (addago.Days == 0 || addago.Days == 1)
                    {
                        UploadDate_lbl.Text = Convert.ToString(addago.Days) + " day ago";
                    }
                    else
                    {
                        UploadDate_lbl.Text = Convert.ToString(addago.Days) + " days ago";
                    }
                    ClosingDate_lbl.Text = string.Format("{0:MMM} {0:dd}, {0:yyyy}", Job.ClosingDate);

                    //Description
                    lbl_Description.Text = HttpUtility.HtmlDecode(Job.Description.ToString().Replace(Environment.NewLine, "<br />"));
                    lbl_BriefInfo.Text = HttpUtility.HtmlDecode(Job.OrgInfo.ToString().Replace(Environment.NewLine, "<br />"));
                    //Salary
                    if (job.SalaryType == false)
                    {
                        lbl_Salary.Text = "negotiable";
                    }
                    else if (Job.Salary == 0 && Job.SalaryTo == 0)
                    {
                        lbl_Salary.Text = "negotiable";
                    }
                    else
                    {
                        lbl_Salary.Text = Job.Salary + " - " + Job.SalaryTo + " " + Job.SalaryCurrency + "/" + Job.SalaryPaymentType;
                    }
                }
                catch (Exception)
                { }
            }
            if (!IsPostBack)
            {
                try
                {
                    ViewState["PreviousPageUrl"] = Request.UrlReferrer.ToString();
                    hpl_PreviousUrl.NavigateUrl = ViewState["PreviousPageUrl"].ToString();
                }
                catch (Exception)
                {
                }
            }

        }
        protected void Apply_Click(object sender, EventArgs e)
        {
            try
            {
                int jid = (int)ViewState["jid"];
                Response.Redirect("~/memberArea/ContactEmployer.aspx?jId=" + jid);
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('"+ex.Message+"');</script>");
            }
        }
        protected void ApplyWithoutLogin_Click(object sender, EventArgs e)
        {
            try
            {
                int jid = (int)ViewState["jid"];
                Response.Redirect("~/memberArea/ContactWithoutLogin.aspx?jId=" + jid);
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('"+ex.Message+"');</script>");
            }
        }
        protected void savejob_Click(object sender, EventArgs e)
        {
            Job = (DetailJob)ViewState["detailedJob"];
            if (User.IsInRole("Employee"))
            {
                try
                {
                    MembershipUser mu = Membership.GetUser();
                    facade.SaveJob2(mu.ProviderUserKey.ToString(), Job.Id);
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
        protected void Edit_Click(object sender, EventArgs e)
        {
            Session["execJob"] = ViewState["execJob"];
            Session["Preview"] = ViewState["dj"];
            Response.Redirect("~/memberArea/AdsAJob.aspx?stt=edit");
        }
        protected void Repeater_SameEmployerJob_DataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HyperLink hpl_SameEmployerJob = (HyperLink)e.Item.FindControl("hpl_SameEmployerJob");
                hpl_SameEmployerJob.Text = DataBinder.Eval(e.Item.DataItem, "Title").ToString();
                hpl_SameEmployerJob.NavigateUrl = "JobDetails.aspx?jid=" + DataBinder.Eval(e.Item.DataItem, "Id").ToString();
            }
        }
        protected void Repeater_InterestedJob_DataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HyperLink hpl_InterestedJob = (HyperLink)e.Item.FindControl("hpl_InterestedJob");
                hpl_InterestedJob.Text = DataBinder.Eval(e.Item.DataItem, "Title").ToString();
                hpl_InterestedJob.NavigateUrl = "JobDetails.aspx?jid=" + DataBinder.Eval(e.Item.DataItem, "Id").ToString();
            }
        }
    }
}