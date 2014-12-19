<%@ Page Language="C#" MasterPageFile="~/Templates/Masterpage/HomeIntership.Master" AutoEventWireup="true" CodeBehind="visa-service.aspx.cs" Inherits="TeachingJob.Templates.Pages.visa_service" %>

<%@ Register TagPrefix="tj" TagName="SocialLink" Src="~/Templates/UserControl/SocialLinkArticle.ascx" %>
<%@ Register TagPrefix="tj" TagName="IntershipAds" Src="~/Templates/UserControl/IntershipAds.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
<title>Visa Service - Teachinvietnam</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
<link type="text/css" href="/Styles/intership.css" rel="Stylesheet" media="screen" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Banner" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
<div id="intershipPage">
        <div id="home-heading">
            <div class="page-header">
                <%--<h4>Visa Service</h4>--%>
                <div class="ddlYear" style="float: right">
                    <tj:SocialLink ID="SocialLink" runat="server" />
                </div>
            </div>
            <div class="clear-floats">
            </div>
            <asp:Label ID="lbl_MainInfo" runat="server" Text=""></asp:Label>
        </div>
        <div id="home-subContent">
            <tj:IntershipAds ID="ads" runat="server" />
        </div>
        <div class="clear-floats">
        </div>
    </div>
</asp:Content>