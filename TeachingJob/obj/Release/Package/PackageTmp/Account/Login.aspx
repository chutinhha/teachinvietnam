<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="TeachingJob.Account.Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <title><asp:Literal ID="Literal8" runat="server" Text="<%$Resources:Resource, Logintxt %>"></asp:Literal> - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class='col span-8'>
        <div class='component component-CurrentlyRecruiting'>
            <div class="module ">
                <div id="currently-recruiting-outer">
                    <div class="module-title">
                        <h2>
                            <asp:Label ID="lbl_ModuleTitle" runat="server" Text="<%$Resources:Resource, Jobseekerlogintxt %>"></asp:Label></h2>
                    </div>
                    <div class="standard-form2">
                        <h3 class="group-title top">
                            <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource, Clicktotxt %>"></asp:Literal>
                            <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false"><asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource, registerasajobseekertxt %>"></asp:Literal></asp:HyperLink>
                            <asp:HyperLink ID="hpl_RegisterAsEmployer" runat="server" EnableViewState="false"
                                NavigateUrl="~/Account/RegisterAsEmployer.aspx" Visible="false"><asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource, registerasanemployertxt %>"></asp:Literal></asp:HyperLink>
                            <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource, Itsfreetxt %>"></asp:Literal>
                        </h3>
                        <asp:Login ID="LoginUser" runat="server" EnableViewState="true" RenderOuterTable="false"
                            FailureText="<%$Resources:Resource, WrongEmailpasswordPleasetryagaintxt %>">
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
                                                ValidationGroup="LoginUserValidationGroup" Display="Dynamic">*</asp:RequiredFieldValidator>
                                        </td>
                                        <td width="45%" rowspan="6">
                                            <div class="benefitLogin">
                                                <asp:Panel ID="pn_benefit_candidate" runat="server">
                                                    <h5>
                                                        <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource, Registeredteachersbenefits %>"></asp:Literal>:</h5>
                                                    <ul>
                                                        <li><asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource, Registeredteachersbenefits1 %>"></asp:Literal></li>
                                                        <li><asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource, Registeredteachersbenefits2 %>"></asp:Literal></li>
                                                        <li><asp:Literal ID="Literal9" runat="server" Text="<%$Resources:Resource, Registeredteachersbenefits3 %>"></asp:Literal></li>
                                                        <li><asp:Literal ID="Literal18" runat="server" Text="<%$Resources:Resource, Registeredteachersbenefits3.5 %>"></asp:Literal></li>
                                                        <li><asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource, Registeredteachersbenefits4 %>"></asp:Literal>!</li>
                                                    </ul>
                                                </asp:Panel>
                                                <asp:Panel ID="pn_benefit_emp" runat="server" Visible="false">
                                                    <h5>
                                                        <asp:Literal ID="Literal10" runat="server" Text="<%$Resources:Resource, Registeredteachersbenefits5 %>"></asp:Literal>:</h5>
                                                    <ul>
                                                        <li><asp:Literal ID="Literal11" runat="server" Text="<%$Resources:Resource, Registeredteachersbenefits6 %>"></asp:Literal></li>
                                                        <li><asp:Literal ID="Literal12" runat="server" Text="<%$Resources:Resource, Registeredteachersbenefits7 %>"></asp:Literal></li>
                                                        <li><asp:Literal ID="Literal13" runat="server" Text="<%$Resources:Resource, Registeredteachersbenefits8 %>"></asp:Literal></li>
                                                        <li><asp:Literal ID="Literal14" runat="server" Text="<%$Resources:Resource, Registeredteachersbenefits9 %>"></asp:Literal></li>
                                                        <li><asp:Literal ID="Literal15" runat="server" Text="<%$Resources:Resource, Registeredteachersbenefits10 %>"></asp:Literal></li>
                                                    </ul>
                                                </asp:Panel>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"
                                                Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required."
                                                ValidationGroup="LoginUserValidationGroup" Display="Dynamic">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td style="line-height: 12px;">
                                            <asp:CheckBox ID="RememberMe" runat="server" />
                                            <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline"><asp:Literal ID="Literal17" runat="server" Text="<%$Resources:Resource, Keepmeloggedintxt %>"></asp:Literal></asp:Label>
                                        </td>
                                    </tr>
                                    <tr style="height: 10px">
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Button ID="LoginButton" CssClass="standard-button orange small" runat="server"
                                                CommandName="Login" Text="<%$Resources:Resource, Logintxt %>" ValidationGroup="LoginUserValidationGroup" />
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
                                            <span class="failureLogin">
                                                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Account/RecoveryPassword.aspx"><asp:Literal ID="Literal16" runat="server" Text="<%$Resources:Resource, PwdRecovery %>"></asp:Literal></asp:HyperLink>
                                            &nbsp;or&nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Account/Reactivation.aspx">Did not get activation mail</asp:HyperLink>
                                        </td>
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
