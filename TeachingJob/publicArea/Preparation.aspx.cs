using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.IO;
using System.Drawing;
using TeachingJob.Data;
using System.Drawing.Imaging;

namespace TeachingJob.publicArea
{
    public partial class Preparation : BasePage
    {

        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessLogic.BusinessFacade facade;

        protected void Page_Load(object sender, EventArgs e)
        {
            facade = new BusinessLogic.BusinessFacade(myConn);
            
            repeater_tabs.DataSource = facade.View_Article("view_Preparation_Article");
            repeater_tabs.DataBind();
            repeater_Content.DataSource = repeater_tabs.DataSource;
            repeater_Content.DataBind();

            //File reader
            string filepath = Server.MapPath("~/UserData/template/Preparation.txt");
            if(File.Exists(filepath)){
                StreamReader reader = new StreamReader(filepath);
                literal_stickyText.Text = reader.ReadToEnd().Replace(Environment.NewLine,"<br />");
            }
        }
        protected void ClearContent()
        {
            txt_Title.Text = "";
            txt_body.Text = "";
            //FileUpload1.Dispose();
        }
        protected void Post_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (User.IsInRole("superadmin") || User.IsInRole("admin"))
                {
                    Boolean setPreparationArticle = false;
                    //if (cb_SetAsSlider.Checked) { setslider = true; }

                    facade.Insert_PreparedArticle(txt_Title.Text.Trim(), "", txt_body.Text.Trim(), setPreparationArticle, General.ACTIVE_PREPARATION);

                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('Your article is posted successfully');window.location.href='Preparation.aspx';</script>");

                }
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('Error: please select a valid image and its size is less than 1MB.');</script>");
            }
        }

        protected String fileUploadName(FileUpload fileupload)
        {
            try
            {
                string fileUploadDir = Server.MapPath(General.EMP_ARTICLE_LOGO + txt_Title.Text.Trim() + "/");
                if (!System.IO.Directory.Exists(fileUploadDir))
                {
                    System.IO.Directory.CreateDirectory(fileUploadDir);
                }

                var image = System.Drawing.Image.FromStream(fileupload.PostedFile.InputStream);
                var newImage = Utils.ScaleImage(image, 300, 196);
                newImage.Save(fileUploadDir + fileupload.FileName, ImageFormat.Jpeg);

                return fileupload.PostedFile.FileName.ToString();
            }
            catch (Exception)
            {
                return "";
            }
        }
        public bool IsValidImage(string fileName)
        {
            Regex regex = new Regex(@"(.*?)\.(jpg|JPG|jpeg|JPEG|png|PNG|gif|GIF|bmp|BMP)$");
            return regex.IsMatch(fileName);
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
                    string body= DataBinder.Eval(e.Item.DataItem, "Body").ToString();

                    lbl_ArticleTitle.Text = title;
                    literal_Body.Text = body.Replace(Environment.NewLine,"<br />");

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
    }
}