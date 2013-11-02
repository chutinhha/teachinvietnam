using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;

namespace TeachingJob.publicArea
{
    public partial class term_condition_master : System.Web.UI.Page
    {
        string filepath;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.IsInRole("admin") || !User.IsInRole("superadmin"))
            {
                Response.Redirect("errorpages/Error403.aspx");
            }
            filepath = Server.MapPath("~/UserData/template/TermAndCondition.txt");
            if (!IsPostBack)
            {
                StreamReader sr = null;
                try
                {
                    if (File.Exists(filepath))
                    {
                        sr = new StreamReader(filepath);
                        txt_term.Text = HttpUtility.HtmlDecode(sr.ReadToEnd().ToString());
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

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            StreamWriter sw = null;
            try
            {
                if (File.Exists(filepath))
                {
                    File.Delete(filepath);
                }
                sw = new StreamWriter(filepath, false);
                sw.Write(txt_term.Text.Trim()); // Write the file.
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "PopupScript", "<script>alert('Change succeeded!');window.location.href='terms-conditions.aspx';</script>");
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                if (sw != null)
                {
                    //sw.Flush();
                    sw.Close(); // Close the instance of StreamWriter.
                    sw.Dispose(); // Dispose from memory.      
                }
            }
        }

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("terms-conditions.aspx");
        }
    }
}