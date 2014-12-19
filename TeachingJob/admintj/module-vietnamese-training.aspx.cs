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
                string filepath_VietnameseTraining = Server.MapPath("~/UserData/template/vietnamese-training.txt");
                string filepath_ProvideWorkPermitForForeignerLaborersWorkingInVietnam = Server.MapPath("~/UserData/template/provide-work-permit-for-foreigner-laborers-working-in-vietnam.txt");
                string filepath_TranslationAndInterpretationService = Server.MapPath("~/UserData/template/translation-and-interpretation-service.txt");
                string filepath_VisaService = Server.MapPath("~/UserData/template/visa-service.txt");

                if (!IsPostBack)
                {
                    StreamReader sr = null;
                    try
                    {
                        if (File.Exists(filepath_TranslationAndInterpretationService))
                        {
                            sr = new StreamReader(filepath_TranslationAndInterpretationService);
                            txtTranslationAndInterpretationService.Text = HttpUtility.HtmlDecode(sr.ReadToEnd().ToString());
                        }

                        if (File.Exists(filepath_VisaService))
                        {
                            //sr = null;
                            sr = new StreamReader(filepath_VisaService);
                            txtVisaService.Text = HttpUtility.HtmlDecode(sr.ReadToEnd().ToString());
                        }

                        if (File.Exists(filepath_ProvideWorkPermitForForeignerLaborersWorkingInVietnam))
                        {
                            sr = new StreamReader(filepath_ProvideWorkPermitForForeignerLaborersWorkingInVietnam);
                            txtProvideWorkPermitForForeignerLaborersWorkingInVietnam.Text = HttpUtility.HtmlDecode(sr.ReadToEnd().ToString());
                        }

                        if (File.Exists(filepath_VietnameseTraining))
                        {
                            sr = new StreamReader(filepath_VietnameseTraining);
                            txtVietnameseTraining.Text = HttpUtility.HtmlDecode(sr.ReadToEnd().ToString());
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
        protected void btnVietnameseTrainingSubmit_Click(object sender, EventArgs e)
        {
            //StreamWriter writer = null;
            //try
            //{
            //    string filePath = Server.MapPath("~/UserData/template/vietnamese-training.txt");
            //    if (File.Exists(filePath))
            //    {
            //        File.Delete(filePath);
            //    }
            //    writer = new StreamWriter(filePath, false);
            //    writer.Write(Utils.RemoveBreakLine(txtVietnameseTraining.Text.Trim()));
            //    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('Saved successfully');window.location.href='" + Request.Url.AbsoluteUri + "'</script>");
            //}
            //catch (Exception ex)
            //{
            //    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopopScript", "<script>alert('" + ex.Message + "');</script>");
            //}
            //finally
            //{
            //    if (writer != null)
            //    {
            //        writer.Close();
            //        writer.Dispose();
            //    }
            //}
            WriteToFile(Server.MapPath("~/UserData/template/vietnamese-training.txt"), txtVietnameseTraining.Text.Trim());
        }

        protected void btnTranslationAndInterpretationServiceSubmit_Click(object sender, EventArgs e)
        {
            WriteToFile(Server.MapPath("~/UserData/template/translation-and-interpretation-service.txt"), txtTranslationAndInterpretationService.Text.Trim());
        }

        protected void btnVisaServiceSubmit_Click(object sender, EventArgs e)
        {
            WriteToFile(Server.MapPath("~/UserData/template/visa-service.txt"), txtVisaService.Text.Trim());
        }

        protected void btnProvideWorkPermitForForeignerLaborersWorkingInVietnamSubmit_Click(object sender, EventArgs e)
        {
            WriteToFile(Server.MapPath("~/UserData/template/provide-work-permit-for-foreigner-laborers-working-in-vietnam.txt"), txtProvideWorkPermitForForeignerLaborersWorkingInVietnam.Text.Trim());
        }

        private void WriteToFile(string filepath, string txtEditorValue)
        {
            StreamWriter writer = null;
            try
            {
                string filePath = filepath;// Server.MapPath("~/UserData/template/vietnamese-training.txt");
                if (File.Exists(filePath))
                {
                    File.Delete(filePath);
                }
                writer = new StreamWriter(filePath, false);
                writer.Write(Utils.RemoveBreakLine(txtEditorValue));
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