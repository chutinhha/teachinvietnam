using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeachingJob.Data;
using BusinessLogic.Facade;

namespace TeachingJob.s
{
    public partial class services : BasePage
    {
        int serviceId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ServiceArticle article = null;
                if (Request.QueryString["aid"] == null)
                {
                    article = ServiceArticle.GetAll().OrderByDescending(x => x.DisplayOrder).ThenBy(x => x.CreatedDate).FirstOrDefault();
                }
                else
                {
                    serviceId = Convert.ToInt32(Request.QueryString["aid"].ToString());
                    article = ServiceArticle.GetArticleById(serviceId);
                }

                if (article != null)
                {
                    lblContent.Text = article.MainContent;
                    lblHeader.Text = article.Title;
                }


                var rootArticles = ServiceArticle.GetAll().Where(x => x.ParentId == 0).OrderByDescending(x => x.DisplayOrder).ThenBy(x => x.CreatedDate);
                repeater_tabs.DataSource = rootArticles;
                repeater_tabs.DataBind();
            }
        }

        protected void repeater_tabs_databound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HyperLink hplTabs = (HyperLink)e.Item.FindControl("hplTabs");
                ServiceArticle dataitem = (ServiceArticle)e.Item.DataItem;

                hplTabs.Text = dataitem.Title;
                hplTabs.ToolTip = hplTabs.Text;
                hplTabs.NavigateUrl = "~/s/services.aspx?aid=" + dataitem.Id;

                if (serviceId != 0 && serviceId == dataitem.Id)
                {
                    hplTabs.Attributes.Add("class", "selected");
                }
                
                List<ServiceArticle> sublist = ServiceArticle.GetSubArticlesById(Convert.ToInt32(dataitem.Id));
                if (sublist.Count > 0)
                {
                    Repeater repeater_subtabs = (Repeater)e.Item.FindControl("repeater_subtabs");
                    repeater_subtabs.DataSource = sublist;
                    repeater_subtabs.DataBind();
                }
            }
        }
        protected void repeater_subtabs_databound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HyperLink hplSubTabs = (HyperLink)e.Item.FindControl("hplSubTabs");
                ServiceArticle dataitem = (ServiceArticle)e.Item.DataItem;
                if (serviceId != 0 && serviceId == dataitem.Id)
                {
                    hplSubTabs.Attributes.Add("class", "selected");
                }
                hplSubTabs.Text = dataitem.Title;
                hplSubTabs.ToolTip = hplSubTabs.Text;
                hplSubTabs.NavigateUrl = "~/s/services.aspx?aid=" + dataitem.Id;
            }
        }
    }
}