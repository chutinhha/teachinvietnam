using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic.Facade;
using TeachingJob.Data;

namespace TeachingJob.admintj
{
    public partial class ServiceManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.DefaultButton = btnGetInternshipById.UniqueID;
            if (!IsPostBack)
            {
                BindingParentId();
            }
        }
        private void BindingParentId()
        {
            ddlParentCategory.Items.Clear();
            ddlParentCategory.Items.Insert(0, new ListItem("Root", "0" ));
            var articleList = ServiceArticle.GetAllIdAndTitle();
            foreach (var data in articleList)
            {
                string text = data.Value;
                if (data.Key != 0 && ServiceArticle.hasParentNotRoot(data.Key))
                {
                    text = "Root --> ... --> " + data.Value;
                }
                else if (data.Key != 0)
                {
                    text = "Root --> " + data.Value;
                }
                ddlParentCategory.Items.Add(new ListItem(text, data.Key.ToString()));
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
                    ServiceArticle.InsertNewArticle(Convert.ToInt32(ddlParentCategory.SelectedValue), txtTitle.Text.Trim(), Utils.RemoveBreakLine(txtContent.Text.Trim()), cbDisplayOnMenu.Checked, order, cbActive.Checked);
                    gv_Intership.DataBind();
                    Page.ClientScript.RegisterClientScriptBlock(GetType(), "", "<script>alert('Post new success');</script>");
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "", "<script>alert('"+ex.Message+"');</script>");
            }
        }
        protected void btnGetArticleById_Click(object sender, EventArgs e)
        {
            int id;
            if (int.TryParse(txtEditId.Text.Trim(), out id))
            {
                ServiceArticle sa = ServiceArticle.GetArticleById(id);
                txtTitle.Text = sa.Title;
                cbActive.Checked = sa.Active;
                txtContent.Text = sa.MainContent;
                cbDisplayOnMenu.Checked = sa.DisplayOnMenu;
                txtDisplayOrder.Text = sa.DisplayOrder.ToString();
                ListItem categoryItem = ddlParentCategory.Items.FindByValue(sa.ParentId.ToString());
                if (categoryItem != null)
                {
                    categoryItem.Selected = true;
                }

                Page.ClientScript.RegisterStartupScript(this.GetType(), "PopopScript", "<script>document.getElementById('tblIntership').style.display = 'inline';</script>");
                btnPost.Visible = false;
                btnPost.CausesValidation = false;
                btnUpdate.Visible = true;
                btnUpdate.CausesValidation = true;
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "", "<script>alert('Please enter edit ID as a number');</script>");
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
                BusinessLogic.Facade.ServiceArticle.UpdateArticle(Convert.ToInt32(txtEditId.Text.Trim()), Convert.ToInt32(ddlParentCategory.SelectedValue), txtTitle.Text.Trim(), Utils.RemoveBreakLine(txtContent.Text.Trim()), cbDisplayOnMenu.Checked, order, cbActive.Checked);
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('Update success!');</script>");
                gv_Intership.DataBind();
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "", "<script>alert('"+ex.Message+"');</script>");
            }
        }
        protected void gvRowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton lbtn = (ImageButton)e.Row.Cells[8].Controls[0];
                lbtn.OnClientClick = "if (confirm('Are you sure?') == false) return false;";
                e.Row.Attributes.Add("onmouseover", "this.setAttribute('bgColor', this.style.backgroundColor); this.style.backgroundColor = '#C2D69B';");
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor = this.getAttribute('bgColor');");
            }
        }
    }
}