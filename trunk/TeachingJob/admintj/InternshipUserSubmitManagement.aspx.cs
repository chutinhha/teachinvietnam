using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using TeachingJob.Data;

namespace TeachingJob.admintj
{
    public partial class InternshipUserSubmitManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string filepath = Server.MapPath("~/UserData/template/Internship_SubmitYour.txt");

                StreamReader sr = null;
                try
                {
                    if (File.Exists(filepath))
                    {
                        sr = new StreamReader(filepath);
                        txtRightPanel.Text = HttpUtility.HtmlDecode(sr.ReadToEnd().ToString());
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
        protected void gvIntershipCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "this.setAttribute('bgColor', this.style.backgroundColor); this.style.backgroundColor = '#C2D69B';");
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor = this.getAttribute('bgColor');");
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string filepath = Server.MapPath("~/UserData/template/Internship_SubmitYour.txt");
            try
            {
                Utils.WriteToFile(filepath, Utils.RemoveBreakLine(txtRightPanel.Text.Trim()));
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('Content Description is updated successfully');window.location.href='" + Request.Url.AbsoluteUri + "'</script>");
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}