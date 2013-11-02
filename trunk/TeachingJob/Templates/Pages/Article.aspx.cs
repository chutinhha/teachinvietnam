using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeachingJob.Templates.Pages
{
    public partial class Article : System.Web.UI.Page
    {
        private string myConnStr = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessLogic.BusinessFacade facade;
        protected void Page_Load(object sender, EventArgs e)
        {
            facade = new BusinessLogic.BusinessFacade(myConnStr);
            if(Request.Params["aId"]==null){
                Page.ClientScript.RegisterClientScriptBlock(GetType(),"","<script>alert('There is no article!')</script>");
                return;
            }
            BusinessLogic.Facade.Intership.Intership _intership = BusinessLogic.Facade.Intership.Intership.getIntershipById(Convert.ToInt32(Request.Params["aId"].ToString()));
            if (_intership == null)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "", "<script>alert('There is no article as you request!')</script>");
                return;
            }
            liPageHeader.Text = _intership.ArticleName;
            aHeader.Text = _intership.ArticleName;
            aContent.Text = _intership.ArticleContent;
            liCreatedDate.Text = Convert.ToDateTime(_intership.CreatedDate).ToShortDateString();
        }
    }
}