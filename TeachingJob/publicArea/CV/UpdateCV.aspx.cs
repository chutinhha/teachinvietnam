using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using TeachingJob.Data;
using System.Reflection;
using System.Resources;

namespace TeachingJob.publicArea.CV
{
    public partial class UpdateCV : BasePage
    {
        string cvname;
        public string Cvname
        {
            get { return cvname; }
            set { cvname = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Assembly ass = Assembly.Load("App_GlobalResources");
            ResourceManager rm = new ResourceManager("Resources.Resource", ass);
            if (Request.QueryString["stt"] != null && Request.QueryString["stt"] == "updated")
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + rm.GetString("Yourprofileisupdated") + "');</script>");
            }
            if (Request.QueryString["stt"] != null && Request.QueryString["stt"] == "fe")
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + rm.GetString("invalidDoB") + "');</script>");
            }

            //Guid providerkey = new Guid("44160A74-D9E0-498C-9778-8DAEE05A2A85");
            MembershipUser mu = null;
            try
            {
                Cvname = Request.Params["cvname"];
                mu = Membership.GetUser(new Guid(Cvname));
            }
            catch (Exception)
            {
                Response.Redirect("../errorpages/Error404.aspx");
            }
            //ProfileCommon userProfile = Profile.GetProfile(cvname);
            lbl_CandidateName.Text = Context.Profile.GetPropertyValue("Employee.FirstName").ToString() + " " + Context.Profile.GetPropertyValue("Employee.LastName").ToString();
            literalTitle.Text = lbl_CandidateName.Text;
            lbl_Major.Text = Context.Profile.GetPropertyValue("CV.Major").ToString();
            try
            {
               // ImgAvatar.ImageUrl = General.CAN_LOGO + mu.UserName + "/" + Context.Profile.GetPropertyValue("Employee.Avatar").ToString();
                ImgAvatar.ImageUrl = Utils.validateImage(General.CAN_LOGO + mu.UserName , Context.Profile.GetPropertyValue("Employee.Avatar").ToString());
            }
            catch (Exception)
            {
                ImgAvatar.ImageUrl = "~/images/companyLogo/no_image.jpg";
            }
            DateTime dt = new DateTime(Convert.ToDateTime(Context.Profile.GetPropertyValue("Employee.DateOfBirth").ToString()).Year, Convert.ToDateTime(Context.Profile.GetPropertyValue("Employee.DateOfBirth").ToString()).Month, Convert.ToDateTime(Context.Profile.GetPropertyValue("Employee.DateOfBirth").ToString()).Day);

            lbl_Dob.ToolTip = String.Format("{0:MMM d, yyyy}", dt);
            lbl_Dob.Text = dt.ToShortDateString();

            if (Convert.ToDateTime(Context.Profile.GetPropertyValue("CV.LastUpdated")).Year == 0001)
            {
                lbl_LastUpdate.Text = "";
            }
            else
            {
                lbl_LastUpdate.Text = rm.GetString("Lastupdateat") +" " + Context.Profile.GetPropertyValue("CV.LastUpdated").ToString();
            }
            if (Convert.ToBoolean(Context.Profile.GetPropertyValue("CV.DisplayEmail").ToString()) == true)
            {
                lbl_Mail.Text = mu.UserName;
            }
            else
            {
                lbl_Mail.Text = "Private";
            }
            if (Convert.ToBoolean(Context.Profile.GetPropertyValue("CV.DisplayAddress").ToString()) == true)
            {
                lbl_Address.Text = Context.Profile.GetPropertyValue("Employee.PresentLocation").ToString();
            }
            else
            {
                lbl_Address.Text = "Private";
            }
            if (Convert.ToBoolean(Context.Profile.GetPropertyValue("CV.DisplayPhone").ToString()) == true)
            {
                lbl_Phone.Text = Context.Profile.GetPropertyValue("Employee.Phone").ToString();
            }
            else
            {
                lbl_Phone.Text = "Private";
            }

            List<TeachingJob.publicArea.CV.objValue> objList = new List<TeachingJob.publicArea.CV.objValue>();

            if (Context.Profile.GetPropertyValue("Employee.Citizenship") != null)
            {
                lbl_NativeOf.Text = Context.Profile.GetPropertyValue("Employee.Citizenship").ToString();
            }

            if (Context.Profile.GetPropertyValue("CV.EduLevel") != null)
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("EduLevel"), Context.Profile.GetPropertyValue("CV.EduLevel").ToString()));
            }
            if (Context.Profile.GetPropertyValue("CV.Major") != null)
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("SpecializationMajor"), Context.Profile.GetPropertyValue("CV.Major").ToString()));
            }
            if (Context.Profile.GetPropertyValue("CV.Language") != null)
            {
                string lang = Context.Profile.GetPropertyValue("CV.Language").ToString() + " - " + Context.Profile.GetPropertyValue("CV.Language_lvl").ToString();
                if (Context.Profile.GetPropertyValue("CV.Language2").ToString() != "")
                {
                    lang += "<br/> " + Context.Profile.GetPropertyValue("CV.Language2").ToString() + " - " + Context.Profile.GetPropertyValue("CV.Language2_lvl").ToString();
                }
                if (Context.Profile.GetPropertyValue("CV.Language3").ToString() != "")
                {
                    lang += "<br/> " + Context.Profile.GetPropertyValue("CV.Language3").ToString() + " - " + Context.Profile.GetPropertyValue("CV.Language3_lvl").ToString();
                }
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("LanguageSpoken"), lang));
            }
            if (Context.Profile.GetPropertyValue("CV.YearsofExperience") != null)
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("Yearsofexperience"), Context.Profile.GetPropertyValue("CV.YearsofExperience").ToString()));
            }
            if (Context.Profile.GetPropertyValue("CV.RelatedExperience") != null)
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("RelatedExperience2"), Context.Profile.GetPropertyValue("CV.RelatedExperience").ToString()));
            }
            if (Context.Profile.GetPropertyValue("CV.MostRecentPosition") != null)
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("MostRecentPosition"), Context.Profile.GetPropertyValue("CV.MostRecentPosition").ToString()));
            }
            if (Context.Profile.GetPropertyValue("CV.CurrentJobLevel") != null)
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("CurrentJobLevel2"), Context.Profile.GetPropertyValue("CV.CurrentJobLevel").ToString()));
            }

            if (Context.Profile.GetPropertyValue("CV.Achievements") != null)
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("Achievements2"), Context.Profile.GetPropertyValue("CV.Achievements").ToString()));
            }
            if (Context.Profile.GetPropertyValue("CV.SkillsInterests") != null)
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("SkillsInterests2"), Context.Profile.GetPropertyValue("CV.SkillsInterests").ToString()));
            }
            if (Context.Profile.GetPropertyValue("CV.Memberships") != null)
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("Memberships2"), Context.Profile.GetPropertyValue("CV.Memberships").ToString()));
            }
            if (Context.Profile.GetPropertyValue("CV.DesiredEmployment") != null)
            {
                string category = Context.Profile.GetPropertyValue("CV.DesiredEmployment").ToString();
                if (Context.Profile.GetPropertyValue("CV.DesiredEmployment2").ToString() != "")
                {
                    category += "<br/> " + Context.Profile.GetPropertyValue("CV.DesiredEmployment2").ToString();
                }
                if (Context.Profile.GetPropertyValue("CV.DesiredEmployment3").ToString() != "")
                {
                    category += "<br/> " + Context.Profile.GetPropertyValue("CV.DesiredEmployment3").ToString();
                }
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("DesiredEmployment"), category));

            }
            if (Context.Profile.GetPropertyValue("CV.DesiredJobLevel") != null)
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("desiredjoblevel"), Context.Profile.GetPropertyValue("CV.DesiredJobLevel").ToString()));
            }
            if (Context.Profile.GetPropertyValue("CV.EmploymentType") != null)
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("DesiredEmploymenttype"), Context.Profile.GetPropertyValue("CV.EmploymentType").ToString()));
            }
            if (Context.Profile.GetPropertyValue("CV.DesiredLocations") != null)
            {
                string location = Context.Profile.GetPropertyValue("CV.DesiredLocations").ToString();
                if (Context.Profile.GetPropertyValue("CV.DesiredLocations2").ToString() != "")
                {
                    location += "<br/> " + Context.Profile.GetPropertyValue("CV.DesiredLocations2").ToString();
                }
                if (Context.Profile.GetPropertyValue("CV.DesiredLocations3").ToString() != "")
                {
                    location += "<br/> " + Context.Profile.GetPropertyValue("CV.DesiredLocations3").ToString();
                }
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("Iminterested"), location));
            }
            if (Context.Profile.GetPropertyValue("CV.SalaryType").ToString() == "True")
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("Salaryexpectation2"), Context.Profile.GetPropertyValue("CV.SalaryFrom") + " - " + Context.Profile.GetPropertyValue("CV.SalaryTo") + " " + Context.Profile.GetPropertyValue("CV.SalaryCurrency") + "/" + Context.Profile.GetPropertyValue("CV.SalaryPaidType")));
            }
            else
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("Salaryexpectation2"), rm.GetString("Negotiable")));
            }
            if (Context.Profile.GetPropertyValue("CV.DesiredTravel") != null)
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("Desiredtravel"), Context.Profile.GetPropertyValue("CV.DesiredTravel").ToString()));
            }
            if (Context.Profile.GetPropertyValue("CV.CurrentResidence") != null)
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("CurrentResidence"), Context.Profile.GetPropertyValue("CV.CurrentResidence").ToString()));
            }

            if (Context.Profile.GetPropertyValue("CV.WillingToRelocate") != null)
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("Willingtorelocate2"), Context.Profile.GetPropertyValue("CV.WillingToRelocate").ToString()));
            }
            if (Context.Profile.GetPropertyValue("CV.HowSoonToWork") != null)
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("Howsoonareyouavailabletowork"), Context.Profile.GetPropertyValue("CV.HowSoonToWork").ToString()));
            }
            rp_Content.DataSource = objList;
            rp_Content.DataBind();


            //if (Context.Profile.GetPropertyValue("CV.PersonalStatement").ToString() != "")
            //{
            List<TeachingJob.publicArea.CV.objValue> statementList = new List<TeachingJob.publicArea.CV.objValue>();
            statementList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("PersonalStatement2"), Context.Profile.GetPropertyValue("CV.PersonalStatement").ToString()));
            ListView1.DataSource = statementList;
            ListView1.DataBind();
            //}
        }
    }
}