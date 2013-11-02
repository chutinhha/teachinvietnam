<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="RecoveryPwd.aspx.cs" Inherits="TeachingJob.Account.RecoveryPwd" %>

<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
    <title>Recovery Password - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
                        
                        <table>
                            <tr>
                                <td class="cot3">
                                    <asp:Label ID="Username" runat="server"
                                        Text="Username"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Username" runat="server" Text="" CssClass="color666"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword"
                                        Text="<%$Resources:Resource,NewPassword %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="NewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"
                                        Width="200px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword"
                                        CssClass="failureNotification" ErrorMessage="<%$Resources:Resource,NewPasswordisrequired %>"
                                        ToolTip="<%$Resources:Resource,NewPasswordisrequired %>" ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                                        </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword"
                                        Text="<%$Resources:Resource,ConfirmNewPassword %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="ConfirmNewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"
                                        Width="200px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword"
                                        CssClass="failureNotification" Display="Dynamic" ErrorMessage="<%$Resources:Resource,ConfirmNewPasswordisrequired %>"
                                        ToolTip="Confirm New Password is required." ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword"
                                        ControlToValidate="ConfirmNewPassword" CssClass="failureNotification" Display="Dynamic"
                                        ErrorMessage="<%$Resources:Resource,TheConfirmNewPasswordmustmatch %>" ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <span class="literalNotification">
                                        <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
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
                                        <asp:Button ID="ChangePasswordPushButton" runat="server" OnClick="Update_Click"
                                            CssClass="standard-button orange small" Text="<%$Resources:Resource,Update %>"
                                            ValidationGroup="ChangeUserPasswordValidationGroup" />
                                        <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" OnClick="Cancel_Click"
                                            CssClass="standard-button small" Text="<%$Resources:Resource,Cancel %>" />
                                    </p>
                                </td>
                            </tr>
                        </table>
                        <div class="clear-floats">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
