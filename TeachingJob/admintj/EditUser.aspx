<%@ Page Title="" Language="C#" MasterPageFile="~/admintj/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="EditUser.aspx.cs" Inherits="TeachingJob.admintj.EditUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <div class="grid-1">
            <div class="title-grid">
                Edit user</div>
            <div>
                <h4>General user information</h4></div>
            <p>
            </p>
            <table class="gridview" border="1">
                <tr>
                    <td width="130">
                        <b>UserName:</b>
                    </td>
                    <td width="300">
                        <asp:Literal runat="server" ID="lblUserName" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>E-mail address:</b>
                    </td>
                    <td>
                        <asp:HyperLink ID="lnkEmailAddress" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Registered:</b>
                    </td>
                    <td>
                        <asp:Literal ID="lblRegistered" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Last Login:</b>
                    </td>
                    <td>
                        <asp:Literal ID="lblLastLogin" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Last Activity:</b>
                    </td>
                    <td>
                        <asp:Literal ID="lblLastActivity" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Online Now:</b>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkIsOnlineNow" Enabled="false" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Approved:</b>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkIsApproved" AutoPostBack="true" OnCheckedChanged="chkIsApproved_CheckedChanged"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Locked Out:</b>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkIsLockedOut" AutoPostBack="true" OnCheckedChanged="chkIsLockedOut_CheckedChanged"
                            runat="server" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="lbl_Stt" runat="server" Text="" CssClass="redColor"></asp:Label>
            <hr />
            <div>
                <h4>User's roles</h4></div>
            <p>
            </p>
            <asp:CheckBoxList runat="server" ID="chklRoles" RepeatColumns="3" CellSpacing="10" />
            <table cellpadding="2" width="450">
                <tr>
                    <td align="right">
                        <asp:Label runat="server" ID="lblRolesOK" CssClass="redColor" Text="Roles were successfully updated"
                            Visible="false" />
                        <asp:Button ID="btnUpdate" Text="Update" OnClick="btnUpdate_Click" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <small>Create new role: </small>
                        <asp:TextBox ID="txtNewRole" runat="server" />
                        <asp:RequiredFieldValidator ID="validatorRequireRole" ControlToValidate="txtNewRole"
                            SetFocusOnError="true" ErrorMessage="Role name is required." ValidationGroup="CreateRole"
                            runat="server">
                        </asp:RequiredFieldValidator>
                        <asp:Button runat="server" ID="btnCreate" Text="Create" ValidationGroup="CreateRole"
                            OnClick="btnCreate_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
