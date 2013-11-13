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
    public partial class module_vietnamese_training : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string filepath = Server.MapPath("~/UserData/template/vietnamese-training.txt");
                if (!IsPostBack)
                {
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
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            StreamWriter writer = null;
            try
            {
                string filePath = Server.MapPath("~/UserData/template/vietnamese-training.txt");
                if (File.Exists(filePath))
                {
                    File.Delete(filePath);
                }
                writer = new StreamWriter(filePath, false);
                writer.Write(Utils.RemoveBreakLine(txtRightPanel.Text.Trim()));
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('Saved successfully');window.location.href='" + Request.Url.AbsoluteUri + "'</script>");
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                if (writer != null)
                {
                    writer.Close();
                    writer.Dispose();
                }
            }
        }
        
    }
}