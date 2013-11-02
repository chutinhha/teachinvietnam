<%@ Page Title="" Language="C#" MasterPageFile="~/admintj/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="UserRole.aspx.cs" Inherits="TeachingJob.admintj.RoleManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <div class="grid-1">
            <div class="title-grid">
               <span> Users in Role</span></div>
            <div class="content-gird">
                <p>
                    If you want to add user a new role,
                    <ul class="padding5">
                        <li>please select a role you want to add in the drop down list</li>
                        <li>enter username to the text box</li>
                    </ul>
                    .Then click the button.
                </p>
                <br />
                <asp:DropDownList ID="ddl_RoleList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_RoleList_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:TextBox ID="txt_Username" runat="server"></asp:TextBox>
                <asp:Button ID="btn_ChangeRole" runat="server" Text="Add role" OnClick="btn_ChangeRole_Click" />
                <asp:Label ID="lblStatus" runat="server" CssClass="redColor" Text=""></asp:Label>
                                <asp:Button ID="btn_SendMail" runat="server" Text="" 
                    onclick="btn_SendMail_Click" />
                
                <br />
                <br />
                <asp:GridView ID="gv_UsersInRoles" runat="server" CssClass="gridview" OnRowDeleting="gv_UsersInRoles_RowDeleting">
                    <Columns>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbl_delete" runat="server" CommandName="Delete" OnClientClick="return Confirm('Are you sure?');">Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <div class="clear">
                </div>
            </div>
        </div>
        <!--Statistic end-->
    </div>
    <!-- END MAIN-->
</asp:Content>
