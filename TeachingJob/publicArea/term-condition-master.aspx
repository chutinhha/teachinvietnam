<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="term-condition-master.aspx.cs" Inherits="TeachingJob.publicArea.term_condition_master" ValidateRequest="false" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
    <title>Edit term of use - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col span-8">
        <asp:Panel ID="Panel1" runat="server">
            <div class="module">
                <h3>
                    Enter new content</h3>
                <%--<asp:TextBox ID="txt_term" runat="server" TextMode="MultiLine" Columns="135" Rows="30"></asp:TextBox>--%>
                <CKEditor:CKEditorControl ID="txt_term" BasePath="~/Scripts/ckeditor" runat="server"></CKEditor:CKEditorControl>
                <br />
                <asp:Button ID="btn_submit" runat="server" Text="Submit" 
                    CssClass="standard-button orange small" onclick="btn_submit_Click" />
                <asp:Button ID="btn_Cancel" runat="server" Text="Cancel"  CssClass="standard-button small"
                    onclick="btn_Cancel_Click" />
            </div>
        </asp:Panel>
    </div>
</asp:Content>
