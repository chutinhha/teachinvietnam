using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using TeachingJob.Data;
using System.Reflection;
using System.Resources;
using System.Web.Security;

namespace TeachingJob.publicArea.CV
{
    public partial class SearchResultcv : BasePage
    {
        String conn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;
        public string qt_location { get; set; }
        public string qt_citizen { get; set; }
        public string qt_cate { get; set; }
        public string qt_yoe { get; set; }
        public string qt_el { get; set; }
        public string qt_jl { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Assembly ass = Assembly.Load("App_GlobalResources");
            ResourceManager rm = new ResourceManager("Resources.Resource", ass);
            facade = new BusinessFacade(conn);

            String kw = Request.Params["kw"];
            qt_cate = Request.QueryString["cate"];
            qt_location = Request.QueryString["location"];
            qt_citizen = Request.QueryString["citizen"];

            qt_yoe = Request.QueryString["yoe"];
            qt_jl = Request.QueryString["jl"];
            qt_el = Request.QueryString["el"];
            Boolean ad = false;
            if (Request.QueryString["ad"] == "true")
            {
                ad = true;
            }
            CollectionPager1.MaxPages = 10000;
            CollectionPager1.PageSize = Convert.ToInt32(ddl_ResultPerPage.SelectedValue);
            CollectionPager1.DataSource = facade.proc_SearchCV(kw, qt_cate, qt_location, qt_citizen, qt_el, qt_jl, qt_yoe, ad);
            CollectionPager1.BindToControl = DataList1;
            DataList1.DataSource = CollectionPager1.DataSourcePaged;
            DataList1.DataBind();
            if (DataList1.Items.Count == 0)
            {
                lbl_JobCount.Text = rm.GetString("Noresume");
                Panel1.Visible = true;
            }
            else
            {
                lbl_JobCount.Text = DataList1.Items.Count + " " + rm.GetString("resumesfound");
                Panel1.Visible = false;
            }
        }

        protected void DataList_DataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string usernameStr = DataBinder.Eval(e.Item.DataItem, "Username").ToString();
                string imgName = DataBinder.Eval(e.Item.DataItem, "Logo").ToString();
                string userId = DataBinder.Eval(e.Item.DataItem, "UserId").ToString();

                HyperLink hpl_Image = (HyperLink)e.Item.FindControl("hpl_Image");
                hpl_Image.NavigateUrl = "~/publicArea/CV/Detail.aspx?cvname=" + userId;
                //
                HyperLink hpl_Fullname = (HyperLink)e.Item.FindControl("hpl_Fullname");
                hpl_Fullname.Text = DataBinder.Eval(e.Item.DataItem, "Fullname").ToString();
                hpl_Fullname.NavigateUrl = "~/publicArea/CV/Detail.aspx?cvname=" + userId;
                //Image
                Image img = (Image)e.Item.FindControl("Img");
                if (imgName == null || imgName == "")
                {
                    img.ImageUrl = "~/images/companyLogo/noLogo.jpg";
                }
                else
                {
                    img.ImageUrl = General.CAN_LOGO + usernameStr + "/" + imgName;
                }

                //Major
                Label lbl_Major = (Label)e.Item.FindControl("lbl_Major");
                lbl_Major.Text = DataBinder.Eval(e.Item.DataItem, "Major").ToString();
                lbl_Major.ToolTip = DataBinder.Eval(e.Item.DataItem, "Major").ToString();

                string location2tt = "";
                string location3tt = "";
                DateTime dob = Convert.ToDateTime(DataBinder.Eval(e.Item.DataItem, "Dob"));
                Boolean salaryType = false;
                try
                {
                    if (DataBinder.Eval(e.Item.DataItem, "SalaryType") != null)
                    {
                        salaryType = DataBinder.Eval(e.Item.DataItem, "SalaryType") != null ? Convert.ToBoolean(DataBinder.Eval(e.Item.DataItem, "SalaryType").ToString()) : false;
                    }
                }
                catch (Exception)
                {
                    salaryType = false;
                }
                string salaryMessage = string.Empty;
                if (salaryType == true)
                {
                    salaryMessage = "Salary: " + DataBinder.Eval(e.Item.DataItem, "SalaryFrom1").ToString() + " - "
                    + DataBinder.Eval(e.Item.DataItem, "SalaryTo1").ToString() + " "
                    + DataBinder.Eval(e.Item.DataItem, "SalaryCurrency1").ToString() + "/"
                    + DataBinder.Eval(e.Item.DataItem, "SalaryPaidType1").ToString() + "\n";
                }
                else
                {
                    salaryMessage = "Salary: negotiable \n";
                }
                if (DataBinder.Eval(e.Item.DataItem, "Location3").ToString() != "")
                { location3tt = ", " + DataBinder.Eval(e.Item.DataItem, "Location3").ToString(); }
                if (DataBinder.Eval(e.Item.DataItem, "Location2").ToString() != "")
                { location2tt = ", " + DataBinder.Eval(e.Item.DataItem, "Location2").ToString(); }
                img.ToolTip = "Fullname: " + hpl_Fullname.Text + "\n"
                    + "Major: " + lbl_Major.Text + "\n"
                    + "Citizenship: " + DataBinder.Eval(e.Item.DataItem, "Citizenship").ToString() + "\n"
                    + "Dob: " + dob.ToShortDateString() + "\n"
                    + "Recent position: " + DataBinder.Eval(e.Item.DataItem, "MostRecentPosition1").ToString() + "\n"
                    + salaryMessage
                    + "Expected location: " + DataBinder.Eval(e.Item.DataItem, "Location").ToString() + location2tt + location3tt + "\n"
                    + "Last Updated: " + DataBinder.Eval(e.Item.DataItem, "LastUpdated").ToString();
                hpl_Fullname.ToolTip = img.ToolTip;

                //save cv button
                LinkButton lbtn_SavedJob = (LinkButton)e.Item.FindControl("lbtn_SavedJob");
                lbtn_SavedJob.CommandArgument = usernameStr;
            }
        }
        protected void PageSize_SelectChanged(object sender, EventArgs e)
        {
            try
            {
                CollectionPager1.PageSize = Convert.ToInt32(ddl_ResultPerPage.SelectedValue);
                DataList1.DataBind();
            }
            catch (IndexOutOfRangeException)
            {

            }
        }
        protected void Citizenship_DataBound(object sender, EventArgs e)
        {

        }
        protected void DataList1_OnCommand(object sender, DataListCommandEventArgs e)
        {
            if (e.CommandName == "save")
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

                    MembershipUser cv_mu = Membership.GetUser(e.CommandArgument.ToString());
                    MembershipUser currentUser = Membership.GetUser();

                    BusinessFacade facade = new BusinessFacade(myConn);
                    facade.SaveCv(currentUser.ProviderUserKey.ToString(), cv_mu.ProviderUserKey.ToString());
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + rm.GetString("Thisresumesavedinto") + "');</script>");

                }
            }
        }
    }
}