using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using System.Web.Security;
using TeachingJob.Data;
using BusinessLogic.CV;
using AjaxControlToolkit;
using System.Reflection;
using System.Resources;
using System.Threading;
using System.Web.UI.HtmlControls;
using System.Text;

namespace TeachingJob.memberArea
{
    public partial class AdsAJob : BasePage
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;
        private string UserID;
        MembershipUser mu;
        protected void BindingDDlControl(DropDownList ddl, String value)
        {
            if (value != "")
            {
                ListItem li = ddl.Items.FindByValue(value);
                if (li != null) { li.Selected = true; }
            }
        }
        protected void BindingTxtControl(TextBox txt, String value)
        {
            if (value != "" || value != null)
            {
                txt.Text = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            facade = new BusinessFacade(myConn);
            mu = Membership.GetUser();
            UserID = mu.ProviderUserKey.ToString();

            //Page.Form.DefaultButton = btnPostJob.UniqueID;

            if (!IsPostBack)
            {
                //ddl_OrgType.DataBind();
                //ddl_SchoolType.DataBind();
                ddlJobLevel.DataBind();
                ddl_EducationRequirement.DataBind();
                ddlJobEmploymentType.DataBind();
                ddlJobLocation.DataBind();
                ddlJobLocation2.DataBind();
                ddlJobLocation3.DataBind();
                ddlCitizenship.DataBind();
                Category.DataBind();
                Category2.DataBind();
                Category3.DataBind();
                txt_Email.Text = mu.Email;

                CalendarExtender1.StartDate = DateTime.Now;
                CalendarExtender1.EndDate = DateTime.Now.AddDays(General.CLOSING_DATE_PERIOD);
                //If we have premium employer, set closing date longer.
                if (User.IsInRole("PremiumEmp"))
                {
                    CalendarExtender1.EndDate = DateTime.Now.AddDays(General.CLOSING_DATE_PERIOD * 2);
                }
                if (Thread.CurrentThread.CurrentCulture.Name == "en-US")
                {
                    CalendarExtender1.Format = "MM/dd/yyyy";
                }
                else
                {
                    CalendarExtender1.Format = "dd/MM/yyyy";
                }

                string contactperson = HttpContext.Current.Profile.GetPropertyValue("Employer.Salutation").ToString() + " " + HttpContext.Current.Profile.GetPropertyValue("Employer.FirstName").ToString() + " " + HttpContext.Current.Profile.GetPropertyValue("Employer.MiddleName").ToString() + " " + HttpContext.Current.Profile.GetPropertyValue("Employer.LastName").ToString();
                Contact.Text = contactperson;
            }
            if (!IsPostBack)
            {
                try
                {
                    ViewState["PreviousPageUrl"] = Request.UrlReferrer.ToString();
                }
                catch (Exception)
                {
                    Response.Redirect("~/Employer/EmployerSite.aspx?r=e");
                }

                if (Request.Params["stt"] == "edit")
                {
                    if (Session["Preview"] != null)
                    {
                        Dj = (DetailJob)Session["Preview"];

                        BindingTxtControl(txtJobTitle, Dj.Title);
                        BindingDDlControl(Category, Dj.Category);
                        BindingDDlControl(Category2, Dj.Category2);
                        BindingDDlControl(Category3, Dj.Category3);
                        BindingDDlControl(ddlCitizenship, Dj.Citizenship);
                        if (Dj.JobLevel != "")
                        {
                            ListItem sJobLevel = ddlJobLevel.Items.FindByValue(Dj.JobLevel);
                            if (sJobLevel != null) { sJobLevel.Selected = true; }
                        }
                        BindingDDlControl(ddl_EducationRequirement, Dj.EduRequirement);
                        BindingDDlControl(ddlJobEmploymentType, Dj.EmploymentType);
                        BindingDDlControl(ddlJobLocation, Dj.Workplace);
                        BindingDDlControl(ddlJobLocation2, Dj.Workplace2);
                        BindingDDlControl(ddlJobLocation3, Dj.Workplace3);
                        BindingTxtControl(txtJobDescription,Dj.Description);
                        BindingTxtControl(txtJobClosingDate, Dj.ClosingDate.ToShortDateString());
                        BindingTxtControl(Contact, Dj.Contact);
                        BindingTxtControl(txt_Email, Dj.EmailForEmployer);
                        BindingTxtControl(txt_SalaryFrom, Dj.Salary.ToString());
                        BindingTxtControl(txt_SalaryTo, Dj.SalaryTo.ToString());
                        BindingDDlControl(ddl_SalaryCurrency, Dj.SalaryCurrency);
                        BindingDDlControl(ddl_SalaryPaidType, Dj.SalaryPaymentType);

                        if (Session["execJob"] != null && Session["execJob"].ToString() == "true")
                        {
                            cb_ExecutiveJob.Checked = true;
                        }
                        else { cb_ExecutiveJob.Checked = false; }
                    }
                }
            }
        }

        protected void btnPostJob_Click(object sender, EventArgs e)
        {
            Boolean salaryType;
            string _salarytype = Request.Form["salaryType"].ToString();
            if (_salarytype == "Negotiable")
            {
                salaryType = false;
            }
            else
            {
                salaryType = true;
            }
            Boolean executiveJob = false;
            if (cb_ExecutiveJob.Checked)
            {
                executiveJob = true;
            }

            if (txt_SalaryFrom.Text == "") { txt_SalaryFrom.Text = "0"; }  //2 thang salary khi insert no la decimal nen phai 
            if (txt_SalaryTo.Text == "") { txt_SalaryTo.Text = "0"; }   // gan gia tri cho no =0 moi run dc
            if (txtJobClosingDate.Text == "") { txtJobClosingDate.Text = string.Empty; }

            DetailJob dj = new DetailJob(txtJobTitle.Text.Trim(), txtJobDescription.Text.Trim(), mu.ProviderUserKey.ToString(), Category.SelectedValue, Category2.SelectedValue, Category3.SelectedValue, ddlCitizenship.SelectedValue, ddlJobLevel.SelectedValue, ddl_EducationRequirement.SelectedValue, ddlJobEmploymentType.SelectedValue, ddlJobLocation.SelectedValue, ddlJobLocation2.SelectedValue, ddlJobLocation3.SelectedValue, salaryType, Convert.ToDecimal(txt_SalaryFrom.Text.Trim()), Convert.ToDecimal(txt_SalaryTo.Text.Trim()), ddl_SalaryCurrency.SelectedValue, ddl_SalaryPaidType.SelectedValue, Convert.ToDateTime(txtJobClosingDate.Text.Trim()), executiveJob, Contact.Text.Trim(), txt_Email.Text.Trim());
            string stt = facade.InsertNewJob(dj);
            if (stt == "done")
            {
                string bodyMail = "";
                bodyMail += "Dear HR Manager";
                bodyMail += "("+dj.OrgName+")";
                bodyMail += "We deeply appreciate your placement of advertisement in the job vacancies with Teachinvietnam.org. Your ad was published and is available at this link: ";
                bodyMail += "This job will be deleted automatically in " + dj.ClosingDate.ToString("MM/dd/YYYY") + ".<br/>";
                bodyMail += "We look forward to sharing your success in the near future.";
                StringBuilder sb = new StringBuilder();
                MailUtils mailUtils = new MailUtils(Request);
                sb.Append(mailUtils.MailHeader());
                sb.Append(bodyMail );
                sb.Append(mailUtils.MailFooter());
                Utils.SendMail(dj.EmailForEmployer,"New job", sb.ToString(), "", "");
                Response.Redirect("~/memberArea/PostJobSuccess.aspx");
            }
        }

        protected void Category_DataBound(object sender, EventArgs e)
        {
            CategoryBinding(Category);
        }
        private void CategoryBinding(DropDownList ddl)
        {
            List<Sector> seList1 = facade.GetFullCategory(1);
            List<Sector> seList2 = facade.GetFullCategory(2);
            List<Sector> seList3 = facade.GetFullCategory(3);

            ddl.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            if (!IsPostBack)
            {
                int index1 = 1;
                Utils.catebinding(ddl, seList1, 1, index1);
                index1 = ddl.Items.Count;
                Utils.catebinding(ddl, seList2, 2, index1);
                index1 = ddl.Items.Count;
                Utils.catebinding(ddl, seList3, 3, index1);
            }
        }
        protected void Category2_DataBound(object sender, EventArgs e)
        {
            CategoryBinding(Category2);
        }
        protected void Category3_DataBound(object sender, EventArgs e)
        {
            CategoryBinding(Category3);
        }

        protected void Citizenship_DataBound(object sender, EventArgs e)
        {
            Assembly ass = Assembly.Load("App_GlobalResources");
            ResourceManager rm = new ResourceManager("Resources.Resource", ass);

            ddlCitizenship.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            ddlCitizenship.Items.Insert(1, new ListItem(rm.GetString("AnyCitizenship"), "Any citizenship"));

            List<Citizenship> ciList = facade.GetAllCitizenship();
            foreach (Citizenship ci in ciList)
            {
                ListItem li = Utils.DecideLangDropdown(ci.CitizenshipName, ci.CitizenshipName_vn);
                if (li.Value == "Afghanistan" || li.Value == "Afghanistan")
                {
                    ListItem l = new ListItem("------------------------------", "N/A");
                    ddlCitizenship.Items.Add(l);
                }
                ddlCitizenship.Items.Add(li);
            }
        }
        protected void EmpT_DataBound(object sender, EventArgs e)
        {
            ddlJobEmploymentType.Items.Insert(0, new ListItem(string.Empty, String.Empty));

            List<EmploymentType> etList = facade.GetAllEmploymentType();

            foreach (EmploymentType et in etList)
            {
                ListItem li = Utils.DecideLangDropdown(et.EtName, et.EtName_vn);
                ddlJobEmploymentType.Items.Add(li);
            }
        }
        protected void JobLevel_DataBound(object sender, EventArgs e)
        {
            ddlJobLevel.Items.Insert(0, new ListItem(string.Empty, String.Empty));
            //ddlJobLevel.SelectedIndex = 0;
            List<JobRole> jrList = facade.GetAllJobRole();
            foreach (JobRole jr in jrList)
            {
                ListItem li = Utils.DecideLangDropdown(jr.JrName, jr.JrName_vn);
                ddlJobLevel.Items.Add(li);
            }
        }
        protected void EduLevel_DataBound(object sender, EventArgs e)
        {
            ddl_EducationRequirement.Items.Insert(0, new ListItem(string.Empty, string.Empty));

            List<EduLevelcs> elList = facade.GetEduLevel();
            foreach (EduLevelcs el in elList)
            {
                ListItem li = Utils.DecideLangDropdown(el.Name_en, el.Name_vi);
                ddl_EducationRequirement.Items.Add(li);
            }
        }
        protected void Location_DataBound(object sender, EventArgs e)
        {
            LocationBinding(ddlJobLocation);
        }
        private void LocationBinding(DropDownList ddl)
        {
            ddl.Items.Insert(0, new ListItem(string.Empty, String.Empty));

            List<Location> loList = facade.GetAllLocation();
            foreach (Location lo in loList)
            {
                ListItem li = Utils.DecideLangDropdown(lo.LName, lo.LName_vn);

                if (lo.LName == "Ha Noi")
                {
                    ddl.Items.Insert(1, li);
                    continue;
                }
                if (lo.LName == "Ho Chi Minh")
                {
                    ddl.Items.Insert(2, li);
                    continue;
                }
                ddl.Items.Add(li);
            }
        }
        protected void Location2_DataBound(object sender, EventArgs e)
        {
            LocationBinding(ddlJobLocation2);
        }
        protected void Location3_DataBound(object sender, EventArgs e)
        {
            LocationBinding(ddlJobLocation3);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(ViewState["PreviousPageUrl"].ToString());
        }
        public string GetText(string content)
        {
            return content;
        }
        protected void Preview_OnClick(object sender, EventArgs e)
        {
            if (txt_SalaryFrom.Text == "") { txt_SalaryFrom.Text = "0"; }  //2 thang salary khi insert no la decimal nen phai 
            if (txt_SalaryTo.Text == "") { txt_SalaryTo.Text = "0"; }   // gan gia tri cho no =0 moi run dc

            int id = 0;
            string orgname = Context.Profile.GetPropertyValue("Organization.OrganizationName").ToString();
            string orgInfo = Context.Profile.GetPropertyValue("Organization.BriefInfo").ToString();
            string orglogo;
            try
            {
                orglogo = Context.Profile.GetPropertyValue("Organization.Logo").ToString();
            }
            catch (NullReferenceException)
            {
                orglogo = "";
            }
            string orgAdd = Context.Profile.GetPropertyValue("Organization.Address1").ToString();
            string phone = Context.Profile.GetPropertyValue("Organization.PhoneNumber1").ToString();
            string website = Context.Profile.GetPropertyValue("Organization.Website").ToString();
            string orgtype = Context.Profile.GetPropertyValue("Organization.OrganizationType").ToString();
            string schoolType = Context.Profile.GetPropertyValue("Organization.SchoolType").ToString();
            string usernameMail = mu.UserName;
            string jtitle = txtJobTitle.Text.Trim();
            DateTime uploaddate = DateTime.Now;
            DateTime closing = Convert.ToDateTime(txtJobClosingDate.Text.Trim());
            string description = txtJobDescription.Text.Trim();
            string cate1 = Category.SelectedValue.Trim();
            string cate2 = Category2.SelectedValue;
            string cate3 = Category3.SelectedValue;
            string workplace1 = ddlJobLocation.SelectedValue;
            string workplace2 = ddlJobLocation2.SelectedValue;
            string workplace3 = ddlJobLocation3.SelectedValue;
            Boolean salaryType = false;
            string salarytype = Request.Form["salaryType"].ToString();
            if (salarytype == "Negotiable")
            {
                salaryType = false;
            }
            else
            {
                salaryType = true;
            }

            if (cb_ExecutiveJob.Checked)
            {
                Session["execJob"] = "true";
            }
            else
            {
                Session["execJob"] = null;
            }
            Decimal salaryFrom = Convert.ToDecimal(txt_SalaryFrom.Text);
            Decimal salaryTo = Convert.ToDecimal(txt_SalaryTo.Text);
            string salarycurrency = ddl_SalaryCurrency.SelectedValue;
            string salarypayment = ddl_SalaryPaidType.SelectedValue;
            string citizenship = ddlCitizenship.SelectedValue;
            string joblevel = ddlJobLevel.SelectedValue;
            string eduredquire = ddl_EducationRequirement.SelectedValue;
            string empType = ddlJobEmploymentType.SelectedValue;
            string contact = Contact.Text.Trim();
            int viewcount = 0;
            string emailToApplicants = txt_Email.Text.Trim();
            Boolean executivejob = cb_ExecutiveJob.Checked;
            dj = new DetailJob(id, orgname, orgInfo, orglogo, orgAdd, phone, website, mu.UserName, emailToApplicants, jtitle, uploaddate, closing, description, cate1, cate2, cate3, workplace1, workplace2, workplace3, salaryType, salaryFrom, salaryTo, salarycurrency, salarypayment, citizenship, joblevel, eduredquire, empType, contact, viewcount, orgtype, schoolType);
            Session["Preview"] = dj;
            Response.Redirect("~/publicArea/JobDetails.aspx?view=preview");
        }
        DetailJob dj;

        public DetailJob Dj
        {
            get { return dj; }
            set { dj = value; }
        }
    }
}