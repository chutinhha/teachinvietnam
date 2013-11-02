using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Subgurim.Controles;
using com.flajaxian;
using System.Globalization;

namespace TeachingJob
{
    public partial class About : System.Web.UI.Page
    {
        MembershipUser mu;
        protected void Page_Load(object sender, EventArgs e)
        {
            mu = Membership.GetUser();
            Label1.Text = HttpContext.Current.Request.Url.Host;
            Label4.Text = DateTime.Now.GetDateTimeFormats(new CultureInfo("vi-VN"))[15] + " | " + DateTime.Now.GetDateTimeFormats(new CultureInfo("vi-VN"))[26] + " | " + DateTime.Now.GetDateTimeFormats(new CultureInfo("vi-VN"))[27] + " | " + DateTime.Now.GetDateTimeFormats(new CultureInfo("vi-VN"))[28] + " | " + DateTime.Now.GetDateTimeFormats(new CultureInfo("vi-VN"))[29] + " | " + DateTime.Now.GetDateTimeFormats(new CultureInfo("vi-VN"))[30] + " | " + DateTime.Now.GetDateTimeFormats(new CultureInfo("vi-VN"))[31] + " | " + DateTime.Now.GetDateTimeFormats(new CultureInfo("vi-VN"))[32] + " | " + DateTime.Now.GetDateTimeFormats(new CultureInfo("vi-VN"))[33] + " | " + DateTime.Now.GetDateTimeFormats(new CultureInfo("vi-VN"))[34] + " | " + DateTime.Now.GetDateTimeFormats(new CultureInfo("vi-VN"))[35] + " | ";
            if (FileUploaderAJAX1.IsPosting)
            {
                this.managePost();
            }
        }

        private void managePost()
        {
            HttpPostedFileAJAX pf = FileUploaderAJAX1.PostedFile;
            pf.responseMessage_Uploaded_Saved = String.Format("<a href='#'>{0}</a> {1}KB", pf.FileName, pf.ContentLength / 1024);
            pf.responseMessage_Uploaded_NotSaved = String.Format("<a href='#'>{0}</a> is not a valid file.", pf.FileName);
            //if (pf.Deleted)
            //{
            //    Response.Redirect("http://DANTRI.COM");
            //}
            //if (IsValidImage(pf.FileName) && pf.ContentLength <= 3 * 1024000)
            //{
                FileUploaderAJAX1.SaveAs("~/temp/", pf.FileName);
            //}
            //else
            //{
            //    Label1.Text = "Content type error!";
            //}
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }
        protected void FileUploader_FileReceived(object sender, FileReceivedEventArgs e)
        {
            string fileUploadDir = Server.MapPath("~/temp/" + "19c92c1a-b6c0-4333-9734-b646148f311a" + "/");
            if (!System.IO.Directory.Exists(fileUploadDir))
            {
                System.IO.Directory.CreateDirectory(fileUploadDir);
            }
            e.File.SaveAs(fileUploadDir + e.File.FileName);
        }
        protected void FileNameDetermining(object sender, FileNameDeterminingEventArgs e)
        {
            string fileUploadDir = Server.MapPath("~/temp/" + mu.ProviderUserKey.ToString() + "/");
            if (!System.IO.Directory.Exists(fileUploadDir))
            {
                System.IO.Directory.CreateDirectory(fileUploadDir);
            }
            e.File.SaveAs(fileUploadDir + e.File.FileName);
        }
    }
}
