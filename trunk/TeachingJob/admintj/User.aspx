<%@ Page Title="" Language="C#" MasterPageFile="~/admintj/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="User.aspx.cs" Inherits="TeachingJob.admintj.User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        
        <div class="grid-1">
            <div class="title-grid">
            <span>    User Management</span></div>
            <div class="content-gird">
                <div>
                    Users Account Management</div>
                <p>
                </p>
                <b>- The total registered users is:
                    <asp:Literal runat="server" ID="lblTotalUsers" /><br />
                    - The total online users at this moment:
                    <asp:Literal runat="server" ID="lblOnlineUsers" /></b>
                <p>
                </p>
                In order to display all users whose name begins with letter click on the link letter:
                <p>
                </p>
                <asp:Repeater runat="server" ID="rptAlphabetBar" OnItemCommand="rptAlphabetBar_ItemCommand">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Container.DataItem %>'
                            CommandArgument='<%# Container.DataItem %>' />&nbsp;&nbsp;
                    </ItemTemplate>
                </asp:Repeater>
                <p>
                </p>
                Use the below feature to search users by partial username or e-mail:
                <p>
                </p>
                <asp:DropDownList runat="server" ID="ddlUserSearchTypes">
                    <asp:ListItem Text="UserName" Selected="true" />
                    <asp:ListItem Text="E-mail" />
                </asp:DropDownList>
                contains
                <asp:TextBox runat="server" ID="txtSearchText" />
                <asp:Button runat="server" ID="btnSearch" Text="Search" OnClick="btnSearch_Click" /> 
                by
                <asp:DropDownList ID="ddl_UsersInRole" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_UsersInRole_IndexChanged">
                    <asp:ListItem Value="0" Selected="True" Text="All"></asp:ListItem>
                    <asp:ListItem Value="1" Text="Organization"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Employee"></asp:ListItem>
                </asp:DropDownList>
                <div>
                    <asp:Label ID="lbl_Stt" runat="server" CssClass="redColor" Text=""></asp:Label>
                </div>
                <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="false" DataKeyNames="Email"
                    OnRowCreated="gvUsers_RowCreated" OnRowDeleting="gvUsers_RowDeleting" Width="100%" CssClass="gridview" >
                    <Columns>
                        <asp:BoundField HeaderText="UserName" DataField="UserName" />
                        <asp:HyperLinkField HeaderText="E-mail" DataTextField="Email" DataNavigateUrlFormatString="mailto:{0}"
                            DataNavigateUrlFields="Email" />
                        <asp:BoundField HeaderText="Phone" DataField="Phone" />
                        <asp:BoundField HeaderText="Created" DataField="CreationDate" DataFormatString="{0:MMM} {0:dd}, {0:yyyy}" />
                        <asp:BoundField HeaderText="Last activity" DataField="LastActivityDate" DataFormatString="{0:MMM} {0:dd}, {0:yyyy}" />
                        <asp:BoundField HeaderText="Role" DataField="Role" />
                        <asp:CheckBoxField HeaderText="Approved" DataField="IsApproved" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Center" />
                        <asp:HyperLinkField Text="<img src='../images/icons/CRUD/update.png' border='0' title='Edit' />"
                            DataNavigateUrlFormatString="EditUser.aspx?UserName={0}" DataNavigateUrlFields="Email" />
                        <asp:ButtonField CommandName="Delete" ButtonType="Image" ImageUrl="~/images/icons/CRUD/delete.png" />
                    </Columns>
                    <EmptyDataTemplate>
                        No users found.</EmptyDataTemplate>
                </asp:GridView>
                <div class="clear">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
