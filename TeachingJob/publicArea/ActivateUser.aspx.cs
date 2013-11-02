using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace TeachingJob.publicArea
{
    public partial class ActivateUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Lets Activate the User
            //if (String.IsNullOrEmpty(Request.Params["Id"]))
            //{
            //    // We do not have the userId. Redirect some where
            //    Response.Redirect("errorpages/Error404.aspx");
            //}
            //else
            //{
                // We have a userId.
                try
                {
                    Guid userId = new Guid(Request.Params["Id"]);
                    if (userId != Guid.Empty)
                    {
                        MembershipUser user = Membership.GetUser(userId);
                        // Activate the user
                        user.IsApproved = true;
                        // Update the user activation
                        Membership.UpdateUser(user);
                        //Auto login after active
                        FormsAuthentication.SetAuthCookie(user.UserName, true);
                        FormsAuthentication.RedirectFromLoginPage(user.UserName, true);
                        
                        Response.Redirect("~/publicArea/Welcome.aspx");
                        // We success fully activate the user. Redirect somewhere
                        //Response.Redirect("~/");
                    }
                }
                catch (Exception ex)
                {
                    // Error. Redirect some where
                    //Response.Redirect("ErrorPage.aspx");
                    Label1.Text = ex.Message;
                }
            //}
            // We should never reach here. Just in case redirect some where
            //Response.Redirect("~/publicArea/Welcome.aspx", true);
        }
    }
}