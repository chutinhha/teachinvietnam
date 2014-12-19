using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeachingJob.Templates.Pages
{
    public partial class visa_service : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("~/UserData/template/visa-service.txt");
            StreamReader sr = null;
            try
            {

                if (File.Exists(filePath))
                {
                    sr = new StreamReader(filePath);
                    lbl_MainInfo.Text = HttpUtility.HtmlDecode(sr.ReadToEnd().ToString());
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                sr.Close();
                sr.Dispose();
            }
        }
    }
}