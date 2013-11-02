<%@ Page Title="" Language="C#" MasterPageFile="~/Training.Master" AutoEventWireup="true" CodeBehind="TrainingCourse.aspx.cs" Inherits="TeachingJob.publicArea.Training.TrainingCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>Training courses - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../css/content.css" runat="server" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class='editable-area span-12'>
        <div class='section'>
            <div class='col span-12 last'>
            </div>
        </div>
        <div class='section'>
            <div class='col span-8'>
                <div class='component component-LatestJobs' id='c-5'>
                    <div class="module public-sector">
                        <div class="module-title">
                            <h2>
                                <asp:Literal ID="Literal1" runat="server" Text="Training courses"></asp:Literal></h2>
                            <div class="clear-floats">
                            </div>
                        </div>
                        <%--<ul id="mod-tabs" class="light-grey-gradient">
                            <li class="selected"><a href="#All-tab">
                                <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,All %>"></asp:Literal></a></li>
                            <li><a href="#Education-tab">
                                <asp:Literal ID="Literal3" runat="server"></asp:Literal></a></li>
                            <li><a href="#Health-tab">
                                <asp:Literal ID="Literal4" runat="server"></asp:Literal></a></li>
                            <li><a href="#Civil-Service-tab">
                                <asp:Literal ID="Literal5" runat="server"></asp:Literal></a></li>
                        </ul>--%>
                        
                        <div id="All-tab" class="job-type-tab1 show">
                            <table class="latest-jobs public-sector">
                                <tr class="header">
                                    <th class="title paddingleft">
                                        <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource,titletxt %>"></asp:Literal>
                                    </th>
                                    <th class="salary">
                                        <asp:Literal ID="Literal8" runat="server" Text="Certificate"></asp:Literal>
                                    </th>
                                    <th class="added" align="right">
                                        <asp:Literal ID="Literal7" runat="server" Text="Cost"></asp:Literal>
                                    </th>
                                </tr>
                                <asp:Repeater ID="Repeater_TrainingCourse" runat="server" OnItemDataBound="Repeater_TrainingCourse_DataBound">
                                    <ItemTemplate>
                                        <tr class="industry-19">
                                            <td class="job-title">
                                                <a href="#"><strong>
                                                    <asp:Label ID="lbl_Title" runat="server" Text=""></asp:Label>
                                                </strong></a>
                                                <br />
                                            </td>
                                            <td class="salary">
                                                <asp:Label ID="lbl_Certificate" runat="server" Text=""></asp:Label>
                                            </td>
                                            <td class="added" align="right">
                                                <asp:Label ID="lbl_Cost" runat="server" Text=""></asp:Label>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                        <%--<div id="Education-tab" class="job-type-tab hide">
                            <table class="latest-jobs public-sector">
                                <tr class="header">
                                    <th class="title paddingleft">
                                        <asp:Literal ID="Literal9" runat="server" Text="<%$Resources:Resource,titletxt %>"></asp:Literal>
                                    </th>
                                    <th class="salary">
                                        <asp:Literal ID="Literal10" runat="server" Text="<%$Resources:Resource,Salary %>"></asp:Literal>
                                    </th>
                                    <th class="added" align="right">
                                        <asp:Literal ID="Literal11" runat="server" Text="<%$Resources:Resource,ClosingDate %>"></asp:Literal>
                                    </th>
                                </tr>
                                <asp:Repeater ID="Repeater_GetAllJobByAdministration" runat="server" OnItemDataBound="Repeater2_DataBound">
                                    <ItemTemplate>
                                        <tr class="industry-19">
                                            <td class="job-title">
                                                <a href="JobDetails.aspx?jId=<%#Eval("jId") %>"><strong>
                                                    <asp:Label ID="lbl_Title" runat="server" Text=""></asp:Label>
                                                </strong></a>
                                                <br />
                                            </td>
                                            <td class="salary">
                                                <asp:Label ID="lbl_Salary" runat="server" Text=""></asp:Label>
                                            </td>
                                            <td class="added" align="right">
                                                <asp:Label ID="lbl_ClosingDate" runat="server" Text=""></asp:Label>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                        <div id="Health-tab" class="job-type-tab hide">
                            <table class="latest-jobs public-sector">
                                <tr class="header">
                                    <th class="title paddingleft">
                                        <asp:Literal ID="Literal12" runat="server" Text="<%$Resources:Resource,titletxt %>"></asp:Literal>
                                    </th>
                                    <th class="salary">
                                        <asp:Literal ID="Literal13" runat="server" Text="<%$Resources:Resource,Salary %>"></asp:Literal>
                                    </th>
                                    <th class="added" align="right">
                                        <asp:Literal ID="Literal14" runat="server" Text="<%$Resources:Resource,ClosingDate %>"></asp:Literal>
                                    </th>
                                </tr>
                                <asp:Repeater ID="Repeater_GetAllJobByThrough" runat="server" OnItemDataBound="Repeater3_DataBound">
                                    <ItemTemplate>
                                        <tr class="industry-19">
                                            <td class="job-title">
                                                <a href="JobDetails.aspx?jId=<%#Eval("jId") %>"><strong>
                                                    <asp:Label ID="lbl_Title" runat="server" Text=""></asp:Label>
                                                </strong></a>
                                                <br />
                                            </td>
                                            <td class="salary">
                                                <asp:Label ID="lbl_Salary" runat="server" Text=""></asp:Label>
                                            </td>
                                            <td class="added" align="right">
                                                <asp:Label ID="lbl_ClosingDate" runat="server" Text=""></asp:Label>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                        <div id="Civil-Service-tab" class="job-type-tab hide">
                            <table class="latest-jobs public-sector">
                                <tr class="header">
                                    <th class="title paddingleft">
                                        <asp:Literal ID="Literal15" runat="server" Text="<%$Resources:Resource,titletxt %>"></asp:Literal>
                                    </th>
                                    <th class="salary">
                                        <asp:Literal ID="Literal16" runat="server" Text="<%$Resources:Resource,Salary %>"></asp:Literal>
                                    </th>
                                    <th class="added" align="right">
                                        <asp:Literal ID="Literal17" runat="server" Text="<%$Resources:Resource,ClosingDate %>"></asp:Literal>
                                    </th>
                                </tr>
                                <asp:Repeater ID="Repeater_GetAllJobByAcademic" runat="server" OnItemDataBound="Repeater4_DataBound">
                                    <ItemTemplate>
                                        <tr class="industry-19">
                                            <td class="job-title">
                                                <a href="JobDetails.aspx?jId=<%#Eval("jId") %>"><strong>
                                                    <asp:Label ID="lbl_Title" runat="server" Text="Label"></asp:Label>
                                                </strong></a>
                                                <br />
                                            </td>
                                            <td class="salary">
                                                <asp:Label ID="lbl_Salary" runat="server" Text="Label"></asp:Label>
                                            </td>
                                            <td class="added" align="right">
                                                <asp:Label ID="lbl_ClosingDate" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>--%>
                        <a id="see-more-jobs" href="NewJobs.aspx" class="standard-button dark more">
                            <asp:Literal ID="Literal18" runat="server" Text="<%$Resources:Resource,Viewallnewjobs %>"></asp:Literal></a>
                    </div>
                    <script type="text/javascript">

                        $(document).ready(function () {
                            $('#mod-tabs').simpleTabs();
                        });

                    </script>
                </div>
            </div>
            <div class='col span-4 last'>
                <div class='component component-Advert' id='c-2'>
                    <div class="module mpu  pagelets-module">
                        <div class="component-container">
                            <div class="advert  public-sector MPU">
                                <noscript>
                                    <a href="" target="_blank">
                                        <img src="" alt="" /></a></noscript>
                                <div id="dfp-0">
                                </div>
                                <!-- end ad tag -->
                                <p class="small-text center no-marg">
                                    advertisement</p>
                            </div>
                        </div>
                        <div class="clear-floats">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
