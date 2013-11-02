using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeachingJob
{
    public partial class Intership : System.Web.UI.Page
    {
        private String connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        //BusinessLogic.BusinessFacade facade;

        protected void Page_Load(object sender, EventArgs e)
        {
            //facade = new BusinessLogic.BusinessFacade(connStr);
            //var IntershipYears = BusinessLogic.Facade.Intership.Intership.GetAll().OrderByDescending(x=>x.CreatedDate.Year).Select(x => x.CreatedDate.Year).Distinct();
            //ddlIntYear.Items.Add(new ListItem("All", "All"));
            //foreach (var year in IntershipYears)
            //{
            //    ddlIntYear.Items.Add(new ListItem(year.ToString(),year.ToString()));
            //}
            rpt_IntershipArticle.DataSource = BusinessLogic.Facade.Intership.Intership.GetAll();
            rpt_IntershipArticle.DataBind();
        }
        protected void rpt_IntershipArticle_OnDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    HyperLink aHeaderLink = (HyperLink)e.Item.FindControl("aHeaderLink");
                    Label aIntroduction = (Label)e.Item.FindControl("aIntroduction");
                    Literal liCreatedDate = (Literal)e.Item.FindControl("liCreatedDate");
                    BusinessLogic.Facade.Intership.Intership intershipObj = new BusinessLogic.Facade.Intership.Intership();
                    //intershipObj = e.Item.DataItem as BusinessLogic.Facade.Intership.Intership;
                    string articleName = DataBinder.Eval(e.Item.DataItem, "articleName").ToString();
                    string articleIntroduction = DataBinder.Eval(e.Item.DataItem, "articleIntroduction").ToString();

                    liCreatedDate.Text =Convert.ToDateTime(DataBinder.Eval(e.Item.DataItem, "CreatedDate").ToString()).ToShortDateString();
                    aHeaderLink.Text = articleName;
                    aHeaderLink.NavigateUrl = "~/Templates/Pages/Article.aspx?aId=" + DataBinder.Eval(e.Item.DataItem, "id").ToString();
                    aIntroduction.Text = articleIntroduction.Replace(Environment.NewLine, "<br />");
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}