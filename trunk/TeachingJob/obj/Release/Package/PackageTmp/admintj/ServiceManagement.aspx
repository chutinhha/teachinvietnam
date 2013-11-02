<%@ Page Title="" Language="C#" MasterPageFile="~/admintj/AdminSite.Master" AutoEventWireup="true" CodeBehind="ServiceManagement.aspx.cs" Inherits="TeachingJob.admintj.ServiceManagement" %>
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
               <span> Services</span></div>
            <div class="content-gird">
                <h3  style="padding-bottom:5px">Administer Services Articles</h3>
                <asp:GridView ID="gv_Intership" runat="server" CssClass="gridview"
                    AllowPaging="True" PageSize="20" AllowSorting="True" 
                    AutoGenerateColumns="False" OnRowCreated="gvRowCreated"
                    CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="id" 
                    DataSourceID="SqlDataSource1">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="parentId" HeaderText="Parent ID" 
                            SortExpression="parentId" />
                        <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                        <asp:BoundField DataField="maincontent" HeaderText="Main Content" Visible="false"
                            SortExpression="maincontent" />
                        <asp:BoundField DataField="createdDate" HeaderText="Created Date" DataFormatString="{0:MMM} {0:dd}, {0:yyyy}"
                            SortExpression="createdDate" />
                        <asp:CheckBoxField DataField="displayOnMenu" HeaderText="DisplayOnMenu" 
                            SortExpression="displayOnMenu" />
                        <asp:BoundField DataField="displayOrder" HeaderText="DisplayOrder" 
                            SortExpression="displayOrder" />
                        <asp:CheckBoxField DataField="active" HeaderText="Active" 
                            SortExpression="active" />
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
                    ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="EXEC proc_service_article_delete @id" 
                    SelectCommand="SELECT * FROM [tbl_service_article]">
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
                <asp:Button ID="btnGetInternshipById" runat="server" Text="Get" OnClick="btnGetArticleById_Click" CssClass="standard-button orange small" ValidationGroup="EditGroup" /></div>
                <table cellpadding="3" border="0" class="tablePadding" id="tblIntership" style="display:none">
                    <tr>
                        <td><b>Article Title</b></td>
                        <td><asp:TextBox ID="txtTitle" runat="server" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" Display="Dynamic" ValidationGroup="intershipGroup" ErrorMessage="Please enter title" CssClass="validation"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td><b>Category</b></td>
                        <td>
                            <asp:DropDownList ID="ddlParentCategory" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <b>Main Content</b><CKEditor:CKEditorControl ID="txtContent" BasePath="~/Scripts/ckeditor" runat="server" Width="710px"></CKEditor:CKEditorControl>
                            <div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtContent" Display="Dynamic" ValidationGroup="intershipGroup" ErrorMessage="Please enter content"  CssClass="validation"></asp:RequiredFieldValidator><br />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Display On Menu</b></td>
                        <td><asp:CheckBox ID="cbDisplayOnMenu" runat="server" Checked="true" /></td>
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
