using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.IO;

namespace TeachingJob.admintj
{
    public partial class AdminSite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string[] files = Directory.GetFiles(Server.MapPath("~/temp"), "*.*", SearchOption.AllDirectories);
           
        }
        protected void ClearTempFolder(object sender, EventArgs e)
        {
            if (Membership.GetNumberOfUsersOnline() == 1)
            {
                string[] files = Directory.GetFiles(Server.MapPath("~/temp/"), "*.*", SearchOption.AllDirectories);
                if (files.Length > 0)
                {
                    foreach (string f in files)
                    {
                        File.Delete(f);
                    }
                }
             
            }
            else
            {
               
            }
        }
    }
}