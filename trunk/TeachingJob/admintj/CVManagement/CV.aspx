<%@ Page Title="" Language="C#" MasterPageFile="~/admintj/AdminSite.Master" AutoEventWireup="true" CodeBehind="CV.aspx.cs" Inherits="TeachingJob.admintj.CVManagement.CV" %>
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
                CV Management</span></div>
            <div class="content-gird">
                <input type="hidden" name="datenow" value="18/10/2012" />
                <asp:GridView ID="gv_CV" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                    CellPadding="3" Width="95%" BackColor="White" BorderColor="#CCCCCC" OnRowCreated="gv_RowCreated"
                    BorderStyle="None" BorderWidth="1px" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                            <a target="_blank" href='/admintj/SendingEmail.aspx?mailto=<%#Eval("username") %>'><%#Eval("username") %></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Fullname" HeaderText="Fullname" ReadOnly="True" 
                            SortExpression="Fullname" />
                        <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" 
                            ReadOnly="True" SortExpression="CreateDate" />
                        <asp:BoundField DataField="lastupdated" HeaderText="lastupdated" ReadOnly="True" 
                            SortExpression="lastupdated" />
                        <asp:BoundField DataField="active" HeaderText="active" ReadOnly="True" 
                            SortExpression="active" />
                    </Columns>                    
                    <FooterStyle BackColor="White" ForeColor="#000066" CssClass="gv_padding" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" CssClass="gv_padding" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" CssClass="gv_padding" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                    SelectCommand="proc_GetAllCV" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
