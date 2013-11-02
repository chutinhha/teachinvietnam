<%@ Page Title="" Language="C#" MasterPageFile="~/admintj/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="SQL.aspx.cs" Inherits="TeachingJob.admintj.SQL"
    ValidateRequest="false" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>SQL Query</title>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <div class="grid-1">
            <div class="title-grid">
              <span> SQL Query</span>
            </div>
            <div class="content-gird">
                <h4>
                    Enter Query</h4>
                <%--<CKEditor:CKEditorControl ID="txt_content_en" BasePath="~/Scripts/ckeditor"
                    runat="server"></CKEditor:CKEditorControl>--%>
                <asp:TextBox ID="txtQuery" runat="server" TextMode="MultiLine" Rows="10" Columns="80"></asp:TextBox>
                <br />

                <br />
                <div style="float: right; color: Red;">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="sendMailGroup"
                        CssClass="redColor" />
                </div>
                <br />
                <asp:Button ID="btn_submit" runat="server" Text="Execute" CssClass="standard-button orange small"
                    OnClick="btn_submit_Click" ValidationGroup="sendMailGroup" />
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Query is required"
                    ControlToValidate="txtQuery" Display="Dynamic" ValidationGroup="sendMailGroup"
                    Text="*" CssClass="redColor"></asp:RequiredFieldValidator>
            </div>
        </div>
    </div>
</asp:Content>
