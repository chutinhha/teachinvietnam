using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text.RegularExpressions;
using System.Drawing;
using TeachingJob.Data;

namespace TeachingJob.publicArea
{
    public partial class RecruitmentCenter : System.Web.UI.Page
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessLogic.BusinessFacade facade;

        protected void Page_Load(object sender, EventArgs e)
        {
            facade = new BusinessLogic.BusinessFacade(myConn);

            repeater_tabs.DataSource = facade.view_HiringAdvice_Category();
            repeater_tabs.DataBind();
            repeater_Content.DataSource = null;
            repeater_Content.DataBind();

            //File reader
            string filepath = Server.MapPath("~/UserData/template/HiringAdvice.txt");
            if (File.Exists(filepath))
            {
                StreamReader reader = new StreamReader(filepath);
                literal_stickyText.Text = reader.ReadToEnd().Replace(Environment.NewLine, "<br />");
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
                Boolean setRecruitmentArticle = true;

                facade.Insert_PreparedArticle(txt_Title.Text.Trim(), "", txt_body.Text.Trim(), setRecruitmentArticle, true);

                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('Your article is posted successfully');window.location.href='RecruitmentCenter.aspx';</script>");

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

                System.Drawing.Image imageToBeResized = System.Drawing.Image.FromStream(fileupload.PostedFile.InputStream);
                int imageHeight = imageToBeResized.Height;
                int imageWidth = imageToBeResized.Width;
                int maxHeight = 196;
                int maxWidth = 300;
                imageHeight = (imageHeight * maxWidth) / imageWidth;
                imageWidth = maxWidth;
                if (imageHeight > maxHeight)
                {
                    imageWidth = (imageWidth * maxHeight) / imageHeight;
                    imageHeight = maxHeight;
                }
                Bitmap bitmap = new Bitmap(imageToBeResized, imageWidth, imageHeight);
                bitmap.Save(fileUploadDir + fileupload.FileName);

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

        //protected void FileUpload1_CustomValidation(object source, ServerValidateEventArgs args)
        //{
        //    if (IsValidImage(FileUpload1.PostedFile.FileName))
        //    {
        //        if (FileUpload1.PostedFile.ContentLength < 1024000)
        //        {
        //            args.IsValid = true;
        //        }
        //        else
        //        {
        //            args.IsValid = false;
        //        }
        //    }
        //    else
        //    {
        //        args.IsValid = false;
        //    }

        //}

        protected void Content_DataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Label lbl_ArticleTitle = (Label)e.Item.FindControl("lbl_ArticleTitle");
                    Literal literal_Body = (Literal)e.Item.FindControl("literal_Body");

                    string title = DataBinder.Eval(e.Item.DataItem, "Title").ToString();
                    string body = DataBinder.Eval(e.Item.DataItem, "ArticleContent").ToString();

                    lbl_ArticleTitle.Text = title;
                    literal_Body.Text = body.Replace(Environment.NewLine, "<br />");

                    if (User.IsInRole("Organization") || User.IsInRole("admin"))
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