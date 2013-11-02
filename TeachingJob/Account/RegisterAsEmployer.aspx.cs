using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using BusinessLogic;
using System.Text.RegularExpressions;
using AjaxControlToolkit;
using System.IO;
using System.Drawing;
using TeachingJob.Data;
using System.Reflection;
using System.Resources;
using System.Drawing.Imaging;


namespace TeachingJob.Account
{
    public partial class RegisterAsEmployer : BasePage
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Page.Form.DefaultButton = ((Button)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("CreateUserButton")).UniqueID;
            facade = new BusinessFacade(myConn);
            DropDownList ddl_Ci = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddlCitizenship");

            ToolkitScriptManager objScriptManager = (ToolkitScriptManager)this.Master.FindControl("ToolkitScriptManager1");
            objScriptManager.AsyncPostBackTimeout = 36000;
            objScriptManager.RegisterAsyncPostBackControl(ddl_Ci);
        }
        protected void CreateUserWizard1_Finish(object sender, EventArgs e)
        {
            Page.Response.Redirect("~/Account/myAccount.aspx");
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
                        if (fileupload.PostedFile.ContentLength < General.IMAGE_SIZE)
                        {
                            string fileUploadDir = Server.MapPath(General.EMP_LOGO + userid + "/");
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
                            var newImage = Utils.ScaleImage(image, 160, 120);
                            newImage.Save(fileUploadDir + fileupload.FileName, ImageFormat.Jpeg);
                            label.Text = "File is selected!";
                            return fileupload.FileName;
                        }
                        else
                        {
                            label.Text = "Error: File upload has to be less than "+General.GetImageSize(General.IMAGE_SIZE)+"mbs!";
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

        public string RegisterUsername
        {
            get
            {
                if (ViewState["username"] != null)
                {
                    return ViewState["username"].ToString();
                }

                return "";
            }
            set
            {
                ViewState["username"] = value;
            }
        }
        public void CreateUserWizard1_Binding(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Assembly ass = Assembly.Load("App_GlobalResources");
                ResourceManager rm = new ResourceManager("Resources.Resource", ass);

                DropDownList ddl_Lo = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddlJobLocation");
                ddl_Lo.Items.Insert(0, new ListItem(rm.GetString("Pleaseselect"), string.Empty));
                ddl_Lo.SelectedIndex = 0;
                List<Location> loList = facade.GetAllLocation();
                foreach (Location l in loList)
                {
                    ListItem li = Utils.DecideLangDropdown(l.LName, l.LName_vn);
                    ddl_Lo.Items.Add(li);
                }

                DropDownList ddl_Ci = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddlCitizenship");
                ddl_Ci.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                ddl_Ci.SelectedIndex = 0;
                List<Citizenship> ciList = facade.GetAllCitizenship();
                foreach (Citizenship ci in ciList)
                {
                    ListItem li = Utils.DecideLangDropdown(ci.CitizenshipName, ci.CitizenshipName_vn);
                    ddl_Ci.Items.Add(li);
                }

                ////ORG TYPE
                DropDownList ddl = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("OrganizationType");
                List<OrganizationType> otList = facade.GetAllOrganizationType();
                ddl.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                ddl.SelectedIndex = 0;
                if (otList != null)
                {
                    foreach (OrganizationType sc in otList)
                    {
                        ListItem li = Utils.DecideLangDropdown(sc.Name, sc.Name_vn);
                        if (sc.Name == "Private Tutor")
                        {
                            ddl.Items.Insert(1, li);
                            continue;
                        }
                        ddl.Items.Add(li);
                    }
                }
                else
                {
                    ListItem li = new ListItem("N/A", "N/A");
                    ddl.Items.Add(li);
                }
                DropDownList ddl_SchoolType = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddl_SchoolType");
                ddl_SchoolType.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                ddl_SchoolType.SelectedIndex = 0;
                List<SchoolType> stList = facade.GetSchoolType();
                foreach (SchoolType st in stList)
                {
                    ListItem li = Utils.DecideLangDropdown(st.Name, st.Name_vn);
                    ddl_SchoolType.Items.Add(li);
                }
            }
        }
        
        protected void createUserWizard_CreateUserError(object sender, CreateUserErrorEventArgs arguments)
        {
            LogCreateUserError(arguments.CreateUserError, "no user info");
        }
        private void LogCreateUserError(MembershipCreateStatus status, string username)
        {
            string reasonText = status.ToString();

            switch (status)
            {
                case MembershipCreateStatus.DuplicateEmail:
                case MembershipCreateStatus.DuplicateProviderUserKey:
                case MembershipCreateStatus.DuplicateUserName:

                    reasonText = "The user details you entered are already registered.";
                    break;

                case MembershipCreateStatus.InvalidAnswer:
                case MembershipCreateStatus.InvalidEmail:
                case MembershipCreateStatus.InvalidProviderUserKey:
                case MembershipCreateStatus.InvalidQuestion:
                case MembershipCreateStatus.InvalidUserName:
                case MembershipCreateStatus.InvalidPassword:

                    reasonText = string.Format("The {0} provided was invalid.", status.ToString().Substring(7));
                    break;
                default:
                    reasonText = "Due to an unknown problem, we were not able to register you at this time";
                    break;

            }
        }

        protected void customValidation_ddl_Select_Location(object sender, ServerValidateEventArgs e)
        {
            DropDownList ddl = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddlJobLocation");
            if (ddl.SelectedValue != string.Empty)
            {
                e.IsValid = true;
            }
            else
            {
                e.IsValid = false;
            }
        }
        protected void customValidation_ddl_Select_Citizenship(object sender, ServerValidateEventArgs e)
        {
            DropDownList ddl = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddlCitizenship");
            if (ddl.SelectedValue != string.Empty)
            {
                e.IsValid = true;
            }
            else
            {
                e.IsValid = false;
            }
        }
        protected void OrganizationType_IndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("OrganizationType");
            DropDownList ddl_SchoolType = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddl_SchoolType");
            if (ddl.SelectedValue.Contains("K-12"))
            {
                //ddl_SchoolType.Enabled = true;
            }
            else
            {
                //ddl_SchoolType.Enabled = false;
                ddl_SchoolType.SelectedIndex = 0;
            }
        }
        protected void Country_IndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddlCitizenship");
            DropDownList ddlJobLocation = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddlJobLocation");
            if (ddl.SelectedValue.Contains("Vietnam"))
            {
                //ddlJobLocation.Enabled = true;
            }
            else
            {
                //ddlJobLocation.Enabled = false;
                ddlJobLocation.SelectedIndex = 0;
            }
        }
    }
}