using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using System.Data;
using TeachingJob.Data;
using System.Web.Security;
using BusinessLogic.Facade;

namespace TeachingJob
{
    public partial class _Default : BasePage
    {

        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                facade = new BusinessFacade(myConn);

                dataListJobSlide.RepeatColumns = 2;
                dataListJobSlide.DataSource = facade.GetFeaturedJob();
                dataListJobSlide.DataBind();
                Repeater_NewestJobs.DataSource = facade.GetNewestJobs();
                Repeater_NewestJobs.DataBind();
                //repeater_GetTop16CV.DataSource = facade.GetTop16CV();
                //repeater_GetTop16CV.DataBind();
                //Thuc ra dang tro vao thang GetTop16
                repeater_GetTop6CV.DataSource = facade.GetTop6CV();
                repeater_GetTop6CV.DataBind();
                dl_featureLogo.DataSource = FeaturedLogo.GetAll();
                dl_featureLogo.DataBind();
                
                BindingInternship();
            }

        }

        private void BindingInternship()
        {
            try
            {
                BusinessLogic.Facade.Intership.Intership internship = BusinessLogic.Facade.Intership.Intership.getIntershipById(
                   Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["DefaultInternshipId"].ToString()), true);
                if (internship != null)
                {
                    string articleName = internship.ArticleName;
                    string articleIntroduction = internship.ArticleIntroduction;

                    liCreatedDate.Text = internship.CreatedDate.ToShortDateString();
                    aHeaderLink.Text = articleName;
                    aHeaderLink.NavigateUrl = "~/Templates/Pages/Article.aspx?aId=" + internship.Id.ToString();
                    aIntroduction.Text = articleIntroduction.Replace(Environment.NewLine, "<br />");
                }
                else
                {
                    aHeaderLink.Text = "No selected Internship or it does not exist anymore";
                }
            }
            catch (Exception e)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('"+e.Message+"');</script>");
            }
        }
        protected void dl_featureLogo_DataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                FeaturedLogo logo = (FeaturedLogo)e.Item.DataItem;
                Image imgFeaturedLogo = (Image)e.Item.FindControl("imgFeaturedLogo");
                if (imgFeaturedLogo != null)
                {
                    imgFeaturedLogo.ImageUrl = Utils.validateImage(General.EMP_LOGO + logo.Username, logo.Logo);
                    imgFeaturedLogo.AlternateText = logo.OrgName;
                    imgFeaturedLogo.ToolTip = logo.OrgName;
                }
            }
        }
        protected void dataListJobSlide_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            //Image img = (Image)e.Item.FindControl("Image1");
            //img.ToolTip = "Click to view job's criterials!";

            //HyperLink HyperLink1 = (HyperLink)e.Item.FindControl("HyperLink1");
            HyperLink hplTitle = (HyperLink)e.Item.FindControl("hpl_Title");
            hplTitle.Text =CutTitle(DataBinder.Eval(e.Item.DataItem, "Title").ToString(),50);
            hplTitle.NavigateUrl = "~/publicArea/JobDetails.aspx?jId=" + DataBinder.Eval(e.Item.DataItem, "Id").ToString();
            hplTitle.ToolTip = DataBinder.Eval(e.Item.DataItem, "Title").ToString();
            //hplTitle.NavigateUrl = GenerateURL(DataBinder.Eval(e.Item.DataItem, "Title"), DataBinder.Eval(e.Item.DataItem, "Id"));
            //string text = DataBinder.Eval(e.Item.DataItem, "Avatar").ToString();
            //string employer = DataBinder.Eval(e.Item.DataItem, "Employer").ToString();  //Emp ID
            //img.ImageUrl = Utils.validateImage(General.EMP_LOGO + employer,text);
            //HyperLink1.NavigateUrl = hplTitle.NavigateUrl;

            Label lbl = (Label)e.Item.FindControl("lbl_OrganizationName");
            lbl.Text = DataBinder.Eval(e.Item.DataItem, "OrgName").ToString();
        }
        //protected void GetTop16CV_DataBind(object sender, RepeaterItemEventArgs e)
        //{
        //    string imgStr = DataBinder.Eval(e.Item.DataItem, "Logo").ToString();
        //    string usernameStr = DataBinder.Eval(e.Item.DataItem, "Username").ToString();
        //    string major = DataBinder.Eval (e.Item.DataItem,"Major").ToString();
        //    string fullname = DataBinder.Eval(e.Item.DataItem, "FullName").ToString();
        //    string userId = DataBinder.Eval(e.Item.DataItem, "UserId").ToString();

        //    Image imgLogo = (Image)e.Item.FindControl("img_Logo");
        //    imgLogo.ImageUrl = Utils.validateImage(General.CAN_LOGO + usernameStr, imgStr);
        //    imgLogo.ToolTip = fullname;

        //    HyperLink hpl_username = (HyperLink)e.Item.FindControl("hpl_Username");
        //    hpl_username.Text = fullname;
        //    hpl_username.NavigateUrl = "~/publicArea/CV/Detail.aspx?r=e&cvname=" + userId;

        //    HyperLink hpl_Logo = (HyperLink)e.Item.FindControl("hpl_Logo");
        //    hpl_Logo.NavigateUrl = "~/publicArea/CV/Detail.aspx?r=e&cvname=" + userId;

        //    HyperLink hpl_readmore = (HyperLink)e.Item.FindControl("hpl_readmore");
        //    hpl_readmore.NavigateUrl = "~/publicArea/CV/Detail.aspx?r=e&cvname=" + userId;

        //    Label lblMajor = (Label)e.Item.FindControl("lbl_Major");
        //    lblMajor.Text = major;

        //    Label lbl_Interest = (Label)e.Item.FindControl("lbl_Interest");
        //    int noofinterest = facade.NoOfInterested(userId);
        //    if (noofinterest != 0)
        //    {
        //        lbl_Interest.Text = noofinterest + " interested.";
        //    }
        //}
        protected void repeater_GetTop6CV_DataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    HyperLink hpl_CvLink = (HyperLink)e.Item.FindControl("hpl_CvLink");
                    string UserId = DataBinder.Eval(e.Item.DataItem, "UserId").ToString();
                    hpl_CvLink.NavigateUrl = "~/publicArea/CV/Detail.aspx?r=e&cvname=" + UserId;
                }
            }
            catch (NullReferenceException)
            {
                Response.Redirect("~/publicArea/errorpages/Error404.aspx");
            }
        }
        protected void NewestJobs_DataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    HyperLink hpl_NewestJobTitle = (HyperLink)e.Item.FindControl("hpl_NewestJobTitle");
                    hpl_NewestJobTitle.NavigateUrl = "~/publicArea/JobDetails.aspx?jid="+DataBinder.Eval(e.Item.DataItem, "Id") ;
                    hpl_NewestJobTitle.ToolTip = string.Format("{0}\nClosing date: {1}", DataBinder.Eval(e.Item.DataItem, "Title").ToString(),Convert.ToDateTime(DataBinder.Eval(e.Item.DataItem, "ClosingDate").ToString()).ToString("dd MMM yyyy"));
                }
            }
            catch (NullReferenceException)
            {
                Response.Redirect("~/publicArea/errorpages/Error404.aspx");
            }
        }

        public string CutTitle(object title,int length)
        {
            string newTT = "";
            string oldTT =title.ToString();
            if (oldTT.Length > length)
            {
                newTT = oldTT.Substring(0, length);
                if (newTT.LastIndexOf(" ") > 0)
                {
                    newTT = newTT.Substring(0, newTT.LastIndexOf(" "));
                }
                newTT = newTT + "...";
            }
            else
            {
                newTT = oldTT;
            }
            return newTT;
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
        //    strTitle = "TeachingJobs/" + strTitle + "-" + strId + ".htm";

        //    return strTitle;
        //}

        //protected override object LoadPageStateFromPersistenceMedium()
        //{
        //    string viewState = Request.Form["__VSTATE"];
        //    byte[] bytes = Convert.FromBase64String(viewState);
        //    bytes = Compressor.Decompress(bytes);
        //    LosFormatter formatter = new LosFormatter();
        //    return formatter.Deserialize(Convert.ToBase64String(bytes));
        //}

        //protected override void SavePageStateToPersistenceMedium(object viewState)
        //{
        //    LosFormatter formatter = new LosFormatter();
        //    StringWriter writer = new StringWriter();
        //    formatter.Serialize(writer, viewState);
        //    string viewStateString = writer.ToString();
        //    byte[] bytes = Convert.FromBase64String(viewStateString);
        //    bytes = Compressor.Compress(bytes);
        //    ClientScript.RegisterHiddenField("__VSTATE", Convert.ToBase64String(bytes));
        //}
    }
}
