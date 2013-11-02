using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeachingJob.Templates.UserControl
{
    public partial class SocialReference : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hpl_ShareFacebook.NavigateUrl = "http://www.facebook.com/sharer/sharer.php?u=" + HttpContext.Current.Request.Url.AbsoluteUri;
            hpl_ShareTwitter.NavigateUrl = "https://twitter.com/intent/tweet?source=webclient&text=" + HttpContext.Current.Request.Url.AbsoluteUri;
        }
    }
}