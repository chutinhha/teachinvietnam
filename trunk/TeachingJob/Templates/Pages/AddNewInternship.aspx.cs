using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeachingJob.Data;

namespace TeachingJob.Templates.Pages
{
    public partial class AddNewInternship : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnPost_Click(object sender, EventArgs e)
        {
            try
            {
                BusinessLogic.Facade.Intership.Intership.Insert(txtTitle.Text.Trim(), Utils.RemoveBreakLine(txtIntroduction.Text.Trim()), Utils.RemoveBreakLine(txtContent.Text.Trim()), cbActive.Checked, cbEnableFreeGuide.Checked, cbEnableApplyOnline.Checked);
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('Your article is posted successfully');window.location.href='/Intership.aspx'</script>");
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Intership.aspx");
        }
    }
}