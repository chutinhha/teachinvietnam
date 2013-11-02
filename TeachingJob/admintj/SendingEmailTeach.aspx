<%@ Page Title="" Language="C#" MasterPageFile="~/admintj/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="SendingEmailTeach.aspx.cs" Inherits="TeachingJob.admintj.SendingEmailTeach"
    ValidateRequest="false" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Sending mail Teacher </title>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <div class="grid-1">
            <div class="title-grid">
               <span>Send an Email to Teacher </span>
                <div style="float: right;background-color:White">
                    <asp:DropDownList ID="ddl_body" runat="server" AutoPostBack="true">
                        <asp:ListItem Text="Body only" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Body with quote" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddl_lang" runat="server" AutoPostBack="true">
                        <asp:ListItem Text="One language" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Two languages" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                    
                </div>
            </div>
            <div class="content-gird">
                <table>
                    <tr>
                        <td>
                            To: &nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="txt_mailto" Width="400px" runat="server" Text=""></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            CC: &nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="txt_cc" Width="400px" runat="server" Text=""></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            BCC: &nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="txt_bcc" Width="400px" runat="server" Text=""></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Subject:&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="txt_subject" Width="400px" runat="server" Text="Subject"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <h4>
                    Content 1</h4>
                <%--<CKEditor:CKEditorControl ID="txt_content_en" BasePath="~/Scripts/ckeditor"
                    runat="server"></CKEditor:CKEditorControl>--%>
                <%--<asp:TextBox ID="txt_content_en" runat="server" TextMode="MultiLine" Rows="10" Columns="80"></asp:TextBox>--%>
                <FCKeditorV2:FCKeditor ID="txt_content_en" runat="server" BasePath="/" FullPage="true">
                    </FCKeditorV2:FCKeditor>
                <br />
                <asp:Panel ID="panel_quote_en" Visible="false" runat="server">
                    <h4>
                        Quote 1</h4>
                    <%--<CKEditor:CKEditorControl ID="txt_quote_en" BasePath="~/Scripts/ckeditor"
                        runat="server"></CKEditor:CKEditorControl>--%>
                    <asp:TextBox ID="txt_quote_en" runat="server" TextMode="MultiLine" Rows="10" Columns="80"></asp:TextBox>
                </asp:Panel>
                <asp:Panel ID="panel_content_vi" Visible="false" runat="server">
                    <h4>
                        Content 2</h4>
                    <%--<CKEditor:CKEditorControl ID="txt_content_vi" BasePath="~/Scripts/ckeditor"
                        runat="server"></CKEditor:CKEditorControl>--%>
                   <%-- <asp:TextBox ID="txt_content_vi" runat="server" TextMode="MultiLine" Rows="10" Columns="80"></asp:TextBox>--%>
                    <FCKeditorV2:FCKeditor ID="txt_content_vi" runat="server" BasePath="/" FullPage="true">
                    </FCKeditorV2:FCKeditor>
                    <asp:Panel ID="panel_quote_vi" runat="server" Visible="false">
                        <h4>
                            Quote 2</h4>
                        <%--<CKEditor:CKEditorControl ID="txt_quote_vi" BasePath="~/Scripts/ckeditor"
                            runat="server"></CKEditor:CKEditorControl>--%>
                        <asp:TextBox ID="txt_quote_vi" runat="server" TextMode="MultiLine" Rows="10" Columns="80"></asp:TextBox>
                    </asp:Panel>
                </asp:Panel>
                <br />
                <div style="float: right; color: Red;">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="sendMailGroup"
                        CssClass="redColor" />
                </div>
                <br />
                <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="standard-button orange small"
                    OnClick="btn_submit_Click"  />
                <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CssClass="standard-button small"
                    OnClick="btn_Cancel_Click" />
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Mailto is required"
                    ControlToValidate="txt_mailto" Display="Dynamic" ValidationGroup="sendMailGroup"
                    Text="*" CssClass="redColor"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Subject is required"
                    ControlToValidate="txt_subject" Display="Dynamic" ValidationGroup="sendMailGroup"
                    Text="*" CssClass="redColor"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Content is requried"
                    ControlToValidate="txt_content_en" Display="Dynamic" ValidationGroup="sendMailGroup"
                    Text="*" CssClass="redColor"></asp:RequiredFieldValidator>
            </div>
        </div>
    </div>
</asp:Content>
