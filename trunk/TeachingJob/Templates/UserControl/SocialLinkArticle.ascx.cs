using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeachingJob.Templates.UserControl
{
    public partial class SocialLinkArticle : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hplShareFB.NavigateUrl = "http://www.facebook.com/sharer/sharer.php?u=" + HttpContext.Current.Request.Url.AbsoluteUri;
            hplShareTW.NavigateUrl = "https://twitter.com/intent/tweet?source=webclient&text=" + HttpContext.Current.Request.Url.AbsoluteUri;
            hplShareLI.NavigateUrl = string.Format("http://www.linkedin.com/shareArticle?mini=true&url={0}&title={1}&summary={2}&source={3}", HttpContext.Current.Request.Url.AbsoluteUri, Page.Title, HttpContext.Current.Request.Url.AbsoluteUri,"LinkedIn");
            hplShareGM.NavigateUrl = string.Format("mailto:your@email.address?body={0}&subject={1}", HttpContext.Current.Request.Url.AbsoluteUri, Page.Title);
        }
    }
}