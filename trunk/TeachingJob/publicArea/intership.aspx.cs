using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using BusinessLogic.Facade.Intership;
using TeachingJob.Data;

namespace TeachingJob.publicArea
{
    public partial class intership : System.Web.UI.Page
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessLogic.BusinessFacade facade;

        protected void Page_Load(object sender, EventArgs e)
        {
            facade = new BusinessLogic.BusinessFacade(myConn);

            Intership intership = new Intership();
            //repeater_tabs.DataSource = Intership.GetAll();
            //repeater_tabs.DataBind();
            repeater_Content.DataSource = repeater_tabs.DataSource;
            repeater_Content.DataBind();

            //File reader
            string filepath = Server.MapPath("~/UserData/template/Preparation.txt");
            if (File.Exists(filepath))
            {
                StreamReader reader = new StreamReader(filepath);
                literal_stickyText.Text = reader.ReadToEnd().Replace(Environment.NewLine, "<br />");
            }
            if (User.IsInRole("superadmin") || User.IsInRole("admin"))
            {
                pnl_ApplyAdd.Visible = true;
            }
        }
        protected void Content_DataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Label lbl_ArticleTitle = (Label)e.Item.FindControl("lbl_ArticleTitle");
                    Literal literal_Body = (Literal)e.Item.FindControl("literal_Body");

                    string title = DataBinder.Eval(e.Item.DataItem, "Title").ToString();
                    string body = DataBinder.Eval(e.Item.DataItem, "Body").ToString();

                    lbl_ArticleTitle.Text = title;
                    literal_Body.Text = body.Replace(Environment.NewLine, "<br />");

                    if (User.IsInRole("superadmin") || User.IsInRole("admin"))
                    {
                        Panel Panel1 = (Panel)e.Item.FindControl("Panel1");
                        Panel1.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void Post_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (User.IsInRole("superadmin") || User.IsInRole("admin"))
                {
                    //Intership.Insert(txt_Title.Text.Trim(), txt_body.Text.Trim());
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('Your article is posted successfully');window.location.href='intership.aspx';</script>");
                }
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('Error: please select a valid image and its size is less than 1MB.');</script>");
            }
        }
    }
}