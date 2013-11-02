using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
namespace TeachingJob.admintj
{
    public partial class BrowseFiles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string[] viewPaths = { "~/Uploads/" };
            if (Request.QueryString["url"] != null)
            {
                viewPaths = new string[] { Request.QueryString["url"] };
            }
           FileExplorer1.Configuration.ViewPaths=viewPaths;
           FileExplorer1.Configuration.UploadPaths = viewPaths;
           FileExplorer1.Configuration.DeletePaths = viewPaths;
           string[] SearchPatterns = new string[] { "*.jpg", "*.jpeg", "*.gif", "*.png" };
           FileExplorer1.Configuration.SearchPatterns = SearchPatterns;
           FileExplorer1.Configuration.MaxUploadFileSize = 2000000;
            
        }
    }
}