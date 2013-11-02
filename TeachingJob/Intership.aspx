<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/Masterpage/HomeIntership.Master"
    AutoEventWireup="true" CodeBehind="Intership.aspx.cs" Inherits="TeachingJob.Intership" %>
<%@ Register TagPrefix="tj" TagName="SocialLink" Src="~/Templates/UserControl/SocialLinkArticle.ascx" %>
<%@ Register TagPrefix="tj" TagName="IntershipAds" Src="~/Templates/UserControl/IntershipAds.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>Intership - Teachinvietnam</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <link type="text/css" href="/Styles/intership.css" rel="Stylesheet" media="screen" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="intershipPage">
        <div id="home-heading">
            <div class="page-header">
                <h2>Lastest News</h2>
                <div class="ddlYear" style="float: right">
                    <tj:SocialLink ID="SocialLink" runat="server" />
                   <%-- <asp:DropDownList ID="ddlIntYear" runat="server" Visible="false">
                    </asp:DropDownList>--%>
                </div>
            </div>
            <div class="clear-floats">
            </div>
            <asp:Repeater ID="rpt_IntershipArticle" runat="server" OnItemDataBound="rpt_IntershipArticle_OnDataBound">
                <ItemTemplate>
                    <div class="articleWrapper">
                        <div>
                            <div class="header">
                                <h4><asp:HyperLink ID="aHeaderLink" runat="server"></asp:HyperLink></h4>
                            </div>
                            <%--<div class="sharelink">
                                
                            </div>--%>
                        </div>
                        <div class="clear-floats"></div>
                        <div>
                            <asp:Label ID="aIntroduction" runat="server"></asp:Label>
                        </div>
                        <div class="createdDate">
                            Created on:
                            <asp:Literal ID="liCreatedDate" runat="server"></asp:Literal>
                        </div>
                        <div class="createdDate">
                            <p style="margin: 5px 0 5px 0">
                                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="standard-button orange small apply-button"
                                    NavigateUrl="~/Templates/Pages/InternshipGuide.aspx">Get free guide &raquo;</asp:HyperLink>
                                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="standard-button orange small apply-button"
                                    NavigateUrl="~/Templates/Pages/SubmitYourInternship.aspx">Apply Online &raquo;</asp:HyperLink>
                            </p>
                        </div>
                        <hr class="hr" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div id="home-subContent">
            <tj:IntershipAds ID="ads" runat="server" />
        </div>
        <div class="clear-floats">
        </div>
    </div>
</asp:Content>
