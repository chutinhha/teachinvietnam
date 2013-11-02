<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="EmployerSite.aspx.cs" Inherits="TeachingJob.Employer.EmployerSite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>
        <asp:Literal ID="Literal13" runat="server" Text="<%$Resources:Resource,EmployerSiteManagement %>"></asp:Literal> - TeachinVietnam</title>
    <link href="../css/content.css" type="text/css" rel="stylesheet" media="screen" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="module padded" id="member-home">
        <h1 class="medium-heading">
            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:Resource, Welcome %>"></asp:Literal>
            <asp:Literal ID="lbl_firstname" runat="server"></asp:Literal>,<%--&nbsp;<asp:Literal ID="Literal2"
                runat="server" Text="<%$ Resources:Resource,welcometoyourpagesite %>"></asp:Literal>--%>
           </h1>
        <h2 class="lighter small-heading">
            <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,WeatTeachinVietnamarededicated %>"></asp:Literal>
        </h2>
        <br />
        <div class="group inner-module" id="posted-job">
            <div class="inner">
                <span class="icon"></span>
                <h3>
                    <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,MyJobs %>"></asp:Literal></h3>
                <ul>
                    <li>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/memberArea/AdsAJob.aspx">
                            <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource,CreateaJob %>"></asp:Literal></asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Employer/TeacherTraining.aspx">
                            <asp:Literal ID="Literal2" runat="server" Text="Post a training course" Visible="false"></asp:Literal></asp:HyperLink>
                    </li>
                </ul>
            </div>
        </div>
        <div class="group inner-module" id="my-jobs">
            <div class="inner">
                <span class="icon"></span>
                <h3>
                    <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource,JobsManagement %>"></asp:Literal></h3>
                <ul>
                    <li><a href="JobsManagement.aspx">
                        <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource,MyPostedJobs %>"></asp:Literal></a>
                    </li>
                    <li><a href="cvsaved.aspx">
                        <asp:Literal ID="Literal8" runat="server" Text="<%$Resources:Resource,MyCVSaved %>"></asp:Literal></a>
                    </li>
                    <li><a href="MyApplicants.aspx"><asp:Literal ID="Literal9" runat="server" Text="<%$Resources:Resource,MyApplicants %>"></asp:Literal></a>
                        <asp:Label ID="lbl_NewApply" runat="server" Text="" CssClass="tag new"></asp:Label></li>
                </ul>
            </div>
        </div>
        <div class="group last inner-module" id="my-account">
            <div class="inner">
                <span class="icon"></span>
                <h3>
                    <asp:Literal ID="Literal10" runat="server" Text="<%$Resources:Resource,MyAccount %>"></asp:Literal></h3>
                <ul>
                    <li><a href="../Account/RecruiterInfo.aspx"><asp:Literal ID="Literal11" runat="server" Text="<%$Resources:Resource,EditProfile %>"></asp:Literal></a></li>
                    <li><a href="../Account/ChangePassword.aspx"><asp:Literal ID="Literal12" runat="server" Text="<%$Resources:Resource,ChangePassword %>"></asp:Literal></a></li>
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
        <div class="clear-floats">
        </div>
    </div>
</asp:Content>
