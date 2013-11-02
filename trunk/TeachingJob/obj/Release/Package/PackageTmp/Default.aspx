<%@ Page Title="Teaching in Vietnam" Language="C#" MasterPageFile="~/Site.master" 
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TeachingJob._Default" EnableViewState="false" %>

<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
    <title>
        <asp:Literal ID="Literal8" runat="server" Text="<%$Resources:Resource, Homepagetxt %>"></asp:Literal>
    </title>
</asp:Content>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <%--<script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-34143082-1']);
        _gaq.push(['_setDomainName', 'teachinvietnam.org']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>--%>
    <link type="text/css" href="/Styles/intership.css" rel="Stylesheet" media="screen" />
    <style type="text/css">
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<div id="intershipPage">
        <div id="home-heading">
    <div class='editable-area span-12'>
        <div class='section'>
            <div class='col span-12 last'>
            </div>
        </div>
        <div class='section'>
            <!--Left Column-->
            <div class='col span-8'>
                <div class='component component-CurrentlyRecruiting'>
                    <div class="module no-border-radius">
                        <div id="currently-recruiting-outer">
                            <div class="module-title">
                                <h2>
                                    <asp:Label ID="lbl_FeaturedEmployers" runat="server" Text="<%$Resources:Resource, FeaturedJobtxt %>"></asp:Label></h2>
                            </div>
                            <div class="paddingtop10px">
                                    <asp:DataList ID="dataListJobSlide" runat="server" RepeatDirection="Vertical" Width="100%" CssClass="featured-jobs" OnItemDataBound="dataListJobSlide_ItemDataBound">
                                        <ItemTemplate>
                                            <div>
                                                <ul>
                                                    <li>
                                                        <div class="label_comp">
                                                            <div class="job-title"><asp:HyperLink ID="hpl_Title" runat="server"></asp:HyperLink></div>
                                                            <div class="company-name"><asp:Label ID="lbl_OrganizationName" runat="server" ToolTip="<%$Resources:Resource, CompanyNametxt %>" CssClass="orgname"></asp:Label></div>
                                                        </div>
                                                        <%--<span class="img" style="display:none">
                                                            <asp:HyperLink ID="HyperLink1" runat="server">
                                                                <asp:Image ID="Image1" runat="server" CssClass="recruiter-logo" />
                                                            </asp:HyperLink></span>--%> </li>
                                                </ul>
                                                <div class="clear-floats">
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="template-box">
                    <div style="padding-bottom:5px"><asp:Label ID="Label2" runat="server" CssClass="heading" Text="Internships"></asp:Label></div>
                    <div class="articleWrapper">
                        <div>
                            <div class="header">
                                <h4><asp:HyperLink ID="aHeaderLink" runat="server"></asp:HyperLink></h4>
                            </div>
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
                                <asp:HyperLink ID="HyperLink22" runat="server" CssClass="standard-button orange small apply-button"
                                    NavigateUrl="~/Templates/Pages/SubmitYourInternship.aspx">Apply Online &raquo;</asp:HyperLink>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <!--End Left Column-->
            <!--Right Column-->
            <div class='col span-295 employer-logo-block float-right-only'>
                <div class='component'>
                    <div class="module no-border-radius" style="padding:2px !important">
                        <div class="featured-employer">
                            <asp:Label ID="Label1" runat="server" CssClass="featurelogoheading" Text="<%$Resources:Resource, FeaturedEmployerstxt %>"></asp:Label>
                        </div>
                        <div>
                            <asp:DataList ID="dl_featureLogo" runat="server" CssClass="featurelogo" OnItemDataBound="dl_featureLogo_DataBound" RepeatColumns="2" RepeatDirection="Vertical">
                                <ItemTemplate>
                                    <asp:Image ID="imgFeaturedLogo" runat="server"  />
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                </div>

                <div class='component component-LatestJobs'>
                    <div class="module">
                        <div class="simple-tabs" id="about-tabs">
                            <div class="module-title">
                                <ul>
                                    <li><a href="#panel1">
                                        <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource, Newjobstxt %>"></asp:Literal></a></li>
                                    <li><a href="#panel2">
                                        <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource, Newresumestxt %>"></asp:Literal></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="panels">
                            <div class="inner">
                                <div id="panel1" class="simple-tab-panel homepage-latest-panel">
                                    <asp:Repeater ID="Repeater_NewestJobs" runat="server" OnItemDataBound="NewestJobs_DataBound">
                                        <HeaderTemplate>
                                            <table class="latest-jobs">
                                               <%-- <tr class="header">
                                                    <th class="paddingleft">
                                                        <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource, titletxt %>"></asp:Literal>
                                                    </th>
                                                    <th class="added1" align="right">
                                                        <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource, ClosingDatetxt %>"></asp:Literal>
                                                    </th>
                                                </tr>--%>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr class="industry-0">
                                                <td>
                                                    <div class="tdjob-title">
                                                        <asp:HyperLink ID="hpl_NewestJobTitle" runat="server">
                                                    <strong><%#CutTitle(Eval("Title"),50)%></strong> 
                                                        </asp:HyperLink>
                                                        <br />
                                                        <%#Eval("Avatar") %></div>
                                                </td>
                                                <%--<td class="added1" align="right">
                                                    <div class="tdclosingDate">
                                                        <%#Eval("ClosingDate","{0:MMM} {0:dd}, {0:yyyy}") %>
                                                    </div>
                                                </td>--%>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                    <a id="see-more-jobs" href="publicArea/NewJobs.aspx" class="float-right">
                                        <asp:Literal ID="Literal10" runat="server" Text="<%$Resources:Resource, viewalltxt %>"></asp:Literal></a>
                                </div>
                                <div id="panel2" class="simple-tab-panel homepage-latest-panel">
                                    <asp:Repeater ID="repeater_GetTop6CV" runat="server" OnItemDataBound="repeater_GetTop6CV_DataBound">
                                        <HeaderTemplate>
                                            <table class="latest-jobs">
                                                <%--<tr class="header">
                                                    <th class="paddingleft">
                                                        <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource, CVtitlenametxt %>"></asp:Literal>
                                                    </th>
                                                    <th class="added" align="right">
                                                        <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource, addtxt %>"></asp:Literal>
                                                    </th>
                                                </tr>--%>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr class="industry-0">
                                                <td class="job-title nooverflow" title="CV title / Candidate name">
                                                    <div class="tdjob-title">
                                                        <asp:HyperLink ID="hpl_CvLink" runat="server" Target="_blank">
                                                        <strong>
                                                        <%#CutTitle(Eval("Major"),50)%></strong> </asp:HyperLink></div>
                                                    <div class="tdjob-title nooverflow">
                                                        <%#Eval("Fullname")%></div>
                                                </td>
                                                <%--<td class="paddingright added2" align="right">
                                                    <div class="tdclosingDate">
                                                        <%#Eval("Uploaddate", "{0:MMM} {0:dd}, {0:yyyy}")%>
                                                    </div>
                                                </td>--%>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/publicArea/CV/SearchResultcv.aspx?kw=&cate=&location=&citizen="
                                        CssClass="float-right">
                                        <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource, viewalltxt %>"></asp:Literal></asp:HyperLink>
                                </div>
                            </div>
                        </div>
                        <script type="text/javascript">

                            $(document).ready(function () {
                                $('#about-tabs').simpleTabs();
                            });

                        </script>
                    </div>
                </div>
            </div>
            <!--End Right Column-->
        </div>
        
        <%--<div class='section'>
            <div class='col span-12 last'>
                <div class='component component-BeInspired'>
                    <div id="job-people-19864" class="job-people dot-slider hero">
                        <h2>
                            <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource, FeaturedCandidatestxt %>"></asp:Literal>
                        </h2>
                        <div class="wrapper slide-wrapper">
                            <div class="content slides">
                                <asp:Repeater ID="repeater_GetTop16CV" runat="server" OnItemDataBound="GetTop16CV_DataBind">
                                    <ItemTemplate>
                                        <div class="slide">
                                            <div class="person">
                                                <div class="module">
                                                    <asp:HyperLink ID="hpl_Logo" runat="server" Target="_blank">
                                                        <asp:Image ID="img_Logo" runat="server" CssClass="maxheightCV" Height="125px" Width="200px" />
                                                    </asp:HyperLink>
                                                    <p>
                                                        <strong>
                                                            <asp:HyperLink ID="hpl_Username" runat="server" Text="" Target="_blank"></asp:HyperLink>
                                                        </strong>
                                                        <br />
                                                        <asp:Label ID="lbl_Major" runat="server" Text=""></asp:Label>
                                                        <br />
                                                        <asp:Label ID="lbl_Interest" runat="server" Text=""></asp:Label>
                                                        <br />
                                                        <asp:HyperLink ID="hpl_readmore" runat="server" CssClass="read-more" Target="_blank">
                                                            <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource, ReadmyCVtxt %>"></asp:Literal></asp:HyperLink>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <div class="dots-nav">
                            <ul>
                                <%for (int i = 0; i < repeater_GetTop16CV.Items.Count / 4; i++)
                                  { %>
                                <li><a href="#"></a></li>
                                <%} %>
                            </ul>
                        </div>
                    </div>
                    <script type="text/javascript">
                        $(window).load(function () {
                            $("#job-people-19864").dotSlider();
                        });

                    </script>
                </div>
            </div>
        </div>--%>
    </div>
            
        </div>
        <div class="clear-floats">
        </div>
    </div>
</asp:Content>
