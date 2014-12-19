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
                <h3 style="padding-bottom:5px">Our Services text description</h3>
                <div class="clear">
                </div>
                <hr />
                <table cellpadding="3" border="0" class="tablePadding" id="tblRightPanel">
                    <tr>
                        <td colspan="2">
                            <h4>Translation and Interpretation Service</h4>
                            <CKEditor:CKEditorControl ID="txtTranslationAndInterpretationService" BasePath="~/Scripts/ckeditor" runat="server"></CKEditor:CKEditorControl>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtTranslationAndInterpretationService" Display="Dynamic" ValidationGroup="group1" ErrorMessage="Please enter text" CssClass="validation"></asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnTranslationAndInterpretationServiceSubmit" runat="server" Text="Save" OnClick="btnTranslationAndInterpretationServiceSubmit_Click" CssClass="standard-button orange small" ValidationGroup="group1" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h4>Visa Service</h4>
                            <CKEditor:CKEditorControl ID="txtVisaService" BasePath="~/Scripts/ckeditor" runat="server"></CKEditor:CKEditorControl>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtVisaService" Display="Dynamic" ValidationGroup="group2" ErrorMessage="Please enter text" CssClass="validation"></asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnVisaServiceSubmit" runat="server" Text="Save" OnClick="btnVisaServiceSubmit_Click" CssClass="standard-button orange small" ValidationGroup="rightPanelGroup" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h4>Provide Work Permit for Foreigner Laborers Working in Vietnam</h4>
                            <CKEditor:CKEditorControl ID="txtProvideWorkPermitForForeignerLaborersWorkingInVietnam" BasePath="~/Scripts/ckeditor" runat="server"></CKEditor:CKEditorControl>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtProvideWorkPermitForForeignerLaborersWorkingInVietnam" Display="Dynamic" ValidationGroup="group3" ErrorMessage="Please enter text" CssClass="validation"></asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnProvideWorkPermitForForeignerLaborersWorkingInVietnamSubmit" runat="server" Text="Save" OnClick="btnProvideWorkPermitForForeignerLaborersWorkingInVietnamSubmit_Click" CssClass="standard-button orange small" ValidationGroup="group3" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h4>Vietnamese Training</h4>
                            <CKEditor:CKEditorControl ID="txtVietnameseTraining" BasePath="~/Scripts/ckeditor" runat="server"></CKEditor:CKEditorControl>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtVietnameseTraining" Display="Dynamic" ValidationGroup="group4" ErrorMessage="Please enter text" CssClass="validation"></asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnVietnameseTrainingSubmit" runat="server" Text="Save" OnClick="btnVietnameseTrainingSubmit_Click" CssClass="standard-button orange small" ValidationGroup="group4" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                </table>
                <div class="clear">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
