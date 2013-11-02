using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using System.Web.Security;
using AjaxControlToolkit;
using TeachingJob.Data;

namespace TeachingJob.Employer
{
    public partial class JobsManagement : BasePage
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;
        int jid;
        string userId;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.Params["delete"] == "successful")
            //{
            //    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('Your job has been deleted successfully!');</script>");
            //}
            try
            {
                facade = new BusinessFacade(myConn);
                MembershipUser mu = Membership.GetUser();
                userId = mu.ProviderUserKey.ToString();

                JobDatabinding();

                //User for ajax load
                ToolkitScriptManager objScriptManager = (ToolkitScriptManager)this.Master.FindControl("ToolkitScriptManager1");
                objScriptManager.AsyncPostBackTimeout = 36000;

                foreach (RepeaterItem ri in Repeater1.Items)
                {
                    if (ri.ItemType == ListItemType.Item || ri.ItemType == ListItemType.AlternatingItem)
                    {
                        LinkButton lb = (LinkButton)ri.FindControl("lbtn_Delete");
                        objScriptManager.RegisterAsyncPostBackControl(lb);
                    }
                }
            }
            catch (NullReferenceException)
            {
                Response.Redirect("~/publicArea/errorpages/Error404.aspx");
            }
        }
        private void JobDatabinding()
        {
            CollectionPager1.MaxPages = 10000;
            CollectionPager1.PageSize = 12;
            CollectionPager1.DataSource = facade.GetPostedJobByUser(userId);
            CollectionPager1.BindToControl = Repeater1;
            Repeater1.DataSource = CollectionPager1.DataSourcePaged;
            Repeater1.DataBind();
        }
        protected void PostJob_DataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                    jid = Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "Id").ToString());

                    Label lbl_Title = (Label)e.Item.FindControl("lbl_JobTitle");
                    Label lbl_Upload = (Label)e.Item.FindControl("lbl_Upload");
                    Label lbl_Closing = (Label)e.Item.FindControl("lbl_Closing");
                    Label lbl_ViewCount = (Label)e.Item.FindControl("lbl_ViewCount");
                    HyperLink hpl_JobTitle = (HyperLink)e.Item.FindControl("hpl_JobTitle");

                    lbl_Title.Text = DataBinder.Eval(e.Item.DataItem, "Title").ToString();
                    lbl_Title.ToolTip = DataBinder.Eval(e.Item.DataItem, "Title").ToString();
                    hpl_JobTitle.NavigateUrl = "~/publicArea/JobDetails.aspx?jid=" + jid;
                    lbl_Upload.Text = DataBinder.Eval(e.Item.DataItem, "UploadDate", "{0:MMM} {0:dd}, {0:yyyy}").ToString();
                    lbl_Closing.Text = DataBinder.Eval(e.Item.DataItem, "ClosingDate", "{0:MMM} {0:dd}, {0:yyyy}").ToString();
                    lbl_ViewCount.Text = DataBinder.Eval(e.Item.DataItem, "Viewcount").ToString();

                    //crud
                    HiddenField HiddenField_ID = (HiddenField)e.Item.FindControl("HiddenField_ID");
                    HiddenField_ID.Value = DataBinder.Eval(e.Item.DataItem, "Id").ToString();
                }
            }
            catch (NullReferenceException)
            {
                
            }
        }

        protected void Repeater1_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            HiddenField HiddenField_ID = (HiddenField)e.Item.FindControl("HiddenField_ID");
            
            if (e.CommandName == "View")
            {
                Response.Redirect("~/publicArea/JobDetails.aspx?jid=" + HiddenField_ID.Value);
            }
            if (e.CommandName == "Edit")
            {
                Response.Redirect("~/");
            }
            if (e.CommandName == "Delete")
            {
                facade.DeleteAPostedJob(Convert.ToInt32(HiddenField_ID.Value));
                JobDatabinding();
                //Response.Redirect("JobsManagement.aspx?delete=successful");
            }
        }
    }
}