<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/Masterpage/HomeIntership.Master" AutoEventWireup="true" CodeBehind="services.aspx.cs" Inherits="TeachingJob.s.services" %>
<%@ Register TagPrefix="tj" TagName="SocialLink" Src="~/Templates/UserControl/SocialLinkArticle.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
<title>Services - Teach in Vietnam</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
<link type="text/css" href="/Styles/intership.css" rel="Stylesheet" media="screen" />
<style type="text/css">
    #tabs li {border-bottom:none !important; border-right:none !important}
    /*.subtab{padding:0 5px 20px 20px !important}
    #service-tabs li{border:1px solid #888;}*/
    #service-tabs{float:left;  list-style:none;  margin: 0 -1px 0 12px;  padding:0;  font-size:1.4em;  display:block; width:190px; border-right:1px solid #ddd}    
    #service-tabs li a{display:block;text-decoration:none;color:#888;font-size:14px}
    #service-tabs li a:hover{color:#009a9a;text-decoration:underline}
    #service-tabs .selected{color:#009a9a; font-weight:bold;  background-color:#fff;  margin-right:-1px;  border-right:1px solid #fff}
    #service-tabs li ul li a{background-image:url('../images/sitefiles/menu-left-icon_2.png'); background-repeat:no-repeat; background-position:5px 10px; color:#888;font-size:12px; padding-left:20px}
</style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Banner" runat="server">
    <div>
    <div class="border-top">&nbsp;</div>
        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/services/prepare/internshipbanner.jpg" Width="100%" />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<div id="intershipPage">
        <div id="home-heading" class="width100percent">
            <div class="page-header">
                <h2>Services</h2>
                <div class="ddlYear" style="float: right">
                    <tj:SocialLink ID="SocialLink" runat="server" />
                </div>
            </div>
            <div class="clear-floats">
            </div>

            <div class="simple-tabs-panel-container">
                <asp:Repeater ID="repeater_tabs" runat="server" OnItemDataBound="repeater_tabs_databound">
                        <HeaderTemplate>
                            <ul id="service-tabs">
                            <div style="margin-left: -12px;"><img src="../images/sitefiles/programTitle-vietnam199x66.png" /></div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <asp:HyperLink ID="hplTabs" runat="server"></asp:HyperLink>
                                <asp:Repeater ID="repeater_subtabs" runat="server" OnItemDataBound="repeater_subtabs_databound">
                                    <HeaderTemplate><ul></HeaderTemplate>
                                    <ItemTemplate>
                                        <li><asp:HyperLink ID="hplSubTabs" runat="server"></asp:HyperLink></li>
                                    </ItemTemplate>
                                    <FooterTemplate></ul></FooterTemplate>
                                </asp:Repeater>
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                </asp:Repeater>
                <div class="panel custom-simple-tab-panel full-width simple-tab-panel" id="Why-teach-in-Vietnam" style="display: block;">
                    <div class="inner">
                        <h5 class="heading-type large-heading green">
                            <asp:Label ID="lblHeader" runat="server"></asp:Label>
                        </h5>
                        <hr style="border:0; border-bottom:1px solid gray" />
                        <asp:Label ID="lblContent" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="clear-floats">
                </div>
            </div>
        </div>
        <div class="clear-floats">
        </div>
    </div>
</asp:Content>
