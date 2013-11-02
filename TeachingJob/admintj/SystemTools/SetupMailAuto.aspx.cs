using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeachingJob.Data;
using System.Text;
using System.Globalization;
using BusinessLogic;
namespace TeachingJob.admintj
{
    public partial class SetupMailAuto : System.Web.UI.Page
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbDayOfWeek.Items.Add(new ListItem("Monday", DayOfWeek.Monday.ToString()));
                lbDayOfWeek.Items.Add(new ListItem("Tuesday", DayOfWeek.Tuesday.ToString()));
                lbDayOfWeek.Items.Add(new ListItem("Wednesday", DayOfWeek.Wednesday.ToString()));
                lbDayOfWeek.Items.Add(new ListItem("Thursday", DayOfWeek.Thursday.ToString()));
                lbDayOfWeek.Items.Add(new ListItem("Friday", DayOfWeek.Friday.ToString()));
                lbDayOfWeek.Items.Add(new ListItem("Saturday", DayOfWeek.Saturday.ToString()));
                lbDayOfWeek.Items.Add(new ListItem("Sunday", DayOfWeek.Sunday.ToString()));

                string DaySend = System.Configuration.ConfigurationManager.AppSettings["DaySend"];
                string HourSend = System.Configuration.ConfigurationManager.AppSettings["HourSend"];
                lbDayOfWeek.ClearSelection();
                foreach (string t in DaySend.Split(','))
                { 
                    foreach(ListItem item in lbDayOfWeek.Items)
                    {
                        if (item.Value == t)
                        {
                            item.Selected = true;
                        }
                    }
                }
                try {
                    ddlHour.Items.FindByValue(HourSend).Selected = true;
                }
                catch (Exception ex)
                { }
            }

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    string strDay = "";
                    foreach (ListItem item in lbDayOfWeek.Items)
                    {
                        if (item.Selected)
                        {
                            if (strDay == "")
                            {
                                strDay = strDay + item.Value;
                            }
                            else
                            { strDay = strDay +","+ item.Value; }
                        }
                    }
                    System.Configuration.ConfigurationManager.AppSettings["DaySend"] = strDay;
                    System.Configuration.ConfigurationManager.AppSettings["HourSend"] = ddlHour.SelectedValue;
                }
                
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
        }

    }
}