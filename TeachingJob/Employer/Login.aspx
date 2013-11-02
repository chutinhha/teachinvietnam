<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TeachingJob.Employer.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Employer Login - TeachinVietnam</title>
    <link href="../css/content.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class='col span-8'>
        <div class='component component-CurrentlyRecruiting'>
            <div class="module ">
                <div id="currently-recruiting-outer">
                    <div class="module-title">
                        <h2>Login</h2>
                    </div>
                    <div class="standard-form2">
                        <h3 class="group-title top">
                            Click to 
                            <%--<asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false">register as candidate</asp:HyperLink>
                            or--%>
                            <asp:HyperLink ID="hpl_RegisterAsEmployer" runat="server" EnableViewState="false"
                                NavigateUrl="~/Account/RegisterAsEmployer.aspx">register as employer</asp:HyperLink>
                            . It's free.
                        </h3>
                        <asp:Login ID="LoginUser" runat="server" EnableViewState="true" RenderOuterTable="false" FailureText="Wrong Email / password. Please try again." OnLoggedIn="OnLoggedIn_Click" >
                            <LayoutTemplate>
                                <table>
                                    <tr>
                                        <td class="cot6">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Email:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server" CssClass="textEntry" Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required."
                                                ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                                        </td>
                                        <td width="45%" rowspan="6">
                                        <div class="benefitLogin">
                                        <h5>Registered teachers get the following benefits:</h5>
                                        <ul>
                                            <li>Upload your Word/PDF CV or build your online CV</li>
                                            <li>Search through employer vacancies</li>
                                            <li>Receive job vacancies via email</li>
                                            <li>And more!</li>
                                        </ul>
                                        </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password" Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required."
                                                ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td style="line-height:12px;">
                                            <asp:CheckBox ID="RememberMe" runat="server" />
                                            <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Keep me logged in</asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <span class="failureNotification">
                                                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification"
                                                ValidationGroup="LoginUserValidationGroup" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <p class="submitButton">
                                                <asp:Button ID="LoginButton" CssClass="standard-button orange small" runat="server" CommandName="Login"
                                                    Text="Login" ValidationGroup="LoginUserValidationGroup" />
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Account/RecoveryPassword.aspx">Forgot your password? Please click here</asp:HyperLink></td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                        </asp:Login>
                        <div class="clear-floats">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
