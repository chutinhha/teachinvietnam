<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobsManagement.aspx.cs" Inherits="TeachingJob.Employer.JobsManagement" EnableEventValidation="false" %>
<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>
        <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource, JobsManagement%>"></asp:Literal> - TeachinVietnam</title>
    <link type="text/css" rel="Stylesheet" href="../memberArea/style.css" />
    <link href="../css/content.css" type="text/css" rel="stylesheet" media="screen" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class='col span-9'>
        <div class='component component-CurrentlyRecruiting'>
            <div class="module ">
                <div id="currently-recruiting-outer">
                    <div class="module-title">
                        <h2>
                            <asp:Label ID="Label1" runat="server" Text="<%$Resources:Resource, ApplicationManagement%>"></asp:Label></h2>
                    </div>
                    <div class="standard-form1 ">
                        <h3 class="group-title top">
                            <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource, Manageyourpostedjobs%>"></asp:Literal>
                        </h3>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                        <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="PostJob_DataBound" OnItemCommand="Repeater1_ItemCommand">
                            <HeaderTemplate>
                                <table id="hor-minimalist-b" summary="Employee Pay Sheet" width="100%">
                                    <thead>
                                        <tr>
                                            <th scope="col">
                                                <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource, jobtitletxt%>"></asp:Literal>
                                            </th>
                                            <th scope="col">
                                                <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource, DatePosted%>"></asp:Literal>
                                            </th>
                                            <th scope="col" class="cot20">
                                                <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource, ClosingDate%>"></asp:Literal>
                                            </th>
                                            <th scope="col">
                                                <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource, Viewno%>"></asp:Literal>
                                            </th>
                                            <th scope="col">
                                                <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource, Option%>"></asp:Literal>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="cot41">
                                        <asp:HyperLink ID="hpl_JobTitle" runat="server" CssClass="jobtitleColor" Target="_blank">
                                            <asp:Label ID="lbl_JobTitle" runat="server" CssClass="jobtitleColor" Text=""></asp:Label>
                                        </asp:HyperLink>
                                    </td>
                                    <td class="cot25">
                                        <asp:Label ID="lbl_Upload" runat="server" Text=""></asp:Label>
                                    </td>
                                    <td class="cot15"> 
                                        <asp:Label ID="lbl_Closing" runat="server" Text=""></asp:Label>
                                    </td>
                                    <td class="cot15" align="center">
                                        <asp:Label ID="lbl_ViewCount" runat="server" Text="Status"></asp:Label>
                                    </td>
                                    <td class="cot15">
                                        <asp:LinkButton ID="lbtn_View" runat="server" CommandName="View" ToolTip="View job's details">
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/icons/CRUD/view.png" />
                                        </asp:LinkButton>
                                        <%--<asp:LinkButton ID="lbtn_Edit" runat="server" CommandName="Edit">
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/images/icons/CRUD/update.png" ToolTip="Edit job's information" />
                                        </asp:LinkButton>--%>
                                        <asp:LinkButton ID="lbtn_Delete" runat="server" CommandName="Delete"  OnClientClick="return confirm('Warning: This job will not appear in the website anymore. Are you sure to delete?');">
                                            <asp:Image ID="Image3" runat="server" ImageUrl="~/images/icons/CRUD/delete.png" ToolTip="Delete this job" />
                                        </asp:LinkButton>
                                        <asp:HiddenField ID="HiddenField_ID" runat="server" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody> </table>
                            </FooterTemplate>
                        </asp:Repeater>
                        </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="clear-floats">
                        </div>
                    </div>
                    <ul class="pager" style="padding-right: 10px;">
                        <cc1:CollectionPager ID="CollectionPager1" BackText="Prev &amp;nbsp;" LabelText=""
                            NextText="&amp;nbsp; Next" ShowFirstLast="False" SliderSize="5" PagingMode="PostBack"
                            runat="server" BackNextLocation="Split" PageNumbersDisplay="Numbers" ResultsLocation="None"
                            BackNextDisplay="HyperLinks" HideOnSinglePage="true">
                        </cc1:CollectionPager>
                    </ul>
                    <div class="clear-floats">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col span-3 last" id="member-nav">
        <div class="module">
            <p class="home">
                <span class="icon"></span><a id="A1" href="~/Employer/EmployerSite.aspx" runat="server"><asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource,Employermanagement %>"></asp:Literal></a></p>
            <div id="my-cvs">
                <h3>
                    <span class="icon"></span><asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,MyJobs %>"></asp:Literal></h3>
                <ul>
                    <li><a id="A2" href="~/memberArea/AdsAJob.aspx" runat="server"><asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,CreateaJob %>"></asp:Literal></a></li>
                    <li><a id="A5" href="~/Employer/TeacherTraining.aspx" runat="server" visible="false">
                    <asp:Literal ID="Literal16" runat="server" Text="Post a training course"></asp:Literal></a></li>
                </ul>
            </div>
            <div id="my-jobs">
                <h3>
                    <span class="icon"></span><asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource,JobsManagement %>"></asp:Literal></h3>
                <ul>
                    <li class="rightselected"><a id="posted" href="~/Employer/JobsManagement.aspx" runat="server"><asp:Literal ID="Literal8" runat="server" Text="<%$Resources:Resource,MyPostedJobs %>"></asp:Literal></a></li>
                    <li><a id="A4" runat="server" href="~/Employer/cvsaved.aspx"><asp:Literal ID="Literal9" runat="server" Text="<%$Resources:Resource,MyCVSaved %>"></asp:Literal></a></li>
                    <li><a id="Applicants" href="~/Employer/MyApplicants.aspx" runat="server"><asp:Literal ID="Literal10" runat="server" Text="<%$Resources:Resource,MyApplicants %>"></asp:Literal></a></li>
                </ul>
            </div>
            <div id="my-account">
                <h3>
                    <span class="icon"></span><asp:Literal ID="Literal11" runat="server" Text="<%$Resources:Resource,MyAccount %>"></asp:Literal></h3>
                <ul>
                    <li><a id="A3" runat="server" href="~/Account/RecruiterInfo.aspx"><asp:Literal ID="Literal12" runat="server" Text="<%$Resources:Resource,EditProfile %>"></asp:Literal></a></li>
                    <li><a id="A8" runat="server" href="~/Account/ChangePassword.aspx"><asp:Literal ID="Literal13" runat="server" Text="<%$Resources:Resource,ChangePassword %>"></asp:Literal></a></li>
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
