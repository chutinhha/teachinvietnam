using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic.Facade;

namespace TeachingJob.admintj
{
    public partial class FeatureLogo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.DefaultButton = btnGetFeatureLogoById.UniqueID;
            if (!IsPostBack)
            {
                txtOrgName.Visible = false;
                txtLogo.Visible = false;
                cbActive.Visible = false;
            }
        }
        protected void gvRowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton lbtn = (ImageButton)e.Row.Cells[6].Controls[0];
                lbtn.OnClientClick = "if (confirm('Are you sure?') == false) return false;";
                e.Row.Attributes.Add("onmouseover", "this.setAttribute('bgColor', this.style.backgroundColor); this.style.backgroundColor = '#C2D69B';");
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor = this.getAttribute('bgColor');");
            }
        }
        protected void btnGetFeatureLogoById_Click(object sender, EventArgs e)
        {
            int id;
            if (int.TryParse(txtEditId.Text.Trim(), out id))
            {
                FeaturedLogo myFeaturedLogo = FeaturedLogo.GetFeatureLogoById(id);
                txtOrgName.Text = myFeaturedLogo.OrgName;
                cbActive.Checked = myFeaturedLogo.Active;
                txtUserName.Text = myFeaturedLogo.Username;
                txtDisplayOrder.Text = myFeaturedLogo.SortOrder.ToString();
                txtLogo.Text = myFeaturedLogo.Logo;
                
                Page.ClientScript.RegisterStartupScript(this.GetType(), "PopopScript", "<script>document.getElementById('tblIntership').style.display = 'inline';</script>");

                txtOrgName.ReadOnly = true;
                txtUserName.ReadOnly = true;
                txtLogo.ReadOnly = true;

                btnPost.Visible = false;
                btnPost.CausesValidation = false;
                btnUpdate.Visible = true;
                btnUpdate.CausesValidation = true;

                txtOrgName.Visible = true;
                txtLogo.Visible = true;
                cbActive.Visible = true;

            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "", "<script>alert('Please enter edit ID as a number');</script>");
            }
        }
        protected void btnPost_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    int order = Convert.ToInt32(txtDisplayOrder.Text.Trim());
                    if (string.IsNullOrEmpty(order.ToString()))
                    {
                        order = 10;
                    }
                    FeaturedLogo.InsertNewLogo(txtUserName.Text.Trim(), order);
                    gvFeaturedLogo.DataBind();
                    Page.ClientScript.RegisterClientScriptBlock(GetType(), "", "<script>alert('Post new success');</script>");
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "", "<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                int order = Convert.ToInt32(txtDisplayOrder.Text.Trim());
                if (string.IsNullOrEmpty(order.ToString()))
                {
                    order = 10;
                }
                FeaturedLogo.UpdateLogo(Convert.ToInt32(txtEditId.Text.Trim()), order, cbActive.Checked);
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('Update success!');</script>");
                gvFeaturedLogo.DataBind();
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "", "<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}