using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using TeachingJob.Data;
using BusinessLogic.Facade.Employer;
using System.Web.Security;

namespace TeachingJob.Employer
{
    public partial class TeacherTraining : System.Web.UI.Page
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;
        protected void Page_Load(object sender, EventArgs e)
        {
            facade = new BusinessFacade(myConn);

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
                txt_OrgName.Text = Context.Profile.GetPropertyValue("Organization.OrganizationName").ToString();
                txt_website.Text = Context.Profile.GetPropertyValue("Organization.Website").ToString();
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

                try
                {
                    ViewState["PreviousPageUrl"] = Request.UrlReferrer.ToString();
                }
                catch (Exception)
                {
                    Response.Redirect("~/Employer/EmployerSite.aspx");
                }
            }
            txt_CourseContent.Attributes.Add("onkeydown", "textCounter(this,'" + Label9.ClientID + "', 5000)");

            txt_benefit.Attributes.Add("onkeydown", "textCounter2(this,'" + Label10.ClientID + "', 5000)");
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Employer/EmployerSite.aspx");
        }
        protected void btnPost_Click(object sender, EventArgs e)
        {
            try
            {
                MembershipUser mu = Membership.GetUser();
                TrainingCourseLogic.InsertNewCourse(mu.ProviderUserKey.ToString(), txt_Certificate.Text.Trim(), txt_CourseLength.Text.Trim(),
                    txt_timetable.Text.Trim(),txt_Cost.Text.Trim(),txt_EntryRequirement.Text.Trim(),txt_ContactInfo.Text.Trim(),txt_CourseContent.Text.Trim(),txt_benefit.Text.Trim());
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('A new training course has been registered successfully!');</script>");
                //Redirect user 
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('Fail to create a new course.\\nPlease try again.');</script>");
            }
        }
        protected void OrganizationType_IndexChanged(object sender, EventArgs e)
        {
            if (!OrganizationType.SelectedValue.Contains("K-12"))
            {
                ddl_SchoolType.SelectedIndex = 0;
            }
        }

        protected void Country_IndexChanged(object sender, EventArgs e)
        {
            if (!ddlCitizenship.SelectedValue.Contains("Vietnam"))
            {
                ddlJobLocation.SelectedIndex = 0;
            }
        }
    }
}