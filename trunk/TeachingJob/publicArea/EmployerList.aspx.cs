using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection;
using System.Resources;
using BusinessLogic;
using TeachingJob.Data;
using BusinessLogic.Facade.Employer;

namespace TeachingJob.publicArea
{
    public partial class EmployerList : System.Web.UI.Page
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddl_city.DataBind();
            }
        }
        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            if (ddl_city.SelectedValue != string.Empty)
            {
                try
                {
                    EmployerLogic empLogic = new EmployerLogic(myConn);
                    List<BusinessLogic.Employer> eList = empLogic.GetEmployerByCity(ddl_city.SelectedValue);
                    Repeater_Org.DataSource = eList;
                    Repeater_Org.DataBind();
                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
                }
            }
        }
        protected void ddl_city_DataBound(object sender, EventArgs e)
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
        protected void Repeater_Org_DataBind(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HyperLink hpl_OrgName = e.Item.FindControl("hpl_OrgName") as HyperLink;
                hpl_OrgName.Text = DataBinder.Eval(e.Item.DataItem, "EmName").ToString();
                hpl_OrgName.NavigateUrl = "~/publicArea/EmployerInfo.aspx?eid=" + DataBinder.Eval(e.Item.DataItem, "UniqueId").ToString();

                Label lbl_SchoolType = e.Item.FindControl("lbl_SchoolType") as Label;
                string stype = DataBinder.Eval(e.Item.DataItem, "SchoolType").ToString();
                string otype = DataBinder.Eval(e.Item.DataItem, "OrgType").ToString();
                string ot = otype != "" ? otype : string.Empty;
                string st = stype != "" ? " - "+stype: string.Empty;
                string type = ot + st;
                lbl_SchoolType.Text = type;
            }
        }
    }
}