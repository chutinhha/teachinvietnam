using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using BusinessLogic.Article;
using System.Web.Security;
using TeachingJob.Data;
using System.Reflection;
using System.Resources;

namespace TeachingJob.Employer
{
    public partial class HiringAdviceDetail : BasePage
    {
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;
        int id;

        protected void Page_Load(object sender, EventArgs e)
        {
            facade = new BusinessLogic.BusinessFacade(conn);
            if (Request.Params["id"] != null)
            {
                id = Convert.ToInt16(Request.Params["id"]);
                BusinessLogic.Article.HiringAdvice ha = facade.GetHiringAdviceById(id);
                Guid guid = new Guid(ha.Writer);
                MembershipUser mu = Membership.GetUser(guid);
                lbl_ArticleTitle.Text = ha.Title;

                logo.ImageUrl = Utils.validateImage(General.EMP_HIRING_ADVICE + ha.Writer , ha.Logo);

                lbl_Name.Text = ha.FullName;
                lbl_UploadDate.Text = ha.UploadedDate.ToShortDateString();
                literal_detail.Text = ha.Detail.ToString().Replace(Environment.NewLine, "<br />");
            }
            else
            {
                Response.Redirect("~/publicarea/errorpages/error404.aspx");
            }

            List<Comment> cList = facade.ViewCommentHiringById(id);
            if (cList.Count != 0)
            {
                CollectionPager1.MaxPages = 10000;
                CollectionPager1.PageSize = 10;
                CollectionPager1.DataSource = cList;
                CollectionPager1.BindToControl = repeater_showComment;
                repeater_showComment.DataSource = CollectionPager1.DataSourcePaged;
                repeater_showComment.DataBind();
            }
            else
            {
                repeater_showComment.Visible = false;
            }

            //Limit input characters
            txt_Content.Attributes.Add("onkeydown", "textCounter(this,'" + Label1.ClientID + "', 5000)");
            txt_Content.Attributes.Add("onkeyup", "textCounter(this,'" + Label1.ClientID + "', 5000)");
            txt_Content.Attributes.Add("onmousedown", "textCounter(this,'" + Label1.ClientID + "', 5000)");
            txt_Content.Attributes.Add("onmouseup", "textCounter(this,'" + Label1.ClientID + "', 5000)");
            txt_Content.Attributes.Add("onblur", "textCounter(this,'" + Label1.ClientID + "', 5000)");
        }
        protected void repeater_showComment_DataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lbl_Name = (Label)e.Item.FindControl("lbl_Name");
                Label lbl_CreatedDate = (Label)e.Item.FindControl("lbl_CreatedDate");
                Literal literal_Body = (Literal)e.Item.FindControl("literal_Body");
                //Label lbl_OrgName = (Label)e.Item.FindControl("lbl_OrgName");
                Literal literal_RepTo = (Literal)e.Item.FindControl("literal_RepTo");
                literal_RepTo.Text = lbl_ArticleTitle.Text;
                //lbl_OrgName.Text = DataBinder.Eval(e.Item.DataItem, "OrgName").ToString();
                string logo = DataBinder.Eval(e.Item.DataItem, "Logo").ToString();
                string writer = DataBinder.Eval(e.Item.DataItem, "Writername").ToString();

                lbl_Name.Text = DataBinder.Eval(e.Item.DataItem, "Fullname").ToString();
                lbl_Name.ToolTip = DataBinder.Eval(e.Item.DataItem, "OrgName").ToString();
                lbl_CreatedDate.Text = DataBinder.Eval(e.Item.DataItem, "Createddate").ToString();
                string body = DataBinder.Eval(e.Item.DataItem, "Body").ToString();
                literal_Body.Text = body.Replace(Environment.NewLine, "<br />");

                Image Img_PersonalImage = (Image)e.Item.FindControl("Img_PersonalImage");
                Img_PersonalImage.ImageUrl = Utils.validateImage(General.EMP_HIRING_ADVICE + writer , logo);
                if (User.IsInRole("admin") || User.IsInRole("superadmin"))
                {
                    LinkButton lbtn_Remove = (LinkButton)e.Item.FindControl("lbtn_Remove");
                    lbtn_Remove.Visible = true;
                    lbtn_Remove.CommandArgument = DataBinder.Eval(e.Item.DataItem, "Id").ToString();
                }
            }
        }
        protected void btn_PostComment_Click(object sender, EventArgs e)
        {
            MembershipUser mu = Membership.GetUser();
            facade.PostCommentHiring(id, mu.ProviderUserKey.ToString(), HttpUtility.HtmlEncode(txt_Content.Text.Trim()), General.ACTIVE_HIRINGADVICE_COMMENT);

            //lbl_Status.Visible = true;
            //Panel_WriteComment.Visible = false;

            string url2 = Request.RawUrl.ToString();
            Assembly ass = Assembly.Load("App_GlobalResources");
            ResourceManager rm = new ResourceManager("Resources.Resource", ass);

            Page.ClientScript.RegisterClientScriptBlock(GetType(), "PopupScript", "<script>alert('" + rm.GetString("Thanksforyouranswer") + "');window.location.href='" + url2 + "';</script>");
            //Response.Redirect(url2);
        }

        protected void btn_Clear_Click(object sender, EventArgs e)
        {
            //ca 2 url deu dc
            //string url = Request.Url.AbsolutePath + Request.Url.Query;
            string url2 = Request.RawUrl.ToString();
            Response.Redirect(url2);
        }
        protected void repeater_showComment_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteComment")
            {

                facade.removeRow(Convert.ToInt16(e.CommandArgument), "id", "tbl_CommentHiring");
                repeater_showComment.DataBind();
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "PopupScript", "<script>alert('Removed Successfully!');</script>");

            }
        }

    }
}