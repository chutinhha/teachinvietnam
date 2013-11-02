<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="terms-conditions.aspx.cs" Inherits="TeachingJob.publicArea.terms_conditions" %>

<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
    <title>Term of Use - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../css/preparation.css" rel="stylesheet" type="text/css" />
    <script src="../Styles/simple-tabs9fab.js?mt=1323683811" type="text/javascript"></script>
    <script src="../Styles/jquery-dialogfbf6.js?mt=1319121455" type="text/javascript"></script>
    <script type='text/javascript'>
        $(function () {
            $('#tabs').simpleTabs();

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="connect">
        <div class="module">
            <div class="term-policy">
                <%--<div class="skyTerm">
                </div>--%>
                <div class="nav-icons">
                    <ul>
                        <li class="iphone"><a href="#"></a></li>
                        <li class="email"><a href="#"></a></li>
                        <li class="twitter"><a href="#"></a></li>
                        <li class="facebook"><a href="#"></a></li>
                    </ul>
                </div>
                <div class="simple-tabs-panel-container">
                    <ul id="tabs" class="heading-type regular vertical-tabs">
                        <li class="simple-tab"><a href="#about-us" title="about-us">About us</a>
                        </li>
                        <li class="simple-tab"><a href="#term-of-use" title="term-of-use">Terms of Use</a>
                        </li>
                        <li class="simple-tab"><a href="#privacy-policy" title="term-of-use">Privacy policy</a>
                        </li>
                    </ul>
                    <div class="panel custom-simple-tab-panel full-width" id="about-us">
                        <div class="inner">
                            <h5 class="heading-type large-heading green">
                                <asp:Literal ID="Literal3" runat="server" Text="About us"></asp:Literal></h5>
                            <hr />
                            <p>
                                <asp:Literal ID="literal_aboutus" runat="server"></asp:Literal>
                            </p>
                            <asp:HyperLink ID="hpl_edit_aboutus" runat="server" Visible="false" CssClass="postnew2">Edit</asp:HyperLink>
                        </div>
                    </div>
                    <div class="panel custom-simple-tab-panel full-width" id="term-of-use">
                        <div class="inner">
                            <h5 class="heading-type large-heading green">
                                <asp:Literal ID="Literal1" runat="server" Text="Terms of Use"></asp:Literal></h5>
                            <hr />
                            <p>
                                <asp:Literal ID="literal_term" runat="server"></asp:Literal>
                            </p>
                            <asp:HyperLink ID="hpl_edit" runat="server" Visible="false" CssClass="postnew2">Edit</asp:HyperLink>
                        </div>
                    </div>
                    <div class="panel custom-simple-tab-panel full-width" id="privacy-policy">
                        <div class="inner">
                            <h5 class="heading-type large-heading green">
                                <asp:Literal ID="Literal2" runat="server" Text="Privacy policy"></asp:Literal></h5>
                            <hr />
                            <p>
                                <asp:Literal ID="literal_policy" runat="server"></asp:Literal>
                            </p>
                            <asp:HyperLink ID="hpl_edit_policy" runat="server" Visible="false" CssClass="postnew2">Edit</asp:HyperLink>
                        </div>
                    </div>
                    <div class="clear-floats">
                    </div>
                </div>
                <!-- end of simple tabs panel -->
            </div>
        </div>
    </div>
    <!-- end of #connect div  -->
    <div class="clear-floats">
    </div>
</asp:Content>
