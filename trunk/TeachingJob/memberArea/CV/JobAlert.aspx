<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="JobAlert.aspx.cs" Inherits="TeachingJob.memberArea.CV.JobAlert" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Job Alert - TeachinVietnam</title>
    <link href="../../css/content.css" rel="stylesheet" type="text/css" />
    <link href="../style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class='col span-9'>
        <div class='component component-CurrentlyRecruiting'>
            <div class="module ">
                <div id="currently-recruiting-outer">
                    <div class="module-title">
                        <h2>
                            <asp:Label ID="Label1" runat="server" Text="<%$Resources:Resource,JobAlert %>"></asp:Label></h2>
                    </div>
                    <div class="standard-form1">
                        <asp:Panel ID="panel_headingmodule" runat="server" Visible="false">
                            <h3 class="group-title top">
                                <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,Helpyoufindyourdesiredjob %>"></asp:Literal>
                            </h3>
                        </asp:Panel>
                        <asp:Panel ID="Panel_IsActive" runat="server" Visible="false">
                            <h3 class="group-title top">
                                Your job alert is currently inactive.<br />
                                Please click 
                                <asp:HyperLink ID="HyperLink1" ForeColor="DarkGreen" runat="server" CssClass="jobAlertLink" NavigateUrl="~/memberArea/CV/privacy-setting.aspx">here</asp:HyperLink> if you want to change your setting.</h3>
                        </asp:Panel>
                        <asp:Panel ID="Panel_IsRegister" runat="server" Visible="false">
                            <h3 class="group-title top">
                                You currently cannot use this function.<br />
                                Please register to use job alert.</h3>
                            <asp:Button ID="btn_Register" runat="server" Text="Register Job Alert" CssClass="standard-button orange small"
                                OnClick="btn_Register_Click" />
                        </asp:Panel>
                        <asp:Panel ID="Panel_NoJobsInList" runat="server" Visible="false">
                            <h3 class="group-title top">
                                <asp:Literal ID="Literal16" runat="server" Text="<%$Resources:Resource,nojobinlist %>"></asp:Literal></h3>
                        </asp:Panel>
                        <asp:Panel ID="Panel_NotCreateCV" runat="server" Visible="false">
                            <h3 class="group-title top">
                                <asp:Literal ID="Literal17" runat="server" Text="<%$Resources:Resource,pleasecreateacv %>"></asp:Literal></h3>
                        </asp:Panel>
                        <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="JobAlert_DataBound"
                            OnItemCommand="ItemCommander">
                            <HeaderTemplate>
                                <table id="hor-minimalist-b">
                                    <thead>
                                        <tr>
                                            <th scope="col">
                                                <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,jobtitletxt %>"></asp:Literal>
                                            </th>
                                            <th scope="col">
                                                <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource,ClosingDate %>"></asp:Literal>
                                            </th>
                                            <th scope="col">
                                                <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,DatePosted %>"></asp:Literal>
                                            </th>
                                            <th scope="col">
                                                <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,Option %>"></asp:Literal>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="cot60">
                                        <asp:HyperLink ID="hpl_JobTitle" runat="server" CssClass="jobtitleColor" Target="_blank">
                                            <asp:Label ID="lbl_JobTitle" runat="server" CssClass="jobtitleColor" Text=""></asp:Label>
                                        </asp:HyperLink>
                                    </td>
                                    <td class="cot20">
                                        <asp:Label ID="lbl_Closing" runat="server" Text=""></asp:Label>
                                    </td>
                                    <td class="cot20">
                                        <asp:Label ID="lbl_PostedDate" runat="server" Text=""></asp:Label>
                                    </td>
                                    <td class="cot10">
                                        <asp:HyperLink ID="hpl_View" runat="server" Target="_blank">
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/images/icons/CRUD/view.png" />
                                        </asp:HyperLink>
                                        <asp:LinkButton ID="lbtn_Save" runat="server" CommandName="Save">
                                            <asp:Image ID="Image3" runat="server" ImageUrl="~/images/icons/CRUD/delete.png" ToolTip="<%$Resources:Resource,Deletethissavedjob %>" />
                                        </asp:LinkButton>
                                        <asp:HiddenField ID="hf_savedjobid" runat="server" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody> </table>
                            </FooterTemplate>
                        </asp:Repeater>
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
                        <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,Myjobapplications %>"></asp:Literal></a></li>
                    <li><a id="A3" href="~/memberArea/ManageSavedJob.aspx" runat="server">
                        <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource,Managesavedjobs %>"></asp:Literal></a></li>
                    <li class="rightselected"><a id="A6" href="~/memberArea/CV/JobAlert.aspx" runat="server">
                        <asp:Literal ID="Literal15" runat="server" Text="<%$Resources:Resource,JobAlert %>"></asp:Literal></a></li>
                </ul>
            </div>
            <div id="my-cvs">
                <h3>
                    <span class="icon"></span>
                    <asp:Literal ID="Literal8" runat="server" Text="<%$Resources:Resource,MyCVs %>"></asp:Literal></h3>
                <ul>
                    <li>
                        <asp:HyperLink ID="hpl_CreateCV" runat="server" NavigateUrl="~/memberArea/AdsCv.aspx">
                            <asp:Literal ID="Literal9" runat="server" Text="<%$Resources:Resource,CreateaCV %>"></asp:Literal></asp:HyperLink></li>
                    <li><a href="../../publicArea/CV/Detail.aspx?cvname=<%=UserId %>" target="_blank">
                        <asp:Literal ID="Literal10" runat="server" Text="<%$Resources:Resource,Reviewresume %>"></asp:Literal></a></li>
                    <li><a href="../../publicArea/CV/UpdateCV.aspx?cvname=<%= UserId %>" target="_blank">
                        <asp:Literal ID="Literal11" runat="server" Text="<%$Resources:Resource,Updateyourresume %>"></asp:Literal></a></li>
                </ul>
            </div>
            <div id="my-account">
                <h3>
                    <span class="icon"></span>
                    <asp:Literal ID="Literal12" runat="server" Text="<%$Resources:Resource,MyAccount %>"></asp:Literal></h3>
                <ul>
                    <li><a id="A4" href="~/memberArea/CV/privacy-setting.aspx" runat="server">
                        <asp:Literal ID="Literal13" runat="server" Text="<%$Resources:Resource,PrivacySettings %>"></asp:Literal></a></li>
                    <li><a id="A5" href="~/Account/ChangePassword.aspx" runat="server">
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
</asp:Content>
