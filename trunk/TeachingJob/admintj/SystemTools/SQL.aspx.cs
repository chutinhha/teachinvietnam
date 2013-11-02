using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeachingJob.Data;
using System.Text;
using System.Globalization;
using BusinessLogic;
namespace TeachingJob.admintj
{
    public partial class SQL : System.Web.UI.Page
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        MailUtils mailUtils;
        string mark;
        BusinessFacade facade;
        protected void Page_Load(object sender, EventArgs e)
        {
            facade = new BusinessFacade(myConn);
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    string  rs = facade.SQLExecute(txtQuery.Text.Trim());
                    if (rs=="_")
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('Excute Success');</script>");
                    }
                    else {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + rs + "');</script>");
                    }
                    
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
        }
      
    }
}