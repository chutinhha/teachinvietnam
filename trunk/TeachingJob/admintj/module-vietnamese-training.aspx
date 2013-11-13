<%@ Page Title="" Language="C#" MasterPageFile="~/admintj/AdminSite.Master" AutoEventWireup="true" CodeBehind="module-vietnamese-training.aspx.cs" Inherits="TeachingJob.admintj.module_vietnamese_training" %>
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
            <div class="content-gird">
                <h3 style="padding-bottom:5px">Vietnamese training text description</h3>
                <div class="clear">
                </div>
                <hr />
                <table cellpadding="3" border="0" class="tablePadding" id="tblRightPanel">
                    <tr>
                        <td colspan="2"><h4>Vietnamese training</h4><CKEditor:CKEditorControl ID="txtRightPanel" BasePath="~/Scripts/ckeditor" runat="server"></CKEditor:CKEditorControl>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtRightPanel" Display="Dynamic" ValidationGroup="rightPanelGroup" ErrorMessage="Please enter text" CssClass="validation"></asp:RequiredFieldValidator><br /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnSubmit" runat="server" Text="Save" OnClick="btnSubmit_Click" CssClass="standard-button orange small" ValidationGroup="rightPanelGroup" />
                        </td>
                    </tr>
                </table>
                <div class="clear">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
