<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="JobDetails.aspx.cs" Inherits="TeachingJob.publicArea.JobDetails" %>
    
<%@ Register TagPrefix="tj" TagName="SocialLink" Src="~/Templates/UserControl/SocialLinkArticle.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../css/brochure3805.css" type="text/css" rel="Stylesheet" />
    <link href="../css/content.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            var text = $('#content1').html();
            var extract = text.substring(0, 400) + "...";
            $('#content1').html(extract);
            $('#button').html('<a href="#" class="more">Show More</a>');
            more(text);
        });

        this.more = function (text) {
            $('.more').click(function () {
                $('#content1').html(text);
                $('#content1').append('<div class="position"></div>');
                position();
                $('#button').html('<a href="#" class="less">Show Less</a>');
                return false;
            });
        }

        this.position = function () {
            var p = $(".position");
            var position = p.position();
            var pos_top = position.top-90;
            $('#content1').animate({ height: pos_top + 'px' }, function () {
                less();
            });
        }

        this.less = function () {
            $('.less').click(function () {
                $('#content1').animate({ height: '80px' }, function () {
                    var text = $('#content1').html();
                    var extract = text.substring(0, 400) + "...";
                    $('#content1').html(extract);
                    $('#button').html('<a href="#" class="more">Show More</a>');
                    more(text);
                });
                return false;
            });
        }
    </script>
    <style type="text/css">
        .section_content div.date, #header, .contact_sx #invia, #social ul li, #social ul li#social_top, #social ul li#social_bottom, #social_button, #footer
        {
            background-image: url(img/colors/celestial_sky.png);
        }
        h2, h4
        {
            color: #3380AB;
        }
        h3
        {
            color: #1B445C;
        }
        #content1
        {
            overflow: hidden;
        }
        .less
        {
            font-size: 12px;
            margin-left: 40px;
        }
        .more
        {
            font-size: 12px;
            font-weight: bold;
            margin-left: 40px;
        }
        #button
        {
            margin-bottom: 20px;
            margin-top: 5px;
        }
        .displaynone
        {
            display: none;
        }
    </style>    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
    <title>
        <%= Job.Title + " - " + Job.Workplace + " - TeachinVietnam" %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col span-10">
        <div id="brochure-nav">
            &laquo;
            <asp:HyperLink ID="hpl_PreviousUrl" runat="server" Text="<%$Resources:Resource,Return %>"></asp:HyperLink>
            <div class="prev-next-links">
            </div>
            <div class="clear-floats">
            </div>
        </div>
        <div id="brochure" class="module">
            <div id="main">
                <div id="main-details">
                    <h1>
                        <%= Job.Title %></h1>
                    <hr />
                    <div class="apply-group">
                        <ul class="dates">
                            <li>
                                <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,Viewed %>"></asp:Literal><br />
                                <b>
                                    <%=Job.Viewcount %></b> </li>
                            <li class="added">
                                <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,Added %>"></asp:Literal>
                                <br />
                                <strong>
                                    <asp:Label ID="UploadDate_lbl" runat="server" Text="N/A"></asp:Label></strong></li>
                            <li class="vevent">
                                <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,ClosingDate %>"></asp:Literal><br />
                                <strong class="contrast">
                                    <abbr class="dtstart">
                                        <asp:Label ID="ClosingDate_lbl" runat="server" Text="N/A"></asp:Label></abbr></strong></li>
                        </ul>
                        <div class="clear-floats">
                        </div>
                    </div>
                    <div class='topright'>
                    </div>
                    <div class="clear-floats">
                    </div>
                </div>
                <div class="clear-floats">
                </div>
            </div>
            <div id="recruiter">
                <div id="recruiter-logo">
                    <table cellspacing="0">
                        <tr>
                            <td valign="top">
                                <asp:Image ID="OrgLogo_img" runat="server" CssClass="recruiter-logo img" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="recruiter-details" class="vcard org">
                    <h2 class="fn">
                        <%= Job.OrgName %></h2>
                    <p class="tel">
                        <%= Job.OrgType %>
                        <%if (Job.SchoolType != "")
                          { %>
                        -
                        <%=Job.SchoolType%><%} %>
                        <br />
                        <%= Job.OrgAddress1 %>
                        <br />
                        <a href="<%= "http://"+Job.Website %>" target="_blank" rel="nofollow">
                            <abbr class="url" title="<%= Job.Website %>">
                                <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,VisitEmployerWebsite %>"></asp:Literal></abbr></a>
                    </p>
                </div>
                <div class="clear-floats">
                </div>
                <div id="content1" class="OrgDescription">
                    <p class="OrgDescription">
                        <asp:Label ID="lbl_BriefInfo" runat="server" Text=""></asp:Label>
                    </p>
                </div>
                <div id="button">
                </div>
            </div>
            <div class="clear-floats">
            </div>
            <div id="details">
                <div id="summary">
                    <h3>
                        <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource,JobSummary %>"></asp:Literal></h3>
                    <dl>
                        <dt>
                            <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource,Employer %>"></asp:Literal>
                        </dt>
                        <dd>
                            <%= Job.OrgName %></dd>
                        <dt>
                            <asp:Literal ID="Literal11" runat="server" Text="<%$Resources:Resource,JobLevel %>"></asp:Literal></dt>
                        <dd>
                            <%= Job.JobLevel %><br />
                        </dd>
                        <dt>
                            <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource,Category %>"></asp:Literal></dt>
                        <dd>
                            <%= Job.Category %>
                            <%  if (Job.Category2 != "") { Response.Write("<br />" + Job.Category2); } %>
                            <%  if (Job.Category3 != "") { Response.Write("<br />" + Job.Category3); } %>
                        </dd>
                        <dt>
                            <asp:Literal ID="Literal8" runat="server" Text="<%$Resources:Resource,JobLocation %>"></asp:Literal></dt>
                        <dd>
                            <%= Job.Workplace %>
                            <%if (Job.Workplace2 != "") { Response.Write("<br />" + Job.Workplace2); } %>
                            <%if (Job.Workplace3 != "") { Response.Write("<br />" + Job.Workplace3); } %>
                        </dd>
                        <dt>
                            <asp:Literal ID="Literal9" runat="server" Text="<%$Resources:Resource,Salary %>"></asp:Literal></dt>
                        <dd>
                            <asp:Label ID="lbl_Salary" runat="server" Text=""></asp:Label></dd>
                        <dt>
                            <asp:Literal ID="Literal10" runat="server" Text="<%$Resources:Resource,RequiredCitizenship %>"></asp:Literal></dt>
                        <dd>
                            <%= Job.Citizenship %></dd>
                        <dt>
                            <asp:Literal ID="Literal12" runat="server" Text="<%$Resources:Resource,RequiredEducation %>"></asp:Literal></dt>
                        <dd>
                            <%= Job.EduRequirement %></dd>
                        <dt>
                            <asp:Literal ID="Literal13" runat="server" Text="<%$Resources:Resource,EmploymentType %>"></asp:Literal></dt>
                        <dd>
                            <%= Job.EmploymentType %></dd>
                        <dt>
                            <asp:Literal ID="Literal14" runat="server" Text="<%$Resources:Resource,Contact %>"></asp:Literal></dt>
                        <dd>
                            <a href="mailTo:<%= Job.EmailForEmployer %>">
                                <%= Job.Contact %></a></dd>
                    </dl>
                </div>
                <div class="description">
                    <div class="h3">
                        <asp:Label ID="AboutTheJob_lbl" runat="server" Text="<%$Resources:Resource,JobDetails %>"></asp:Label></div>
                    <p>
                        <asp:Label ID="lbl_Description" runat="server" Text="Description"></asp:Label>
                    </p>
                </div>
                <div class="clear-floats">
                </div>
            </div>
            <%--<div id="apply1">
                <table>
                    <tr>
                        <td>
                            <span class="ref"><a href="#" class="favouritelink"><span class='icon'></span>Save this
                    job!</a> </span>
                        </td>
                        <td>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Mailto:">Mail to a friend</asp:HyperLink>
                        </td>
                        <td>
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="#">Google+</asp:HyperLink>
                        </td>
                        <td>
                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="#">Tweet</asp:HyperLink>
                        </td>
                        <td>
                            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="#">Print</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </div>--%>
            <div id="apply">
                <asp:Button ID="btn_Apply" runat="server" CssClass="standard-button orange small apply-button"
                    Text="<%$Resources:Resource,Applyforthisjob %>" OnClick="Apply_Click" />
                <asp:Button ID="Button1" runat="server" CssClass="standard-button orange small apply-button"
                    Text="Quick apply" OnClick="ApplyWithoutLogin_Click" ToolTip="Apply without login" />
                <asp:Button ID="btn_SaveJob" runat="server" Text="<%$Resources:Resource,Savethisjob %>"
                    CssClass="standard-button blue small" OnClick="savejob_Click" />
                <asp:Button ID="btn_Edit" runat="server" Text="<%$Resources:Resource,Keepediting %>"
                    CssClass="standard-button blue small" OnClick="Edit_Click" Visible="false" />
                    <div class="float-right">
                        <tj:SocialLink ID="SocialLink" runat="server" />
                    </div>
                <div class="clear-floats">
                </div>
            </div>
            <!-- end of #apply -->
            <asp:Panel ID="Panel_Additional" runat="server">
                <div id="additional">
                    <div id="related">
                        <h3>
                            <asp:Literal ID="Literal15" runat="server" Text="<%$Resources:Resource,Otherjobswethink %>"></asp:Literal></h3>
                        <asp:Repeater ID="Repeater_InterestedJob" runat="server" OnItemDataBound="Repeater_InterestedJob_DataBound">
                            <HeaderTemplate>
                                <ul class="arrow-list">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li><span class="icon"></span>
                                    <asp:HyperLink ID="hpl_InterestedJob" runat="server"></asp:HyperLink>
                                </li>
                            </ItemTemplate>
                            <FooterTemplate>
                                </ul>
                            </FooterTemplate>
                        </asp:Repeater>
                        <%--<p style="margin: 10px 0 0 11px;">
                        <a href="#">View more jobs</a></p>--%>
                    </div>
                    <!-- end of #related -->
                    <div id="other">
                        <h3>
                            <asp:Literal ID="Literal16" runat="server" Text="<%$Resources:Resource,Otherjobsfrom %>"></asp:Literal>
                            <%=Job.OrgName %>:</h3>
                        <asp:Repeater ID="Repeater_SameEmployerJob" runat="server" OnItemDataBound="Repeater_SameEmployerJob_DataBound">
                            <HeaderTemplate>
                                <ul class="arrow-list">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li><span class="icon"></span>
                                    <asp:HyperLink ID="hpl_SameEmployerJob" runat="server"></asp:HyperLink>
                                </li>
                            </ItemTemplate>
                            <FooterTemplate>
                                </ul>
                            </FooterTemplate>
                        </asp:Repeater>
                        <%--<p style="margin: 10px 0 0 11px;">
                        <a href="#">View all CPL Newry & Belfast jobs</a></p>--%>
                    </div>
                    <!-- end of #other -->
                    <div class="clear-floats">
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
