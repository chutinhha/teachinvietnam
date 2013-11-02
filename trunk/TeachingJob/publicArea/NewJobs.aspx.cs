using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using System.Data;
using TeachingJob.Data;

namespace TeachingJob.publicArea
{
    public partial class NewJobs : BasePage
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;
        
        string orderBy = "jUploadDate";
        string orderUpdown = "DESC";
        protected void Page_Load(object sender, EventArgs e)
        {
            facade = new BusinessFacade(myConn);

            int itemNumber = Convert.ToInt32(ddl_PageSize.SelectedValue);
            CollectionPager1.PageSize = itemNumber;
            BindingList();

            if (!IsPostBack)        //ko co su kien nao xay ra, chi chay lan dau tien 
            {

            }
            if (IsPostBack)         //co su kien nao xay ra, cai nay thi` binh thuong ko can de no cung load
            {

            }
            Literal1.Text = Convert.ToString(CollectionPager1.TotalRecords);
            CollectionPager1.PreRender += new EventHandler(CollectionPager1_PreRender);
            if (CollectionPager1.PageCount > 1)
            {
                CollectionPager1.HideOnSinglePage = false;
            }

            //ddl_PageSize.Visible = false;
            //ddl_SortItems.Visible = false;
            //lbl_sortBy.Visible = false;
            //lbl_ResultPerPage.Visible = false;

        }
        PagedDataSource objSourcePaged = new PagedDataSource();
        private void BindingList()
        {
            CollectionPager1.MaxPages = 10000;
            CollectionPager1.DataSource = facade.GetJobList(orderBy, orderUpdown);
            CollectionPager1.BindToControl = ListView1;

            objSourcePaged = CollectionPager1.DataSourcePaged;
            ListView1.DataSource = objSourcePaged;
            ListView1.DataBind();
        }
        //protected void CollectionPager1_Click(object sender, EventArgs e)
        //{
            
        //    objSourcePaged.CurrentPageIndex += 1;

        //}

        void CollectionPager1_PreRender(object sender, EventArgs e)
        {
            lbl_currentPage.Text = Convert.ToString(CollectionPager1.CurrentPage);
            lbl_totalPage.Text = Convert.ToString(CollectionPager1.PageCount);
            BindingList();
        }
        protected void PageSize_SelectChanged(object sender, EventArgs e)
        {
            try
            {
                CollectionPager1.PageSize = Convert.ToInt32(ddl_PageSize.SelectedValue);
                BindingList();
            }
            catch (Exception)
            {
                //Page.PreviousPage
            }
        }
        protected void ddl_SortItems_SelectChanged(object sender, EventArgs e)
        {

        }

