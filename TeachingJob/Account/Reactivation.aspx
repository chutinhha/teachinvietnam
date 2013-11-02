<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Reactivation.aspx.cs" Inherits="TeachingJob.Account.Reactivation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>Resend activation mail - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class='col span-8'>
        <div class='component component-CurrentlyRecruiting'>
            <div class="module ">
                <div id="currently-recruiting-outer">
                    <div class="module-title">
                        <h2><asp:Literal ID="Literal2" runat="server" Text="Account activation"></asp:Literal></h2>
                    </div>
                    <div class="standard-form2">
                        <h3 class="group-title top">
                            <asp:Literal ID="Literal3" runat="server" Text="Resend activation mail"></asp:Literal>
                        </h3>
                        <span style="font-family:Sans-Serif; font-size:12px;">
                            <asp:Literal ID="Literal1" runat="server" Text="Please enter your register mail:"></asp:Literal>
                        </span>
                        <table>
                            <tr>
                                <td class="cot15">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" Text="<%$Resources:Resource,UserName %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server" Width="200px" MaxLength="200"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" Display="Dynamic"
                                        ErrorMessage="<%$Resources:Resource,UserNameisrequired %>" CssClass="failureNotification" ToolTip="<%$Resources:Resource,UserNameisrequired %>"
                                        ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic"
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
                                            CssClass="standard-button orange small" OnClick="PwdReactivate_SendingMail" />
                                        <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" OnClick="Cancel_Click"
                                            CssClass="standard-button small" Text="<%$Resources:Resource,Cancel %>" />
                                    </p>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
