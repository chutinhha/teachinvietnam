using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Web.Profile;
using TeachingJob.admintj.model;

namespace TeachingJob.admintj
{
    public partial class User : System.Web.UI.Page
    {
        private MembershipUserCollection allRegisteredUsers = Membership.GetAllUsers();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                lblOnlineUsers.Text = Membership.GetNumberOfUsersOnline().ToString();
                lblTotalUsers.Text = allRegisteredUsers.Count.ToString();
                string[] alph = "A;B;C;D;E;F;G;J;K;L;M;N;O;P;Q;R;S;T;U;V;W;X;Y;Z;All".Split(';');
                rptAlphabetBar.DataSource = alph;
                rptAlphabetBar.DataBind();
            }
        }
        protected void rptAlphabetBar_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            gvUsers.Attributes.Add("SearchByEmail", false.ToString());
            if (e.CommandArgument.ToString().Length == 1)
            {
                gvUsers.Attributes.Add("SearchText", e.CommandArgument.ToString() + "%");
                this.BindAllUsers(false);
            }
            else
            {
                gvUsers.Attributes.Add("SearchText", "");
                this.BindAllUsers(false);
            }
        }
        private void BindAllUsers(bool reloadAllUsers,int role=0)
        {
            MembershipUserCollection allUsers = null;
            if (reloadAllUsers)
                allUsers = Membership.GetAllUsers();
            string searchText = "";
            if (!string.IsNullOrEmpty(gvUsers.Attributes["SearchText"]))
                searchText = gvUsers.Attributes["SearchText"];
            bool searchByEmail = false;
            if (!string.IsNullOrEmpty(gvUsers.Attributes["SearchByEmail"]))
                searchByEmail = bool.Parse(gvUsers.Attributes["SearchByEmail"]);
            if (searchText.Length > 0)
            {
                if (searchByEmail)
                    allUsers = Membership.FindUsersByEmail(searchText);
                else
                    allUsers = Membership.FindUsersByName(searchText);
            }
            else
            {
                allUsers = allRegisteredUsers;
            }

            List<UserModel> userList = new List<UserModel>();
            foreach (MembershipUser mu in allUsers)
            {
                UserModel user = new UserModel();
                user.Email = mu.Email;
                user.CreationDate = mu.CreationDate;
                user.LastActivityDate = mu.LastActivityDate;
                user.IsApproved = mu.IsApproved;

                ProfileBase profile = ProfileBase.Create(mu.UserName);
                if (Roles.IsUserInRole(mu.UserName, "Organization"))
                {
                    user.UserName = profile.GetPropertyValue("Employer.FirstName").ToString() + " " + profile.GetPropertyValue("Employer.LastName").ToString();
                    user.Phone = profile.GetPropertyValue("Employer.Phone").ToString();
                    user.Role = "Organization";
                }
                else if (Roles.IsUserInRole(mu.UserName, "Employee"))
                {
                    user.UserName = profile.GetPropertyValue("Employee.FirstName").ToString() + " " + profile.GetPropertyValue("Employee.LastName").ToString();
                    user.Phone = profile.GetPropertyValue("Employee.Phone").ToString();
                    user.Role = "Employee";
                }
                else
                {
                    user.UserName = mu.UserName;
                    user.Phone = "N/A";
                    user.Role = "N/A";
                }
                userList.Add(user);
            }
            if (role == 0) {gvUsers.DataSource = userList; }
            else if (role == 1) { gvUsers.DataSource = userList.Where(x => x.Role == "Organization"); }
            else if (role == 2) { gvUsers.DataSource = userList.Where(x => x.Role == "Employee"); }
            
            
            gvUsers.DataBind();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            bool searchByEmail = (ddlUserSearchTypes.SelectedValue == "E-mail");
            gvUsers.Attributes.Add("SearchText", "%" + txtSearchText.Text + "%");
            gvUsers.Attributes.Add("SearchByEmail", searchByEmail.ToString());
            BindAllUsers(false);
        }
        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string userName = gvUsers.DataKeys[e.RowIndex].Value.ToString();
                Membership.DeleteUser(userName);
                ProfileManager.DeleteProfile(userName);
                lbl_Stt.Text = "Delete \"" + userName + "\" successfully!";
                BindAllUsers(true);
                lblTotalUsers.Text = allRegisteredUsers.Count.ToString();
            }
            catch (Exception)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('Fail to delete user. Please disable user by setting off the approve value.');</script>");
                lbl_Stt.Text = "Fail to delete user. Please disable user by setting off the approve value.";
            }
        }
        protected void gvUsers_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton btn = e.Row.Cells[8].Controls[0] as ImageButton;

                btn.OnClientClick = "if (confirm('Are you sure you want to delete this user?') == false) return false;";
                e.Row.Attributes.Add("onmouseover", "this.setAttribute('bgColor', this.style.backgroundColor); this.style.backgroundColor = '#C2D69B';");
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor = this.getAttribute('bgColor');");
            }
        }

        protected void ddl_UsersInRole_IndexChanged(object sender, EventArgs e)
        {
            if (ddl_UsersInRole.SelectedValue == "1")
            {
                BindAllUsers(false, 1);
            }
            else if (ddl_UsersInRole.SelectedValue == "2")
            {
                BindAllUsers(false, 2);
            }
            else
            {
                BindAllUsers(false);
            }
        }
    }
}