using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic.Facade;
using System.Data;
using System.Collections;
namespace TeachingJob.admintj
{
    public partial class ServicesEdit : System.Web.UI.Page
    {

        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        #region "Function"
        /// <summary>
        /// Load danh sách dịch vụ cha
        /// </summary>
        private void BindParentServices()
        {
           
            Services ctl = new Services(myConn);
            ArrayList arr = new ArrayList();
            DataTable root = ctl.GetByParent(0);
            foreach (DataRow r in root.Rows)
            {
                BusinessLogic.ServicesInfo obj = new BusinessLogic.ServicesInfo();
                obj.ID = int.Parse(r["ID"].ToString());
                obj.ParentId = int.Parse(r["ParentId"].ToString());
                obj.Name = r["Name"].ToString();
                obj.Image = r["Image"].ToString();
                obj.ParentName = r["ParentName"].ToString();
                obj.CONTENT = r["CONTENT"].ToString();
                arr.Add(obj);
                DeQuy(ref arr, obj.ID,"+-");
            }
            ddlServiceParent.DataSource = arr;
            ddlServiceParent.DataBind();
            ddlServiceParent.Items.Insert(0, new ListItem("-----", "0"));
        }


        private void DeQuy(ref ArrayList arr, int ParentId,string strAdd)
        {
            Services ctl = new Services(myConn);
            DataTable root = ctl.GetByParent(ParentId);
            foreach (DataRow r in root.Rows)
            {

                BusinessLogic.ServicesInfo obj = new BusinessLogic.ServicesInfo();
                obj.ID = int.Parse(r["ID"].ToString());
                obj.ParentId = int.Parse(r["ParentId"].ToString());
                obj.Name = strAdd + r["Name"].ToString();
                obj.Image = r["Image"].ToString();
                obj.ParentName = r["ParentName"].ToString();
                obj.CONTENT = r["CONTENT"].ToString();
                arr.Add(obj);
                DeQuy(ref arr, obj.ID, strAdd + "+-");
            }
        }

        #endregion
        #region "Events"
        /// <summary>
        /// Page_load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindParentServices();
            }
        }

        /// <summary>
        /// Event Addnew
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_submit_Click(object sender, EventArgs e)
        {
            Services ctl = new Services(myConn);
            if (Request.QueryString["Id"]!=null)
            {
                ctl.Add(int.Parse(ddlServiceParent.SelectedValue), txt_name.Text, txt_content.Value, "", 1, 1);
            }
            else
            {
                ctl.Add(int.Parse(ddlServiceParent.SelectedValue), txt_name.Text, txt_content.Value, "", 1, 1);
            }
            
            Response.Redirect("/admintj/Services/ServicesManagement.aspx");
        }
        #endregion
        
    }
}