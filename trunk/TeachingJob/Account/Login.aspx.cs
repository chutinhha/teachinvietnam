using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Security;
using TeachingJob.Data;
using System.Reflection;
using System.Resources;

namespace TeachingJob.Account
{
    public partial class Login : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);

            //Make login button become default button in the page ---Cool
            Button btn_Login = LoginUser.FindControl("LoginButton") as Button;
            Page.Form.DefaultButton = btn_Login.UniqueID;

            WebControl control = LoginUser.FindControl("UserName") as WebControl;
            if (control != null) { Page.Form.DefaultFocus = control.ClientID; }
            string ReturnUrl="";
            if (Request.Params["ReturnUrl"] != null)
            {
                ReturnUrl = HttpUtility.UrlDecode(Request.Params["ReturnUrl"]);
                if (Request.Params["ReturnUrl"] != "/Employer/EmployerSite.aspx?r=e" )
                {
                    Literal literal = (Literal)LoginUser.FindControl("FailureText");
                    literal.Text = "Please login.";
                }
                if (Request.Params["authen"] == "false")
                {
                    Literal literal = (Literal)LoginUser.FindControl("FailureText");
                    literal.Text = "Sorry, you do not have authorization to do this. Please login.";
                }
            }
            if (Request.Params["r"] == "e" || ReturnUrl.StartsWith("/publicArea/CV/Detail.aspx"))
            {
                Assembly ass = Assembly.Load("App_GlobalResources");
                ResourceManager rm = new ResourceManager("Resources.Resource", ass);

                lbl_ModuleTitle.Text = rm.GetString("EmployerLogintxt");

                RegisterHyperLink.Visible = false;
                hpl_RegisterAsEmployer.Visible = true;

                Panel pn_benefit_emp = (Panel)LoginUser.FindControl("pn_benefit_emp");
                Panel pn_benefit_candidate = (Panel)LoginUser.FindControl("pn_benefit_candidate");
                pn_benefit_candidate.Visible = false;
                pn_benefit_emp.Visible = true;
            }
            else if (Session["currentUserRole"] != null && Session["currentUserRole"].ToString() == "organization")
            {
                Assembly ass = Assembly.Load("App_GlobalResources");
                ResourceManager rm = new ResourceManager("Resources.Resource", ass);

                lbl_ModuleTitle.Text = rm.GetString("EmployerLogintxt");

                RegisterHyperLink.Visible = false;
                hpl_RegisterAsEmployer.Visible = true;

                Panel pn_benefit_emp = (Panel)LoginUser.FindControl("pn_benefit_emp");
                Panel pn_benefit_candidate = (Panel)LoginUser.FindControl("pn_benefit_candidate");
                pn_benefit_candidate.Visible = false;
                pn_benefit_emp.Visible = true;
            }
        }
        //protected void OnLoggedIn_Click(object sender, EventArgs e)
        //{
        //    string user = LoginUser.UserName;
        //    string[] role = Roles.GetRolesForUser(user);
        //    if (role.Contains("Employee"))
        //    {
        //        Response.Redirect("~/Account/my-jobs.aspx");
        //    }
        //    else if (role.Contains("Organization"))
        //    {
        //        Response.Redirect("~/Employer/EmployerSite.aspx?r=e");
        //    }
        //    else
        //    {
        //        FormsAuthentication.SignOut();
        //        Response.Redirect("Login.aspx?error=authen");
        //    }

        //}
    }
}
