using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using BusinessLogic.Article;
using TeachingJob.Data;
using System.IO;

namespace TeachingJob.publicArea
{
    public partial class DetailTestimonial : BasePage
    {
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;
        int tid;

        protected void Page_Load(object sender, EventArgs e)
        {
            facade = new BusinessLogic.BusinessFacade(conn);
            if (Request.Params["tid"] != null)
            {
                tid = Convert.ToInt16(Request.Params["tid"]);
                BusinessLogic.Article.Preparation p = facade.GetTestimonialArticleById(tid);
                lbl_ArticleTitle.Text = p.Name + " - " + p.Citizenship;
                logo.ImageUrl = Utils.validateImage(General.EMP_TESTIMONIAL_LOGO + p.Name , p.Logo);
                lbl_Name.Text = p.Name;
                lbl_Citizenship.Text = p.Citizenship;
                literal_Body.Text = p.Body.Replace(Environment.NewLine, "<br />"); ;
            }
            else
            {
                Response.Redirect("~/publicarea/errorpages/error404.aspx");
            }
            
            List<Comment> cList = facade.ViewCommentByTid(tid);
            if (cList.Count != 0)
            {
                CollectionPager1.MaxPages = 10000;
                CollectionPager1.PageSize = 10;
                CollectionPager1.DataSource =facade.ViewCommentByTid(tid);
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
                Label lbl_Email = (Label)e.Item.FindControl("lbl_Email");
                Literal literal_Body = (Literal)e.Item.FindControl("literal_Body");

                lbl_Name.Text = DataBinder.Eval(e.Item.DataItem, "Writername").ToString();
                lbl_Email.Text = DataBinder.Eval(e.Item.DataItem, "Email").ToString();
                lbl_CreatedDate.Text = DataBinder.Eval(e.Item.DataItem, "Createddate").ToString();
                string body = DataBinder.Eval(e.Item.DataItem, "Body").ToString();
                literal_Body.Text = body.Replace(Environment.NewLine,"<br />");
            }
        }
        protected void btn_PostComment_Click(object sender, EventArgs e)
        {
            facade.PostComment(tid, txt_Fullname.Text.Trim(), txt_Email.Text.Trim(), HttpUtility.HtmlEncode(txt_Content.Text.Trim()), General.ACTIVE_TESTIMONIAL_COMMENT);
            
            lbl_Status.Visible = true;
            Panel_WriteComment.Visible = false;

            repeater_showComment.DataBind();
            //string url2 = Request.RawUrl.ToString();
            //Response.Redirect(url2+"&stt=posted");
        }

        protected void btn_Clear_Click(object sender, EventArgs e)
        {
            //ca 2 url deu dc
            //string url = Request.Url.AbsolutePath + Request.Url.Query;
            string url2 = Request.RawUrl.ToString();
            Response.Redirect(url2);
        }



    }
}