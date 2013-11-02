using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Profile;
using System.Text.RegularExpressions;
using System.Text;
using System.Net.Mail;
using BusinessLogic;
using System.Drawing;
using System.IO;
using TeachingJob.Data;
using System.Reflection;
using System.Resources;
using System.Globalization;
using System.Threading;
using System.Drawing.Imaging;

namespace TeachingJob.Account
{
    public partial class Register : BasePage
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;
        protected void Page_Load(object sender, EventArgs e)
        {
            facade = new BusinessFacade(myConn);
            //Form.DefaultButton = CreateUserWizard1.create;
            CreateUserWizard1.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
            //CreateUserWizard1.FinishDestinationPageUrl = "../Default.aspx";

            Assembly ass = Assembly.Load("App_GlobalResources");
            ResourceManager rm = new ResourceManager("Resources.Resource", ass);

            DropDownList ddl = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddl_Citizenship");
            List<Citizenship> ciList = facade.GetAllCitizenship();
            ddl.Items.Insert(0, new ListItem(rm.GetString("Pleaseselect"), string.Empty));
            foreach (Citizenship ci in ciList)
            {
                ListItem li = Utils.DecideLangDropdown(ci.CitizenshipName, ci.CitizenshipName_vn);
                ddl.Items.Add(li);
            }

            DropDownList ddl_month = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddl_Month");
            DropDownList ddl_day = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddl_Day");
            DropDownList ddl_year = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddl_Year");

            ddl_month.Items.Insert(0, new ListItem(rm.GetString("Month"), string.Empty));
            ddl_day.Items.Insert(0, new ListItem(rm.GetString("Day"), string.Empty));
            ddl_year.Items.Insert(0, new ListItem(rm.GetString("Year"), string.Empty));

            for (int i = 1; i <= 31; i++)
            {
                ddl_day.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
            }
            for (int i = 1; i <= 12; i++)
            {
                ddl_month.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
            }
            int count = 1;
            for (int i = DateTime.Now.Year; i >= 1900; i--)
            {
                ddl_year.Items.Insert(count, new ListItem(i.ToString(), i.ToString()));
                count++;
            }
        }
        protected void CreateUserWizard1_Finish(object sender, EventArgs e)
        {
            FormsAuthentication.RedirectFromLoginPage(CreateUserWizard1.UserName, true);
            Page.Response.Redirect("~/Account/myAccount.aspx");
        }

        public bool IsValidImage(string fileName)
        {
            Regex regex = new Regex(General.REGEX_IS_VALID_IMAGE);
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
                        if (fileupload.PostedFile.ContentLength < General.IMAGE_SIZE)
                        {
                            string fileUploadDir = Server.MapPath(General.CAN_LOGO + userid + "/");
                            if (!System.IO.Directory.Exists(fileUploadDir))
                            {
                                System.IO.Directory.CreateDirectory(fileUploadDir);
                            }
                            else
                            {
                                string[] filePaths = Directory.GetFiles(fileUploadDir, "*.*", SearchOption.AllDirectories);
                                foreach (string path in filePaths)
                                {
                                    File.Delete(path);
                                }
                            }

                            var image = System.Drawing.Image.FromStream(fileupload.PostedFile.InputStream);
                            var newImage = Utils.ScaleImage(image, 300, 300);
                            newImage.Save(Server.MapPath(General.CAN_LOGO + userid + "/") + fileupload.FileName, ImageFormat.Jpeg);

                            label.Text = "File is selected!";
                            return fileupload.FileName;
                        }
                        else
                        {
                            label.Text = "Error: File upload has to be less than " + General.GetImageSize(General.IMAGE_SIZE) + "mbs !";
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

        protected void Dob_Validator(object sender, ServerValidateEventArgs e)
        {
            DropDownList ddl_month = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddl_Month");
            DropDownList ddl_day = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddl_Day");
            DropDownList ddl_year = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddl_Year");

            if (ddl_day.SelectedValue != string.Empty && ddl_month.SelectedValue != string.Empty && ddl_year.SelectedValue != string.Empty)
            {
                e.IsValid = true;
            }
            else
            {
                e.IsValid = false;
            }
        }
        protected void Dob_Format_Validator(object sender, ServerValidateEventArgs e)
        {
            string ddl_month = ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddl_Month")).SelectedValue;
            string ddl_day = ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddl_Day")).SelectedValue;
            string ddl_year = ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddl_Year")).SelectedValue;

            String dob = ddl_month + "/" + ddl_day + "/" + ddl_year;
            if (IsValidDateTime(dob))
            {
                e.IsValid = true;
            }
            else
            {
                e.IsValid = false;
            }
        }
        public bool IsValidDateTime(String dob)
        {
            Regex regex = new Regex(General.REGEX_IS_VALID_DATETIME);
            return regex.IsMatch(dob);
        }

    }
}
