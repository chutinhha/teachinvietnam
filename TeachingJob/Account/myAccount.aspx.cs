using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using BusinessLogic;
using TeachingJob.Data;
using System.Web.Security;
using System.Drawing;

namespace TeachingJob.Account
{
    public partial class myAccount : BasePage
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        string username;
        public string Username
        {
            get { return username; }
            set { username = value; }
        }
        BusinessFacade facade;
        protected void Page_Load(object sender, EventArgs e)
        {
            String userId = null;
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
                //List<OrganizationType> otType = facade.GetAllOrganizationType();
                //OrganizationType.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                //foreach (OrganizationType ot in otType)
                //{
                //    ListItem li = new ListItem(ot.Name, ot.Name);
                //    OrganizationType.Items.Add(li);
                //}

                //List<Location> loList = facade.GetAllLocation();
                //ddlJobLocation.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                //foreach (Location l in loList)
                //{
                //    ListItem li = new ListItem(l.LName, l.LName);
                //    ddlJobLocation.Items.Add(li);
                //}

                List<Citizenship> ciList = facade.GetAllCitizenship();
                //ddlCitizenship.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                ddl_Citizenship_em.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                foreach (Citizenship ci in ciList)
                {
                    ListItem li = new ListItem(ci.CitizenshipName, ci.CitizenshipName);
                    //ddlCitizenship.Items.Add(li);
                    ddl_Citizenship_em.Items.Add(li);
                }

                ddl_Gender_em.Items.Insert(0, new ListItem(string.Empty, "n"));
            }

        }
        public bool IsValidImage(string fileName)
        {
            Regex regex = new Regex(@"(.*?)\.(jpg|JPG|jpeg|JPEG|png|PNG|gif|GIF|bmp|BMP)$");
            return regex.IsMatch(fileName);
        }
        protected String fileUploadName(FileUpload fileupload, Label label, string userid)
        {
            try
            {
                if (fileupload.HasFile)
                {
                    //if (fileupload.PostedFile.ContentType == "image/jpeg")
                    if (IsValidImage(fileupload.PostedFile.FileName))
                    {
                        if (fileupload.PostedFile.ContentLength < 1024000)
                        {
                            string fileUploadDir = Server.MapPath(General.EMP_LOGO + userid + "/");
                            if (!System.IO.Directory.Exists(fileUploadDir))
                            {
                                System.IO.Directory.CreateDirectory(fileUploadDir);
                            }
                            System.Drawing.Image imageToBeResized = System.Drawing.Image.FromStream(fileupload.PostedFile.InputStream);
                            int imageHeight = imageToBeResized.Height;
                            int imageWidth = imageToBeResized.Width;
                            int maxHeight = 80;
                            int maxWidth = 106;
                            imageHeight = (imageHeight * maxWidth) / imageWidth;
                            imageWidth = maxWidth;
                            if (imageHeight > maxHeight)
                            {
                                imageWidth = (imageWidth * maxHeight) / imageHeight;
                                imageHeight = maxHeight;
                            }
                            Bitmap bitmap = new Bitmap(imageToBeResized, imageWidth, imageHeight);
                            bitmap.Save(Server.MapPath(General.EMP_LOGO + userid + "/") +
                                 fileupload.FileName);

                            
                            label.Text = "File is selected!";
                            return fileupload.FileName;
                        }
                        else
                        {
                            label.Text = "Error: File upload has to be less than 1mb!";
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
        protected String fileUploadName_candidate(FileUpload fileupload, Label label, string userid)
        {
            try
            {
                if (fileupload.HasFile)
                {
                    //if (fileupload.PostedFile.ContentType == "image/jpeg")
                    if (IsValidImage(fileupload.PostedFile.FileName))
                    {
                        if (fileupload.PostedFile.ContentLength < 1024000)
                        {
                            string fileUploadDir = Server.MapPath(General.CAN_LOGO + userid + "/");
                            if (!System.IO.Directory.Exists(fileUploadDir))
                            {
                                System.IO.Directory.CreateDirectory(fileUploadDir);
                            }
                            System.Drawing.Image imageToBeResized = System.Drawing.Image.FromStream(fileupload.PostedFile.InputStream);
                            int imageHeight = imageToBeResized.Height;
                            int imageWidth = imageToBeResized.Width;
                            int maxHeight = 200;
                            int maxWidth = 200;
                            imageHeight = (imageHeight * maxWidth) / imageWidth;
                            imageWidth = maxWidth;
                            if (imageHeight > maxHeight)
                            {
                                imageWidth = (imageWidth * maxHeight) / imageHeight;
                                imageHeight = maxHeight;
                            }
                            Bitmap bitmap = new Bitmap(imageToBeResized, imageWidth, imageHeight);
                            bitmap.Save(Server.MapPath(General.CAN_LOGO + userid + "/") +
                                 fileupload.FileName);

                            label.Text = "Photo is selected!";
                            return fileupload.FileName;
                        }
                        else
                        {
                            label.Text = "Error: File upload has to be less than 1mb!";
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
    }
}