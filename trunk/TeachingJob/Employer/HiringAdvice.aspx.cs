using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Drawing;
using System.IO;
using System.Web.Security;
using BusinessLogic.Article;
using System.Web.UI.HtmlControls;
using TeachingJob.Data;
using System.Reflection;
using System.Resources;

namespace TeachingJob.Employer
{
    public partial class HiringAdvice : BasePage
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessLogic.BusinessFacade facade;

        int currentId;
        int currentIndex;

        Assembly ass;
        ResourceManager rm;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
            ass = Assembly.Load("App_GlobalResources");
            rm = new ResourceManager("Resources.Resource", ass);

            facade = new BusinessLogic.BusinessFacade(myConn);

            Form.DefaultButton = btn_Post.UniqueID;

            //File reader
            string filepath = Server.MapPath("~/UserData/template/HiringAdvice.txt");
            if (File.Exists(filepath))
            {
                StreamReader reader = new StreamReader(filepath);
                literal_stickyText.Text = reader.ReadToEnd().Replace(Environment.NewLine, "<br />");
            }

            if (Request.Params["cateid"] != null && Request.Params["cateindex"] != null)
            {
                currentId = Convert.ToInt16(Request.Params["cateid"].ToString());
                currentIndex = Convert.ToInt16(Request.Params["cateindex"].ToString());
            }
            else
            {
                currentIndex = 0;
                currentId = facade.GetFirstCateId();
            }

            repeater_tabs.DataSource = facade.view_HiringAdvice_Category();
            repeater_tabs.DataBind();

            repeater_Content.DataSource = facade.view_HiringAdvice(currentId);
            repeater_Content.DataBind();


            txt_Detail.Attributes.Add("onkeydown", "textCounter(this,'" + Label1.ClientID + "', 5000)");
            txt_Detail.Attributes.Add("onkeyup", "textCounter(this,'" + Label1.ClientID + "', 5000)");
            txt_Detail.Attributes.Add("onmousedown", "textCounter(this,'" + Label1.ClientID + "', 5000)");
            txt_Detail.Attributes.Add("onmouseup", "textCounter(this,'" + Label1.ClientID + "', 5000)");
            txt_Detail.Attributes.Add("onblur", "textCounter(this,'" + Label1.ClientID + "', 5000)");
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('"+ex.Message+"');</script>");

