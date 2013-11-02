<%@ Page Title="" Language="C#" MasterPageFile="~/admintj/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="Jobs.aspx.cs" Inherits="TeachingJob.admintj.JobManagement.Jobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Jobs administration</title>
    <style type="text/css">
        .gv_padding
        {
            height:30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <div class="grid-1">
            <div class="title-grid">
            <span>
                Job Management
                </span>
                </div>
            <div class="content-gird">
                <input type="hidden" name="datenow" value="18/10/2012" />
                <asp:GridView ID="gv_Job" runat="server" AllowPaging="True" PageSize="20" AllowSorting="True" AutoGenerateColumns="False"
                    CellPadding="3" DataSourceID="SqlDataSource1" OnRowCreated="gv_OnCreated"
                    Width="100%" DataKeyNames="jId"  CssClass="table table-bordered">
                    <Columns>
                        <asp:BoundField DataField="jId" HeaderText="ID"  SortExpression="jId" InsertVisible="False"
                            ReadOnly="True" />
                        <asp:BoundField DataField="jTitle_en" HeaderText="Title" 
                            SortExpression="jTitle_en" />
                            <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                            <a target="_blank" href='/admintj/SendingEmail.aspx?mailto=<%#Eval("jEmailToApplication") %>'><%#Eval("jEmailToApplication")%></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="jContact" HeaderText="Contact" 
                            SortExpression="jContact" />
                        <asp:BoundField DataField="jUploadDate" HeaderText="Uploaded Date" 
                            SortExpression="jUploadDate" />
                        <asp:BoundField DataField="jClosingDate" HeaderText="Closing Date" SortExpression="jClosingDate"></asp:BoundField>
                        <asp:CheckBoxField DataField="jActive" HeaderText="Active" 
                            SortExpression="jActive" />
                        <asp:CommandField HeaderText="Action" ButtonType="Link" ShowEditButton="True" ShowHeader="True" 
                            ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" CssClass="gv_padding" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" CssClass="gv_padding" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" HorizontalAlign="Center" CssClass="gv_padding" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                      
                    SelectCommand="SELECT [jId], [jTitle_en], [jUploadDate], [jClosingDate], [jActive],[jEmailToApplication],[jContact] FROM [tbl_TeachingJob] ORDER BY [jUploadDate] DESC, [jClosingDate] DESC" 
                    UpdateCommand="UPDATE [tbl_TeachingJob] SET [jTitle_en] = @jTitle_en, [jClosingDate] = @jClosingDate, [jActive] = @jActive WHERE [jId] = @original_jId" 
                    ConflictDetection="CompareAllValues" 
                    DeleteCommand="DELETE FROM [tbl_TeachingJob] WHERE [jId] = @original_jId" 
                    InsertCommand="INSERT INTO [tbl_TeachingJob] ([jTitle_en], [jUploadDate], [jClosingDate], [jActive]) VALUES (@jTitle_en, @jUploadDate, @jClosingDate, @jActive)" 
                    OldValuesParameterFormatString="original_{0}">
                    <DeleteParameters>
                        <asp:Parameter Name="original_jId" Type="Int32" />
                        <asp:Parameter Name="original_jTitle_en" Type="String" />
                        <asp:Parameter Name="original_jUploadDate" Type="DateTime" />
                        <asp:Parameter Name="original_jClosingDate" Type="DateTime" />
                        <asp:Parameter Name="original_jActive" Type="Boolean" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="jTitle_en" Type="String" />
                        <asp:Parameter Name="jUploadDate" Type="DateTime" />
                        <asp:Parameter Name="jClosingDate" Type="DateTime" />
                        <asp:Parameter Name="jActive" Type="Boolean" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="jTitle_en" Type="String" />
                        <asp:Parameter Name="jUploadDate" Type="DateTime" />
                        <asp:Parameter Name="jClosingDate" Type="DateTime" />
                        <asp:Parameter Name="jActive" Type="Boolean" />
                        <asp:Parameter Name="original_jId" Type="Int32" />
                        <asp:Parameter Name="original_jTitle_en" Type="String" />
                        <asp:Parameter Name="original_jUploadDate" Type="DateTime" />
                        <asp:Parameter Name="original_jClosingDate" Type="DateTime" />
                        <asp:Parameter Name="original_jActive" Type="Boolean" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
