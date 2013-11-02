using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text.RegularExpressions;
using TeachingJob.Data;
using System.Reflection;
using System.Resources;
using System.Drawing.Imaging;

namespace TeachingJob.publicArea
{
    public partial class Testimonial : BasePage
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessLogic.BusinessFacade facade;

        protected void Page_Load(object sender, EventArgs e)
        {
            facade = new BusinessLogic.BusinessFacade(myConn);

            CollectionPager1.MaxPages = 10000;
            CollectionPager1.PageSize = 5;
            CollectionPager1.DataSource = facade.View_TestimonialArticle();
            CollectionPager1.BindToControl = repeater_Content;
            repeater_Content.DataSource = CollectionPager1.DataSourcePaged;
            repeater_Content.DataBind();

            //File reader
            string filepath = Server.MapPath("~/UserData/template/Testimonial.txt");
            if (File.Exists(filepath))
            {
                StreamReader reader = new StreamReader(filepath);
                literal_stickyText.Text = reader.ReadToEnd().Replace(Environment.NewLine, "<br />");
            }

            //Limit input characters
            txt_body.Attributes.Add("onkeydown", "textCounter(this,'" + Label1.ClientID + "', 5000)");
            txt_body.Attributes.Add("onkeyup", "textCounter(this,'" + Label1.ClientID + "', 5000)");
            txt_body.Attributes.Add("onmousedown", "textCounter(this,'" + Label1.ClientID + "', 5000)");
            txt_body.Attributes.Add("onmouseup", "textCounter(this,'" + Label1.ClientID + "', 5000)");
            txt_body.Attributes.Add("onblur", "textCounter(this,'" + Label1.ClientID + "', 5000)");
        }
        protected void Content_DataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Label lbl_ArticleTitle = (Label)e.Item.FindControl("lbl_ArticleTitle");
                    Label lbl_Name = (Label)e.Item.FindControl("lbl_Name");
                    Label lbl_Citizenship = (Label)e.Item.FindControl("lbl_Citizenship");
                    HyperLink hpl_ArticleTitle = (HyperLink)e.Item.FindControl("hpl_ArticleTitle");
                    HyperLink hpl_logo = (HyperLink)e.Item.FindControl("hpl_logo");

                    Image logo = (Image)e.Item.FindControl("logo");
                    Literal literal_Body = (Literal)e.Item.FindControl("literal_Body");

                    string name = DataBinder.Eval(e.Item.DataItem, "Name").ToString();
                    string citizenship = DataBinder.Eval(e.Item.DataItem, "Citizenship").ToString();
                    string body = DataBinder.Eval(e.Item.DataItem, "Body").ToString();
                    string ImageName = DataBinder.Eval(e.Item.DataItem, "Logo").ToString();
                    string id = DataBinder.Eval(e.Item.DataItem, "Id").ToString();

                    lbl_ArticleTitle.Text = name + " - " + citizenship;
                    lbl_ArticleTitle.ToolTip = "Name - Citizenship";
                    lbl_Name.Text = name;
                    lbl_Citizenship.Text = citizenship;
                    literal_Body.Text = body.Replace(Environment.NewLine, "<br />");
                    //literal_Body.Text = body.Replace(Environment.NewLine, "\n");
                    
                    logo.ImageUrl = Utils.validateImage(General.EMP_TESTIMONIAL_LOGO + name , ImageName);
                    hpl_ArticleTitle.NavigateUrl = "DetailTestimonial.aspx?tid=" + id;
                    hpl_logo.NavigateUrl = hpl_ArticleTitle.NavigateUrl;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void Post_Click(object sender, EventArgs e)
        {
            recaptcha.Validate();
            if (recaptcha.IsValid)
            {
                if (Page.IsValid)
                {
                    Boolean setslider = false;
                    //if (cb_SetAsSlider.Checked) { setslider = true; }

                    facade.Insert_TestimonialArticle(txt_Title.Text.Trim(), txt_citizenship.Text.Trim(), fileUploadName(FileUpload1), HttpUtility.HtmlEncode(txt_body.Text.Trim()), setslider, General.ACTIVE_TESTIMONIAL);
                    //Response.Redirect(this.Request.Url.AbsolutePath);
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('Your article is posted successfully');window.location.href='testimonial.aspx';</script>");
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('There is error existed. Please check again.');</script>");
                }
            }
            else
            {
                Assembly ass = Assembly.Load("App_GlobalResources");
                ResourceManager rm = new ResourceManager("Resources.Resource", ass);
                lbl_captStt.Text = rm.GetString("Pleaseentercorrectcaptcha");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "PopupScript", "<script>document.getElementById('postnewdiv').style.display = 'inline';document.getElementById('" + lbl_captStt.ClientID + "').style.display='inline';</script>");
            }
        }

        protected String fileUploadName(FileUpload fileupload)
        {
            try
            {
                string fileUploadDir = Server.MapPath(General.EMP_TESTIMONIAL_LOGO + txt_Title.Text.Trim() + "/");
                if (!System.IO.Directory.Exists(fileUploadDir))
                {
                    System.IO.Directory.CreateDirectory(fileUploadDir);
                }


                var image = System.Drawing.Image.FromStream(fileupload.PostedFile.InputStream);
                var newImage = Utils.ScaleImage(image, 330, 240);
                newImage.Save(fileUploadDir + fileupload.FileName, ImageFormat.Jpeg);

                return fileupload.PostedFile.FileName.ToString();
            }
            catch (Exception ex)
            {
                lbl_uploadStt.Text = "Error: " + ex.Message.ToString();
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
        //    if (FileUpload1.HasFile)
        //    {
        //        if (IsValidImage(FileUpload1.PostedFile.FileName))
        //        {
        //            if (FileUpload1.PostedFile.ContentLength < 1024000)
        //            {
        //                args.IsValid = true;
        //            }
        //            else
        //            {
        //                args.IsValid = false;
        //            }
        //        }
        //        else
        //        {
        //            args.IsValid = false;
        //        }
        //    }
        //    else { args.IsValid = true; }

        //}
        //protected void cb_SetAsSlider_Validate(object sender, ServerValidateEventArgs args)
        //{
        //    if (FileUpload1.HasFile)
        //    {
        //        args.IsValid = true;
        //    }
        //    else
        //    {
        //        args.IsValid = false;
        //        cb_SetAsSlider.Checked = false;
        //    }
        //}
        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Testimonial.aspx");
        }
    }
}