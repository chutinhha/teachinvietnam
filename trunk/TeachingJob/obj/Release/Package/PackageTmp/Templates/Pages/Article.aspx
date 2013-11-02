<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/Masterpage/HomeIntership.Master"
    AutoEventWireup="true" CodeBehind="Article.aspx.cs" Inherits="TeachingJob.Templates.Pages.Article" %>

<%@ Register TagPrefix="tj" TagName="IntershipAds" Src="~/Templates/UserControl/IntershipAds.ascx" %>
<%@ Register TagPrefix="tj" TagName="SocialLink" Src="~/Templates/UserControl/SocialLinkArticle.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>
        <asp:Literal ID="liPageHeader" runat="server" Text="Intership - Teachinvietnam"></asp:Literal>
    </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <link type="text/css" href="/Styles/intership.css" rel="Stylesheet" media="screen" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="intershipPage">
        <div id="home-heading">
            <div class="articleWrapper">
                <div class="internshipartiletitle">
                    <div class="header">
                        <h4>
                            <asp:Label ID="aHeader" runat="server"></asp:Label></h4>
                    </div>
                    <div class="sharelink">
                        <tj:SocialLink ID="SocialLink" runat="server" />
                    </div>
                </div>
                <div class="clear-floats">
                </div>
                <div>
                    <asp:Label ID="aContent" runat="server"></asp:Label>
                </div>
                <div class="createdDate" style="padding: 10px;">
                    Created on:
                    <asp:Literal ID="liCreatedDate" runat="server"></asp:Literal>
                </div>
                 <div class="createdDate">
                    <p style="margin: 5px 0 5px 0">
                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="standard-button orange small"
                            NavigateUrl="~/Templates/Pages/InternshipGuide.aspx">Get free guide &raquo;</asp:HyperLink>
                    
                        <asp:HyperLink ID="HyperLink2" runat="server" CssClass="standard-button orange small"
                            NavigateUrl="~/Templates/Pages/SubmitYourInternship.aspx">Apply Online &raquo;</asp:HyperLink>
                    </p>
                </div>
            </div>
        </div>
        <div id="home-subContent">
            <tj:IntershipAds ID="ads" runat="server" />
        </div>
        <div class="clear-floats">
        </div>
    </div>
</asp:Content>
