<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="privacy-setting.aspx.cs" Inherits="TeachingJob.memberArea.CV.privacy_setting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Privacy Settings</title>
    <link href="../../css/content.css" rel="stylesheet" type="text/css" />
    <script runat="server">
        protected void Page_PreRender(object sender, EventArgs e)
        {
            MembershipUser mu = Membership.GetUser();
            if (Profile.CV.Searchable == true)
                cb_Resume.Checked = true;
            else
                cb_Resume.Checked = false;
            if (Profile.CV.DisplayEmail == true)
                cb_Email.Checked = true;
            else
                cb_Email.Checked = false;
            if (Profile.CV.DisplayAddress == true)
                cb_Address.Checked = true;
            else
                cb_Address.Checked = false;
            if (Profile.CV.DisplayPhone == true)
                cb_Phone.Checked = true;
            else
                cb_Phone.Checked = false;
        }
        //protected void UpdatePrivacy_Click(object sender, EventArgs e)
        //{
        //    if (cb_Resume.Checked == true) Profile.CV.Searchable = true;
        //    else Profile.CV.Searchable = false;

        //    if (cb_Address.Checked == true) Profile.CV.DisplayAddress = true;
        //    else Profile.CV.DisplayAddress = false;

        //    if (cb_Phone.Checked == true) Profile.CV.DisplayPhone = true;
        //    else Profile.CV.DisplayPhone = false;
            
        //    lbl_Status.Text = "Your update is successful!";
        //}
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class='col span-8'>
        <div class='component component-CurrentlyRecruiting'>
            <div class="module ">
                <div id="">
                    <div class="module-title">
                        <h2>
                            <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,PrivacySettings %>"></asp:Literal>
                        </h2>
                    </div>
                    <div class="standard-form2">
                        <h3 class="group-title top">
                            <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,ChangeyourDisplay %>"></asp:Literal></h3>
                        <table>
                            <tr>
                                <td>
                                    <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,DisplayyourResume %>"></asp:Literal>
                                </td>
                                <td>
                                    <asp:CheckBox ID="cb_Resume" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Literal ID="Literal20" runat="server" Text="<%$Resources:Resource,DisplayyourEmail %>"></asp:Literal>
                                </td>
                                <td>
                                    <asp:CheckBox ID="cb_Email" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,DisplayyourAddress %>"></asp:Literal>
                                </td>
                                <td>
                                    <asp:CheckBox ID="cb_Address" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource,DisplayyourPhoneInfo %>"></asp:Literal>
                                </td>
                                <td>
                                    <asp:CheckBox ID="cb_Phone" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <asp:Panel ID="Panel_JobAlert" runat="server">
                        <div class="standard-form2">
                            <h3 class="group-title top">
                                <asp:Literal ID="Literal19" runat="server" Text="<%$Resources:Resource,JobAlert %>"></asp:Literal></h3>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Literal ID="Literal18" runat="server" Text="<%$Resources:Resource,EnableJobAlert %>"></asp:Literal>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cb_EnableJobAlert" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <asp:Label ID="lbl_Status" runat="server" Text="" CssClass="literalNotification"></asp:Label>
                    <asp:Button ID="btn_Return" runat="server" Text="<%$Resources:Resource,Return %>"
                        OnClick="Return_Click" CssClass="standard-button small float-right" />
                    &nbsp;
                    <asp:Button ID="btn_UpdatePrivacy_em" CssClass="standard-button orange float-right"
                        runat="server" Text="<%$Resources:Resource,Update %>" OnClick="UpdatePrivacy_Click" />
                    <div class="clear-floats">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col span-3 last" id="member-nav">
        <div class="module">
            <p class="home">
                <span class="icon"></span><a id="A1" href="~/Account/my-jobs.aspx" runat="server">
                    <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource,Myjobsmanagement %>"></asp:Literal></a></p>
            <div id="my-jobs">
                <h3>
                    <span class="icon"></span>
                    <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource,MyJobs %>"></asp:Literal></h3>
                <ul>
                    <li><a id="A2" href="~/memberArea/AppManagement.aspx" runat="server">
                        <asp:Literal ID="Literal8" runat="server" Text="<%$Resources:Resource,Myjobapplications %>"></asp:Literal></a></li>
                    <li><a id="A3" href="~/memberArea/ManageSavedJob.aspx" runat="server">
                        <asp:Literal ID="Literal9" runat="server" Text="<%$Resources:Resource,Managesavedjobs %>"></asp:Literal></a></li>
                    <li><a id="A4" href="~/memberArea/CV/JobAlert.aspx" runat="server">
                        <asp:Literal ID="Literal17" runat="server" Text="<%$Resources:Resource,JobAlert %>"></asp:Literal></a></li>
                </ul>
            </div>
            <div id="my-cvs">
                <h3>
                    <span class="icon"></span>
                    <asp:Literal ID="Literal10" runat="server" Text="<%$Resources:Resource,MyCVs %>"></asp:Literal></h3>
                <ul>
                    <li>
                        <asp:LinkButton ID="lbtn_AdsCv" runat="server" OnClick="lbtn_AdsCv_Click">
                            <asp:Literal ID="Literal11" runat="server" Text="<%$Resources:Resource,CreateaCV %>"></asp:Literal></asp:LinkButton></li>
                    <li><a href="../../publicArea/CV/Detail.aspx?cvname=<%= UserId %>" target="_blank">
                        <asp:Literal ID="Literal12" runat="server" Text="<%$Resources:Resource,Reviewresume %>"></asp:Literal></a></li>
                    <li><a href="../../publicArea/CV/UpdateCV.aspx?cvname=<%= UserId %>" target="_blank">
                        <asp:Literal ID="Literal13" runat="server" Text="<%$Resources:Resource,Updateyourresume %>"></asp:Literal></a></li>
                </ul>
            </div>
            <div id="my-account">
                <h3>
                    <span class="icon"></span>
                    <asp:Literal ID="Literal14" runat="server" Text="<%$Resources:Resource,MyAccount %>"></asp:Literal></h3>
                <ul>
                    <li class="rightselected"><a id="A7" runat="server" href="~/memberArea/CV/privacy-setting.aspx">
                        <asp:Literal ID="Literal15" runat="server" Text="<%$Resources:Resource,PrivacySettings %>"></asp:Literal></a></li>
                    <li><a id="A8" runat="server" href="~/Account/ChangePassword.aspx">
                        <asp:Literal ID="Literal16" runat="server" Text="<%$Resources:Resource,ChangePassword %>"></asp:Literal></a></li>
                    <li>
                        <asp:LoginView ID="HeadLoginView" runat="server" EnableViewState="true">
                            <LoggedInTemplate>
                                <asp:LoginStatus ID="HeadLoginStatus" runat="server" LogoutAction="Redirect" LogoutText="<%$ Resources:Resource, Logouttxt %>"
                                    LogoutPageUrl="~/" />
                            </LoggedInTemplate>
                        </asp:LoginView>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="clear-floats">
    </div>
</asp:Content>
