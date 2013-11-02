using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Resources;
using System.Reflection;
using BusinessLogic;
using TeachingJob.Data;
using BusinessLogic.Facade.Employer;

namespace TeachingJob.publicArea
{
    public partial class TeacherTraining : System.Web.UI.Page
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Assembly ass = Assembly.Load("App_GlobalResources");
                ResourceManager rm = new ResourceManager("Resources.Resource", ass);

                facade = new BusinessFacade(myConn);

                ddl_city.Items.Insert(0, new ListItem(rm.GetString("Pleaseselect"), string.Empty));
                ddl_city.SelectedIndex = 0;
                List<Location> loList = facade.GetAllLocation();
                foreach (Location l in loList)
                {
                    ListItem li = Utils.DecideLangDropdown(l.LName, l.LName_vn);
                    ddl_city.Items.Add(li);
                }

                
            }
        }
        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddl_city.SelectedValue != null && ddl_city.SelectedValue.Trim().Length != 0)
                {
                    List<BusinessLogic.Facade.Object.TrainingCourse> courseList = TrainingCourseLogic.GetCoursesByLocation(ddl_city.SelectedValue);
                    Repeater_CourseList.DataSource = courseList;
                    Repeater_CourseList.DataBind();
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "')</script>");
            }
        }
        protected void Repeater_CourseList_DataBind(object sender, RepeaterItemEventArgs e)
        {
            HyperLink hpl_CourseName = e.Item.FindControl("hpl_CourseName") as HyperLink;
            hpl_CourseName.Text = DataBinder.Eval(e.Item.DataItem, "Certificate").ToString();
        }
    }
}