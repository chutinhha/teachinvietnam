<%@ Page Title="" Language="C#" MasterPageFile="~/admintj/AdminSite.Master" AutoEventWireup="true" CodeBehind="IntershipManagement.aspx.cs" Inherits="TeachingJob.admintj.IntershipManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            <div>
               <span> Intership</span></div>
            <div class="content-gird">
                <div style="text-align:right">
                    Set default internship on HomePage: 
                    <asp:TextBox ID="txtAppSettingsInternshipId" runat="server" Width="50px"></asp:TextBox>
                    <asp:Button ID="btnAppSettingsInternship" runat="server" CssClass="standard-button orange small" Text="Save" OnClick="btnAppSettingsInternship_Click" />
                </div>
                <h3  style="padding-bottom:5px">Administer Intership Articles</h3>
                <asp:GridView ID="gv_Intership" runat="server" CssClass="gridview"
                    AllowPaging="True" PageSize="20" AllowSorting="True" AutoGenerateColumns="False" OnRowCreated="gvIntershipCreated"
                    DataKeyNames="id" DataSourceID="SqlDataSource_GetAllIntership" 
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="articleName" HeaderText="Article Name" 
                            SortExpression="articleName" />
                        <asp:BoundField DataField="articleIntroduction" 
                            HeaderText="Introduction" SortExpression="articleIntroduction" Visible="false" />
                        <asp:BoundField DataField="articleContent" HeaderText="Content" Visible="false" 
                            SortExpression="articleContent" />
                        <asp:BoundField DataField="createdDate" HeaderText="Created Date" DataFormatString="{0:MMM} {0:dd}, {0:yyyy}"
                            SortExpression="createdDate" />
                        <asp:CheckBoxField DataField="active" HeaderText="active" HeaderStyle-HorizontalAlign="Center" 
                            ItemStyle-HorizontalAlign="Center" SortExpression="active" />
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
                <asp:SqlDataSource ID="SqlDataSource_GetAllIntership" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="EXEC proc_deleteAIntershipArticle @id" 
                    SelectCommand="proc_getAllIntership" SelectCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Type="Int32" Name="id" />
                    </DeleteParameters>
                </asp:SqlDataSource>
                <div class="clear">
                </div>
                <hr />
                <div class="marginbot">
                    <h4><span onclick="displayNewPost()" style="text-decoration: underline; cursor:pointer">Add/Update Intership</span></h4>
                </div>
                <div style="float:right">
                Enter ID to edit: 
                <asp:TextBox ID="txtInternshipId" runat="server" Width="50px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtInternshipId" Display="Dynamic" ValidationGroup="EditGroup" ErrorMessage="*" CssClass="validation"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  Display="Dynamic" ValidationGroup="EditGroup"
                    ControlToValidate="txtInternshipId" ErrorMessage="only Number is acceptable"  CssClass="validation"
                    ValidationExpression="^[1-9]\d*$"></asp:RegularExpressionValidator>
                <asp:Button ID="btnGetInternshipById" runat="server" Text="Get" OnClick="btnGetInternshipById_Click" CssClass="standard-button orange small" ValidationGroup="EditGroup" /></div>
                <table cellpadding="3" border="0" class="tablePadding" id="tblIntership" style="display:none">
                    <tr>
                        <td><b>Article Title</b></td>
                        <td><asp:TextBox ID="txtTitle" runat="server" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" Display="Dynamic" ValidationGroup="intershipGroup" ErrorMessage="Please enter title" CssClass="validation"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td colspan="2"><b>Introduction</b><CKEditor:CKEditorControl ID="txtIntroduction" BasePath="~/Scripts/ckeditor" runat="server" Width="710px"></CKEditor:CKEditorControl><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtIntroduction" Display="Dynamic" ValidationGroup="intershipGroup" ErrorMessage="Please enter introduction" CssClass="validation"></asp:RequiredFieldValidator><br /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><b>Main Content</b><CKEditor:CKEditorControl ID="txtContent" BasePath="~/Scripts/ckeditor" runat="server" Width="710px"></CKEditor:CKEditorControl><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtContent" Display="Dynamic" ValidationGroup="intershipGroup" ErrorMessage="Please enter content"  CssClass="validation"></asp:RequiredFieldValidator><br /></td>
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
                <hr />
                <div class="marginbot">
                    <h4><span onclick="displayEditRightPanel()" style="text-decoration: underline; cursor:pointer">Edit right panel</span></h4>
                </div>
                <table cellpadding="3" border="0" class="tablePadding" id="tblRightPanel" style="display:none">
                    <tr>
                        <td colspan="2"><b>Internship Right Panel</b><CKEditor:CKEditorControl ID="txtRightPanel" BasePath="~/Scripts/ckeditor" runat="server"></CKEditor:CKEditorControl>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtRightPanel" Display="Dynamic" ValidationGroup="rightPanelGroup" ErrorMessage="Please enter introduction" CssClass="validation"></asp:RequiredFieldValidator><br /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnRightPanel" runat="server" Text="Save" OnClick="btnRightPanel_Click" CssClass="standard-button orange small" ValidationGroup="rightPanelGroup" />
                        </td>
                    </tr>
                </table>
                <div class="clear">
                </div>
            </div>
        </div>
    </div>
   <script type="text/javascript">
//       function ClearContent() {
//           document.getElementById('<%=txtTitle.ClientID %>').value = "";
//           document.getElementById('<%=txtIntroduction.ClientID %>').value = "";
//           document.getElementById('<%=txtContent.ClientID %>').value = "";
//           alert('Clear!');
//           //            $("#<%=txtTitle.ClientID %>").val() = "";
//           //            $("#<%=txtIntroduction.ClientID %>").val() = "";
//           //            $("#<%=txtContent.ClientID %>").val() = "";
//       }
       function displayNewPost() {
           if (document.getElementById('tblIntership').style.display == 'none') {
               document.getElementById('tblIntership').style.display = 'inline';
           } else if (document.getElementById('tblIntership').style.display == 'inline') {
               document.getElementById('tblIntership').style.display = 'none';
           }
       }
       function displayEditRightPanel() {
           if (document.getElementById('tblRightPanel').style.display == 'none') {
               document.getElementById('tblRightPanel').style.display = 'inline';
           } else if (document.getElementById('tblRightPanel').style.display == 'inline') {
               document.getElementById('tblRightPanel').style.display = 'none';
           }
       }
       
    </script>
</asp:Content>
