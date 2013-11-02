<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="ChangePassword.aspx.cs" Inherits="TeachingJob.Account.ChangePassword" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <title>Change Password - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class='col span-8'>
        <div class='component component-CurrentlyRecruiting'>
            <div class="module ">
                <div id="currently-recruiting-outer">
                    <div class="module-title">
                        <h2>
                            <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,ChangePassword %>"></asp:Literal>
                        </h2>
                    </div>
                    <div class="standard-form2">
                        <h3 class="group-title top">
                            <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,Usetheform %>"></asp:Literal>
                        </h3>
                        <p>
                            <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,Newpasswordsarerequired %>"></asp:Literal>
                            <%= Membership.MinRequiredPasswordLength %>
                            <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,charactersinlength %>"></asp:Literal>
                        </p>
                        <asp:ChangePassword ID="ChangeUserPassword" runat="server" OnCancelButtonClick="Cancel_Click" 
                            EnableViewState="true" RenderOuterTable="false" SuccessPageUrl="ChangePasswordSuccess.aspx">
                            <ChangePasswordTemplate>
                                <table>
                                    <tr>
                                        <td class="cot3">
                                            <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword"
                                                Text="<%$Resources:Resource,OldPassword %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="CurrentPassword" runat="server" CssClass="passwordEntry" TextMode="Password"
                                                Width="250px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword"
                                                CssClass="failureNotification" ErrorMessage="<%$Resources:Resource,OldPasswordisrequired %>"
                                                ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword"
                                                Text="<%$Resources:Resource,NewPassword %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="NewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"
                                                Width="250px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword"
                                                CssClass="failureNotification" ErrorMessage="<%$Resources:Resource,NewPasswordisrequired %>"
                                                ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword"
                                                Text="<%$Resources:Resource,ConfirmNewPassword %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ConfirmNewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"
                                                Width="250px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword"
                                                CssClass="failureNotification" Display="Dynamic" ErrorMessage="<%$Resources:Resource,ConfirmNewPasswordisrequired %>"
                                                ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword"
                                                ControlToValidate="ConfirmNewPassword" CssClass="failureNotification" Display="Dynamic"
                                                ErrorMessage="<%$Resources:Resource,TheConfirmNewPasswordmustmatch %>" ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <span class="literalNotification">
                                                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:ValidationSummary ID="ChangeUserPasswordValidationSummary" runat="server" CssClass="failureNotification"
                                                ValidationGroup="ChangeUserPasswordValidationGroup" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <p class="submitButton">
                                                <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword"
                                                    CssClass="standard-button orange small" Text="<%$Resources:Resource,ChangePasswordBtn %>"
                                                    ValidationGroup="ChangeUserPasswordValidationGroup" />
                                                <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                                    CssClass="standard-button small" Text="<%$Resources:Resource,Cancel %>" />
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                            </ChangePasswordTemplate>
                        </asp:ChangePassword>
                        <div class="clear-floats">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
