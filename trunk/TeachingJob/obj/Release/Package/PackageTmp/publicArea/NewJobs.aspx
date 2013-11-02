<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="NewJobs.aspx.cs" Inherits="TeachingJob.publicArea.NewJobs" EnableViewState="true" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>
        <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,NewJobsList %>"></asp:Literal> - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col span-9" id="search-results">
        <div class="module-title1">
            <%--<h2>Job list</h2>--%>
        </div>
        <div id="results" class="module list">
            <div id="list-grid-container" class="results-container module ">
                <div class="search-options">
                    <div class="inner">
                        <p class="large-text" id="count-stats">
                            <strong>
                                <asp:Literal ID="Literal1" runat="server"></asp:Literal></strong> <asp:Label ID="Label1" runat="server" Text="<%$Resources:Resource,Jobsfound %>"></asp:Label></p>
                        <div class="sort">
                            <p>
                                <strong>
                                    <asp:Label ID="lbl_ResultPerPage" runat="server" Text="<%$Resources:Resource,Resultperpage %>"></asp:Label>
                                </strong>
                                <asp:DropDownList ID="ddl_PageSize" runat="server" OnSelectedIndexChanged="PageSize_SelectChanged"
                                    AutoPostBack="true">
                                    <asp:ListItem Value="12">12</asp:ListItem>
                                    <asp:ListItem Value="24">24</asp:ListItem>
                                    <asp:ListItem Value="36">36</asp:ListItem>
                                </asp:DropDownList>
                            </p>
                        </div>
                        <div class="clear-floats">
                        </div>
                    </div>
                </div>
                <!-- end of search-options -->
                <asp:ListView ID="ListView1" runat="server" OnItemDataBound="ListView1_DataBound">
                    <ItemTemplate>
                        <div class="result">
                            <!-- for the benefit of IE -->
                            <div class="logo">
                                <table cellspacing="0">
                                    <tr>
                                        <td align="center" valign="middle">
                                            <asp:Image ID="ImgLogo" runat="server" AlternateText="Company" ToolTip="Company logo"
                                                CssClass="maxheight2" ImageUrl="#" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="details">
                                <span class="title-recruiter">
                                    <h2 class="job-title">
                                        <asp:Button ID="btn_Location" runat="server" CssClass="standard-button1 small1" OnClientClick="this.disabled = true;" />
                                        - <span style="width: 300px; line-height: 16px; height: 16px; display: inline-block;
                                            overflow: hidden;">
                                            <asp:HyperLink ID="hpl_Title" runat="server"></asp:HyperLink></span><%--<span class="tag new">New</span>--%>
                                    </h2>
                                    <div class="h3tag">
                                        <asp:Label ID="lbl_Citizenship" runat="server" Text=""></asp:Label>
                                    </div>
                                </span>
                                <br />
                                <div class="clear-floats">
                                </div>
                                <div class="actions-date">
                                    <p class="closing-date vevent">
                                        <strong>
                                            <asp:Label ID="lbl_Organization" runat="server" Text="Not Specified"></asp:Label>
                                            <br />
                                            <abbr class="dtstart">
                                                <strong class='contrast'>
                                                    <asp:Label ID="lbl_ClosingDate" runat="server" Text=""></asp:Label>
                                                </strong>
                                            </abbr>
                                        </strong>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                <div class="clear-floats">
                </div>
                <div class="pager bottom">
                    <p class="page-count no-marg">
                        <asp:Label ID="Label2" runat="server" Text="<%$Resources:Resource,Page %>"></asp:Label>
                        <asp:Label ID="lbl_currentPage" runat="server" Text="Label"></asp:Label>
                        <asp:Label ID="Label3" runat="server" Text="<%$Resources:Resource,of %>"></asp:Label>
                        <asp:Label ID="lbl_totalPage" runat="server" Text="Label"></asp:Label></p>
                    <ul id="pager0" class="pager">
                        <cc1:CollectionPager ID="CollectionPager1" BackText="Prev &amp;nbsp;" LabelText=""
                            NextText="&amp;nbsp; Next" ShowFirstLast="False" SliderSize="5" PagingMode="PostBack"
                            runat="server" BackNextLinkSeparator="" BackNextLocation="Split" PageNumbersDisplay="Numbers"
                            ResultsLocation="None" BackNextDisplay="HyperLinks" HideOnSinglePage="True">
                        </cc1:CollectionPager>
                    </ul>
                    <div class="clear-floats">
                    </div>
                </div>
                <div class="clear-floats">
                </div>
            </div>
            <div class="clear-floats">
            </div>
        </div>
        <div class="clear-floats">
        </div>
    </div>
</asp:Content>
