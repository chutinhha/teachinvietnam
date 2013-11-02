using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace TeachingJob.Templates.Masterpage
{
    public partial class HomeIntership : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Roles.IsUserInRole("admin") || Roles.IsUserInRole("superadmin"))
                {
                    hpl_adminsite.Visible = true;
                    hpl_adminsite.Text = "Back end";
                    hpl_adminsite.NavigateUrl = "~/admintj/User.aspx";
                    hpl_TeacherTraining.Visible = true;
                    hpl_List.Visible = true;
                }
            }
        }
        protected void RegisterEmployer_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Account/RegisterAsEmployer.aspx");
        }
        protected void RegisterEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Account/Register.aspx");
        }
        protected void LoggedOutAction(object sender, EventArgs e)
        {
            if (Session["currentUserRole"] != null)
            {
                Session["currentUserRole"] = "";
            }
        }
        protected void LoginView_OnPreRender(object sender, EventArgs e)
        {
            try
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    Label lbl_Username = (Label)HeadLoginView.FindControl("lbl_Username");
                    MembershipUser mu = Membership.GetUser();
                    if (HttpContext.Current.User.IsInRole("Organization"))
                    {
                        lbl_Username.Text = Context.Profile.GetPropertyValue("Employer.FirstName").ToString() + " " + Context.Profile.GetPropertyValue("Employer.LastName").ToString();
                    }
                    else
                    {
                        lbl_Username.Text = Context.Profile.GetPropertyValue("Employee.FirstName").ToString() + " " + Context.Profile.GetPropertyValue("Employee.LastName").ToString();
                    }

                }
            }
            catch (Exception)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('Login fails. Please try again.');</script>");
            }
        }
        protected void EmployerSite_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["currentUserRole"] != null)
                {
                    Session["currentUserRole"] = "";
                }

                if (HttpContext.Current.User.IsInRole("Employee"))
                {
                    MembershipUser mu = Membership.GetUser();
                    Session.Add("jobseeker_username", mu.UserName);
                }
                FormsAuthentication.SignOut();

                if (Session["employer_username"] != null)
                {
                    FormsAuthentication.SetAuthCookie(Session["employer_username"].ToString(), true);
                    FormsAuthentication.RedirectFromLoginPage(Session["employer_username"].ToString(), true);
                }
                Response.Redirect("~/Employer/EmployerSite.aspx?r=e");
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void CandidateSite_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["currentUserRole"] != null)
                {
                    Session["currentUserRole"] = "";
                }

                if (HttpContext.Current.User.IsInRole("Organization"))
                {
                    MembershipUser mu = Membership.GetUser();
                    Session.Add("employer_username", mu.UserName);
                }

                FormsAuthentication.SignOut();
                if (Session["jobseeker_username"] != null)
                {
                    FormsAuthentication.SetAuthCookie(Session["jobseeker_username"].ToString(), true);
                    FormsAuthentication.RedirectFromLoginPage(Session["jobseeker_username"].ToString(), true);
                }
                Response.Redirect("~/");
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}