<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/Masterpage/HomeIntership.Master" AutoEventWireup="true" CodeBehind="AddNewInternship.aspx.cs" Inherits="TeachingJob.Templates.Pages.AddNewInternship" %>
<%@ Register TagPrefix="tj" TagName="IntershipAds" Src="~/Templates/UserControl/IntershipAds.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
<title>Add your new internship - Teachinvietnam</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <link type="text/css" href="/Styles/intership.css" rel="Stylesheet" media="screen" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Banner" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
<div id="intershipPage">
        <div id="home-heading">
            <div class="articleWrapper">
                <div class="internshipartiletitle">
                    <div class="header">
                        <h4>
                            <asp:Label ID="aHeader" runat="server" Text="Add new Internship"></asp:Label></h4>
                    </div>
                </div>
                <div class="clear-floats">
                </div>
                <div>
                    <table cellpadding="3" border="0" class="tablePadding" id="tblIntership">
                    <tr>
                        <td><b>Article Title</b></td>
                        <td><asp:TextBox ID="txtTitle" runat="server" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" Display="None" ValidationGroup="intershipGroup" ErrorMessage="Please enter title" CssClass="validation"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td colspan="2"><b>Introduction</b><CKEditor:CKEditorControl ID="txtIntroduction" BasePath="~/Scripts/ckeditor" runat="server" Width="600px"></CKEditor:CKEditorControl><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtIntroduction" Display="None" ValidationGroup="intershipGroup" ErrorMessage="Please enter introduction" CssClass="validation"></asp:RequiredFieldValidator><br /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><b>Main Content</b><CKEditor:CKEditorControl ID="txtContent" BasePath="~/Scripts/ckeditor" runat="server" Width="600px"></CKEditor:CKEditorControl><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtContent" Display="None" ValidationGroup="intershipGroup" ErrorMessage="Please enter content"  CssClass="validation"></asp:RequiredFieldValidator><br /></td>
                    </tr>
                    <tr>
                        <td><b>Active</b></td>
                        <td><asp:CheckBox ID="cbActive" runat="server" Checked="true" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="intershipGroup" CssClass="failureNotification" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnCreate" runat="server" Text="Create &raquo;" OnClick="btnPost_Click" CssClass="standard-button orange small" ValidationGroup="intershipGroup" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="standard-button small" CausesValidation="false" />
                        </td>
                    </tr>
                </table>
                </div>
            </div>
        </div>
        <div id="home-subContent">
        <tj:IntershipAds ID="ads" runat="server" />
        </div>
        <div class="clear-floats">
        </div>
    </div>

</asp:Content>
