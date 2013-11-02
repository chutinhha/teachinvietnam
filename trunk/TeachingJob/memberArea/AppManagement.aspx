<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="AppManagement.aspx.cs" Inherits="TeachingJob.memberArea.AppManagement" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link type="text/css" rel="Stylesheet" href="style.css" />
    <link href="../css/content.css" rel="stylesheet" type="text/css" />
    <title>Manage your applications - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class='col span-9'>
        <div class='component component-CurrentlyRecruiting'>
            <div class="module ">
                <div id="currently-recruiting-outer">
                    <div class="module-title">
                        <h2>
                            <asp:Label ID="Label1" runat="server" Text="<%$Resources:Resource,ApplicationManagement %>"></asp:Label></h2>
                    </div>
                    <div class="standard-form1 ">
                        <h3 class="group-title top">
                            <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,Manageyourapplications %>"></asp:Literal>
                        </h3>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="SaveJob_DataBound" OnItemCommand="SaveJob_ItemCommand">
                                    <HeaderTemplate>
                                        <table id="hor-minimalist-b" summary="Employee Pay Sheet" width="100%">
                                            <thead>
                                                <tr>
                                                    <th scope="col">
                                                        <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,jobtitletxt %>"></asp:Literal>
                                                    </th>
                                                    <th scope="col">
                                                        <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,Organization %>"></asp:Literal>
                                                    </th>
                                                    <th scope="col">
                                                        <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,ClosingDate %>"></asp:Literal>
                                                    </th>
                                                    <th scope="col">
                                                        <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource,AppliedDate %>"></asp:Literal>
                                                    </th>
                                                    <th>
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
                                                <asp:Label ID="lbl_org" runat="server" Text=""></asp:Label>
                                            </td>
                                            <td class="cot15">
                                                <asp:Label ID="lbl_Closing" runat="server" Text=""></asp:Label>
                                            </td>
                                            <td class="cot15">
                                                <asp:Label ID="lbl_SaveDate" runat="server" Text="" ToolTip="<%$Resources:Resource,Thedateyousaved %>"></asp:Label>
                                            </td>
                                            <td class="cot5">
                                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                                <asp:LinkButton ID="LinkButton1" runat="server" ToolTip="<%$Resources:Resource,Deletethisappliedjob %>"
                                                    CommandName="Delete" OnClientClick="return confirm('Are you sure?');">
                                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/icons/CRUD/delete.png" />
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </tbody> </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" >
                            <ProgressTemplate>
                                <div class="screenmiddle">
                                    <img src="../images/sitefiles/ajax-loader.gif" alt="Loading.." />
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        
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
                <span class="icon"></span><a href="../Account/my-jobs.aspx">
                    <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource,Myjobsmanagement %>"></asp:Literal></a></p>
            <div id="my-jobs">
                <h3>
                    <span class="icon"></span><asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource,MyJobs %>"></asp:Literal></h3>
                <ul>
                    <li class="rightselected"><a href="../memberArea/AppManagement.aspx"><asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,Myjobapplications %>"></asp:Literal></a></li>
                    <li><a id="A1" href="~/memberArea/ManageSavedJob.aspx" runat="server"><asp:Literal ID="Literal5" runat="server"  Text="<%$Resources:Resource,Managesavedjobs %>"></asp:Literal></a></li>
                    <li><a id="A2" href="~/memberArea/CV/JobAlert.aspx" runat="server"><asp:Literal ID="Literal15" runat="server" Text="<%$Resources:Resource,JobAlert %>"></asp:Literal></a></li>
                </ul>
            </div>
            <div id="my-cvs">
                <h3>
                    <span class="icon"></span><asp:Literal ID="Literal8" runat="server" Text="<%$Resources:Resource,MyCVs %>"></asp:Literal></h3>
                <ul>
                    <li>
                        <asp:LinkButton ID="lbtn_AdsCv" runat="server" OnClick="lbtn_AdsCv_Click"><asp:Literal ID="Literal9" runat="server" Text="<%$Resources:Resource,CreateaCV %>"></asp:Literal></asp:LinkButton></li>
                    <li><a href="../publicArea/CV/Detail.aspx?cvname=<%=Userid %>" target="_blank"><asp:Literal ID="Literal10" runat="server" Text="<%$Resources:Resource,Reviewresume %>"></asp:Literal></a></li>
                    <li><a href="../publicArea/CV/UpdateCV.aspx?cvname=<%= Userid %>" target="_blank"><asp:Literal ID="Literal11" runat="server" Text="<%$Resources:Resource,Updateyourresume %>"></asp:Literal></a></li>
                </ul>
            </div>
            <div id="my-account">
                <h3>
                    <span class="icon"></span><asp:Literal ID="Literal12" runat="server" Text="<%$Resources:Resource,MyAccount %>"></asp:Literal></h3>
                <ul>
                    <li><a href="CV/privacy-setting.aspx"><asp:Literal ID="Literal13" runat="server" Text="<%$Resources:Resource,PrivacySettings %>"></asp:Literal></a></li>
                    <li><a href="../Account/ChangePassword.aspx"><asp:Literal ID="Literal14" runat="server" Text="<%$Resources:Resource,ChangePassword %>"></asp:Literal></a></li>
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
