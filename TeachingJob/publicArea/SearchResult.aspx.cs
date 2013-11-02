using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using System.Data;
using System.Text;
using TeachingJob.Data;

namespace TeachingJob.publicArea
{
    public partial class SearchResult : BasePage
    {
            String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;
        //string orderBy = "jUploadDate";
        //string orderUpdown = "DESC";
        string keyword;

        public string Keyword
        {
            get { return keyword; }
            set { keyword = value; }
        }
        static string qt_cate = ""; static string qt_location = ""; static string qt_citizen = ""; static string qt_st = "";
        
        //for advance search
        static string qt_jl = ""; static string qt_empt = ""; static string qt_ot = ""; static Boolean ad = false;
        List<SchoolType> schTypeList;
        public List<SchoolType> SchTypeList
        {
            get { return schTypeList; }
            set { schTypeList = value; }
        }
        int itemNumber;
        protected void Page_Load(object sender, EventArgs e)
        {
            facade = new BusinessFacade(myConn);
            //if (!IsPostBack)
            //{
            //    SchTypeList = facade.GetSchoolType();
            //    foreach (SchoolType sc in SchTypeList)
            //    {
            //        ListItem li = new ListItem();
            //        li.Value = sc.Name;
            //        li.Text = sc.Name;
            //        ddl_SchoolType.Items.Add(li);
            //    }
            //}

            Keyword = Request.QueryString["kw"];

            qt_cate = Request.QueryString["cate"];
            qt_location = Request.QueryString["location"];
            qt_ot = Request.QueryString["ot"];
            qt_st = Request.QueryString["st"];              //school type
            qt_citizen = Request.QueryString["citizen"];
            qt_empt = Request.QueryString["empt"];
            qt_jl = Request.QueryString["jl"]; 
            if(string.IsNullOrEmpty(qt_empt))
                qt_empt="";
            if (string.IsNullOrEmpty(qt_jl))
                qt_jl = "";
            
            ad = Convert.ToBoolean(Request.QueryString["ad"]);
            
            if (string.IsNullOrEmpty(qt_ot)) { qt_ot = ""; }
            if (string.IsNullOrEmpty(qt_st)) { qt_st = ""; }
            if (string.IsNullOrEmpty(Keyword)) { Keyword = ""; }

            itemNumber = Convert.ToInt32(ddl_PageSize.SelectedValue);
            //if (!IsPostBack)
            //{
            //    ListItem selectedItem_Type = ddl_SchoolType.Items.FindByValue(qt_st);
            //    if (selectedItem_Type != null)
            //    {
            //        ddl_SchoolType.ClearSelection();
            //        selectedItem_Type.Selected = true;
            //    }
                
            //}
            //qt_st = ddl_SchoolType.SelectedValue;
            BindingList();
            CollectionPager1.PreRender += new EventHandler(CollectionPager1_PreRender);
        }
        PagedDataSource objSourcePaged = new PagedDataSource();
        private void BindingList() 
        {
            CollectionPager1.MaxPages = 10000;
            CollectionPager1.PageSize = itemNumber;
            try
            {
                CollectionPager1.DataSource = facade.GetSearchResult(Keyword, qt_st.Trim(), qt_cate.Trim(), qt_location.Trim(), qt_citizen.Trim(), qt_jl.Trim(), qt_empt.Trim(),qt_ot.Trim(),ad);
                CollectionPager1.BindToControl = ListView1;

                objSourcePaged = CollectionPager1.DataSourcePaged;
                ListView1.DataSource = objSourcePaged;
                ListView1.DataBind();
            }
            catch (NullReferenceException)
            {
                Response.Redirect("~/publicArea/errorPages/Error404.aspx");
            }
            
            Literal1.Text = Convert.ToString(CollectionPager1.TotalRecords);
        }
        protected void SchoolType_SelectedIndexChanged(object sender, EventArgs e)
        {
            qt_st = ddl_SchoolType.SelectedValue;

            if (CollectionPager1.TotalRecords / itemNumber < CollectionPager1.CurrentPage && CollectionPager1.CurrentPage != 1 && itemNumber != 0)
            {
                string query = "?kw=" + Keyword.Trim() + "&st=" + ddl_SchoolType.SelectedValue + "&cate=" + qt_cate + "&location=" + qt_location + "&citizen=" + qt_citizen;
                lbl_DropdownST.Text = "Error: Please reselect a school type";
                Response.Redirect("~/publicArea/SearchResult.aspx" + query);
            }
            BindingList();
            
        }

