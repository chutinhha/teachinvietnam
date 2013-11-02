<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SearchResultcv.aspx.cs" Inherits="TeachingJob.publicArea.CV.SearchResultcv" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Search Results</title>
    <link href="../../css/content.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .pagination
        {
            color: #FFFFFF;
            font-weight: bold;
            background: #4769a4;
        }
        .saveicon
        {
            padding-top: -50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="job-profiles" class="job-wall">
        <div id="search-wall" class="module1">
            <div>
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
                                <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,Resultperpage %>"></asp:Literal>
                                &nbsp;&nbsp;
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
                <asp:Label ID="Label1" runat="server" Text="<%$Resources:Resource,Noresumefound %>"></asp:Label></div>
        </asp:Panel>
        <asp:DataList ID="DataList1" runat="server" OnItemDataBound="DataList_DataBound"
            OnItemCommand="DataList1_OnCommand" RepeatColumns="3" RepeatDirection="Horizontal">
            <ItemTemplate>
                <div class="col span-31">
                    <div class="module">
                        <asp:HyperLink ID="hpl_Image" runat="server" Target="_blank">
                            <asp:Image ID="Img" runat="server" Height="100px" Width="100%" />
                        </asp:HyperLink>
                        <p class="ptagcvsearch">
                            <asp:HyperLink ID="hpl_Fullname" runat="server" Target="_blank"></asp:HyperLink>
                            <asp:LinkButton ID="lbtn_SavedJob" runat="server" CommandName="save">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/icons/tick_circle.png" CssClass="saveicon"
                                    ToolTip="Save this resume" />
                            </asp:LinkButton>
                        </p>
                        <p class="ptagcvsearch">
                            <asp:Label ID="lbl_Major" runat="server" Text="" CssClass="lblmajorcvsearch"></asp:Label></p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
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
</asp:Content>
