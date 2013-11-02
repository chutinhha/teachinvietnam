using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace TeachingJob.Employer
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hpl_RegisterAsEmployer.NavigateUrl = "RegisterAsEmployer.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);

            //Make login button become default button in the page ---Cool
            Button btn_Login = LoginUser.FindControl("LoginButton") as Button;
            Form.DefaultButton = btn_Login.UniqueID;
            if (!IsPostBack)
            {
                FormsAuthentication.SignOut();
                Session.Abandon();
            }
            if (Request.Params["error"] == "authen")
            {
                Literal literal = (Literal)LoginUser.FindControl("FailureText");
                literal.Text = "Your account do not have the authorization to access this page.";
            }
        }
        protected void OnLoggedIn_Click(object sender, EventArgs e)
        {
            string user = LoginUser.UserName;
            string[] role =  Roles.GetRolesForUser(user);
            if (role.Contains("Organization"))
            {
                Response.Redirect("~/Employer/EmployerSite.aspx?r=e");
            }
            else
            {
                FormsAuthentication.SignOut();
                Response.Redirect("Login.aspx?error=authen");
            }
        }
    }
}