        protected void ListView1_DataBound(object sender, ListViewItemEventArgs e)
        {
            //Image
            Image img = (Image)e.Item.FindControl("ImgLogo");
            if (img != null)
            {
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
            }
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

            Button location = (Button)e.Item.FindControl("btn_Location");
            location.Text = DataBinder.Eval(e.Item.DataItem, "WorkPlace").ToString();
            location.ToolTip="Work Location";
            HyperLink title = (HyperLink)e.Item.FindControl("hpl_Title");
            title.Text = DataBinder.Eval(e.Item.DataItem, "Title").ToString();
            title.NavigateUrl = "JobDetails.aspx?jid=" + DataBinder.Eval(e.Item.DataItem, "Id").ToString();
            //title.NavigateUrl = GenerateURL(DataBinder.Eval(e.Item.DataItem, "Title"), DataBinder.Eval(e.Item.DataItem, "Id"), DataBinder.Eval(e.Item.DataItem, "OrgName"));
            title.ToolTip = title.Text;

            Label citizen = (Label)e.Item.FindControl("lbl_Citizenship");
            citizen.Text = DataBinder.Eval(e.Item.DataItem, "Citizenship").ToString();
            citizen.ToolTip = "Required citizenship";
            //UploadDAte
            //Label lbl = (Label)e.Item.FindControl("lbl_AddAgo");
            //DateTime getUploadDate = Convert.ToDateTime(DataBinder.Eval(e.Item.DataItem, "UploadDate").ToString());
            //TimeSpan addago = DateTime.Now.Subtract(getUploadDate);
            //if (addago.Days == 0 || addago.Days == 1)
            //{
            //    lbl.Text = Convert.ToString(addago.Days) + " day ago";
            //}
            //else
            //    lbl.Text = Convert.ToString(addago.Days) + " days ago";

            //Salary
            //Label lblsalary = (Label)e.Item.FindControl("lbl_Salary");
            //string salary = DataBinder.Eval(e.Item.DataItem, "Salary", "{0:$#,##0.00;($#,##0.00);''}");
            //if (salary != "")
            //{
            //    lblsalary.Text = salary.ToString();
            //}
            //else
            //    lblsalary.Text = "Negotiable";
            

            //ClosingDate
            Label closingdate = (Label)e.Item.FindControl("lbl_ClosingDate");
            closingdate.Text = DataBinder.Eval(e.Item.DataItem, "ClosingDate", "{0:MMM} {0:dd}, {0:yyyy}").ToString();
            closingdate.ToolTip = "Closing Date";
            //<%# Eval("ClosingDate", "{0:MMM} {0:dd}, {0:yyyy}")%>
            //Category
            //Label lblCate = (Label)e.Item.FindControl("lbl_Category");
            //string cate = DataBinder.Eval(e.Item.DataItem, "Category").ToString();
            //lblCate.Text = cate;

            //EmploymentType
            //Label lblType = (Label)e.Item.FindControl("lbl_type");
            //string type = DataBinder.Eval(e.Item.DataItem, "EmploymentType").ToString();
            //lblType.Text = type;

            //Job level
            //Label lblJoblevel = (Label)e.Item.FindControl("lbl_joblevel");
            //string joblevel = DataBinder.Eval(e.Item.DataItem, "JobLevel").ToString();
            //lblJoblevel.Text = joblevel;
        }
        public static string GenerateURL(object Title, object strId, object orgName=null)
        {
            string strTitle = Title.ToString();

            #region Generate SEO Friendly URL based on Title
            //Trim Start and End Spaces.
            strTitle = strTitle.Trim();

            //Trim "-" Hyphen
            strTitle = strTitle.Trim('-');

            strTitle = strTitle.ToLower();
            char[] chars = @"$%#@!*?;:~`+=()[]{}|\'<>,/^&"".".ToCharArray();
            strTitle = strTitle.Replace("c#", "C-Sharp");
            strTitle = strTitle.Replace("vb.net", "VB-Net");
            strTitle = strTitle.Replace("asp.net", "Asp-Net");

            //Replace . with - hyphen
            strTitle = strTitle.Replace(".", "-");

            //Replace Special-Characters
            for (int i = 0; i < chars.Length; i++)
            {
                string strChar = chars.GetValue(i).ToString();
                if (strTitle.Contains(strChar))
                {
                    strTitle = strTitle.Replace(strChar, string.Empty);
                }
            }

            //Replace all spaces with one "-" hyphen
            strTitle = strTitle.Replace(" ", "-");

            //Replace multiple "-" hyphen with single "-" hyphen.
            strTitle = strTitle.Replace("--", "-");
            strTitle = strTitle.Replace("---", "-");
            strTitle = strTitle.Replace("----", "-");
            strTitle = strTitle.Replace("-----", "-");
            strTitle = strTitle.Replace("----", "-");
            strTitle = strTitle.Replace("---", "-");
            strTitle = strTitle.Replace("--", "-");

            //Run the code again...
            //Trim Start and End Spaces.
            strTitle = strTitle.Trim();

            //Trim "-" Hyphen
            strTitle = strTitle.Trim('-');
            #endregion

            //Append ID at the end of SEO Friendly URL
            //strTitle = "~/TeachingJobs/" + strId + "/" + strTitle + ".htm";
            strTitle = "~/TeachingJobs/" + strTitle + "-" + strId + ".htm";

            return strTitle;
        }
    }
}