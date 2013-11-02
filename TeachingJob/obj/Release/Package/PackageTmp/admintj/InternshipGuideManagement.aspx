<%@ Page Title="" Language="C#" MasterPageFile="~/admintj/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="InternshipGuideManagement.aspx.cs" Inherits="TeachingJob.admintj.InternshipGuideManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
    .gridview td{padding:10px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <div class="grid-1">
            <div class="title-grid"></div>
            <div class="content-gird">
                <h3 style="padding-bottom: 5px">
                    Administer Internship Guide Statistics</h3>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCreated="gvIntershipCreated"
                    AllowPaging="True" AllowSorting="True" PageSize="20" CssClass="gridview"
                    DataKeyNames="id" DataSourceID="SqlDataSource1" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                        <asp:BoundField DataField="firstname" HeaderText="First Name" 
                            SortExpression="firstname" />
                        <asp:BoundField DataField="lastname" HeaderText="Last Name" 
                            SortExpression="lastname" />
                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                        <asp:BoundField DataField="country" HeaderText="Country" 
                            SortExpression="country" />
                        <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone" />
                        <asp:BoundField DataField="created" HeaderText="Created" DataFormatString="{0:MMM} {0:dd}, {0:yyyy}"
                            SortExpression="created" />
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
                    SelectCommand="SELECT * FROM [tbl_Internship_Guide]"></asp:SqlDataSource>
                <div class="clear">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
