using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using System.Web.Security;
using AjaxControlToolkit;
using BusinessLogic.CV;
using TeachingJob.Data;

namespace TeachingJob.Employer
{
    public partial class MyApplicants : BasePage
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;
        string userId;
        ToolkitScriptManager objScriptManager;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                facade = new BusinessFacade(myConn);
                MembershipUser mu = Membership.GetUser();
                userId = mu.ProviderUserKey.ToString();
                Repeater1.DataSource = facade.GetPostedJobByUser(userId);
                Repeater1.DataBind();
                if (Request.Params["delete"] == "successful")
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('The candidate has been deleted successfully!');</script>");
                    //int id = Convert.ToInt32(Request.Params["jid"]);
                    //Repeater2.DataSource = facade.GetApplicants(id);
                    //Repeater2.DataBind();
                }
                
                //User for ajax load
                objScriptManager = (ToolkitScriptManager)this.Master.FindControl("ToolkitScriptManager1");
                objScriptManager.AsyncPostBackTimeout = 36000;

                foreach (RepeaterItem ri in Repeater1.Items)
                {
                    if (ri.ItemType == ListItemType.Item || ri.ItemType == ListItemType.AlternatingItem)
                    {
                        LinkButton lb = (LinkButton)ri.FindControl("lbtn_JobTitle");
                        objScriptManager.RegisterAsyncPostBackControl(lb);
                    }
                }
                if (!IsPostBack)
                {
                    foreach (RepeaterItem ri in Repeater2.Items)
                    {
                        if (ri.ItemType == ListItemType.Item || ri.ItemType == ListItemType.AlternatingItem)
                        {
                            LinkButton lb = (LinkButton)ri.FindControl("lbtn_MarkAsInterest");
                            objScriptManager.RegisterAsyncPostBackControl(lb);
                        }
                    }
                }
            }
            catch (NullReferenceException)
            {
                Response.Redirect("~/publicArea/errorpages/Error404.aspx");
            }
        }

        protected void Repeater1_JobTitle_DataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Label lbl_JobTitle = (Label)e.Item.FindControl("lbl_JobTitle");
                    HiddenField HiddenField1 = (HiddenField)e.Item.FindControl("HiddenField1");
                    HiddenField1.Value = DataBinder.Eval(e.Item.DataItem, "Id").ToString(); //Id = jid

                    string title = DataBinder.Eval(e.Item.DataItem, "Title").ToString();
                    string appliednumber=facade.AppliedNumber(Convert.ToInt32(HiddenField1.Value)).ToString();
                    lbl_JobTitle.Text = String.Format("<label class='jobtitleColor'>{0}</label> ({1})", title, appliednumber);
                    lbl_JobTitle.ToolTip = DataBinder.Eval(e.Item.DataItem, "Title").ToString() + " (" + facade.AppliedNumber(Convert.ToInt32(HiddenField1.Value)).ToString() + " applied)";
                }
            }
            catch (Exception)
            {

            }
        }
        //hoi thay sau: lam sao de lay dc gia tri hidden field tai pageload
        protected void Repeater1_JobTitle_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            HiddenField HiddenField1 = (HiddenField)e.Item.FindControl("HiddenField1"); //jid
            if (e.CommandName == "View")
            {
                Label lbl_JobTitle = (Label)e.Item.FindControl("lbl_JobTitle");
                lbl_JobTitle.CssClass = "jobtitleColor2";
                List<SaveJobs> sjList = facade.GetApplicants(Convert.ToInt32(HiddenField1.Value));
                if (sjList.Count == 0)
                {
                    Panel_Fake.Visible = true;
                    lbl_NoElementInList.Text = "There is no resume in list";
                    Panel_right.Visible = false;
                }
                else
                { 
                    Panel_Fake.Visible = false;
                    Panel_right.Visible = true;
                    Repeater2.DataSource = sjList;
                    Repeater2.DataBind();
                }
                foreach (RepeaterItem ri in Repeater2.Items)
                {
                    if (ri.ItemType == ListItemType.Item || ri.ItemType == ListItemType.AlternatingItem)
                    {
                        LinkButton lb = (LinkButton)ri.FindControl("lbtn_MarkAsInterest");
                        objScriptManager.RegisterAsyncPostBackControl(lb);
                    }
                }
                ViewState["jid"] = HiddenField1.Value;
            }
        }
        protected void Repeater2_DataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Label lbl_FullName = (Label)e.Item.FindControl("lbl_FullName");
                    Label lbl_Email = (Label)e.Item.FindControl("lbl_Email");
                    Label lbl_SavingDate = (Label)e.Item.FindControl("lbl_SavingDate");
                    HiddenField HiddenField_CandidateId = (HiddenField)e.Item.FindControl("HiddenField_CandidateId");
                    
                    HiddenField_CandidateId.Value = DataBinder.Eval(e.Item.DataItem, "Saver").ToString();
                    lbl_FullName.Text = DataBinder.Eval(e.Item.DataItem, "FullName").ToString();
                    lbl_FullName.ToolTip = DataBinder.Eval(e.Item.DataItem, "FullName").ToString();
                    lbl_Email.Text = DataBinder.Eval(e.Item.DataItem, "CandidateUsername").ToString();
                    lbl_Email.ToolTip = DataBinder.Eval(e.Item.DataItem, "CandidateUsername").ToString();
                    lbl_SavingDate.Text = DataBinder.Eval(e.Item.DataItem, "Savedate", "{0:MMM} {0:dd}, {0:yyyy}").ToString();
                    HiddenField HiddenField_ID = (HiddenField)e.Item.FindControl("HiddenField_ID");
                    HiddenField_ID.Value = DataBinder.Eval(e.Item.DataItem, "Id").ToString();
                    
                    //Mark as read
                    Label lbl_New = (Label)e.Item.FindControl("lbl_New");
                    HiddenField HiddenField_ReadBefore = (HiddenField)e.Item.FindControl("HiddenField_ReadBefore");
                    HiddenField_ReadBefore.Value = DataBinder.Eval(e.Item.DataItem, "ReadBefore").ToString();
                    
                    if (HiddenField_ReadBefore.Value == "False")
                    {
                        lbl_New.Visible = true;
                    }
                    else
                    {
                        lbl_New.Visible = false;
                    }
                    //Mark as interest
                    Image img_favorite = (Image)e.Item.FindControl("img_favorite");
                    HiddenField HiddenField_Favorite = (HiddenField)e.Item.FindControl("HiddenField_Favorite");
                    HiddenField_Favorite.Value = DataBinder.Eval(e.Item.DataItem, "Favorite").ToString();
                    if (HiddenField_Favorite.Value == "False")
                    {
                        img_favorite.ImageUrl = "~/images/icons/unlike.png";
                        img_favorite.ToolTip = "Interested";
                    }
                    else
                    {
                        img_favorite.ImageUrl = "~/images/icons/like.png";
                        img_favorite.ToolTip = "Uninterested";
                    }
                    foreach (RepeaterItem ri in Repeater2.Items)
                    {
                        if (ri.ItemType == ListItemType.Item || ri.ItemType == ListItemType.AlternatingItem)
                        {
                            LinkButton lb = (LinkButton)ri.FindControl("lbtn_MarkAsInterest");
                            objScriptManager.RegisterAsyncPostBackControl(lb);
                        }
                    }
                }
            }
            catch (Exception)
            {

            }
        }
        protected void Repeater2_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            HiddenField HiddenField_ID = (HiddenField)e.Item.FindControl("HiddenField_ID");
            HiddenField HiddenField_CandidateId = (HiddenField)e.Item.FindControl("HiddenField_CandidateId");
            Label lbl_Email = (Label)e.Item.FindControl("lbl_Email");
            Label lbl_New = (Label)e.Item.FindControl("lbl_New");
            
            if (e.CommandName == "Delete")
            {
                facade.DeleteAnApplicant(Convert.ToInt32(HiddenField_ID.Value));
                int jid = Convert.ToInt32(ViewState["jid"].ToString());
                Response.Redirect("MyApplicants.aspx?delete=successful&jid="+jid);
            }
            if (e.CommandName == "View")
            {
                HyperLink hpl_View = (HyperLink)e.Item.FindControl("hpl_View");
                //string navigateUrl = "../publicArea/CV/Detail.aspx?cvname=" + HiddenField_ID.Value;
                //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>window.open('"+navigateUrl+"','_blank');</script>");
                facade.MarkAsRead(Convert.ToInt32(HiddenField_ID.Value), true);
                Response.Redirect("~/publicArea/CV/Detail.aspx?cvname=" + HiddenField_CandidateId.Value);
            }
            if (e.CommandName == "Interest")
            {
                HiddenField HiddenField_Favorite = (HiddenField)e.Item.FindControl("HiddenField_Favorite");
                Boolean input=false;
                if (HiddenField_Favorite.Value == "False")
                {
                    input = true;
                }
                else
                {
                    input = false;
                }
                facade.MarkAsInterest(Convert.ToInt32(HiddenField_ID.Value), input);
                Repeater2.DataSource = facade.GetApplicants(Convert.ToInt32(ViewState["jid"].ToString())); 
                Repeater2.DataBind();
                //Release a note: If your option does not work, please click again to job title to see the effect.
            }
            //de sau lam, khi an vao link cua CV name
            if (e.CommandName == "Read")
            {
                facade.MarkAsRead(Convert.ToInt32(HiddenField_ID.Value), true);
                //Release a note: If your option does not work, please click again to job title to see the effect.
            }
        }
    }
}