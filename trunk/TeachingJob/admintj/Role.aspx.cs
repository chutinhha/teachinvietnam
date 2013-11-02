using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace TeachingJob.admintj
{
    public partial class Role : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindingRole();
            }
        }
        private void BindingRole()
        {
            string[] roleList = Roles.GetAllRoles();
            if (roleList != null)
            {
                GridView1.DataSource = roleList;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (txt_pwd.Text == "QuyenNguyen@")
            {
                TextBox tb = GridView1.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox;
                string newRole = tb.Text;
                string oldRole = Session["oldRole"].ToString();
                string[] usersInRole = Roles.GetUsersInRole(oldRole);

                try
                {
                    if (!Roles.RoleExists(newRole))
                    {
                        Roles.CreateRole(newRole);
                        if (usersInRole.Length > 0)
                        {
                            Roles.AddUsersToRole(usersInRole, newRole);
                            Roles.RemoveUsersFromRole(usersInRole, oldRole);
                        }
                        Roles.DeleteRole(oldRole);
                        lblStatus.Text = "Role is successfully updated!";
                    }
                    else
                    {
                        lblStatus.Text = "Role is existed";
                    }
                }
                catch (Exception)
                {
                    lblStatus.Text = "Update fails";
                }
                GridView1.EditIndex = -1;
                BindingRole();
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            if (txt_pwd.Text == "QuyenNguyen@")
            {
                Session["oldRole"] = GridView1.Rows[e.NewEditIndex].Cells[1].Text;
                GridView1.EditIndex = e.NewEditIndex;
                BindingRole();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (txt_pwd.Text == "QuyenNguyen@")
            {
                string oldRole = GridView1.Rows[e.RowIndex].Cells[1].Text;
                try
                {
                    string[] userinrole = Roles.GetUsersInRole(oldRole);
                    if (userinrole.Length > 0)
                    {
                        Roles.RemoveUsersFromRole(userinrole, oldRole);
                        Roles.DeleteRole(oldRole);
                        lblStatus.Text = "Role has been removed!!";
                    }
                }
                catch (Exception)
                {
                    lblStatus.Text = "Removing fails";
                }
                BindingRole();
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindingRole();
        }

        protected void btn_AddRole_Click(object sender, EventArgs e)
        {
            if (txt_pwd.Text == "QuyenNguyen@")
            {
                if (txtRoleName.Text != "")
                {
                    string newRole = txtRoleName.Text;
                    try
                    {
                        if (!Roles.RoleExists(newRole))
                        {
                            Roles.CreateRole(newRole);
                            lblStatus.Text = "A new role, named " + newRole + " has been created successfully!";

                        }
                        else
                        {
                            lblStatus.Text = "This role is existed!";
                        }
                        BindingRole();
                    }
                    catch (Exception)
                    {
                        lblStatus.Text = "Adding fails!";
                    }
                }
                else
                {
                    lblStatus.Text = "Please write down a role name!";
                }
            }
        }

    }
}