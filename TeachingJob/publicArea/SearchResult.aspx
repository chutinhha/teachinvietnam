<%@ Page Title="Teaching in Vietnam" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="TeachingJob.publicArea.SearchResult" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<title>
    <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,Searchresult %>"></asp:Literal> - TeachinVietnam</title>
    <link href="../css/preparation.css" rel="stylesheet" type="text/css" />
    <link href="../css/content.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col span-9" id="search-results">
        <div class="module-title1">
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div id="results" class="module list">
                    <div id="list-grid-container" class="results-container module ">
                        <div class="search-options">
                            <div class="inner">
                                <p class="large-text" id="count-stats">
                                    <strong>
                                        <asp:Literal ID="Literal1" runat="server"></asp:Literal></strong> 
                                    <asp:Label ID="Label1" runat="server" Text="<%$Resources:Resource,Jobsfound %>"></asp:Label></p>
                                <div class="sort">
                                    <p>
                                        <strong>
                                            <asp:Label ID="lbl_sortBy" runat="server" Text="<%$Resources:Resource,SortBy %>" Visible="false"></asp:Label>
                                        </strong>
                                        <asp:DropDownList ID="ddl_SchoolType" runat="server" CssClass="dropdown2" AutoPostBack="true"
                                            OnSelectedIndexChanged="SchoolType_SelectedIndexChanged"  Visible="false">
                                            <asp:ListItem Selected="True" Value="">School type</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <asp:Label ID="lbl_DropdownST" runat="server" Text=""  Visible="false"></asp:Label>
                                    </p>
                                    <p>
                                        <strong>
                                            <asp:Label ID="lbl_ResultPerPage" runat="server" Text="<%$Resources:Resource,Resultperpage %>"></asp:Label>
                                        </strong>
                                        <asp:DropDownList ID="ddl_PageSize" runat="server" OnSelectedIndexChanged="PageSize_SelectChanged"
                                            AutoPostBack="true" CssClass="dropdown2">
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
                        <asp:ListView ID="ListView1" runat="server" OnItemDataBound="ListView1_DataBound">
                            <ItemTemplate>
                                <div class="result">
                                    <div class="logo">
                                        <table cellspacing="0">
                                            <tr>
                                                <td align="center" valign="middle" class="maxheight2">
                                                    <asp:Image ID="ImgLogo" runat="server"
                                                        CssClass="recruiter-logo maxheight2" ImageUrl="~/images/companyLogo/no_photo.jpg" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="details">
                                        <span class="title-recruiter">
                                            <h3 class="job-title">
                                                <asp:Button ID="btn_Location" runat="server" CssClass="standard-button1 small1" OnClientClick="this.disabled = true;" />
                                                &nbsp;-&nbsp;
                                                <span class="resulttitledisplay"><asp:HyperLink ID="hpl_Title" runat="server"></asp:HyperLink></span><%--<span class="tag new">New</span>--%>
                                            </h3>
                                            <div>
                                                <span class="h3spantag"><asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,RequiredCitizenship %>"></asp:Literal>:</span>
                                                <asp:Label ID="lbl_Citizenship" runat="server" Text="" CssClass="h3tag"></asp:Label>
                                            </div>
                                        </span>
                                        <br />
                                        <div class="clear-floats">
                                        </div>
                                        <div class="actions-date">
                                            <p class="closing-date vevent">
                                                <strong>
                                                    <asp:Label ID="lbl_Organization" runat="server" Text=""></asp:Label>
                                                    <br />
                                                    <abbr>
                                                        <strong class='contrast'>
                                                            <asp:Label ID="lbl_ClosingDate" runat="server" Text=""></asp:Label>
                                                        </strong>
                                                    </abbr>
                                                </strong>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="clear-floats">
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                        <div class="clear-floats">
                            </div>
                        <div class="pager bottom">
                            <p class="page-count no-marg">
                                <asp:Label ID="Label2" runat="server" Text="<%$Resources:Resource,Page %>"></asp:Label>
                                <asp:Label ID="lbl_currentPage" runat="server" Text=""></asp:Label>
                                <asp:Label ID="Label3" runat="server" Text="<%$Resources:Resource,of %>"></asp:Label>
                                <asp:Label ID="lbl_totalPage" runat="server" Text=""></asp:Label></p>
                            <ul id="pager0" class="pager">
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
                    <div class="clear-floats">
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="clear-floats">
        </div>
    </div>
</asp:Content>
