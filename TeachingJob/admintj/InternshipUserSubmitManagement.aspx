<%@ Page Title="" Language="C#" MasterPageFile="~/admintj/AdminSite.Master" AutoEventWireup="true" CodeBehind="InternshipUserSubmitManagement.aspx.cs" Inherits="TeachingJob.admintj.InternshipUserSubmitManagement" %>
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
            <div class="title-grid"></div>
            <div class="content-gird">
                <h3 style="padding-bottom: 5px">
                    Administer Internship User Submission</h3>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCreated="gvIntershipCreated"
                    AllowPaging="True" AllowSorting="True" PageSize="20" CssClass="gridview"
                    DataKeyNames="id" DataSourceID="SqlDataSource1" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" Width="125%" >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                            ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                        <asp:BoundField DataField="firstname" HeaderText="firstname" 
                            SortExpression="firstname" />
                        <asp:BoundField DataField="lastname" HeaderText="lastname" 
                            SortExpression="lastname" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="country" HeaderText="country" 
                            SortExpression="country" />
                        <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                        <asp:BoundField DataField="whenshouldwecall" HeaderText="whenshouldwecall" 
                            SortExpression="whenshouldwecall" />
                        <asp:BoundField DataField="created" HeaderText="created" 
                            SortExpression="created" DataFormatString="{0:dd MMM yyyy}" />
                        <asp:TemplateField HeaderText="CV">
                            <ItemTemplate>
                                <a target="_blank" href='<%#Eval("cvPath") %>'>
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/icons/CRUD/read.png" />
                                </a>
                            </ItemTemplate>
                        </asp:TemplateField>
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
                    ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                    SelectCommand="SELECT * FROM [tbl_Internship_UserSubmit] ORDER BY created DESC"></asp:SqlDataSource>
                <div class="clear">
                </div>
                <hr />
                <div class="marginbot">
                    <h4><span onclick="displayEditRightPanel()" style="text-decoration: underline; cursor:pointer">Edit Page Description</span></h4>
                </div>
                <table cellpadding="3" border="0" class="tablePadding" id="tblRightPanel" style="display:none">
                    <tr>
                        <td colspan="2"><b>Internship User Submission Page Description</b><CKEditor:CKEditorControl ID="txtRightPanel" BasePath="~/Scripts/ckeditor" runat="server"></CKEditor:CKEditorControl>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtRightPanel" Display="Dynamic" ValidationGroup="rightPanelGroup" ErrorMessage="Please enter introduction" CssClass="validation"></asp:RequiredFieldValidator><br /></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnUpdate" runat="server" Text="Save" OnClick="btnUpdate_Click" CssClass="standard-button orange small" ValidationGroup="rightPanelGroup" />
                        </td>
                    </tr>
                </table>
                <div class="clear">
                </div>
            </div>
        </div>
    </div>
       <script type="text/javascript">
           function displayEditRightPanel() {
               if (document.getElementById('tblRightPanel').style.display == 'none') {
                   document.getElementById('tblRightPanel').style.display = 'inline';
               } else if (document.getElementById('tblRightPanel').style.display == 'inline') {
                   document.getElementById('tblRightPanel').style.display = 'none';
               }
           }
    </script>
</asp:Content>
