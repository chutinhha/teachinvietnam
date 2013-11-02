using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using BusinessLogic;
using AjaxControlToolkit;
using System.Web.Security;
using System.IO;
using System.Drawing;
using TeachingJob.Data;
using System.Reflection;
using System.Resources;
using System.Drawing.Imaging;

namespace TeachingJob.Account
{
    public partial class RecruiterInfo : BasePage
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;
        string username;
        MembershipUser mu = Membership.GetUser();

        protected void Page_Load(object sender, EventArgs e)
        {
            facade = new BusinessFacade(myConn);

            //ToolkitScriptManager objScriptManager = (ToolkitScriptManager)this.Master.FindControl("ToolkitScriptManager1");
            //objScriptManager.AsyncPostBackTimeout = 36000;
            //objScriptManager.RegisterAsyncPostBackControl(ddlCitizenship);

            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script type='text/javascript'>showhideOnStartUp();</script>");

            if (!IsPostBack)
            {
                List<Location> loList = facade.GetAllLocation();
                ddlJobLocation.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                foreach (Location l in loList)
                {
                    ListItem li = Utils.DecideLangDropdown(l.LName, l.LName_vn);
                    ddlJobLocation.Items.Add(li);
                }

                List<Citizenship> ciList = facade.GetAllCitizenship();
                ddlCitizenship.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                foreach (Citizenship ci in ciList)
                {
                    ListItem li = Utils.DecideLangDropdown(ci.CitizenshipName, ci.CitizenshipName_vn);
                    ddlCitizenship.Items.Add(li);
                }
                List<OrganizationType> otList = facade.GetAllOrganizationType();
                OrganizationType.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                if (otList != null)
                {
                    foreach (OrganizationType sc in otList)
                    {
                        ListItem li = Utils.DecideLangDropdown(sc.Name, sc.Name_vn);
                        if (sc.Name == "Private Tutor")
                        {
                            OrganizationType.Items.Insert(1, li);
                            continue;
                        }
                        OrganizationType.Items.Add(li);
                    }
                }
                else
                {
                    ListItem li = new ListItem("N/A", "N/A");
                    OrganizationType.Items.Add(li);
                }
                ddl_SchoolType.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                List<SchoolType> stList = facade.GetSchoolType();
                foreach (SchoolType st in stList)
                {
                    ListItem li = Utils.DecideLangDropdown(st.Name, st.Name_vn);
                    ddl_SchoolType.Items.Add(li);
                }
            }
            if (!IsPostBack)
            {
                try
                {
                    ViewState["PreviousPageUrl"] = Request.UrlReferrer.ToString();
                }
                catch (Exception)
                {
                    Response.Redirect("~/Employer/EmployerSite.aspx");
                }
            }
            if (!IsPostBack)
            {
                string email = mu.Email;

                if (Roles.GetRolesForUser(Page.User.Identity.Name).Contains("Organization"))
                {
                    pnl_Employer.Visible = true;

                    username = mu.UserName;
                    Email.Text = email;

                    //ddl_Salutation.SelectedItem.Text = Context.Profile.GetPropertyValue("").ToString();
                    ListItem li_Salutation = ddl_Salutation.Items.FindByValue(Context.Profile.GetPropertyValue("Employer.Salutation").ToString());
                    if (li_Salutation != null)
                    {
                        li_Salutation.Selected = true;
                    }
                    txt_FirstName.Text = Context.Profile.GetPropertyValue("Employer.FirstName").ToString();
                    txt_Middle.Text = Context.Profile.GetPropertyValue("Employer.MiddleName").ToString();
                    txt_LastName.Text = Context.Profile.GetPropertyValue("Employer.LastName").ToString();
                    txt_PrimaryPhone.Text = Context.Profile.GetPropertyValue("Employer.Phone").ToString();

                    if (Context.Profile.GetPropertyValue("Employer.PersonalImage").ToString() == "")
                    {
                        Img_PersonalImage.ImageUrl = "~/images/companyLogo/no_image_100x100.jpg";
                    }
                    else
                    {
                        Img_PersonalImage.ImageUrl = General.EMP_HIRING_ADVICE + mu.ProviderUserKey.ToString() + "/" + Context.Profile.GetPropertyValue("Employer.PersonalImage").ToString();
                    }

                    if (Context.Profile.GetPropertyValue("Organization.Logo") == null)
                    {
                        img_Logo.ImageUrl = "~/images/companyLogo/no_image_100x100.jpg";
                    }
                    else
                    {
                        img_Logo.ImageUrl = General.EMP_LOGO + mu.UserName + "/" + Context.Profile.GetPropertyValue("Organization.Logo").ToString();
                    }
                    OrganizationName_txt.Text = Context.Profile.GetPropertyValue("Organization.OrganizationName").ToString();
                    Website_txt.Text = Context.Profile.GetPropertyValue("Organization.Website").ToString();

                    BriefInfo_txt.Text = Context.Profile.GetPropertyValue("Organization.BriefInfo").ToString();
                    Address1_txt.Text = Context.Profile.GetPropertyValue("Organization.Address1").ToString();
                    Phone1_txt.Text = Context.Profile.GetPropertyValue("Organization.PhoneNumber1").ToString();
                    FaxNumber_txt.Text = Context.Profile.GetPropertyValue("Organization.FaxNumber").ToString();
                    ListItem selectedItem_City = ddlJobLocation.Items.FindByValue(Context.Profile.GetPropertyValue("Organization.City").ToString());
                    if (selectedItem_City != null)
                    {
                        selectedItem_City.Selected = true;
                    }
                    ListItem selectedItem_Country = ddlCitizenship.Items.FindByValue(Context.Profile.GetPropertyValue("Organization.Country").ToString());
                    if (selectedItem_Country != null)
                    {
                        selectedItem_Country.Selected = true;
                    }
                    ListItem selectedItem_OrgType = OrganizationType.Items.FindByValue(Context.Profile.GetPropertyValue("Organization.OrganizationType").ToString());
                    if (selectedItem_OrgType != null)
                    {
                        selectedItem_OrgType.Selected = true;
                    }
                    ListItem selectedItem_schType = ddl_SchoolType.Items.FindByValue(Context.Profile.GetPropertyValue("Organization.SchoolType").ToString());
                    if (selectedItem_schType != null)
                    {
                        selectedItem_schType.Selected = true;
                    }
                    ZipCode_txt.Text = Context.Profile.GetPropertyValue("Organization.ZipCode").ToString();

                }
                else
                    Response.Redirect("~/publicArea/errorpages/Error403.aspx");
            }
        }
        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Employer/EmployerSite.aspx");
        }
        public bool IsValidImage(string fileName)
        {
            Regex regex = new Regex(@"(.*?)\.(jpg|JPG|jpeg|JPEG|png|PNG|gif|GIF|bmp|BMP)$");
            return regex.IsMatch(fileName);
        }
        protected void UpdateProfile_Click(object sender, EventArgs e)
        {
            Assembly ass = Assembly.Load("App_GlobalResources");
            ResourceManager rm = new ResourceManager("Resources.Resource", ass);

            MembershipUser mu = Membership.GetUser();
            if (FileUpload_PersonalImage.HasFile)
            {
                string fileUploadDir = Server.MapPath(General.EMP_HIRING_ADVICE + mu.ProviderUserKey.ToString() + "/");
                if (!System.IO.Directory.Exists(fileUploadDir))
                {
                    System.IO.Directory.CreateDirectory(fileUploadDir);
                }
                string[] filePaths = Directory.GetFiles(Server.MapPath(General.EMP_HIRING_ADVICE + mu.ProviderUserKey.ToString() + "/"), "*.*", SearchOption.AllDirectories);
                foreach (string path in filePaths)
                {
                    File.Delete(path);
                }
                try
                {
                    Context.Profile.SetPropertyValue("Employer.PersonalImage", fileUploadName2(FileUpload_PersonalImage, lbl_ppStt, mu.ProviderUserKey.ToString()));
                    Img_PersonalImage.ImageUrl = General.EMP_HIRING_ADVICE + mu.ProviderUserKey.ToString() + "/" + Context.Profile.GetPropertyValue("Employer.PersonalImage").ToString();
                    lbl_ppStt.Text = rm.GetString("Photoisupdatedsuccessfully");
                }
                catch (Exception)
                {
                    Img_PersonalImage.ImageUrl = "~/images/companyLogo/no_image_100x100.jpg";
                    lbl_ppStt.Text = rm.GetString("Updatefails");
                }
            }

            if (FileUpload1.HasFile)
            {
                string fileUploadDir_emp = Server.MapPath(General.EMP_LOGO + mu.UserName + "/");
                if (!System.IO.Directory.Exists(fileUploadDir_emp))
                {
                    System.IO.Directory.CreateDirectory(fileUploadDir_emp);
                }
                string[] files = Directory.GetFiles(Server.MapPath(General.EMP_LOGO + mu.UserName + "/"), "*.*", SearchOption.AllDirectories);
                foreach (string path in files)
                {
                    File.Delete(path);
                }
                try
                {
                    Context.Profile.SetPropertyValue("Organization.Logo", fileUploadName(FileUpload1, lblStatus, mu.UserName));
                    img_Logo.ImageUrl = General.EMP_LOGO + mu.UserName + "/" + Context.Profile.GetPropertyValue("Organization.Logo").ToString();

                    lblStatus.Text = rm.GetString("Photoisupdatedsuccessfully");
                }
                catch (Exception)
                {
                    img_Logo.ImageUrl = "~/images/companyLogo/no_image_100x100.jpg";
                    lblStatus.Text = rm.GetString("Updatefails");
                }
            }

            Context.Profile.SetPropertyValue("Employer.Salutation", ddl_Salutation.SelectedValue);
            Context.Profile.SetPropertyValue("Employer.FirstName", txt_FirstName.Text.Trim());
            Context.Profile.SetPropertyValue("Employer.MiddleName", txt_Middle.Text.Trim());
            Context.Profile.SetPropertyValue("Employer.LastName", txt_LastName.Text.Trim());
            Context.Profile.SetPropertyValue("Employer.Phone", txt_PrimaryPhone.Text.Trim());
            Context.Profile.SetPropertyValue("Organization.OrganizationName", OrganizationName_txt.Text.Trim());
            Context.Profile.SetPropertyValue("Organization.Website", Website_txt.Text.Trim());
            Context.Profile.SetPropertyValue("Organization.BriefInfo", BriefInfo_txt.Text.Trim());
            Context.Profile.SetPropertyValue("Organization.Address1", Address1_txt.Text.Trim());
            Context.Profile.SetPropertyValue("Organization.PhoneNumber1", Phone1_txt.Text.Trim());
            Context.Profile.SetPropertyValue("Organization.FaxNumber", FaxNumber_txt.Text.Trim());
            Context.Profile.SetPropertyValue("Organization.ZipCode", ZipCode_txt.Text.Trim());

            Context.Profile.SetPropertyValue("Organization.Country", ddlCitizenship.SelectedValue);
            if (ddlCitizenship.SelectedValue.Contains("ietnam"))
            {
                Context.Profile.SetPropertyValue("Organization.City", ddlJobLocation.SelectedValue);
            }
            else
            {
                Context.Profile.SetPropertyValue("Organization.City", string.Empty);
            }
            Context.Profile.SetPropertyValue("Organization.OrganizationType", OrganizationType.SelectedValue);
            if (OrganizationType.SelectedValue.Contains("K-12"))
            {
                Context.Profile.SetPropertyValue("Organization.SchoolType", ddl_SchoolType.SelectedValue);
            }
            else
            {
                Context.Profile.SetPropertyValue("Organization.SchoolType", string.Empty);
            }
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('Update successfully');</script>");
        }
        protected void OrganizationType_IndexChanged(object sender, EventArgs e)
        {
            if (OrganizationType.SelectedValue.Contains("K-12"))
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
            if (ddlCitizenship.SelectedValue.Contains("Vietnam"))
            {
                //ddlJobLocation.Enabled = true;
            }
            else
            {
                //ddlJobLocation.Enabled = false;
                ddlJobLocation.SelectedIndex = 0;
            }
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

                            var image = System.Drawing.Image.FromStream(fileupload.PostedFile.InputStream);
                            var newImage = Utils.ScaleImage(image, 160, 120);
                            newImage.Save(Server.MapPath(General.EMP_LOGO + userid + "/") + fileupload.FileName, ImageFormat.Jpeg);

                            label.Text = "File is selected!";
                            return fileupload.FileName;
                        }
                        else
                        {
                            label.Text = "Upload error: File upload has to be less "+General.GetImageSize(General.IMAGE_SIZE)+" 5mb!";
                            return null;
                        }
                    }
                    else
                    {
                        label.Text = "Upload error: Only image can be uploaded!";
                        return null;
                    }
                }
                else
                {
                    label.Text = "Upload error: You have not specified a file!";
                    return null;
                }
            }
            catch (Exception ex)
            {
                label.Text = "Upload error: " + ex.Message.ToString();
                return null;
            }
        }
        protected String fileUploadName2(FileUpload fileupload, Label label, string userid)
        {
            try
            {
                if (fileupload.HasFile)
                {
                    if (IsValidImage(fileupload.PostedFile.FileName))
                    {
                        if (fileupload.PostedFile.ContentLength < General.IMAGE_SIZE)
                        {
                            string fileUploadDir = Server.MapPath(General.EMP_HIRING_ADVICE + userid + "/");
                            if (!System.IO.Directory.Exists(fileUploadDir))
                            {
                                System.IO.Directory.CreateDirectory(fileUploadDir);
                            }

                            var image = System.Drawing.Image.FromStream(fileupload.PostedFile.InputStream);
                            var newImage = Utils.ScaleImage(image, 160, 120);
                            newImage.Save(Server.MapPath(General.EMP_HIRING_ADVICE + userid + "/") + fileupload.FileName, ImageFormat.Jpeg);


                            label.Text = "File is selected!";
                            return fileupload.FileName;
                        }
                        else
                        {
                            label.Text = "Error: File upload has to be less than " + General.GetImageSize(General.IMAGE_SIZE) + "mbs!";
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