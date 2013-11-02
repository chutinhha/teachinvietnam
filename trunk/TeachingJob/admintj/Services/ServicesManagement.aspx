<%@ Page Title="" Language="C#" MasterPageFile="~/admintj/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="ServicesManagement.aspx.cs" Inherits="TeachingJob.admintj.ServicesManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Services administration</title>
    <style type="text/css">
        .standard-button
        {
            text-align: center;
            border: 0;
            font-size: 1.6em;
            font-family: Calibri;
            line-height: 20px;
            padding: 5px 13px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            color: #222 !important;
            font-weight: bold;
            text-decoration: none;
            display: inline-block;
            border: 1px solid #aaa;
            border: 0px solid #ccc;
        }
        .standard-button::-moz-focus-inner
        {
            border: 0;
            padding: 0;
            margin: 0;
        }
        .standard-button:hover
        {
            background-image: none;
            background-color: #bbb;
            cursor: pointer;
        }
        
        .clearbtn
        {
            background-image: none;
            background-color: #bbb;
            cursor: pointer;
        }
        
        .standard-button.dark, .standard-button.contrast, .standard-button.green, .standard-button.orange, .standard-button.blue
        {
            color: #fff !important;
            text-decoration: none;
            -webkit-text-shadow: none;
            -moz-text-shadow: none;
            text-shadow: none;
        }
        
        .standard-button.blue
        {
            background: #2898D0;
            background: -moz-linear-gradient(top,#2898D0 0%,#2898D0 50%,#2898D0 51%,#2898D0 100%);
            background: -webkit-gradient(linear,left top,left bottom,color-stop(0%,#2898D0),color-stop(50%,#2898D0),color-stop(51%,#2898D0),color-stop(100%,#2898D0));
            background: linear-gradient(top,#2898D0 0%,#2898D0 50%,#2898D0 51%,#2898D0 100%); /* W3C */
            border: 1px solid #2898D0;
            -moz-box-shadow: 0 1px 0 0 #2898D0 inset;
            -webkit-box-shadow: 0 1px 0 0 #2898D0 inset;
            box-shadow: 0 1px 0 0 #2898D0 inset;
        }
        .standard-button.blue:hover
        {
            background-image: none;
            background-color: #2290C8;
            cursor: pointer;
        }
        .standard-button.orange
        {
            background: #ff820b;
        }
        .orangeButton
        {
            background: #ff810a;
        }
        .standard-button.orange:hover
        {
            background-image: none;
            background-color: #3eb365;
            cursor: pointer;
        }
        
        .standard-button.large
        {
            font-size: 1.8em;
            padding: 10px 30px;
        }
        .standard-button.small
        {
            font-size: 14px;
            padding: 4px 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <div class="grid-1">
            <div class="title-grid">
                Services Management
                <div style="float: right">
                    <asp:Button ID="btn_submit" runat="server" Text="Add New" CssClass="standard-button orange small"
                        OnClick="btn_submit_Click" />
                </div>
            </div>
            <div class="content-gird">
                <asp:GridView ID="gv_Services" runat="server" AllowPaging="True" PageSize="20" AllowSorting="True"
                    AutoGenerateColumns="False" CellPadding="3" Width="95%" DataKeyNames="ID" BackColor="White"
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:BoundField DataField="Name" ItemStyle-HorizontalAlign="Left" HeaderText="Name" ReadOnly="True"  ItemStyle-Width="40%" />
                        <asp:TemplateField HeaderText="Action" ItemStyle-Width="20%">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="cmdEdit" CommandArgument='<%#Eval("Id") %>' CommandName="cmdEdit">Edit</asp:LinkButton> &nbsp;&nbsp; &nbsp;&nbsp;
                                <asp:LinkButton runat="server" ID="cmdDelete" CommandArgument='<%#Eval("Id") %>' CommandName="cmdDelete">Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" CssClass="gv_padding" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" CssClass="gv_padding" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" HorizontalAlign="Center" CssClass="gv_padding" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
