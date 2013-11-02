using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace TeachingJob.Templates.UserControl
{
    public partial class IntershipAds : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("~/UserData/template/Internship_RightPanel.txt");
            StreamReader sr = null;
            try
            {
                
                if (File.Exists(filePath))
                {
                    sr = new StreamReader(filePath);
                    lblAds.Text = HttpUtility.HtmlDecode(sr.ReadToEnd().ToString());
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                sr.Close();
            }
        }
    }
}