                //Response.Redirect(Request.RawUrl.ToString());
            }
        }

        protected void repeater_tabs_DataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    LinkButton lbtn_Cate = (LinkButton)e.Item.FindControl("lbtn_Cate");

                    if (!IsPostBack && e.Item.ItemIndex == currentIndex)
                    {
                        lbtn_Cate.CssClass = "lbtn2";
                    }

                    lbtn_Cate.Text = DataBinder.Eval(e.Item.DataItem, "Name").ToString();
                    lbtn_Cate.CommandArgument = DataBinder.Eval(e.Item.DataItem, "Id").ToString();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void ClearContent()
        {
            txt_Title.Text = "";
        }
        protected void Post_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    MembershipUser mu = Membership.GetUser();
                    facade.AddHiringAdvice(txt_Title.Text.Trim(), currentId, mu.ProviderUserKey.ToString(), General.ACTIVE_HIRINGADVICE, txt_Detail.Text.Trim());

                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('" + rm.GetString("Yourquestionispostedsuccessfully") + "');window.location.href='HiringAdvice.aspx?cateid=" + currentId + "&cateindex=" + currentIndex + "';</script>");

                }
                catch (Exception)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('Error! Please Post again');window.location.href='HiringAdvice.aspx';</script>");
                }
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('Error: Your data is not qualified to be posted.');</script>");
            }
        }

        protected void Content_DataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Label lbl_ArticleTitle = (Label)e.Item.FindControl("lbl_ArticleTitle");
                    Label lbl_Name = (Label)e.Item.FindControl("lbl_Name");
                    Label lbl_UploadDate = (Label)e.Item.FindControl("lbl_UploadDate");
                    HyperLink hpl_ArticleTitle = (HyperLink)e.Item.FindControl("hpl_ArticleTitle");
                    HyperLink hpl_logo = (HyperLink)e.Item.FindControl("hpl_logo");

                    System.Web.UI.WebControls.Image logo = (System.Web.UI.WebControls.Image)e.Item.FindControl("logo");

                    string title = DataBinder.Eval(e.Item.DataItem, "Title").ToString();
                    string writer = DataBinder.Eval(e.Item.DataItem, "Writer").ToString();
                    string fullname = DataBinder.Eval(e.Item.DataItem, "FullName").ToString();
                    string orgname = DataBinder.Eval(e.Item.DataItem, "OrgName").ToString();
                    string usernameLogo = DataBinder.Eval(e.Item.DataItem, "Logo").ToString();
                    string id = DataBinder.Eval(e.Item.DataItem, "Id").ToString();
                    string uploaddate = DataBinder.Eval(e.Item.DataItem, "UploadedDate", "{0:MMM} {0:dd}, {0:yyyy}").ToString();
                    DateTime up = DateTime.Parse(uploaddate);
                    Guid guid = new Guid(writer);
                    MembershipUser mu = Membership.GetUser(guid);

                    lbl_ArticleTitle.Text = title;
                    lbl_ArticleTitle.ToolTip = title;
                    lbl_Name.Text = fullname;
                    //lbl_OrgName.Text = orgname;

                    logo.ImageUrl = Utils.validateImage(General.EMP_HIRING_ADVICE + writer , usernameLogo);
                    logo.ToolTip = lbl_ArticleTitle.Text;

                    int countComment = facade.GetNumberOfCommentHiringById(Convert.ToInt16(id));
                    string cm = countComment + " " + rm.GetString("comments");
                    if (countComment == 1)
                    {
                        cm = countComment + " " + rm.GetString("comment");
                    }
                    else if (countComment == 0)
                    {
                        cm = rm.GetString("Nocomment");
                        Panel pn_LatestComment = (Panel)e.Item.FindControl("pn_LatestComment");
                        pn_LatestComment.Visible = false;
                    }
                    lbl_UploadDate.Text = up + " - " + cm;

                    Comment comment = facade.GetRecentComment(Convert.ToInt16(id));
                    if (comment != null)
                    {
                        Literal LastestComment = (Literal)e.Item.FindControl("LastestComment");
                        LastestComment.Text = rm.GetString("LastestCommentby") + " " + comment.Fullname + " " + rm.GetString("at") + " " + comment.Createddate + ":";
                        Literal LastestCommentContent = (Literal)e.Item.FindControl("LastestCommentContent");
                        LastestCommentContent.Text = " - " + comment.Body;
                    }

                    hpl_ArticleTitle.NavigateUrl = "HiringAdviceDetail.aspx?id=" + id;
                    hpl_logo.NavigateUrl = hpl_ArticleTitle.NavigateUrl;

                    HtmlGenericControl divAnswer = (HtmlGenericControl)e.Item.FindControl("answerDiv");
                    HtmlAnchor lnkAnswer = (HtmlAnchor)e.Item.FindControl("lnkAnswer");
                    lnkAnswer.Attributes.Add("onclick", "showAnswerPanel(\"" + divAnswer.ClientID + "\")");

                    HtmlAnchor CancelAnswer = (HtmlAnchor)e.Item.FindControl("CancelAnswer");
                    CancelAnswer.Attributes.Add("onclick", "hideAnswerPanel('" + divAnswer.ClientID + "')");

                    LinkButton lbtn_Answer = (LinkButton)e.Item.FindControl("lbtn_Answer");
                    lbtn_Answer.CommandArgument = id;

                    if (User.IsInRole("admin") || User.IsInRole("superadmin"))
                    {
                        LinkButton lbtn_Remove = (LinkButton)e.Item.FindControl("lbtn_Remove");
                        lbtn_Remove.Visible = true;
                        lbtn_Remove.CommandArgument = id;
                    }


                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void repeater_Content_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "PostYourAnswer")
            {
                try
                {
                    string answerText = Request.Form["answerText"];
                    MembershipUser mu = Membership.GetUser();
                    facade.PostCommentHiring(Convert.ToInt16(e.CommandArgument), mu.ProviderUserKey.ToString(), HttpUtility.HtmlEncode(answerText.Trim()), General.ACTIVE_HIRINGADVICE_COMMENT);
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + rm.GetString("Thanksforyouranswer") + "');window.location.href='HiringAdvice.aspx?cateid=" + currentId + "&cateindex=" + currentIndex + "';</script>");
                }
                catch (Exception)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('Error: please try again or contact administrator.');</script>");
                }
            }
            if (e.CommandName == "DeleteAdvice")
            {
                try
                {
                    facade.disableRow("tbl_HiringAdvice", "active", Convert.ToInt16(e.CommandArgument));
                    repeater_Content.DataBind();
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('Delete successfully!');window.location.href='HiringAdvice.aspx?cateid=" + currentId + "&cateindex=" + currentIndex + "';</script>");
                }
                catch (System.Data.SqlClient.SqlException)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('error!');</script>");
                }
            }
        }
        int cateid;
        protected void repeater_tabs_Command(object sender, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewArticleByCategory")
            {
                LinkButton lbtn_Cate = (LinkButton)e.Item.FindControl("lbtn_Cate");
                lbtn_Cate.CssClass = "lbtn2";
                cateid = Convert.ToInt32(e.CommandArgument.ToString());
                ViewState["cateid"] = cateid;
                ViewState["cateindex"] = e.Item.ItemIndex;

                Response.Redirect("HiringAdvice.aspx?cateid=" + cateid + "&cateindex=" + e.Item.ItemIndex);

                repeater_Content.DataSource = facade.view_HiringAdvice(cateid);
                repeater_Content.DataBind();
            }
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