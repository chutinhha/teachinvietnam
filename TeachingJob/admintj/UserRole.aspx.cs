using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace TeachingJob.admintj
{
    public partial class RoleManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRoles();
            }
            btn_SendMail.Text = "Send mail to all " + ddl_RoleList.SelectedItem.Text;
        }
        private void BindRoles()
        {
            string[] roleList = Roles.GetAllRoles();
            ddl_RoleList.DataSource = roleList;
            ddl_RoleList.DataBind();
            string roleName = ddl_RoleList.Items[0].ToString();
            BindGvUser(roleName);
        }

        private void BindGvUser(string roleName)
        {
            string[] userList = Roles.GetUsersInRole(roleName);
            gv_UsersInRoles.DataSource = userList;
            gv_UsersInRoles.DataBind();
        }

        protected void ddl_RoleList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string roleName = ddl_RoleList.SelectedValue.ToString();
            BindGvUser(roleName);
        }

        protected void btn_ChangeRole_Click(object sender, EventArgs e)
        {
            string role = ddl_RoleList.SelectedValue.ToString();
            string username = txt_Username.Text;
            MembershipUser mu = Membership.GetUser(username);

            if (mu != null)
            {
                string[] userInRole = Roles.FindUsersInRole(role, username);
                if (userInRole.Length == 0)
                {
                    Roles.AddUserToRole(username, role);
                    lblStatus.Text = "Adding user in role successfully!!";
                }
                else
                {
                    lblStatus.Text = "This user is already in this role!";
                }
            }
            else
            {
                lblStatus.Text = "User is not existed!";
            }
            BindGvUser(role);
        }

        protected void gv_UsersInRoles_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string rolename = ddl_RoleList.SelectedValue.ToString();
            string username = gv_UsersInRoles.Rows[e.RowIndex].Cells[1].Text;
            Roles.RemoveUserFromRole(username, rolename);
            lblStatus.Text = "The user: " + username + " has successfully remove from the role: " + rolename;
            BindGvUser(rolename);
        }

        protected void btn_SendMail_Click(object sender, EventArgs e)
        {
            Response.Redirect("/admintj/SendingEmail.aspx?t=" + ddl_RoleList.SelectedValue);
        }
        
    }
}