using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using System.Web.Security;
using System.Text.RegularExpressions;
using System.IO;
using System.Drawing;
using TeachingJob.Data;
using System.Threading;
using System.Globalization;
using System.Drawing.Imaging;

namespace TeachingJob.publicArea.CV.InternalUpdate
{
    public partial class UpdatePersonal : BasePage
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        string username;
        public string Username
        {
            get { return username; }
            set { username = value; }
        }
        BusinessFacade facade;
        String userId;
        public String UserId
        {
            get { return userId; }
            set { userId = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                MembershipUser mu = Membership.GetUser();
                Username = mu.UserName;
                userId = mu.ProviderUserKey.ToString();
            }
            catch (NullReferenceException)
            {
                Response.Redirect("~/publicArea/errorpages/Error404.aspx");
            }

            facade = new BusinessFacade(myConn);
            if (!IsPostBack)
            {
                List<Citizenship> ciList = facade.GetAllCitizenship();
                ddl_Citizenship_em.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                foreach (Citizenship ci in ciList)
                {
                    ListItem li = Utils.DecideLangDropdown(ci.CitizenshipName, ci.CitizenshipName_vn);
                    ddl_Citizenship_em.Items.Add(li);
                }

                ddl_Gender_em.Items.Insert(0, new ListItem(string.Empty, "n"));
            }
        }
        protected String fileUploadName_candidate(FileUpload fileupload, Label label, string username)
        {
            try
            {
                if (fileupload.HasFile)
                {
                    //if (fileupload.PostedFile.ContentType == "image/jpeg")
                    if (IsValidImage(fileupload.PostedFile.FileName))
                    {
                        if (fileupload.PostedFile.ContentLength < General.IMAGE_SIZE)
                        {
                            string fileUploadDir = Server.MapPath(General.CAN_LOGO + username + "/");
                            if (!System.IO.Directory.Exists(fileUploadDir))
                            {
                                System.IO.Directory.CreateDirectory(fileUploadDir);
                            }
                            else
                            {
                                string[] filePaths = Directory.GetFiles(Server.MapPath(General.CAN_LOGO + username + "/"), "*.*",
                                             SearchOption.AllDirectories);

                                foreach (string path in filePaths)
                                {
                                    File.Delete(path);
                                }
                            }
                            //change image size
                            var image = System.Drawing.Image.FromStream(fileupload.PostedFile.InputStream);
                            var newImage = Utils.ScaleImage(image, 300, 300);
                            newImage.Save(Server.MapPath(General.CAN_LOGO + username + "/") + fileupload.FileName, ImageFormat.Jpeg);

                            label.Text = "Photo is selected!";
                            return fileupload.FileName;
                        }
                        else
                        {
                            label.Text = "Error: File upload has to be less than "+General.GetImageSize(General.IMAGE_SIZE)+"mb!";
                            return null;
                        }
                    }
                    else
                    {
                        label.Text = "Error: Only image can be uploaded!";
                        return null;
                    }
                }
                else
                {
                    label.Text = "Error: You have not specified a file!";
                    return null;
                }
            }
            catch (Exception ex)
            {
                label.Text = "Error: " + ex.Message.ToString();
                return null;
            }
        }
        public bool IsValidImage(string fileName)
        {
            Regex regex = new Regex(@"(.*?)\.(jpg|JPG|jpeg|JPEG|png|PNG|gif|GIF|bmp|BMP)$");
            return regex.IsMatch(fileName);
        }
    }
}