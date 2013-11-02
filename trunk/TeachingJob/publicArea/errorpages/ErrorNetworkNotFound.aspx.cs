using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeachingJob.publicArea.errorpages
{
    public partial class ErrorNetworkNotFound : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["PreviousPageUrl"] = Request.UrlReferrer.ToString();
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string url = ViewState["PreviousPageUrl"].ToString();
            Response.Redirect(url);
        }
    }
}