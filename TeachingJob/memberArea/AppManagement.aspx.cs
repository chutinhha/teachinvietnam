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
namespace TeachingJob.memberArea
{
    public partial class AppManagement : BasePage
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;
        string userid;
        public string Userid
        {
            get { return userid; }
            set { userid = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //Neu da tao CV Thi chi co update
            if ((Boolean)Context.Profile.GetPropertyValue("Employee.AllowCreateCV") == false)
            {
                lbtn_AdsCv.Visible = false;
            }
            facade = new BusinessFacade(myConn);
            try
            {
                MembershipUser mu = Membership.GetUser();
                userid = mu.ProviderUserKey.ToString();
            }
            catch (Exception)
            {
                Response.Redirect("~/publicArea/errorpages/Error404.aspx");
            }

            BindingList();
        }
        private void BindingList()
        {
            CollectionPager1.MaxPages = 10000;
            CollectionPager1.PageSize = 12;
            CollectionPager1.DataSource = facade.GetSaveJobs(userid);
            CollectionPager1.BindToControl = Repeater1;
            Repeater1.DataSource = CollectionPager1.DataSourcePaged;
            Repeater1.DataBind();

        }
        protected void SaveJob_DataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    int jid = Convert.ToInt16(DataBinder.Eval(e.Item.DataItem, "JId").ToString());
                    Label lbl_jobtitle = (Label)e.Item.FindControl("lbl_JobTitle");
                    Label lbl_emp = (Label)e.Item.FindControl("lbl_org");
                    Label lbl_Closing = (Label)e.Item.FindControl("lbl_Closing");
                    //Label lbl_stt = (Label)e.Item.FindControl("lbl_Stt");
                    Label lbl_savedate = (Label)e.Item.FindControl("lbl_SaveDate");
                    HyperLink hpl_jTitle = (HyperLink)e.Item.FindControl("hpl_JobTitle");
                    HiddenField HiddenField1 = (HiddenField)e.Item.FindControl("HiddenField1");

                    HiddenField1.Value = DataBinder.Eval(e.Item.DataItem, "Id").ToString();
                    hpl_jTitle.NavigateUrl = "~/publicArea/JobDetails.aspx?jid=" + jid;
                    lbl_jobtitle.Text = DataBinder.Eval(e.Item.DataItem, "JTitle").ToString();
                    lbl_jobtitle.ToolTip = lbl_jobtitle.Text;
                    lbl_emp.Text = DataBinder.Eval(e.Item.DataItem, "OrgName").ToString();
                    lbl_emp.ToolTip = lbl_emp.Text;
                    lbl_Closing.Text = DataBinder.Eval(e.Item.DataItem, "JClosingDate", "{0:MMM} {0:dd}, {0:yyyy}").ToString();
                    //lbl_stt.Text = DataBinder.Eval(e.Item.DataItem, "Stt").ToString();
                    //lbl_stt.Text = "Applied";
                    lbl_savedate.Text = DataBinder.Eval(e.Item.DataItem, "Savedate", "{0:MMM} {0:dd}, {0:yyyy}").ToString();

                    ToolkitScriptManager objScriptManager = (ToolkitScriptManager)this.Master.FindControl("ToolkitScriptManager1");
                    objScriptManager.AsyncPostBackTimeout = 36000;
                    LinkButton lb = (LinkButton)e.Item.FindControl("LinkButton1");
                    objScriptManager.RegisterAsyncPostBackControl(lb);
                }
            }
            catch (NullReferenceException)
            {
            }
        }
        protected void SaveJob_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            HiddenField HiddenField1 = (HiddenField)e.Item.FindControl("HiddenField1");
            if (e.CommandName == "Delete")
            {
                facade.DeleteSaveJobs(Convert.ToInt32(HiddenField1.Value));
                BindingList();
            }
        }
        protected void lbtn_AdsCv_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/memberArea/AdsCv.aspx");
        }
    }
}