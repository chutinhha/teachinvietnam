<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="EmployerInfo.aspx.cs" Inherits="TeachingJob.publicArea.EmployerInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>
        <asp:Literal ID="title" runat="server"></asp:Literal>
        - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../css/brochure3805.css" type="text/css" rel="Stylesheet" />
    <link href="../css/preparation.css" rel="stylesheet" type="text/css" />
    <link href="../css/table.css" rel="stylesheet" type="text/css" />
    <%--<script src="../Styles/simple-tabs9fab.js?mt=1323683811" type="text/javascript"></script>
    <script src="../Styles/jquery-dialogfbf6.js?mt=1319121455" type="text/javascript"></script>--%>
    <script type='text/javascript'>
        $(function () {
            $('#tabs').simpleTabs();
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="connect">
        <div class="module">
            <div class="employer">
                <div class="employerInfo">
                    <h2 class="heading-type center contrast">
                        Employer Info</h2>
                </div>
                <div class="simple-tabs-panel-container">
                    <ul id="tabs" class="heading-type regular vertical-tabs">
                        <li class="simple-tab"><a href="#about" title="Employer Info">Employer Info</a></li>
                        <li class="simple-tab"><a href="#posted-job-list" title="Posted job list">Posted job
                            list</a></li>
                        <li class="simple-tab"><a href="#course" title="Employer's course">Training courses</a></li>
                    </ul>
                    <div class="panel custom-simple-tab-panel full-width" id="about">
                        <div class="inner">
                            <div id="recruiter">
                                <div id="r-info">
                                    <asp:Repeater ID="Repeater_Info" runat="server" OnItemDataBound="Repeater_Info_DataBound">
                                        <HeaderTemplate>
                                            <div id="r-logo" style="float: right;">
                                                <asp:Image ID="OrgLogo_img" runat="server" CssClass="img2" />
                                            </div>
                                            <h2 style="color: #4F4338; margin-bottom: 0;">
                                                <asp:Literal ID="li_OrgName" runat="server"></asp:Literal></h2>
                                            <table style="margin: 0; padding: 0; width: 100%" cellpadding="0" cellspacing="0">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td class="cot15">
                                                    <%#Eval("Name") %>
                                                </td>
                                                <td>
                                                    <%# Eval("Value") %>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <tr>
                                                <td>
                                                    <b>Brief desciption:</b>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_BriefInfo" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </div>
                                <div class="clear-floats">
                                </div>
                            </div>
                            <div class="clear-floats">
                            </div>
                        </div>
                    </div>
                    <div class="panel custom-simple-tab-panel full-width" id="posted-job-list">
                        <div class="inner">
                            <h2><asp:Literal ID="literal_postedJobInform" runat="server" Text=""></asp:Literal></h2>
                            <asp:Repeater ID="Repeater_PostedJob" runat="server" OnItemDataBound="Repeater_PostedJob_DataBound">
                                <HeaderTemplate>
                                    <table id="hor-minimalist-b" width="100%">
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
                                        <td class="cot15">
                                            <asp:Label ID="lbl_Upload" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td class="cot15">
                                            <asp:Label ID="lbl_Closing" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td class="cot10" align="center">
                                            <asp:Label ID="lbl_ViewCount" runat="server" Text="Status"></asp:Label>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </tbody> </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <div class="panel custom-simple-tab-panel full-width" id="course">
                        <div class="inner">
                            <h2><asp:Literal ID="literal_courseInform" runat="server" Text="Training Course"></asp:Literal></h2>
                            <asp:Repeater ID="Repeater_TrainingCourse" runat="server" OnItemDataBound="Repeater_TrainingCourse_ItemDataBound">
                                <HeaderTemplate>
                                    <div id="recruiter">
                                        <div id="r-info">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div class="trainingcourseinfo">
                                        <table style="margin: 0; padding: 0;" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td colspan="2">
                                                    <asp:Label ID="lbl_Certificate" runat="server" CssClass="bold biggerfont"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="cot15">
                                                    Length:
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_Length" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="cot15">
                                                    Time table:
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_timetable" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="cot15">
                                                    Cost:
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_cost" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="cot15">
                                                    Contact:
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_contact" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="cot15">
                                                    Course content:
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_content" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </ItemTemplate>
                                <SeparatorTemplate>
                                    <br />
                                </SeparatorTemplate>
                                <FooterTemplate>
                                    </div></div>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <div class="clear-floats">
                    </div>
                </div>
                <!-- end of simple tabs panel -->
            </div>
        </div>
    </div>
    <!-- end of #connect div  -->
    <div class="clear-floats">
    </div>
</asp:Content>
