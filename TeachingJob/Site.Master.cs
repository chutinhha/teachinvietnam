using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using System.Threading;
using System.Globalization;
using System.Reflection;
using System.Resources;
using TeachingJob.Data;
using System.Web.Security;
using BusinessLogic.Article;

namespace TeachingJob
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

        BusinessFacade facade;
        private int availableJobCount;

        public int AvailableJobCount
        {
            get { return availableJobCount; }
            set { availableJobCount = value; }
        }
        public string root;
        ResourceManager rm;

        //redirect to login page for different roles
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["currentUserRole"] != null)
            {
                if (Session["currentUserRole"].ToString() == "organization")
                {
                    Response.AppendHeader("Redirect", Convert.ToString(Session.Timeout - 3) + "; URL=~/Account/Login.aspx?r=e");
                }
                else
                {
                    Response.AppendHeader("Redirect", Convert.ToString(Session.Timeout - 3) + "; URL=~/Account/Login.aspx");
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.User.Identity.IsAuthenticated)
            {
                if (Roles.IsUserInRole("organization"))
                {
                    Session["currentUserRole"] = "organization";
                }
                else if (Roles.IsUserInRole("employee"))
                {
                    Session["currentUserRole"] = "employee";
                }
            }
            //FormsAuthentication.RedirectToLoginPage("~/Account/Login.aspx?r=e");
            try
            {
                Assembly ass = Assembly.Load("App_GlobalResources");
                rm = new ResourceManager("Resources.Resource", ass);
                facade = new BusinessFacade(myConn);
                //Page.Form.DefaultButton = btn_Search.UniqueID;

                if (Request.Params["r"] == "e")
                {
                    btn_CandidateSite.Visible = true;
                    btn_EmployerSite.Visible = false;
                }
                if (Roles.IsUserInRole("Organization"))
                {
                    btn_CandidateSite.Visible = true;
                    btn_EmployerSite.Visible = false;

                    //invi candidate site
                    hpl_SchoolJob.Visible = false;
                    hpl_ExecJob.Visible = false;
                    htlHomeMenu2.Visible = false;
                    hplmyAccountMenu2.Visible = false;
                    HyperLink2.Visible = false;
                    btn_Search.Visible = false;
                    lbl_AvaiJob.Visible = false;
                    hpl_AdvanceSearch.Visible = false;

                    //show emp site
                    hpl_CvSearch.Visible = true;
                    HyperLink1.Visible = true;
                    hpl_em_myAccount.Visible = true;
                    HyperLink3.Visible = true;
                    HyperLink4.Visible = true;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>document.getElementById('li4').style.display = 'none';document.getElementById('li5').style.display = 'none';</script>");
                    //Panel1.Visible = false;
                    btn_Search_Cv.Visible = true;
                    //Other
                    lbl_SearchLabel.Text = rm.GetString("ResumesSearch");
                    //Panel_Gallery.Visible = false;
                    //Panel_PhongBi_emp.Visible = true;
                    int avaiResumes = facade.GetAvaiResumes();
                    lbl_AvaiResumes.Text = avaiResumes + " " + rm.GetString("resumesavailable"); ;
                    lbl_AvaiResumes.Visible = true;
                    hpl_AdvanceSearchCV.Visible = true;
                }

                AvailableJobCount = facade.GetAvailableJobCount();
                lbl_AvaiJob.Text = AvailableJobCount.ToString() + " " + rm.GetString("jobAvai");
                if (!IsPostBack)
                {
                    Page.Header.DataBind();
                }
                repeater_GetOrgType.DataSource = facade.GetAllOrganizationType();
                repeater_GetOrgType.DataBind();
                Repeater_Footer.DataSource = repeater_GetOrgType.DataSource;
                Repeater_Footer.DataBind();
                if (!Session.IsNewSession && !IsPostBack)
                {
                    try
                    {
                        setKeyword(Session["keyword"].ToString());
                        //setCitizenship(Session["citizenship"].ToString());
                    }
                    catch (NullReferenceException)
                    {

                    }
                }

                MasterDataBind();
                //else
                //{
                //ClearSession();
                //}
                //ClearSession();

                if (Roles.IsUserInRole("admin") || Roles.IsUserInRole("superadmin"))
                {
                    hpl_adminsite.Visible = true;
                    hpl_adminsite.Text = "Back end";
                    hpl_adminsite.NavigateUrl = "~/admintj/User.aspx";
                    hpl_TeacherTraining.Visible = true;
                    hpl_List.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void MasterDataBind()
        {
            try
            {
                dataListLocation.DataSource = facade.GetAllLocation();
                dataListLocation.DataBind();
                dl_adminCate.DataSource = facade.GetChildCategory(1);
                dl_adminCate.DataBind();
                dl_Fromk12Cate.DataSource = facade.GetChildCategory(2);
                dl_Fromk12Cate.DataBind();
                dl_AcademicCate.DataSource = facade.GetChildCategory(3);
                dl_AcademicCate.DataBind();

                //testimonial
                //Preparation p = facade.GetSlider();
                //img_slider.ImageUrl = General.EMP_TESTIMONIAL_LOGO + p.Name + "/" + p.Logo;
                //img_slider.ImageUrl = "~/images/services/internships.jpg";
                //lbl_caption.Text = "<h3>" + p.Name + " - " + p.Citizenship + "</h3>" + p.Body;

                datalist_Citizenship.DataSource = facade.GetAllCitizenship();
                datalist_Citizenship.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            BusinessLogic.Facade.Component.CategoryLogic componentFacade = new BusinessLogic.Facade.Component.CategoryLogic(myConn);
            List<Sector> sectorList = componentFacade.GetRootCategory();

            if (Thread.CurrentThread.CurrentCulture.Name == "en-US")
            {
                foreach (Sector sector in sectorList)
                {
                    if (sector.SeId == 1) { TabPanel1.HeaderText = sector.SeName_en; }
                    else if (sector.SeId == 2) { TabPanel2.HeaderText = sector.SeName_en; }
                    else if (sector.SeId == 3) { TabPanel3.HeaderText = sector.SeName_en; }
                }
            }
            else
            {
                foreach (Sector sector in sectorList)
                {
                    if (sector.SeId == 1) { TabPanel1.HeaderText = sector.SeName_vi; }
                    else if (sector.SeId == 2) { TabPanel2.HeaderText = sector.SeName_vi; }
                    else if (sector.SeId == 3) { TabPanel3.HeaderText = sector.SeName_vi; }
                }
            }
        }
        protected void RegisterEmployer_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Account/RegisterAsEmployer.aspx");
        }
        protected void RegisterEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Account/Register.aspx");
        }

        protected void dataListSector_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var myCheckBox = (CheckBox)e.Item.FindControl("cbSectorName");
                if (myCheckBox != null)
                {
                    myCheckBox.ID = "cbSectorName_" + e.Item.ItemIndex;
                    if (Thread.CurrentThread.CurrentCulture.Name == "vi-VN")
                    {
                        myCheckBox.Text = " " + DataBinder.Eval(e.Item.DataItem, "SeName_vi").ToString();
                    }
                    else
                    {
                        myCheckBox.Text = " " + DataBinder.Eval(e.Item.DataItem, "seName_en").ToString();
                    }
                    myCheckBox.InputAttributes.Add("value", DataBinder.Eval(e.Item.DataItem, "seName_en").ToString());
                    try
                    {
                        if (!Session.IsNewSession && !IsPostBack && Session["category"].ToString() != null)
                        {
                            string[] wpSplit = Session["category"].ToString().Split('O');
                            foreach (string str in wpSplit)
                            {
                                if (myCheckBox.InputAttributes["value"].ToString() == str)
                                {
                                    myCheckBox.Checked = true;
                                }
                            }
                            if (wpSplit.Length == 1)
                            {
                                lbl_Category.Text = wpSplit[0].ToString();
                            }
                            else if (wpSplit.Length > 1)
                            {
                                lbl_Category.Text = wpSplit.Length + " " + rm.GetString("categoriesselected");
                            }
                        }
                    }
                    catch (Exception) { }
                }
            }
        }
        string cate_filter;
        protected void cbSectorName_OnCheckChanged(object sender, EventArgs e)
        {
            var cbCateList = ((CheckBox)sender).InputAttributes["value"];

            if (string.IsNullOrEmpty(cate_filter))
            {
                cate_filter = cbCateList;
            }
            else
            {
                cate_filter += "O" + cbCateList;
            }
        }
        protected void dataListLocation_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                CheckBox myCheckBox = (CheckBox)e.Item.FindControl("cb_Location");
                if (myCheckBox != null)
                {
                    myCheckBox.ID = "cb_Location_" + e.Item.ItemIndex;
                    if (Thread.CurrentThread.CurrentCulture.Name == "vi-VN")
                    {
                        myCheckBox.Text = " " + DataBinder.Eval(e.Item.DataItem, "LName_vn").ToString();
                    }
                    else
                    {
                        myCheckBox.Text = " " + DataBinder.Eval(e.Item.DataItem, "LName").ToString();
                    }
                    myCheckBox.InputAttributes.Add("value", DataBinder.Eval(e.Item.DataItem, "LName").ToString());
                    try
                    {
                        if (!Session.IsNewSession && !IsPostBack && Session["location"].ToString() != null)
                        {
                            string[] wpSplit = Session["location"].ToString().Split('O');
                            foreach (string str in wpSplit)
                            {
                                if (myCheckBox.InputAttributes["value"].ToString() == str)
                                {
                                    myCheckBox.Checked = true;
                                }
                            }
                            if (wpSplit.Length == 1)
                            {
                                lbl_Location.Text = wpSplit[0].ToString();
                            }
                            else if (wpSplit.Length > 1)
                            {
                                lbl_Location.Text = wpSplit.Length + " " + rm.GetString("locationsselected");
                            }
                        }
                    }
                    catch (Exception) { }
                }
            }
        }
        string LoFilter;
        //int LoFilter_Count = 0;
        protected void cb_Location_CheckChanged(object sender, EventArgs e)
        {
            //LoFilter_Count++;
            //if (LoFilter_Count == 1)
            //{
            //    lbl_Location.Text = "1";
            //}
            //else
            //{
            //    lbl_Location.Text = LoFilter_Count.ToString();
            //}
            var cbLocationAtt = ((CheckBox)sender).InputAttributes["value"];
            if (string.IsNullOrEmpty(LoFilter))
            {
                LoFilter = cbLocationAtt;
            }
            else
            {
                LoFilter += "O" + cbLocationAtt;
            }
        }
        //Citizenship 
        protected void dataLisCitizenship_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                CheckBox myCheckBox = (CheckBox)e.Item.FindControl("cb_Citizenship");
                if (myCheckBox != null)
                {
                    myCheckBox.ID = "cb_Citizenship" + e.Item.ItemIndex;

                    if (Thread.CurrentThread.CurrentCulture.Name == "vi-VN")
                    {
                        myCheckBox.Text = " " + DataBinder.Eval(e.Item.DataItem, "CitizenshipName_vn").ToString();
                    }
                    else
                    {
                        myCheckBox.Text = " " + DataBinder.Eval(e.Item.DataItem, "CitizenshipName").ToString();
                    }
                    myCheckBox.InputAttributes.Add("value", DataBinder.Eval(e.Item.DataItem, "CitizenshipName").ToString());
                    try
                    {
                        if (!Session.IsNewSession && !IsPostBack && Session["citizenship"].ToString() != null)
                        {
                            string[] wpSplit = Session["citizenship"].ToString().Split('O');
                            foreach (string str in wpSplit)
                            {
                                if (myCheckBox.InputAttributes["value"].ToString() == str)
                                {
                                    myCheckBox.Checked = true;
                                }
                            }
                            if (wpSplit.Length == 1)
                            {
                                lbl_Citizenship2.Text = wpSplit[0].ToString();
                            }
                            else if (wpSplit.Length > 1)
                            {
                                lbl_Citizenship2.Text = wpSplit.Length + " " + rm.GetString("citizenshipsselected");
                            }
                        }
                    }
                    catch (Exception) { }
                }
            }
        }
        string CiFilter;
        protected void cb_Citizenship_CheckChanged(object sender, EventArgs e)
        {
            var cbCitizenshipAtt = ((CheckBox)sender).InputAttributes["value"];
            if (string.IsNullOrEmpty(CiFilter))
            {
                CiFilter = cbCitizenshipAtt;
            }
            else
            {
                CiFilter += "O" + cbCitizenshipAtt;
            }
        }
        //string ddl_value;
        protected void Search_Click(object sender, EventArgs e)
        {
            try
            {
                //ddl_value =ddl_SchoolType.SelectedItem.Value; 
                string keyword = txt_Search.Text.Trim();
                Add2Session("keyword", txt_Search.Text);
                Add2Session("citizenship", CiFilter);
                Add2Session("category", cate_filter);
                Add2Session("location", LoFilter);
                string query = "?kw=" + keyword.Trim() + "&cate=" + cate_filter + "&location=" + LoFilter + "&citizen=" + CiFilter;

                //ddl_SchoolType.DataTextField = ddl_value;

                Response.Redirect("~/publicArea/SearchResult.aspx" + query);
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
        }
        private void Add2Session(string ss_name, string ss_value)
        {
            if (Session.IsNewSession)
            {
                Session.Add(ss_name, ss_value);
            }
            else
            {
                Session[ss_name] = ss_value;
            }
        }
        public void setKeyword(string str)
        {
            txt_Search.Text = str;
        }
        protected void repeater_GetOrgType_DataBound(object sender, RepeaterItemEventArgs e)
        {
            HyperLink hpl = (HyperLink)e.Item.FindControl("hpl_OrgType");
            if (Thread.CurrentThread.CurrentCulture.Name == "vi-VN")
            {
                hpl.Text = DataBinder.Eval(e.Item.DataItem, "Name_vn").ToString();
            }
            else
            {
                hpl.Text = DataBinder.Eval(e.Item.DataItem, "Name").ToString();
            }
            hpl.NavigateUrl = "#" + e.Item.ItemIndex;

        }
        protected void Repeater_Footer_DataBound(object sender, RepeaterItemEventArgs e)
        {
            DataList dl = (DataList)e.Item.FindControl("dl_footer");
            string orgType = DataBinder.Eval(e.Item.DataItem, "Name").ToString();

            dl.DataSource = facade.GetJobByOrgType(orgType);
            dl.DataBind();
        }
        protected void dl_footer_DataBound(object sender, DataListItemEventArgs e)
        {
            HyperLink hpl_JobTitle = (HyperLink)e.Item.FindControl("hpl_JobTitleFooter");
            hpl_JobTitle.Text = DataBinder.Eval(e.Item.DataItem, "jTitle_en").ToString();
            hpl_JobTitle.ToolTip = DataBinder.Eval(e.Item.DataItem, "jTitle_en").ToString();
            hpl_JobTitle.NavigateUrl = "~/publicArea/JobDetails.aspx?jId=" + DataBinder.Eval(e.Item.DataItem, "jId").ToString();
        }


        protected void dl_Joblevel_Databound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var myCheckBox = (CheckBox)e.Item.FindControl("cb_JobLevel");
                if (myCheckBox != null)
                {
                    myCheckBox.ID = "cb_JobLevel_" + e.Item.ItemIndex;
                    myCheckBox.Text = DataBinder.Eval(e.Item.DataItem, "JrName").ToString();
                    myCheckBox.InputAttributes.Add("value", DataBinder.Eval(e.Item.DataItem, "JrName").ToString());

                    //myCheckBox.CssClass = "checked root";
                    //myCheckBox.AutoPostBack = true;

                }
            }
        }
        protected void dl_workplace_Databound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var myCheckBox = (CheckBox)e.Item.FindControl("cb_workplace");
                if (myCheckBox != null)
                {
                    myCheckBox.ID = "cb_workplace_" + e.Item.ItemIndex;
                    myCheckBox.Text = DataBinder.Eval(e.Item.DataItem, "LName").ToString();
                    myCheckBox.InputAttributes.Add("value", DataBinder.Eval(e.Item.DataItem, "LName").ToString());

                }
            }
        }
        protected void EmployerSite_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["currentUserRole"] != null)
                {
                    Session["currentUserRole"] = "";
                }

                if (HttpContext.Current.User.IsInRole("Employee"))
                {
                    MembershipUser mu = Membership.GetUser();
                    Session.Add("jobseeker_username", mu.UserName);
                }
                FormsAuthentication.SignOut();

                if (Session["employer_username"] != null)
                {
                    FormsAuthentication.SetAuthCookie(Session["employer_username"].ToString(), true);
                    FormsAuthentication.RedirectFromLoginPage(Session["employer_username"].ToString(), true);
                }
                Response.Redirect("~/Employer/EmployerSite.aspx?r=e");
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void CandidateSite_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["currentUserRole"] != null)
                {
                    Session["currentUserRole"] = "";
                }

                if (HttpContext.Current.User.IsInRole("Organization"))
                {
                    MembershipUser mu = Membership.GetUser();
                    Session.Add("employer_username", mu.UserName);
                }

                FormsAuthentication.SignOut();
                if (Session["jobseeker_username"] != null)
                {
                    FormsAuthentication.SetAuthCookie(Session["jobseeker_username"].ToString(), true);
                    FormsAuthentication.RedirectFromLoginPage(Session["jobseeker_username"].ToString(), true);
                }
                Response.Redirect("~/");
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void LoginView_OnPreRender(object sender, EventArgs e)
        {
            try
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    Label lbl_Username = (Label)HeadLoginView.FindControl("lbl_Username");
                    MembershipUser mu = Membership.GetUser();
                    if (HttpContext.Current.User.IsInRole("Organization"))
                    {
                        lbl_Username.Text = Context.Profile.GetPropertyValue("Employer.FirstName").ToString() + " " + Context.Profile.GetPropertyValue("Employer.LastName").ToString();
                    }
                    else
                    {
                        lbl_Username.Text = Context.Profile.GetPropertyValue("Employee.FirstName").ToString() + " " + Context.Profile.GetPropertyValue("Employee.LastName").ToString();
                    }

                }
            }
            catch (Exception)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('Login fails. Please try again.');</script>");
            }
        }
        protected void LoggedOutAction(object sender, EventArgs e)
        {
            if (Session["currentUserRole"] != null)
            {
                Session["currentUserRole"] = "";
            }
        }
        protected void SearchCV_Click(object sender, EventArgs e)
        {
            try
            {
                string keyword = txt_Search.Text;
                Add2Session("keyword", txt_Search.Text);
                Add2Session("citizenship", CiFilter);
                Add2Session("category", cate_filter);
                Add2Session("location", LoFilter);
                string query = "?kw=" + keyword.Trim() + "&cate=" + cate_filter + "&location=" + LoFilter + "&citizen=" + CiFilter;

                Response.Redirect("~/publicArea/CV/SearchResultcv.aspx" + query);
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void Img_FlagVi_Click(object sender, ImageClickEventArgs e)
        {
            string redirectTo = null;
            String url = this.Page.Request.Url.AbsoluteUri;

            if (url.Contains('?') && !url.Contains("lang"))
            {
                redirectTo = url + "&lang=vi";
            }
            else if (url.Contains('?') && (url.Contains("lang=en") || url.Contains("lang=vi")))
            {
                redirectTo = url.Replace("lang=en", "lang=vi");
            }
            else
            {
                redirectTo = url + "?lang=vi";
            }
            Response.Redirect(redirectTo);
        }
        protected void Img_FlagEn_Click(object sender, ImageClickEventArgs e)
        {
            string redirectTo;
            String url = this.Page.Request.Url.AbsoluteUri;
            if (url.Contains('?') && !url.Contains("lang"))
            {
                redirectTo = url + "&lang=en";
            }
            else if (url.Contains('?') && (url.Contains("lang=en") || url.Contains("lang=vi")))
            {
                redirectTo = url.Replace("lang=vi", "lang=en");
            }
            else
            {
                redirectTo = url + "?lang=en";
            }
            Response.Redirect(redirectTo);
        }
    }
}
