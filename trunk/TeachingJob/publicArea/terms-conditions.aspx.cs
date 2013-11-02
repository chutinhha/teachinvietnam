using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace TeachingJob.publicArea
{
    public partial class terms_conditions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string aboutus_filepath = Server.MapPath("~/UserData/template/about-us.txt");
                if (File.Exists(aboutus_filepath))
                {
                    StreamReader sr = new StreamReader(aboutus_filepath);
                    literal_aboutus.Text = HttpUtility.HtmlDecode(sr.ReadToEnd().ToString());
                    sr.Close();
                }
                string filepath = Server.MapPath("~/UserData/template/TermAndCondition.txt");
                if (File.Exists(filepath))
                {
                    StreamReader sr = new StreamReader(filepath);
                    literal_term.Text = HttpUtility.HtmlDecode(sr.ReadToEnd().ToString());
                    sr.Close();
                }
                string privacy_filepath = Server.MapPath("~/UserData/template/privacy-policy.txt");
                if (File.Exists(privacy_filepath))
                {
                    StreamReader sr = new StreamReader(privacy_filepath);
                    literal_policy.Text = HttpUtility.HtmlDecode(sr.ReadToEnd().ToString());
                    sr.Close();
                }

                if (User.IsInRole("admin") || User.IsInRole("superadmin"))
                {
                    hpl_edit.Visible = true;
                    hpl_edit.NavigateUrl = "~/publicArea/term-condition-master.aspx";
                    hpl_edit_policy.Visible = true;
                    hpl_edit_policy.NavigateUrl = "~/publicArea/privacy-policy-master.aspx";
                    hpl_edit_aboutus.Visible = true;
                    hpl_edit_aboutus.NavigateUrl = "~/publicArea/aboutus-master.aspx";
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}