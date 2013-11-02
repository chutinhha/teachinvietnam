using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using BusinessLogic;
using System.Reflection;
using System.Resources;
using TeachingJob.Data;
using BusinessLogic.Facade.Object;
using BusinessLogic.Facade;

namespace TeachingJob
{
    public partial class Training : System.Web.UI.MasterPage
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;
        CourseBusinessFacade courseFacade;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Assembly ass = Assembly.Load("App_GlobalResources");
                ResourceManager rm = new ResourceManager("Resources.Resource", ass);

                facade = new BusinessFacade(myConn);
                courseFacade = new CourseBusinessFacade();

                //rm.GetString("Pleaseselect")
                ddl_city.Items.Insert(0, new ListItem("Any location", string.Empty));
                ddl_city.SelectedIndex = 0;
                List<Location> loList = facade.GetAllLocation();
                foreach (Location l in loList)
                {
                    ListItem li = Utils.DecideLangDropdownV2(l.LName, l.LName_vn,l.LId.ToString());
                    ddl_city.Items.Add(li);
                }

                List<Sector> seList = facade.GetChildCategory(3);
                ddl_category.Items.Insert(0, new ListItem("Any category", string.Empty));
                foreach (Sector s in seList)
                {
                    ListItem li = Utils.DecideLangDropdownV2(s.SeName_en, s.SeName_vi,s.SeId.ToString());
                    ddl_category.Items.Add(li);
                }

                List<TrainingLevel> tlList = courseFacade.GetTrainingLevel();
                ddl_level.Items.Insert(0, new ListItem("Any level", string.Empty));
                foreach (TrainingLevel tl in tlList)
                {
                    ListItem li = Utils.DecideLangDropdownV2(tl.TlName_en, tl.TlName_vi,tl.Id.ToString());
                    ddl_level.Items.Add(li);
                }

                lbl_AvaiCourse.Text = courseFacade.GetAvailableCourse() + " courses available";
            }
        }
        protected void btn_Search_Click(object sender, EventArgs e)
        {
            string courseName = txt_Search.Text.Trim();
            string cate = ddl_category.SelectedValue;
            string level = ddl_level.SelectedValue;
            string location = ddl_city.SelectedValue;
            string query = "~/publicArea/Training/CourseSearchResult.aspx?cn=" + courseName + "&ca=" + cate + "&le=" + level + "&lo=" + location;
            Response.Redirect(query);
        }
        protected void LoggedOutAction(object sender, EventArgs e)
        {
            if (Session["currentUserRole"] != null)
            {
                Session["currentUserRole"] = "";
            }
        }
        protected void LoginView_OnPreRender(object sender, EventArgs e)
        {
            try
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    Label lbl_Username = (Label)HeadLoginView.FindControl("lbl_Username");
                    MembershipUser mu = Membership.GetUser();
                    if (HttpContext.Current.User.IsInRole("Organization"))
                    {
                        lbl_Username.Text = Context.Profile.GetPropertyValue("Employer.FirstName").ToString() + " " + Context.Profile.GetPropertyValue("Employer.LastName").ToString();
                    }
                    else
                    {
                        lbl_Username.Text = Context.Profile.GetPropertyValue("Employee.FirstName").ToString() + " " + Context.Profile.GetPropertyValue("Employee.LastName").ToString();
                    }

                }
            }
            catch (Exception)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('Login fails. Please try again.');</script>");
            }
        }
    }
}