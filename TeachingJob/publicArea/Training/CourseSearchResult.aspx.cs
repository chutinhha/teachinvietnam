using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic.Facade.Employer;

namespace TeachingJob.publicArea.Training
{
    public partial class CourseSearchResult : System.Web.UI.Page
    {
        private string courseName;
        private string cate_id;
        private string level_id;
        private string location_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                courseName = Request.Params["cn"] != null ? Request.Params["cn"].ToString() : "";
                cate_id = Request.Params["ca"] != null ? Request.Params["ca"].ToString() : "";
                level_id = Request.Params["le"] != null ? Request.Params["le"].ToString() : "";
                location_id = Request.Params["lo"] != null ? Request.Params["lo"].ToString() : "";

                Repeater_TrainingCourse.DataSource = TrainingCourseLogic.SearchCourses(courseName,cate_id,level_id,location_id);
                Repeater_TrainingCourse.DataBind();
            }
            catch (Exception ex)
            {
                Literal error = Master.FindControl("literal_error") as Literal;
                error.Text = ex.Message;
            }
        }
        protected void Repeater_TrainingCourse_DataBound(object sender, RepeaterItemEventArgs e)
        {
            Label lbl_Title = e.Item.FindControl("lbl_Title") as Label;
            Label lbl_Cost = e.Item.FindControl("lbl_Cost") as Label;
            Label lbl_Certificate = e.Item.FindControl("lbl_Certificate") as Label;

            lbl_Title.Text = DataBinder.Eval(e.Item.DataItem, "Name").ToString();
            lbl_Certificate.Text = DataBinder.Eval(e.Item.DataItem, "CertificateName").ToString();
            lbl_Cost.Text = DataBinder.Eval(e.Item.DataItem, "Cost").ToString();
        }
    }
}