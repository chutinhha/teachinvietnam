<%@ Page Title="" Language="C#" MasterPageFile="~/admintj/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="Role.aspx.cs" Inherits="TeachingJob.admintj.Role" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <div class="grid-1">
            <div class="title-grid">
               <span> Role</span></div>
            <div class="content-gird">
                <p>
                    <asp:TextBox ID="txt_pwd" runat="server" TextMode="Password"></asp:TextBox>
                </p>
                <br />
                <asp:GridView ID="GridView1" runat="server" OnRowUpdating="GridView1_RowUpdating"
                    OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" CssClass="gridview"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
                <div class="clear">
                </div>
                <div class="marginbot">
                    <br />
                    Add new role:
                    <asp:TextBox ID="txtRoleName" runat="server"></asp:TextBox>
                    <asp:Button ID="btn_AddRole" runat="server" Text="Add" OnClick="btn_AddRole_Click" />
                    <asp:Label ID="lblStatus" runat="server" Text="" CssClass="redColor"></asp:Label>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
    </div>
    <!-- END MAIN-->
</asp:Content>
