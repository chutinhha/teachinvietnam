using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeachingJob.Data;
using System.IO;
using System.Data;

namespace TeachingJob.admintj
{
    public partial class ImageUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dataTable = new DataTable();
                dataTable.Columns.Add("Name", typeof(string));
                dataTable.Columns.Add("Extension", typeof(string));
                dataTable.Columns.Add("CreationDate", typeof(DateTime));
                dataTable.Columns.Add("Size (KB)", typeof(int));

                string[] filesPath = Directory.GetFiles(Server.MapPath(General.ADMIN_IMAGE_UPLOAD), "*.*", SearchOption.AllDirectories);
                foreach (string path in filesPath)
                {
                    FileInfo fileInfor = new FileInfo(path);
                    dataTable.Rows.Add(fileInfor.FullName, fileInfor.Extension, fileInfor.CreationTime, General.GetFileSizeByKB((int)fileInfor.Length));
                }

                gvUploadFile.DataSource = dataTable;
                gvUploadFile.DataBind();

            }
        }
        protected void gvUploadFile_OnDataBound(Object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Text = !string.IsNullOrEmpty(e.Row.Cells[0].Text) ? string.Format("<a href='{0}' runat='server' target='_blank'>{1}</a>", Utils.GetVirtualPath(e.Row.Cells[0].Text), TrimSlash(e.Row.Cells[0].Text)) : string.Empty;
                e.Row.Cells[1].Text = !string.IsNullOrEmpty(e.Row.Cells[1].Text) ? "<i>" + e.Row.Cells[1].Text + "</i>" : string.Empty;
                e.Row.Cells[2].Text = e.Row.Cells[2] != null ? (Convert.ToDateTime(e.Row.Cells[2].Text)).ToString("dd MMM yyyy") : string.Empty;
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            fileUploadName(fileupload, lblStatus);
        }
        protected String fileUploadName(FileUpload fileupload, Label label)
        {
            try
            {
                if (fileupload.HasFile)
                {

                    if (fileupload.PostedFile.ContentLength < General.IMAGE_SIZE)
                    {
                        string fileUploadDir = Server.MapPath(General.ADMIN_IMAGE_UPLOAD);
                        if (!System.IO.Directory.Exists(fileUploadDir))
                        {
                            System.IO.Directory.CreateDirectory(fileUploadDir);
                        }
                        fileupload.SaveAs(fileUploadDir + fileupload.PostedFile.FileName);

                        label.Text = "File (<b>" + fileupload.FileName + "</b>) is saved!";
                        return fileupload.FileName;
                    }
                    else
                    {
                        label.Text = "Error: File upload has to be less than " + General.GetImageSize(General.IMAGE_SIZE) + "mbs !";
                        return null;
                    }

                }
                else
                {
                    label.Text = "Error: You have not specified a file!";
                    return null;
                }
            }
            catch (Exception ex)
            {
                label.Text = "Error: " + ex.Message.ToString();
                return null;
            }
        }
        private string TrimSlash(string value)
        {
            return value.Substring(value.LastIndexOf('\\')+1);
        }
    }
}