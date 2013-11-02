using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeachingJob.Templates.UserControl
{
    public partial class Social4Master : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hplShareFB.NavigateUrl = "http://www.facebook.com/sharer/sharer.php?u=" + HttpContext.Current.Request.Url.AbsoluteUri;
                hplShareTW.NavigateUrl = "https://twitter.com/intent/tweet?source=webclient&text=" + HttpContext.Current.Request.Url.AbsoluteUri;
                hplShareLI.NavigateUrl = string.Format("http://www.linkedin.com/shareArticle?mini=true&url={0}&title={1}&summary={2}&source={3}", HttpContext.Current.Request.Url.AbsoluteUri, Page.Title, HttpContext.Current.Request.Url.AbsoluteUri, "LinkedIn");
            }
        }
    }
}