using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using TeachingJob.Data;
using System.Threading;

namespace TeachingJob.publicArea
{
    public partial class JobSector : BasePage
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;
        protected void Page_Load(object sender, EventArgs e)
        {
            facade=new BusinessFacade(myConn);

            Repeater_AllJobByAllSector.DataSource = facade.GetAllJob();
            Repeater_AllJobByAllSector.DataBind();

            Repeater_GetAllJobByAdministration.DataSource = facade.GetJobsBySectorId(1);
            Repeater_GetAllJobByAdministration.DataBind();
            Repeater_GetAllJobByThrough.DataSource = facade.GetJobsBySectorId(2);
            Repeater_GetAllJobByThrough.DataBind();
            Repeater_GetAllJobByAcademic.DataSource = facade.GetJobsBySectorId(3);
            Repeater_GetAllJobByAcademic.DataBind();
        }
        protected void Repeater1_DataBound(object sender, RepeaterItemEventArgs e)
        {
            Label lbl_Title = (Label)e.Item.FindControl("lbl_Title");
            lbl_Title.Text = DataBinder.Eval(e.Item.DataItem, "jTitle_en").ToString();
            lbl_Title.ToolTip = DataBinder.Eval(e.Item.DataItem, "jTitle_en").ToString();

            Label lbl_ClosingDate = (Label)e.Item.FindControl("lbl_ClosingDate");
            lbl_ClosingDate.Text = DataBinder.Eval(e.Item.DataItem, "jClosingDate", "{0:MMM} {0:dd}, {0:yyyy}");

            Label lbl_Salary = (Label)e.Item.FindControl("lbl_Salary");
            string salaryType = DataBinder.Eval(e.Item.DataItem, "jSalaryType").ToString();
            if (salaryType != "True")
            {
                lbl_Salary.Text = "Negotiable";
            }
            else
            {
                string sfrom = DataBinder.Eval(e.Item.DataItem, "jSalary_en").ToString();
                string sto = DataBinder.Eval(e.Item.DataItem, "jSalaryTo_en").ToString();
                string scurrency = DataBinder.Eval(e.Item.DataItem, "jSalaryCurrency").ToString();
                string spaymenttype = DataBinder.Eval(e.Item.DataItem, "jSalaryPaymentType").ToString();

                lbl_Salary.Text = String.Format("{0} - {1} {2}/{3}", sfrom, sto, scurrency, spaymenttype);
            }
        }
        protected void Repeater2_DataBound(object sender, RepeaterItemEventArgs e)
        {
            Label lbl_Title = (Label)e.Item.FindControl("lbl_Title");
            lbl_Title.Text = DataBinder.Eval(e.Item.DataItem, "jTitle_en").ToString();
            lbl_Title.ToolTip = DataBinder.Eval(e.Item.DataItem, "jTitle_en").ToString();

            Label lbl_ClosingDate = (Label)e.Item.FindControl("lbl_ClosingDate");
            lbl_ClosingDate.Text = DataBinder.Eval(e.Item.DataItem, "jClosingDate", "{0:MMM} {0:dd}, {0:yyyy}");

            Label lbl_Salary = (Label)e.Item.FindControl("lbl_Salary");
            string salaryType = DataBinder.Eval(e.Item.DataItem, "jSalaryType").ToString();
            if (salaryType != "True")
            {
                lbl_Salary.Text = "Negotiable";
            }
            else
            {
                string sfrom = DataBinder.Eval(e.Item.DataItem, "jSalary_en").ToString();
                string sto = DataBinder.Eval(e.Item.DataItem, "jSalaryTo_en").ToString();
                string scurrency = DataBinder.Eval(e.Item.DataItem, "jSalaryCurrency").ToString();
                string spaymenttype = DataBinder.Eval(e.Item.DataItem, "jSalaryPaymentType").ToString();

                lbl_Salary.Text = String.Format("{0} - {1} {2}/{3}", sfrom, sto, scurrency, spaymenttype);
            }
        }
        protected void Repeater3_DataBound(object sender, RepeaterItemEventArgs e)
        {
            Label lbl_Title = (Label)e.Item.FindControl("lbl_Title");
            lbl_Title.Text = DataBinder.Eval(e.Item.DataItem, "jTitle_en").ToString();
            lbl_Title.ToolTip = DataBinder.Eval(e.Item.DataItem, "jTitle_en").ToString();

            Label lbl_ClosingDate = (Label)e.Item.FindControl("lbl_ClosingDate");
            lbl_ClosingDate.Text = DataBinder.Eval(e.Item.DataItem, "jClosingDate", "{0:MMM} {0:dd}, {0:yyyy}");

            Label lbl_Salary = (Label)e.Item.FindControl("lbl_Salary");
            string salaryType = DataBinder.Eval(e.Item.DataItem, "jSalaryType").ToString();
            if (salaryType != "True")
            {
                lbl_Salary.Text = "Negotiable";
            }
            else
            {
                string sfrom = DataBinder.Eval(e.Item.DataItem, "jSalary_en").ToString();
                string sto = DataBinder.Eval(e.Item.DataItem, "jSalaryTo_en").ToString();
                string scurrency = DataBinder.Eval(e.Item.DataItem, "jSalaryCurrency").ToString();
                string spaymenttype = DataBinder.Eval(e.Item.DataItem, "jSalaryPaymentType").ToString();

                lbl_Salary.Text = String.Format("{0} - {1} {2}/{3}", sfrom, sto, scurrency, spaymenttype);
            }
        }
        protected void Repeater4_DataBound(object sender, RepeaterItemEventArgs e)
        {
            Label lbl_Title = (Label)e.Item.FindControl("lbl_Title");
            lbl_Title.Text = DataBinder.Eval(e.Item.DataItem, "jTitle_en").ToString();
            lbl_Title.ToolTip = DataBinder.Eval(e.Item.DataItem, "jTitle_en").ToString();

            Label lbl_ClosingDate = (Label)e.Item.FindControl("lbl_ClosingDate");
            lbl_ClosingDate.Text = DataBinder.Eval(e.Item.DataItem, "jClosingDate", "{0:MMM} {0:dd}, {0:yyyy}");

            Label lbl_Salary = (Label)e.Item.FindControl("lbl_Salary");
            string salaryType = DataBinder.Eval(e.Item.DataItem, "jSalaryType").ToString();
            if (salaryType != "True")
            {
                lbl_Salary.Text = "Negotiable";
            }
            else
            {
                string sfrom = DataBinder.Eval(e.Item.DataItem, "jSalary_en").ToString();
                string sto = DataBinder.Eval(e.Item.DataItem, "jSalaryTo_en").ToString();
                string scurrency = DataBinder.Eval(e.Item.DataItem, "jSalaryCurrency").ToString();
                string spaymenttype = DataBinder.Eval(e.Item.DataItem, "jSalaryPaymentType").ToString();

                lbl_Salary.Text = String.Format("{0} - {1} {2}/{3}", sfrom, sto, scurrency, spaymenttype);
            }
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            BusinessLogic.Facade.Component.CategoryLogic componentFacade = new BusinessLogic.Facade.Component.CategoryLogic(myConn);
            List<Sector> sectorList = componentFacade.GetRootCategory();

            if (Thread.CurrentThread.CurrentCulture.Name == "en-US")
            {
                foreach (Sector sector in sectorList)
                {
                    if (sector.SeId == 1) { Literal3.Text = sector.SeName_en; }
                    else if (sector.SeId == 2) { Literal4.Text = sector.SeName_en; }
                    else if (sector.SeId == 3) { Literal5.Text = sector.SeName_en; }
                }
            }
            else
            {
                foreach (Sector sector in sectorList)
                {
                    if (sector.SeId == 1) { Literal3.Text = sector.SeName_vi; }
                    else if (sector.SeId == 2) { Literal4.Text = sector.SeName_vi; }
                    else if (sector.SeId == 3) { Literal5.Text = sector.SeName_vi; }
                }
            }
        }
    }
}