        void CollectionPager1_PreRender(object sender, EventArgs e)
        {
            lbl_currentPage.Text = Convert.ToString(CollectionPager1.CurrentPage);
            lbl_totalPage.Text = Convert.ToString(CollectionPager1.PageCount);
            ((SiteMaster)this.Page.Master).setKeyword(Keyword);
            //((SiteMaster)this.Page.Master).setCitizenship(qt_citizen);
            //BindingList();
        }
        protected void PageSize_SelectChanged(object sender, EventArgs e)
        {
            try
            {
                CollectionPager1.PageSize = Convert.ToInt32(ddl_PageSize.SelectedValue);
                BindingList();
            }
            catch (IndexOutOfRangeException)
            {
                
            }
        }
        protected void ddl_SortItems_SelectChanged(object sender, EventArgs e)
        {

        }
        protected void ListView1_DataBound(object sender, ListViewItemEventArgs e)
        {
            //Image
            Image img = (Image)e.Item.FindControl("ImgLogo");
            string employer = DataBinder.Eval(e.Item.DataItem, "Username").ToString();
            string text = DataBinder.Eval(e.Item.DataItem, "OrgLogo").ToString();
            if (text != "")
            {
                img.ImageUrl = General.EMP_LOGO + employer + "/" + text;
            }
            else
            {
                img.ImageUrl = "~/images/companyLogo/no_image_100x100.jpg";
            }
            Button location = (Button)e.Item.FindControl("btn_Location");
            location.Text = DataBinder.Eval(e.Item.DataItem, "WorkPlace").ToString();
            location.ToolTip = "Work Location";
            
            HyperLink title = (HyperLink)e.Item.FindControl("hpl_Title");
            title.Text = DataBinder.Eval(e.Item.DataItem, "Title").ToString();
            title.NavigateUrl = "JobDetails.aspx?jid=" + DataBinder.Eval(e.Item.DataItem, "Id").ToString();
            //title.NavigateUrl = GenerateURL(DataBinder.Eval(e.Item.DataItem, "Title"), DataBinder.Eval(e.Item.DataItem, "Id"));
            title.ToolTip = title.Text;

            Label citizen = (Label)e.Item.FindControl("lbl_Citizenship");
            citizen.Text = DataBinder.Eval(e.Item.DataItem, "Citizenship").ToString();
            citizen.ToolTip = "Required citizenship";

            //Organization
            Label lblOrganization = (Label)e.Item.FindControl("lbl_Organization");
            lblOrganization.ToolTip = "Organization";
            string organization = DataBinder.Eval(e.Item.DataItem, "OrgName").ToString();
            if (organization != null)
            {
                lblOrganization.Text = organization;
            }
            else
                lblOrganization.Text = "Not Specified!";

            Label closingdate = (Label)e.Item.FindControl("lbl_ClosingDate");
            closingdate.Text = DataBinder.Eval(e.Item.DataItem, "ClosingDate", "{0:MMM} {0:dd}, {0:yyyy}").ToString();
            closingdate.ToolTip = "Closing Date";
            img.ToolTip = lblOrganization.Text;
            img.AlternateText = lblOrganization.Text;
        }
        //public static string GenerateURL(object Title, object strId, object orgName = null)
        //{
        //    string strTitle = Title.ToString();

        //    #region Generate SEO Friendly URL based on Title
        //    //Trim Start and End Spaces.
        //    strTitle = strTitle.Trim();

        //    //Trim "-" Hyphen
        //    strTitle = strTitle.Trim('-');

        //    strTitle = strTitle.ToLower();
        //    char[] chars = @"$%#@!*?;:~`+=()[]{}|\'<>,/^&"".".ToCharArray();
        //    strTitle = strTitle.Replace("c#", "C-Sharp");
        //    strTitle = strTitle.Replace("vb.net", "VB-Net");
        //    strTitle = strTitle.Replace("asp.net", "Asp-Net");

        //    //Replace . with - hyphen
        //    strTitle = strTitle.Replace(".", "-");

        //    //Replace Special-Characters
        //    for (int i = 0; i < chars.Length; i++)
        //    {
        //        string strChar = chars.GetValue(i).ToString();
        //        if (strTitle.Contains(strChar))
        //        {
        //            strTitle = strTitle.Replace(strChar, string.Empty);
        //        }
        //    }

        //    //Replace all spaces with one "-" hyphen
        //    strTitle = strTitle.Replace(" ", "-");

        //    //Replace multiple "-" hyphen with single "-" hyphen.
        //    strTitle = strTitle.Replace("--", "-");
        //    strTitle = strTitle.Replace("---", "-");
        //    strTitle = strTitle.Replace("----", "-");
        //    strTitle = strTitle.Replace("-----", "-");
        //    strTitle = strTitle.Replace("----", "-");
        //    strTitle = strTitle.Replace("---", "-");
        //    strTitle = strTitle.Replace("--", "-");

        //    //Run the code again...
        //    //Trim Start and End Spaces.
        //    strTitle = strTitle.Trim();

        //    //Trim "-" Hyphen
        //    strTitle = strTitle.Trim('-');
        //    #endregion

        //    //Append ID at the end of SEO Friendly URL
        //    //strTitle = "~/TeachingJobs/" + strId + "/" + strTitle + ".htm";
        //    strTitle = "~/TeachingJobs/" + strTitle + "-" + strId + ".htm";

        //    return strTitle;
        //}
    }
}