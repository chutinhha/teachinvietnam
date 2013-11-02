<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="my-jobs.aspx.cs" Inherits="TeachingJob.Account.my_jobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>My Jobs Management</title>
    <link href="../css/content.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="module padded" id="member-home">
        <h1 class="medium-heading">
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        </h1>
        <h2 class="lighter small-heading">
            <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,toMyJobsWelcome %>"></asp:Literal>
        </h2>
        <br />
        <div class="group inner-module" id="my-jobs">
            <div class="inner">
                <span class="icon"></span>
                <h3>
                    <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,MyJobs %>"></asp:Literal></h3>
                <ul>
                    <li><a href="../memberArea/AppManagement.aspx">
                        <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,Myjobapplications %>"></asp:Literal></a> (<%= SjCount %>)</li>
                    <li><a href="~/memberArea/ManageSavedJob.aspx" runat="server">
                        <asp:Literal ID="Literal5" runat="server"  Text="<%$Resources:Resource,Managesavedjobs %>"></asp:Literal></a></li>
                    <li><a id="A1" href="~/memberArea/CV/JobAlert.aspx" runat="server"><asp:Literal ID="Literal15" runat="server" Text="<%$Resources:Resource,JobAlert %>"></asp:Literal></a></li>
                    <%--<li><a href="/members/recent-jobs/">My job Alert</a></li>
                    <li><a href="/members/recent-searches/">Stop email Alert</a></li>--%>
                </ul>
            </div>
        </div>
        <div class="group inner-module" id="my-cvs">
            <div class="inner">
                <span class="icon"></span>
                <h3>
                    <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource,MyCVs %>"></asp:Literal></h3>
                <ul>
                    <li>
                        <asp:LinkButton ID="lbtn_AdsCv" runat="server" OnClick="lbtn_AdsCv_Click">
                            <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource,CreateaCV %>"></asp:Literal></asp:LinkButton>
                    </li>
                    <li><a href="../publicArea/CV/Detail.aspx?cvname=<%= UserId %>" target="_blank">
                        <asp:Literal ID="Literal8" runat="server" Text="<%$Resources:Resource,Reviewresume %>"></asp:Literal></a></li>
                    <li><a href="../publicArea/CV/UpdateCV.aspx?cvname=<%= UserId %>" target="_blank">
                        <asp:Literal ID="Literal9" runat="server" Text="<%$Resources:Resource,Updateyourresume %>"></asp:Literal></a></li>
                </ul>
            </div>
        </div>
        <div class="group last inner-module" id="my-account">
            <div class="inner">
                <span class="icon"></span>
                <h3>
                    <asp:Literal ID="Literal10" runat="server" Text="<%$Resources:Resource,MyAccount %>"></asp:Literal>
                    </h3>
                <ul>
                    <li><a href="../memberArea/CV/privacy-setting.aspx"><asp:Literal ID="Literal11" runat="server" Text="<%$Resources:Resource,PrivacySettings %>"></asp:Literal></a></li>
                    <li><a href="ChangePassword.aspx"><asp:Literal ID="Literal12" runat="server" Text="<%$Resources:Resource,ChangePassword %>"></asp:Literal></a></li>
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
