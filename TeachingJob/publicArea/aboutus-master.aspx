<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="aboutus-master.aspx.cs" Inherits="TeachingJob.publicArea.aboutus_master" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
<title>Edit About us - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<div class="col span-8">
        <asp:Panel ID="Panel1" runat="server">
            <div class="module">
                <h3>
                    Enter new content</h3>
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
