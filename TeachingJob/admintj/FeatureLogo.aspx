<%@ Page Title="" Language="C#" MasterPageFile="~/admintj/AdminSite.Master" AutoEventWireup="true" CodeBehind="FeatureLogo.aspx.cs" Inherits="TeachingJob.admintj.FeatureLogo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title>Services Management</title>
<style type="text/css">
    .gridview td{padding:10px;}
    .tablePadding{padding:5px}
    .tablePadding tr td{padding:5px}
    .standard-button{ text-align:center;  border:0; color:#fff; font-size:1.6em;  font-family:Calibri;  line-height:20px;  padding:5px 13px;  -webkit-border-radius:5px;  -moz-border-radius:5px;  border-radius:5px;   font-weight:bold;  text-decoration:none;  display:inline-block;  border:1px solid #aaa;  border:0px solid #ccc}
    .standard-button.orange{ background:#ff820b}
    .standard-button.orange:hover{ background-image:none;  background-color:#3eb365;  cursor:pointer}
    .standard-button.large{ font-size:1.8em;  padding:10px 30px}
    .standard-button.small{ font-size:14px;  padding:4px 15px}
    .validation{color:Red}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="main">
        <div class="grid-1">
            <div class="title-grid">
               <span>Feature Logo</span></div>
            <div class="content-gird">
                <h3 style="padding-bottom:5px">Administer Feature Logo</h3>
                    <asp:GridView ID="gvFeaturedLogo" runat="server" CssClass="gridview"
                    AllowPaging="True" PageSize="20" AllowSorting="True" 
                    AutoGenerateColumns="False" OnRowCreated="gvRowCreated"
                    CellPadding="4" ForeColor="#333333" GridLines="None"
                    DataKeyNames="id" DataSourceID="SqlDataSource1">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                                ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="OrganizationName" HeaderText="OrganizationName" 
                                SortExpression="OrganizationName" />
                            <asp:BoundField DataField="logo" HeaderText="logo" SortExpression="logo" />
                            <asp:BoundField DataField="username" HeaderText="username" 
                                SortExpression="username" />
                            <asp:CheckBoxField DataField="active" HeaderText="active" 
                                SortExpression="active" />
                            <asp:BoundField DataField="SortOrder" HeaderText="SortOrder" 
                                SortExpression="SortOrder" />
                            <asp:ButtonField HeaderText="Action" CommandName="Delete" ButtonType="Image" ImageUrl="~/images/icons/CRUD/delete.png" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="EXEC proc_feature_logo_delete @id" 
                    SelectCommand="SELECT * FROM [tbl_feature_logo]">
                    <DeleteParameters>
                        <asp:Parameter Type="Int32" Name="id" />
                    </DeleteParameters>        
                </asp:SqlDataSource>
                <div class="clear">
                </div>
                <hr />
                <div class="marginbot">
                    <h4><span onclick="displayNewPost()" style="text-decoration: underline; cursor:pointer">Add/Update Service Articles</span></h4>
                </div>
                <div style="float:right">
                Enter ID to edit: 
                <asp:TextBox ID="txtEditId" runat="server" Width="50px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEditId" Display="Dynamic" ValidationGroup="EditGroup" ErrorMessage="*" CssClass="validation"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  Display="Dynamic" ValidationGroup="EditGroup"
                    ControlToValidate="txtEditId" ErrorMessage="only Number is acceptable"  CssClass="validation"
                    ValidationExpression="^[1-9]\d*$"></asp:RegularExpressionValidator>
                <asp:Button ID="btnGetFeatureLogoById" runat="server" Text="Get" CssClass="standard-button orange small" OnClick="btnGetFeatureLogoById_Click" ValidationGroup="EditGroup" /></div>
                <table cellpadding="3" border="0" class="tablePadding" id="tblIntership" style="display:none">
                    <tr>
                        <td><b>Organization Name</b></td>
                        <td><asp:TextBox ID="txtOrgName" runat="server" Width="200px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><b>Logo</b></td>
                        <td><asp:TextBox ID="txtLogo" runat="server" Width="200px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><b>Username</b></td>
                        <td><asp:TextBox ID="txtUserName" runat="server" Width="200px"></asp:TextBox>
                        <div><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" Display="Dynamic" ValidationGroup="intershipGroup" ErrorMessage="Please enter username that register the organization"  CssClass="validation"></asp:RequiredFieldValidator></div></td>
                    </tr>
                    <tr>
                        <td><b>Display Order</b></td>
                        <td><asp:TextBox ID="txtDisplayOrder" runat="server" Width="50px"></asp:TextBox> <i>Default vaulue is 10</i>
                            <div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDisplayOrder" Display="Dynamic" ValidationGroup="intershipGroup" ErrorMessage="Please enter content"  CssClass="validation"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  Display="Dynamic" ValidationGroup="intershipGroup"
                                    ControlToValidate="txtDisplayOrder" ErrorMessage="only Number is acceptable"  CssClass="validation"
                                    ValidationExpression="^[1-9]\d*$"></asp:RegularExpressionValidator></div>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Active</b></td>
                        <td><asp:CheckBox ID="cbActive" runat="server" Checked="true" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnPost" runat="server" Text="Post" OnClick="btnPost_Click" CssClass="standard-button orange small" ValidationGroup="intershipGroup" />
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CssClass="standard-button orange small" ValidationGroup="intershipGroup" Visible="false" CausesValidation="false" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClientClick="ClearContent()" CssClass="standard-button orange small" CausesValidation="false" />
                        </td>
                    </tr>
                </table>
                <div class="clear">
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function displayNewPost() {
            if (document.getElementById('tblIntership').style.display == 'none') {
                document.getElementById('tblIntership').style.display = 'inline';
            } else if (document.getElementById('tblIntership').style.display == 'inline') {
                document.getElementById('tblIntership').style.display = 'none';
            }
        }
    </script>
</asp:Content>
