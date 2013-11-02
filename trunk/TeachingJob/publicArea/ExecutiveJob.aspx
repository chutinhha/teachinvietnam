<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExecutiveJob.aspx.cs" Inherits="TeachingJob.publicArea.ExecutiveJob" EnableViewState="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<title>
    <asp:Literal ID="Literal19" runat="server" Text="<%$Resources:Resource,ExecutiveJobs %>"></asp:Literal> - TeachinVietnam</title>
    <link href="../css/content.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <div class='editable-area span-12'>
        <div class='section'>
            <div class='col span-12 last'>
            </div>
        </div>
        <div class='section'>
            <div class='col span-8'>
                <div class='component component-LatestJobs'>
                    <div class="module public-sector">
                        <div class="module-title">
                            <h2>
                                <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,NewestExecutiveJobs %>"></asp:Literal></h2>
                            <div class="clear-floats">
                            </div>
                        </div>
                        <ul id="mod-tabs" class="light-grey-gradient">
                            <li class="selected"><a href="#All-tab"><asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,All %>"></asp:Literal></a></li>
                            <li><a href="#Education-tab"><asp:Literal ID="Literal3" runat="server"></asp:Literal></a></li>
                            <li><a href="#Health-tab"><asp:Literal ID="Literal4" runat="server"></asp:Literal></a></li>
                            <li><a href="#Civil-Service-tab"><asp:Literal ID="Literal5" runat="server"></asp:Literal></a></li>
                        </ul>
                        <div id="All-tab" class="job-type-tab show">
                            <table class="latest-jobs public-sector">
                                <tr class="header">
                                    <th class="title paddingleft">
                                        <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource,titletxt %>"></asp:Literal>
                                    </th>
                                    <th class="salary">
                                        <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource,Salary %>"></asp:Literal>
                                    </th>
                                    <th class="added" align="right">
                                        <asp:Literal ID="Literal8" runat="server" Text="<%$Resources:Resource,ClosingDate %>"></asp:Literal>
                                    </th>
                                </tr>
                                <asp:Repeater ID="Repeater_AllJobByAllSector" runat="server" OnItemDataBound="Repeater_AllJobByAllSector_DataBound">
                                <ItemTemplate>
                                <tr class="industry-19">
                                    <td class="job-title">
                                        <a href="JobDetails.aspx?jId=<%#Eval("jId") %>">
                                            <strong>
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
                        <div id="Education-tab" class="job-type-tab hide">
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
                                <asp:Repeater ID="Repeater_GetAllJobByAdministration" runat="server" OnItemDataBound="Repeater_GetAllJobByAdministration_DataBound">
                                <ItemTemplate>
                                <tr class="industry-19">
                                    <td class="job-title">
                                        <a href="JobDetails.aspx?jId=<%#Eval("jId") %>">
                                            <strong>
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
                                <asp:Repeater ID="Repeater_GetAllJobByThrough" runat="server" OnItemDataBound="Repeater_GetAllJobByThrough_DataBound">
                                <ItemTemplate>
                                <tr class="industry-19">
                                    <td class="job-title">
                                        <a href="JobDetails.aspx?jId=<%#Eval("jId") %>">
                                            <strong>
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
                                <asp:Repeater ID="Repeater_GetAllJobByAcademic" runat="server" OnItemDataBound="Repeater_GetAllJobByAcademic_DataBound">
                                <ItemTemplate>
                                <tr class="industry-19">
                                    <td class="job-title">
                                        <a href="JobDetails.aspx?jId=<%#Eval("jId") %>">
                                            <strong>
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
                        </div>
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
                <div class='component component-Advert'>
                    <div class="module mpu  pagelets-module">
                        <div class="component-container">
                            <div class="advert  public-sector MPU">
                                
                                <noscript>
                                    <a href=""
                                        target="_blank">
                                        <img src=""
                                            border="0" alt="" /></a></noscript>
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
