using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using TeachingJob.Data;
using TeachingJob.publicArea.CV;
using BusinessLogic.Facade.Employer;

namespace TeachingJob.publicArea
{
    public partial class EmployerInfo : System.Web.UI.Page
    {
        private string empUniqueId;
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessLogic.Facade.Employer.EmployerLogic empLogic;
        DataTable tbl_EmpInfo;
        List<objValue> objList;
        MembershipUser mu;

        protected void Page_Load(object sender, EventArgs e)
        {
            empUniqueId = Request.Params["eid"].ToString();
            empLogic = new BusinessLogic.Facade.Employer.EmployerLogic(myConn);

            mu = Membership.GetUser(new Guid(empUniqueId));

            DataSet dataset = empLogic.GetEmployerInfo(empUniqueId);
            tbl_EmpInfo = dataset.Tables["tbl_EmpInfo"];

            title.Text = tbl_EmpInfo.Rows[0][3].ToString();
            

            objList = new List<objValue>();
            
            if (tbl_EmpInfo.Rows[0][14].ToString().Trim() != "" && tbl_EmpInfo.Rows[0][14].ToString().Trim() != null)
            {
               objList.Add(new objValue("<b>School type: </b>",tbl_EmpInfo.Rows[0][6].ToString() + "<br />" + tbl_EmpInfo.Rows[0][14].ToString()));
            }
            else
            {
                objList.Add(new objValue("<b>School type: </b>",tbl_EmpInfo.Rows[0][6].ToString()));
            }
            if (tbl_EmpInfo.Rows[0][10].ToString().Trim() == "" || tbl_EmpInfo.Rows[0][10].ToString().Trim() == null)
            {
                objList.Add(new objValue("<b>From: </b>",tbl_EmpInfo.Rows[0][11].ToString()));
            }
            else
            {
                objList.Add(new objValue("<b>From: </b>", tbl_EmpInfo.Rows[0][10].ToString() + " - " + tbl_EmpInfo.Rows[0][11].ToString()));
            }
            addToList("Address", 7);
            addToList("Phone", 9);
            addToList("Fax number", 8);
            addToList("Zip code", 12);
            addToList("Contact", 0);
            objList.Add(new objValue("<b>Website: </b>", "<a href='http://" + tbl_EmpInfo.Rows[0][5].ToString() + "'>" + tbl_EmpInfo.Rows[0][5].ToString() + "</a>"));
            
            //string info_EmpPhone = tbl_EmpInfo.Rows[0][1].ToString();
            //string info_PersonalImage = tbl_EmpInfo.Rows[0][2].ToString();
            //string info_Website = tbl_EmpInfo.Rows[0][5].ToString();
            

            //hpl_OrgWebsite.Text = info_Website;
            //hpl_OrgWebsite.NavigateUrl = "http://" + info_Website;
            

            Repeater_Info.DataSource = objList;
            Repeater_Info.DataBind();

            //li_postedjob_heading.Text = "Jobs which was posted by " + title.Text;
            BusinessLogic.BusinessFacade facade = new BusinessLogic.BusinessFacade(myConn);
            var list  = facade.GetPostedJobByUser(empUniqueId);
            if (list.Count!=0)
            {
                Repeater_PostedJob.DataSource = list;
                Repeater_PostedJob.DataBind();
            }
            else
            {
                literal_postedJobInform.Text = "This employer has posted no job.";
            }

            var list2 = TrainingCourseLogic.GetCoursesByEmployer(mu.ProviderUserKey.ToString());
            if (list2.Count != 0)
            {
                Repeater_TrainingCourse.DataSource = list2;
                Repeater_TrainingCourse.DataBind();
            }
            else
            {
                literal_courseInform.Text = "This employer has posted no training course.";
            }
        }
        private bool isNotNull(string str){
            if (str != null && str.Trim().Length != 0)
            {
                return true;
            }
            return false;
        }
        private void addToList(string name, Int16 i)
        {
            if (isNotNull(tbl_EmpInfo.Rows[0][i].ToString()))
            {
                objList.Add(new objValue("<b>"+name+":</b>", tbl_EmpInfo.Rows[0][i].ToString()));
            }
        }

        protected void Repeater_Info_DataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Footer)
            {
                Label lbl_BriefInfo = e.Item.FindControl("lbl_BriefInfo") as Label;
                lbl_BriefInfo.Text = tbl_EmpInfo.Rows[0][13].ToString();
            }
            if (e.Item.ItemType == ListItemType.Header)
            {
                Literal li_OrgName = e.Item.FindControl("li_OrgName") as Literal;
                li_OrgName.Text = title.Text;

                Image OrgLogo_img = e.Item.FindControl("OrgLogo_img") as Image;
                OrgLogo_img.ImageUrl = General.EMP_LOGO + mu.UserName + "/" + tbl_EmpInfo.Rows[0][4].ToString();
            }
        }
        protected void Repeater_PostedJob_DataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HyperLink hpl_JobTitle = e.Item.FindControl("hpl_JobTitle") as HyperLink;
                hpl_JobTitle.Text = DataBinder.Eval(e.Item.DataItem, "Title").ToString();
                hpl_JobTitle.NavigateUrl = "~/publicArea/JobDetails.aspx?jId=" + DataBinder.Eval(e.Item.DataItem, "Id").ToString();

                Label lbl_Upload = e.Item.FindControl("lbl_Upload") as Label;
                lbl_Upload.Text = DataBinder.Eval(e.Item.DataItem, "UploadDate","{0:d}").ToString();

                Label lbl_Closing = e.Item.FindControl("lbl_Closing") as Label;
                lbl_Closing.Text = DataBinder.Eval(e.Item.DataItem, "ClosingDate", "{0:d}").ToString();

                Label lbl_ViewCount = e.Item.FindControl("lbl_ViewCount") as Label;
                lbl_ViewCount.Text = DataBinder.Eval(e.Item.DataItem, "Viewcount").ToString();                
            }
        }
        protected void Repeater_TrainingCourse_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lbl_Certificate = e.Item.FindControl("lbl_Certificate") as Label;
                Label lbl_Length = e.Item.FindControl("lbl_Length") as Label;
                Label lbl_timetable = e.Item.FindControl("lbl_timetable") as Label;
                Label lbl_cost = e.Item.FindControl("lbl_cost") as Label;
                Label lbl_contact = e.Item.FindControl("lbl_contact") as Label;
                Label lbl_content = e.Item.FindControl("lbl_content") as Label;

                lbl_Certificate.Text = DataBinder.Eval(e.Item.DataItem,"Certificate").ToString();
                lbl_Length.Text = DataBinder.Eval(e.Item.DataItem, "Length").ToString();
                lbl_timetable.Text = DataBinder.Eval(e.Item.DataItem, "Timetable").ToString();
                lbl_cost.Text = DataBinder.Eval(e.Item.DataItem, "Cost").ToString();
                lbl_contact.Text = DataBinder.Eval(e.Item.DataItem, "Contact").ToString();
                lbl_content.Text = DataBinder.Eval(e.Item.DataItem, "Coursecontent").ToString();
            }

        }
    }
}