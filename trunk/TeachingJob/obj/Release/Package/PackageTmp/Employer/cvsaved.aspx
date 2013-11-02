<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="cvsaved.aspx.cs" Inherits="TeachingJob.Employer.cvsaved" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>My CV Saved - TeachinVietnam</title>
    <link href="../css/content.css" type="text/css" rel="stylesheet" media="screen" />
    <style type="text/css">
        .deleteicon
        {
            float: right;
        }
        .deleteicon2
        {
            display: block;
            position: absolute;
            margin: 0;
            border: 0 none transparent;
            padding: 50px;
            padding-bottom: 0px;
            padding-left: 179px;
            padding-top: 10px;
            padding-right: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col span-9">
        <div id="job-profiles" class="job-wall">
            <div id="search-wall" class="module1">
                <div id="filter">
                    <div style="float: left;">
                        <table style="height: 26px">
                            <tr>
                                <td class="valignmiddle">
                                    <asp:Literal ID="lbl_JobCount" runat="server"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="float: right">
                        <table>
                            <tr>
                                <td>
                                    <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource, Resultperpage%>"></asp:Literal>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_ResultPerPage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="PageSize_SelectChanged"
                                        CssClass="dropdown2">
                                        <asp:ListItem Value="12">12</asp:ListItem>
                                        <asp:ListItem Value="24">24</asp:ListItem>
                                        <asp:ListItem Value="36">36</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="clear-floats">
                </div>
            </div>
            <asp:Panel ID="Panel1" runat="server" Visible="false" Width="637px">
                <div style="text-align: center; font-size: 1.6em;">
                    <asp:Label ID="Label1" runat="server" Text="<%$Resources:Resource, Noresumefound%>"></asp:Label></div>
            </asp:Panel>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <div class="screenmiddle">
                        <img src="../images/sitefiles/ajax-loader.gif" alt="Loading.." />
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:DataList ID="DataList1" runat="server" OnItemDataBound="DataList_DataBound"
                        RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList_ItemCommand">
                        <ItemTemplate>
                            <div class="col span-31">
                                <asp:LinkButton ID="lbtn_DeleteSavedJob" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure to delete this resume?');">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/icons/CRUD/delete-icon.png"
                                        CssClass="deleteicon2" ToolTip="Delete this resume from saved list" />
                                </asp:LinkButton>
                                <div class="module">
                                    <asp:HyperLink ID="hpl_Image" runat="server" Target="_blank">
                                        <asp:Image ID="Img" runat="server" Height="100px" Width="100%" />
                                    </asp:HyperLink>
                                    <p class="ptagcvsearch">
                                        <asp:HyperLink ID="hpl_Fullname" runat="server" Target="_blank"></asp:HyperLink>
                                    </p>
                                    <p class="ptagcvsearch">
                                        <asp:Label ID="lbl_Major" runat="server" Text="" CssClass="lblmajorcvsearch"></asp:Label>
                                        <asp:HiddenField ID="HiddenField_ID" runat="server" />
                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </ContentTemplate>
            </asp:UpdatePanel>
            <ul id="pager0" class="pager" style="padding-right: 100px;">
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
    <div class="col span-3 last" id="member-nav">
        <div class="module">
            <p class="home">
                <span class="icon"></span><a id="A1" href="~/Employer/EmployerSite.aspx" runat="server">
                    <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,Employermanagement %>"></asp:Literal></a></p>
            <div id="my-cvs">
                <h3>
                    <span class="icon"></span>
                    <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,MyJobs %>"></asp:Literal></h3>
                <ul>
                    <li><a id="A2" href="~/memberArea/AdsAJob.aspx" runat="server">
                        <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,CreateaJob %>"></asp:Literal></a></li>
                        <li><a id="A5" href="~/Employer/TeacherTraining.aspx" runat="server" visible="false">
                    <asp:Literal ID="Literal16" runat="server" Text="Post a training course"></asp:Literal></a></li>
                </ul>
            </div>
            <div id="my-jobs">
                <h3>
                    <span class="icon"></span>
                    <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource,JobsManagement %>"></asp:Literal></h3>
                <ul>
                    <li><a id="posted" href="~/Employer/JobsManagement.aspx" runat="server">
                        <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource,MyPostedJobs %>"></asp:Literal></a></li>
                    <li class="rightselected"><a runat="server" href="~/Employer/cvsaved.aspx">
                        <asp:Literal ID="Literal8" runat="server" Text="<%$Resources:Resource,MyCVSaved %>"></asp:Literal></a></li>
                    <li><a id="Applicants" href="~/Employer/MyApplicants.aspx" runat="server">
                        <asp:Literal ID="Literal9" runat="server" Text="<%$Resources:Resource,MyApplicants %>"></asp:Literal></a></li>
                </ul>
            </div>
            <div id="my-account">
                <h3>
                    <span class="icon"></span>
                    <asp:Literal ID="Literal10" runat="server" Text="<%$Resources:Resource,MyAccount %>"></asp:Literal></h3>
                <ul>
                    <li><a id="A3" runat="server" href="~/Account/RecruiterInfo.aspx">
                        <asp:Literal ID="Literal11" runat="server" Text="<%$Resources:Resource,EditProfile %>"></asp:Literal></a></li>
                    <li><a id="A8" runat="server" href="~/Account/ChangePassword.aspx">
                        <asp:Literal ID="Literal12" runat="server" Text="<%$Resources:Resource,ChangePassword %>"></asp:Literal></a></li>
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
