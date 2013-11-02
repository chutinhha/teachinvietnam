using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using System.Web.Security;
using System.Collections.Specialized;
using TeachingJob.Data;

namespace TeachingJob.memberArea
{
    public partial class ManageSavedJob : BasePage
    {
        BusinessFacade facade;
        string myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        string userId;
        public string UserId
        {
            get { return userId; }
            set { userId = value; }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            facade = new BusinessFacade(myConn);
            
            //Neu da tao CV Thi chi co update
            if ((Boolean)Context.Profile.GetPropertyValue("Employee.AllowCreateCV") == false)
            {
                lbtn_AdsCv.Visible = false;
            }
            MembershipUser mu = Membership.GetUser();
            UserId = mu.ProviderUserKey.ToString();
            CollectionPager1.MaxPages = General.MAX_PAGE;
            CollectionPager1.PageSize = General.PAGE_SIZE;
            CollectionPager1.DataSource = facade.GetSaveJob2(mu.ProviderUserKey.ToString());
            CollectionPager1.BindToControl = Repeater1;
            Repeater1.DataSource = CollectionPager1.DataSourcePaged;
            Repeater1.DataBind();
        }
        protected void SaveJob_DataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int jid = Convert.ToInt16(DataBinder.Eval(e.Item.DataItem, "JId").ToString());
                HyperLink hpl_JobTitle = (HyperLink)e.Item.FindControl("hpl_JobTitle");
                Label lbl_JobTitle = (Label)e.Item.FindControl("lbl_JobTitle");
                Label lbl_savedDate = (Label)e.Item.FindControl("lbl_savedDate");
                Label lbl_Closing = (Label)e.Item.FindControl("lbl_Closing");

                hpl_JobTitle.NavigateUrl = "~/publicArea/JobDetails.aspx?jid=" + jid;
                lbl_JobTitle.Text = DataBinder.Eval(e.Item.DataItem,"JTitle").ToString();
                lbl_JobTitle.ToolTip = lbl_JobTitle.Text;
                lbl_savedDate.Text = DataBinder.Eval(e.Item.DataItem, "Savedate", "{0:MMM} {0:dd}, {0:yyyy}").ToString();
                lbl_Closing.Text = DataBinder.Eval(e.Item.DataItem, "JClosingDate", "{0:MMM} {0:dd}, {0:yyyy}").ToString();

                HiddenField hf_savedjobid = (HiddenField)e.Item.FindControl("hf_savedjobid");
                hf_savedjobid.Value = jid.ToString();
            }
        }
        protected void ItemCommander(object sender, RepeaterCommandEventArgs e)
        {
            HiddenField hf_savedjobid = (HiddenField)e.Item.FindControl("hf_savedjobid");
            if (e.CommandName == "View")
            {
                Response.Redirect("~/publicArea/JobDetails.aspx?jid=" + hf_savedjobid.Value);
            }
            if (e.CommandName == "Delete")
            {
                facade.DeleteSaveJob2(Convert.ToInt16(hf_savedjobid.Value));
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('Deleted successfully!');window.location.href='ManageSavedJob.aspx';</script>");
                
            }
        }
        protected void lbtn_AdsCv_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/memberArea/AdsCv.aspx");
        }
    }
}