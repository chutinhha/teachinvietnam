<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="RecoveryPassword.aspx.cs" Inherits="TeachingJob.Account.RecoveryPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<title>Recovery Password - TeachinVietnam</title>
    <link href="../css/content.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class='col span-8'>
        <div class='component component-CurrentlyRecruiting'>
            <div class="module ">
                <div id="currently-recruiting-outer">
                    <div class="module-title">
                        <h2>
                            <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,RecoveryPassword %>"></asp:Literal></h2>
                    </div>
                    <div class="standard-form2">
                        <h3 class="group-title top">
                            <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,ForgotYourPassword %>"></asp:Literal>
                        </h3>
                        <p>
                            <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,Enteryouremail %>"></asp:Literal>
                        </p>
                        <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" SuccessTextStyle-ForeColor="gray" SuccessTextStyle-Font-Bold="true" SuccessTextStyle-CssClass="quiet" 
                             SuccessText="<%$Resources:Resource,SuccessText %>">
                            <UserNameTemplate>
                                <table>
                                    <tr>
                                        <td class="cot15">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" Text="<%$Resources:Resource,UserName %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server" Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                ErrorMessage="<%$Resources:Resource,UserNameisrequired %>" CssClass="failureNotification" ToolTip="<%$Resources:Resource,UserNameisrequired %>"
                                                ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                ValidationGroup="PasswordRecovery1" CssClass="failureNotification" ControlToValidate="UserName"
                                                ErrorMessage="<%$Resources:Resource,validmailformat %>" Text="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                    <td></td>
                                        <td>
                                            <span class="literalNotification">
                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            </span>
                                            <asp:ValidationSummary ID="ChangeUserPasswordValidationSummary" runat="server" CssClass="failureNotification"
                                                ValidationGroup="PasswordRecovery1" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <p class="submitButton">
                                                <asp:Button ID="SubmitButton" runat="server" Text="<%$Resources:Resource,Submit %>" ValidationGroup="PasswordRecovery1"
                                                    CssClass="standard-button orange small" OnClick="PwdRecovery_SendingMail" />
                                                <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" OnClick="Cancel_Click"
                                                    CssClass="standard-button small" Text="<%$Resources:Resource,Cancel %>" />
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                            </UserNameTemplate>
                        </asp:PasswordRecovery>
                        <div class="clear-floats">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
