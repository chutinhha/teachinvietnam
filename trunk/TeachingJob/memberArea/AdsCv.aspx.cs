using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using BusinessLogic.CV;
using System.Web.Security;
using BusinessLogic.Language;
using TeachingJob.Data;
using System.Reflection;
using System.Resources;
using System.Threading;

namespace TeachingJob.memberArea
{
    public partial class AdsCv : BasePage
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        
        BusinessFacade facade;
        String userId = null;
        public String UserId
        {
            get { return userId; }
            set { userId = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //nho try-catch roi day ve management site
            if ((Boolean)Context.Profile.GetPropertyValue("Employee.AllowCreateCV") == false)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('Your CV has existed. Please go to employee site to edit your CV!');window.location.href ='../Account/my-jobs.aspx';</script>");
                //Response.Redirect(Request.UrlReferrer.ToString());
            }
            Assembly ass = Assembly.Load("App_GlobalResources");
            ResourceManager rm = new ResourceManager("Resources.Resource", ass);
            try
            {
                MembershipUser mu = Membership.GetUser();
                userId = mu.ProviderUserKey.ToString();
                lbl_fullname.Text = Context.Profile.GetProfileGroup("Employee").GetPropertyValue("FirstName").ToString();
            }
            catch (Exception)
            {
                Response.Redirect("~/publicArea/errorpages/Error404.aspx");
            }

            facade = new BusinessFacade(myConn);
            if (!IsPostBack)
            {
                ddl_EmploymentType.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                List<EmploymentType> etList = facade.GetAllEmploymentType();
                foreach (EmploymentType et in etList)
                {
                    ListItem li = Utils.DecideLangDropdown(et.EtName, et.EtName_vn);
                    ddl_EmploymentType.Items.Add(li);
                }

                ddl_DesiredTravel.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                List<DesiredTravel> dtList = facade.GetDesiredTravel();
                foreach (DesiredTravel dt in dtList)
                {
                    ListItem li = Utils.DecideLangDropdown(dt.Name_en, dt.Name_vi);
                    ddl_DesiredTravel.Items.Add(li);
                }
                ddl_EduLevel.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                List<EduLevelcs> elList = facade.GetEduLevel();
                foreach (EduLevelcs el in elList)
                {
                    ListItem li = Utils.DecideLangDropdown(el.Name_en, el.Name_vi);
                    ddl_EduLevel.Items.Add(li);
                }

                List<WillToRelocated> wrList = facade.GetWilingToRelocate();
                foreach (WillToRelocated wr in wrList)
                {
                    ListItem li = Utils.DecideLangDropdown(wr.Name_en, wr.Name_vi);
                    ddl_Relocated.Items.Add(li);
                }
                ddl_YearOfExp.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                List<YearOfExp> yeList = facade.GetYearsOfExp();
                foreach (YearOfExp ye in yeList)
                {
                    ListItem li = Utils.DecideLangDropdown(ye.Name_en, ye.Name_vi);
                    ddl_YearOfExp.Items.Add(li);
                }

                //CAtegory dropdown
                List<Sector> seList1 = facade.GetFullCategory(1);
                List<Sector> seList2 = facade.GetFullCategory(2);
                List<Sector> seList3 = facade.GetFullCategory(3);

                ddl_Employment.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                if (!IsPostBack)
                {
                    int index1 = 1;
                    Utils.catebinding(ddl_Employment, seList1, 1, index1);
                    index1 = ddl_Employment.Items.Count;
                    Utils.catebinding(ddl_Employment, seList2, 2, index1);
                    index1 = ddl_Employment.Items.Count;
                    Utils.catebinding(ddl_Employment, seList3, 3, index1);
                }
                ddl_Employment2.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                if (!IsPostBack)
                {
                    int index2 = 1;
                    Utils.catebinding(ddl_Employment2, seList1, 1, index2);
                    index2 = ddl_Employment2.Items.Count;
                    Utils.catebinding(ddl_Employment2, seList2, 2, index2);
                    index2 = ddl_Employment2.Items.Count;
                    Utils.catebinding(ddl_Employment2, seList3, 3, index2);
                }
                ddl_Employment3.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                if (!IsPostBack)
                {
                    int index3 = 1;
                    Utils.catebinding(ddl_Employment3, seList1, 1, index3);
                    index3 = ddl_Employment3.Items.Count;
                    Utils.catebinding(ddl_Employment3, seList2, 2, index3);
                    index3 = ddl_Employment3.Items.Count;
                    Utils.catebinding(ddl_Employment3, seList3, 3, index3);
                }
                //-------------------------------------------------

                ddl_JobLevel.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                List<JobRole> jrList = facade.GetAllJobRole();
                foreach (JobRole jr in jrList)
                {
                    ListItem li = Utils.DecideLangDropdown(jr.JrName, jr.JrName_vn);
                    ddl_JobLevel.Items.Add(li);
                }
                ddl_CurrentJobLevel.Items.Insert(0, new ListItem(String.Empty, String.Empty));

                foreach (JobRole jr in jrList)
                {
                    ListItem li = Utils.DecideLangDropdown(jr.JrName, jr.JrName_vn);
                    ddl_CurrentJobLevel.Items.Add(li);
                }

                ddl_DesiredLocation.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                ddl_DesiredLocation2.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                ddl_DesiredLocation3.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                List<Location> loList = facade.GetAllLocation();
                foreach (Location lo in loList)
                {
                    ListItem li = Utils.DecideLangDropdown(lo.LName, lo.LName_vn);
                    ddl_DesiredLocation.Items.Add(li);
                }
                foreach (Location lo in loList)
                {
                    ListItem li = Utils.DecideLangDropdown(lo.LName, lo.LName_vn);
                    ddl_DesiredLocation2.Items.Add(li);
                }
                foreach (Location lo in loList)
                {
                    ListItem li = Utils.DecideLangDropdown(lo.LName, lo.LName_vn);
                    ddl_DesiredLocation3.Items.Add(li);
                }

                ddl_lang1.Items.Insert(0, new ListItem(rm.GetString("Pleaseselect"), string.Empty));
                ddl_lang2.Items.Insert(0, new ListItem(rm.GetString("Pleaseselect"), string.Empty));
                ddl_lang3.Items.Insert(0, new ListItem(rm.GetString("Pleaseselect"), string.Empty));
                List<Lang> langList;
                if (Thread.CurrentThread.CurrentCulture.Name == "vi-VN")
                {
                    langList = facade.GetLang("vi");
                }
                else
                {
                    langList = facade.GetLang("en");
                }
                foreach (Lang l in langList)
                {
                    ListItem li = Utils.DecideLangDropdown(l.Lang_en, l.Lang_vi);
                    ddl_lang1.Items.Add(li);
                }
                foreach (Lang l in langList)
                {
                    ListItem li = Utils.DecideLangDropdown(l.Lang_en, l.Lang_vi);
                    ddl_lang2.Items.Add(li);
                }
                foreach (Lang l in langList)
                {
                    ListItem li = Utils.DecideLangDropdown(l.Lang_en, l.Lang_vi);
                    ddl_lang3.Items.Add(li);
                }
                ddl_lang1_lvl.Items.Insert(0, new ListItem(rm.GetString("Pleaseselect"), string.Empty));
                ddl_lang2_lvl.Items.Insert(0, new ListItem(rm.GetString("Pleaseselect"), string.Empty));
                ddl_lang3_lvl.Items.Insert(0, new ListItem(rm.GetString("Pleaseselect"), string.Empty));
                List<LangLvl> langlvlList = facade.GetLangLvl_en();
                foreach (LangLvl lvl in langlvlList)
                {
                    ListItem li = Utils.DecideLangDropdown(lvl.Langlvl_en, lvl.Langlvl_vi);
                    ddl_lang1_lvl.Items.Add(li);
                }
                foreach (LangLvl lvl in langlvlList)
                {
                    ListItem li = Utils.DecideLangDropdown(lvl.Langlvl_en, lvl.Langlvl_vi);
                    ddl_lang2_lvl.Items.Add(li);
                }
                foreach (LangLvl lvl in langlvlList)
                {
                    ListItem li = Utils.DecideLangDropdown(lvl.Langlvl_en, lvl.Langlvl_vi);
                    ddl_lang3_lvl.Items.Add(li);
                }
                //Load other
                //if (userId != null)
                //{
                //    ListItem li_EduLevel = ddl_EduLevel.Items.FindByValue(Context.Profile.GetPropertyValue("CV.EduLevel").ToString());
                //    if (li_EduLevel != null) { li_EduLevel.Selected = true; }

                //    txt_Major.Text = Context.Profile.GetPropertyValue("CV.Major").ToString();

                //    ListItem li_YearOfExp = ddl_YearOfExp.Items.FindByValue(Context.Profile.GetPropertyValue("CV.YearsofExperience").ToString());
                //    if (li_YearOfExp != null) { li_YearOfExp.Selected = true; }

                //    txt_RelatedExp.Text = Context.Profile.GetPropertyValue("CV.RelatedExperience").ToString();
                //    txt_MostRecentPosition.Text = Context.Profile.GetPropertyValue("CV.MostRecentPosition").ToString();

                //    ListItem li_CurrentJobLevel = ddl_CurrentJobLevel.Items.FindByValue(Context.Profile.GetPropertyValue("CV.CurrentJobLevel").ToString());
                //    if (li_CurrentJobLevel != null) { li_CurrentJobLevel.Selected = true; }

                //    txt_Achievement.Text = Context.Profile.GetPropertyValue("CV.Achievements").ToString();
                //    txt_Skill.Text = Context.Profile.GetPropertyValue("CV.SkillsInterests").ToString();
                //    txt_Membership.Text = Context.Profile.GetPropertyValue("CV.Memberships").ToString();

                //    ListItem li_Employment = ddl_Employment.Items.FindByValue(Context.Profile.GetPropertyValue("CV.DesiredEmployment").ToString());
                //    if (li_Employment != null) { li_Employment.Selected = true; }

                //    ListItem li_JobLevel = ddl_JobLevel.Items.FindByValue(Context.Profile.GetPropertyValue("CV.DesiredJobLevel").ToString());
                //    if (li_JobLevel != null) { li_JobLevel.Selected = true; }

                //    ListItem li_DesiredLocation = ddl_DesiredLocation.Items.FindByValue(Context.Profile.GetPropertyValue("CV.DesiredLocations").ToString());
                //    if (li_DesiredLocation != null) { li_DesiredLocation.Selected = true; }

                //    txt_SalaryFrom.Text = Context.Profile.GetPropertyValue("CV.SalaryFrom").ToString();
                //    txt_SalaryTo.Text = Context.Profile.GetPropertyValue("CV.SalaryTo").ToString();

                //    ListItem li_Currency = ddl_SalaryCurrency.Items.FindByValue(Context.Profile.GetPropertyValue("CV.SalaryCurrency").ToString());
                //    if (li_Currency != null) { li_Currency.Selected = true; }
                //    ListItem li_PaidType = ddl_SalaryPaidType.Items.FindByValue(Context.Profile.GetPropertyValue("CV.SalaryPaidType").ToString());
                //    if (li_PaidType != null) { li_PaidType.Selected = true; }
                //    ListItem li_DesiredTravel = ddl_DesiredTravel.Items.FindByValue(Context.Profile.GetPropertyValue("CV.DesiredTravel").ToString());
                //    if (li_DesiredTravel != null) { li_DesiredTravel.Selected = true; }

                //    ListItem li_Relocated = ddl_Relocated.Items.FindByValue(Context.Profile.GetPropertyValue("CV.WillingToRelocate").ToString());
                //    if (li_Relocated != null) { li_Relocated.Selected = true; }


                //    txt_HowSoonAvai.Text = Context.Profile.GetPropertyValue("CV.HowSoonToWork").ToString();
                //    txt_Statement.Text = HttpUtility.HtmlDecode(Context.Profile.GetPropertyValue("CV.PersonalStatement").ToString());
                //    if (Convert.ToBoolean(Context.Profile.GetPropertyValue("CV.Searchable").ToString()) == true)
                //    {
                //        cb_Seachable.Checked = true;
                //    }
                //    else
                //    {
                //        cb_Seachable.Checked = false;
                //    }
                //}

                //Limit input characters
                txt_Statement.Attributes.Add("onkeydown", "textCounter(this,'" + Label3.ClientID + "', 5000)");
                txt_Statement.Attributes.Add("onkeyup", "textCounter(this,'" + Label3.ClientID + "', 5000)");
                txt_Statement.Attributes.Add("onmousedown", "textCounter(this,'" + Label3.ClientID + "', 5000)");
                txt_Statement.Attributes.Add("onmouseup", "textCounter(this,'" + Label3.ClientID + "', 5000)");
                txt_Statement.Attributes.Add("onblur", "textCounter(this,'" + Label3.ClientID + "', 5000)");
            }
        }
        protected void btnPostCV_Click(object sender, EventArgs e)
        {
            try
            {
                if (userId != null)
                {
                    Context.Profile.SetPropertyValue("CV.EduLevel", ddl_EduLevel.SelectedValue.Trim());
                    Context.Profile.SetPropertyValue("CV.Major", txt_Major.Text.Trim());
                    Context.Profile.SetPropertyValue("CV.Language", ddl_lang1.SelectedValue.Trim());
                    Context.Profile.SetPropertyValue("CV.Language2", ddl_lang2.SelectedValue.Trim());
                    Context.Profile.SetPropertyValue("CV.Language3", ddl_lang3.SelectedValue.Trim());
                    Context.Profile.SetPropertyValue("CV.Language_lvl", ddl_lang1_lvl.SelectedValue.Trim());
                    Context.Profile.SetPropertyValue("CV.Language2_lvl", ddl_lang2_lvl.SelectedValue.Trim());
                    Context.Profile.SetPropertyValue("CV.Language3_lvl", ddl_lang3_lvl.SelectedValue.Trim());
                    Context.Profile.SetPropertyValue("CV.YearsofExperience", ddl_YearOfExp.SelectedValue.Trim());
                    Context.Profile.SetPropertyValue("CV.RelatedExperience", txt_RelatedExp.Text.Trim());
                    Context.Profile.SetPropertyValue("CV.MostRecentPosition", txt_MostRecentPosition.Text.Trim());
                    Context.Profile.SetPropertyValue("CV.CurrentJobLevel", ddl_CurrentJobLevel.SelectedValue.Trim());
                    Context.Profile.SetPropertyValue("CV.Achievements", txt_Achievement.Text.Trim());
                    Context.Profile.SetPropertyValue("CV.SkillsInterests", txt_Skill.Text.Trim());
                    Context.Profile.SetPropertyValue("CV.Memberships", txt_Membership.Text.Trim());
                    Context.Profile.SetPropertyValue("CV.DesiredEmployment", ddl_Employment.SelectedValue.Trim());
                    Context.Profile.SetPropertyValue("CV.DesiredEmployment2", ddl_Employment2.SelectedValue.Trim());
                    Context.Profile.SetPropertyValue("CV.DesiredEmployment3", ddl_Employment3.SelectedValue.Trim());
                    Context.Profile.SetPropertyValue("CV.DesiredJobLevel", ddl_JobLevel.SelectedValue.Trim());
                    Context.Profile.SetPropertyValue("CV.EmploymentType", ddl_EmploymentType.SelectedValue.Trim());
                    Context.Profile.SetPropertyValue("CV.DesiredLocations", ddl_DesiredLocation.SelectedValue.Trim());
                    Context.Profile.SetPropertyValue("CV.DesiredLocations2", ddl_DesiredLocation2.SelectedValue.Trim());
                    Context.Profile.SetPropertyValue("CV.DesiredLocations3", ddl_DesiredLocation3.SelectedValue.Trim());

                    Context.Profile.SetPropertyValue("CV.DesiredTravel", ddl_DesiredTravel.SelectedValue.Trim());
                    Context.Profile.SetPropertyValue("CV.CurrentResidence", txt_CurrentResidence.Text.Trim());
                    Context.Profile.SetPropertyValue("CV.WillingToRelocate", ddl_Relocated.SelectedValue.Trim());
                    Context.Profile.SetPropertyValue("CV.HowSoonToWork", txt_HowSoonAvai.Text.Trim());
                    Context.Profile.SetPropertyValue("CV.PersonalStatement", txt_Statement.Text.Trim());

                    Context.Profile.SetPropertyValue("CV.CreateDate", DateTime.Now);

                    string salarytype = Request.Form["salaryType"].ToString();
                    if (salarytype == "Negotiable")
                    {
                        Context.Profile.SetPropertyValue("CV.SalaryType", false);
                    }
                    else
                    {
                        Context.Profile.SetPropertyValue("CV.SalaryType", true);
                        if (txt_SalaryFrom.Text.Trim() != "")
                        {
                            Context.Profile.SetPropertyValue("CV.SalaryFrom", Convert.ToDecimal(txt_SalaryFrom.Text.Trim()));
                        }
                        if (txt_SalaryTo.Text.Trim() != "")
                        {
                            Context.Profile.SetPropertyValue("CV.SalaryTo", Convert.ToDecimal(txt_SalaryTo.Text.Trim()));
                        }
                        Context.Profile.SetPropertyValue("CV.SalaryCurrency", ddl_SalaryCurrency.SelectedValue.Trim());
                        Context.Profile.SetPropertyValue("CV.SalaryPaidType", ddl_SalaryPaidType.SelectedValue.Trim());
                    }

                    if (cb_Seachable.Checked == true)
                    {
                        Context.Profile.SetPropertyValue("CV.Searchable", true);
                    }
                    else
                        Context.Profile.SetPropertyValue("CV.Searchable", false);

                    Context.Profile.SetPropertyValue("CV.Active", true);
                    Context.Profile.SetPropertyValue("Employee.AllowCreateCV", false);

                    Response.Redirect("DoneCV.aspx");
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('"+ex.Message+"');</script>");
            }
        }
        
        protected void Clear_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/memberArea/AdsCv.aspx");
        }
    }
}