using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using TeachingJob.Data;
using System.Xml;

namespace TeachingJob.admintj
{
    public partial class IntershipManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string filepath = Server.MapPath("~/UserData/template/Internship_RightPanel.txt");
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
                txtAppSettingsInternshipId.Text = System.Configuration.ConfigurationManager.AppSettings["DefaultInternshipId"].ToString();
            }
            //gv_Intership.DataSource = BusinessLogic.Facade.Intership.Intership.GetAll();
            //gv_Intership.DataBind();
        }
        protected void btnAppSettingsInternship_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("~/web.config");
            XmlDocument xDoc = new XmlDocument();
            xDoc.Load(path);
            XmlNodeList nodeList = xDoc.GetElementsByTagName("appSettings");
            XmlNodeList nodeAppSettings = nodeList[0].ChildNodes;
            XmlAttributeCollection xmlAttCollection = nodeAppSettings[3].Attributes;
            //xmlAttCollection[0].InnerXml = "DefaultInternshipId"; // for key attribute
            xmlAttCollection[1].InnerXml = txtAppSettingsInternshipId.Text; // for value attribute
            xDoc.Save(path); // saves the web.config file

            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('Success!');</script>");
        }
        protected void gvIntershipCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton lbtn = (ImageButton)e.Row.Cells[6].Controls[0];
                lbtn.OnClientClick = "if (confirm('Are you sure?') == false) return false;";
                e.Row.Attributes.Add("onmouseover", "this.setAttribute('bgColor', this.style.backgroundColor); this.style.backgroundColor = '#C2D69B';");
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor = this.getAttribute('bgColor');");
            }
        }
        //protected void gv_Intership_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    try
        //    {
        //        string id = gv_Intership.DataKeys[e.RowIndex].Value.ToString();
        //        BusinessLogic.Facade.Intership.Intership.DeleteAIntershipArticle(Convert.ToInt32(id));
        //    }
        //    catch (Exception ex)
        //    {
        //        Page.ClientScript.RegisterClientScriptBlock(GetType(), "", "<script>alert('"+ex.Message+"');</script>");
        //    }
        //}
        protected void btnPost_Click(object sender, EventArgs e)
        {
            try
            {
                BusinessLogic.Facade.Intership.Intership.Insert(txtTitle.Text.Trim(), Utils.RemoveBreakLine(txtIntroduction.Text.Trim()), Utils.RemoveBreakLine(txtContent.Text.Trim()), cbActive.Checked);
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('Your article is posted successfully');window.location.href='" + Request.Url.AbsoluteUri + "'</script>");
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void btnGetInternshipById_Click(object sender, EventArgs e)
        {
            BusinessLogic.Facade.Intership.Intership internship = BusinessLogic.Facade.Intership.Intership.getIntershipById(Convert.ToInt32(txtInternshipId.Text.Trim()),true);
            if (internship != null)
            {
                txtTitle.Text = internship.ArticleName;
                txtIntroduction.Text = internship.ArticleIntroduction;
                txtContent.Text = internship.ArticleContent;
                cbActive.Checked = internship.Active;

                Page.ClientScript.RegisterStartupScript(this.GetType(), "PopopScript", "<script>document.getElementById('tblIntership').style.display = 'inline';</script>");
                btnPost.Visible = false;
                btnPost.CausesValidation = false;
                btnUpdate.Visible = true;
                btnUpdate.CausesValidation = true;
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('There is no internship with ID: "+txtInternshipId.Text.Trim()+"');</script>");
            }
            
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            BusinessLogic.Facade.Intership.Intership.UpdateIntership(Convert.ToInt32(txtInternshipId.Text), txtTitle.Text.Trim(), Utils.RemoveBreakLine(txtIntroduction.Text.Trim()), Utils.RemoveBreakLine(txtContent.Text.Trim()), cbActive.Checked);
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('Update success!');</script>");
            gv_Intership.DataBind();
        }
        protected void btnRightPanel_Click(object sender, EventArgs e)
        {
            StreamWriter writer = null;
            try
            {
                string filePath = Server.MapPath("~/UserData/template/Internship_RightPanel.txt");
                if (File.Exists(filePath))
                {
                    File.Delete(filePath);
                }
                writer = new StreamWriter(filePath, false);
                writer.Write(Utils.RemoveBreakLine(txtRightPanel.Text.Trim()));
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('Content Right Panel is posted successfully');window.location.href='" + Request.Url.AbsoluteUri + "'</script>");
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
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtContent.Text = string.Empty;
            txtIntroduction.Text = string.Empty;
            txtTitle.Text = string.Empty;
        }
    }
}