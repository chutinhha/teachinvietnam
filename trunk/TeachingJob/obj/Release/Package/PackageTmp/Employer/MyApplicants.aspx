<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="MyApplicants.aspx.cs" Inherits="TeachingJob.Employer.MyApplicants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>
        <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,MyApplicants %>"></asp:Literal>
        - TeachinVietnam </title>
    <link type="text/css" rel="Stylesheet" href="../memberArea/style.css" />
    <link href="../css/content.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class='colMyApplicants span-91'>
        <div class='component component-CurrentlyRecruiting'>
            <div class="module ">
                <div id="currently-recruiting-outer">
                    <div class="module-title">
                        <h2>
                            <asp:Label ID="Label1" runat="server" Text="<%$Resources:Resource,ApplicationManagement %>"></asp:Label></h2>
                    </div>
                    <div class="standard-form1 ">
                        <h3 class="group-title top">
                            <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,Manageyourapplicants %>"></asp:Literal>
                        </h3>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:Panel ID="Panel_left" runat="server">
                                    <div class="hor-e-div">
                                        <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_JobTitle_DataBound"
                                            OnItemCommand="Repeater1_JobTitle_ItemCommand">
                                            <HeaderTemplate>
                                                <table id="hor-minimalist-e">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">
                                                                <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,PostedJobs %>"></asp:Literal>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="cot25">
                                                        <asp:LinkButton ID="lbtn_JobTitle" runat="server" CommandName="View">
                                                            <asp:Label ID="lbl_JobTitle" runat="server" Text=""></asp:Label>
                                                            <asp:HiddenField ID="HiddenField1" runat="server" />
                                                        </asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </tbody> </table>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </div>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                            <ProgressTemplate>
                                <div class="screenmiddle">
                                    <img src="../images/sitefiles/ajax-loader.gif" alt="Loading.." />
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                            <ContentTemplate>
                                <asp:Panel ID="Panel_Fake" runat="server">
                                    <table id="hor-minimalist-d">
                                        <thead>
                                            <tr>
                                                <th class="cot41">
                                                    <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,Resumes %>"></asp:Literal>
                                                </th>
                                                <th class="cot40">
                                                    Email
                                                </th>
                                                <th class="cot20">
                                                    <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource,AppliedDate %>"></asp:Literal>
                                                </th>
                                                <th class="cot15">
                                                    <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource,Option %>"></asp:Literal>
                                                </th>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <asp:Label ID="lbl_NoElementInList" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                        </thead>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="Panel_right" runat="server">
                                    <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_DataBound"
                                        OnItemCommand="Repeater2_ItemCommand">
                                        <HeaderTemplate>
                                            <table id="hor-minimalist-d">
                                                <thead>
                                                    <tr>
                                                        <th class="cot41">
                                                            <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,Resumes %>"></asp:Literal>
                                                        </th>
                                                        <th class="cot25">
                                                            Email
                                                        </th>
                                                        <th class="cot20">
                                                            <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource,AppliedDate %>"></asp:Literal>
                                                        </th>
                                                        <th class="cot15">
                                                            <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource,Option %>"></asp:Literal>
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td class="cot41">
                                                    <asp:LinkButton ID="lbtn_ViewCVDetail" runat="server" CommandName="View" OnClientClick="document.getElementById('ctl01').target ='_blank';">
                                                        <asp:Label ID="lbl_FullName" runat="server" CssClass="jobtitleColor" Text=""></asp:Label>
                                                    </asp:LinkButton>
                                                    <asp:Label ID="lbl_New" runat="server" CssClass="tag new" Text="<%$Resources:Resource,New %>"></asp:Label>
                                                </td>
                                                <td class="cot25">
                                                    <asp:Label ID="lbl_Email" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td class="cot20">
                                                    <asp:Label ID="lbl_SavingDate" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td class="cot15">
                                                    <script type="text/javascript">
                                                        function changeimage() {
                                                            document.getElementById('<%# ((RepeaterItem)Container).FindControl("img_favorite").ClientID %>') = "../images/loader.gif";
                                                        }
                                                    </script>
                                                    <asp:LinkButton ID="lbtn_MarkAsInterest" runat="server" CommandName="Interest">
                                                        <asp:Image ID="img_favorite" runat="server" onclick="changeimage()" />
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="lbtn_View" runat="server" CommandName="View" ToolTip="Check your email to view all attachments">
                                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/icons/CRUD/view.png" />
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="lbtn_Delete" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure to delete this job?');">
                                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/images/icons/CRUD/delete.png" ToolTip="Delete this application" />
                                                    </asp:LinkButton>
                                                    <asp:HiddenField ID="HiddenField_ID" runat="server" />
                                                    <asp:HiddenField ID="HiddenField_ReadBefore" runat="server" />
                                                    <asp:HiddenField ID="HiddenField_Favorite" runat="server" />
                                                    <asp:HiddenField ID="HiddenField_CandidateId" runat="server" />
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </tbody> </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="clear-floats">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col span-31 last" id="member-nav">
        <div class="module">
            <p class="home">
                <span class="icon"></span><a id="A1" href="~/Employer/EmployerSite.aspx" runat="server">
                    <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource,Employermanagement %>"></asp:Literal></a></p>
            <div id="my-cvs">
                <h3>
                    <span class="icon"></span>
                    <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,MyJobs %>"></asp:Literal></h3>
                <ul>
                    <li><a id="A2" href="~/memberArea/AdsAJob.aspx" runat="server">
                        <asp:Literal ID="Literal8" runat="server" Text="<%$Resources:Resource,CreateaJob %>"></asp:Literal></a></li>
                    <li><a id="A5" href="~/Employer/TeacherTraining.aspx" runat="server" visible="false">
                        <asp:Literal ID="Literal16" runat="server" Text="Post a training course"></asp:Literal></a></li>
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
</asp:Content>
