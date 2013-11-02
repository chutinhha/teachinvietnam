<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RightPanel.ascx.cs"
    Inherits="TeachingJob.Employer.RightPanel" %>

<link type="text/css" rel="Stylesheet" href="../memberArea/style.css" />
<link href="../css/content.css" rel="stylesheet" type="text/css" />

<div class="col span-31 last" id="member-nav">
    <div class="module">
        <p class="home">
            <span class="icon"></span><a href="~/Employer/EmployerSite.aspx" runat="server">
                <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource,Employermanagement %>"></asp:Literal></a></p>
        <div id="my-cvs">
            <h3>
                <span class="icon"></span>
                <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,MyJobs %>"></asp:Literal></h3>
            <ul>
                <li><a href="~/memberArea/AdsAJob.aspx" runat="server">
                    <asp:Literal ID="Literal8" runat="server" Text="<%$Resources:Resource,CreateaJob %>"></asp:Literal></a></li>
                <li><a href="~/Employer/TeacherTraining.aspx" runat="server">
                    <asp:Literal ID="Literal1" runat="server" Text="Post a training course"></asp:Literal></a></li>
            </ul>
        </div>
        <div id="my-jobs">
            <h3>
                <span class="icon"></span>
                <asp:Literal ID="Literal9" runat="server" Text="<%$Resources:Resource,JobsManagement %>"></asp:Literal></h3>
            <ul>
                <li><a id="posted" href="~/Employer/JobsManagement.aspx" runat="server">
                    <asp:Literal ID="Literal10" runat="server" Text="<%$Resources:Resource,MyPostedJobs %>"></asp:Literal></a></li>
                <li><a id="A4" runat="server" href="~/Employer/cvsaved.aspx">
                    <asp:Literal ID="Literal15" runat="server" Text="<%$Resources:Resource,MyCVSaved %>"></asp:Literal></a></li>
                <li class="rightselected"><a id="Applicants" href="~/Employer/MyApplicants.aspx"
                    runat="server">
                    <asp:Literal ID="Literal11" runat="server" Text="<%$Resources:Resource,MyApplicants %>"></asp:Literal></a></li>
            </ul>
        </div>
        <div id="my-account">
            <h3>
                <span class="icon"></span>
                <asp:Literal ID="Literal12" runat="server" Text="<%$Resources:Resource,MyAccount %>"></asp:Literal></h3>
            <ul>
                <li><a id="A3" runat="server" href="~/Account/RecruiterInfo.aspx">
                    <asp:Literal ID="Literal13" runat="server" Text="<%$Resources:Resource,EditProfile %>"></asp:Literal></a></li>
                <li><a id="A8" runat="server" href="~/Account/ChangePassword.aspx">
                    <asp:Literal ID="Literal14" runat="server" Text="<%$Resources:Resource,ChangePassword %>"></asp:Literal></a></li>
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
