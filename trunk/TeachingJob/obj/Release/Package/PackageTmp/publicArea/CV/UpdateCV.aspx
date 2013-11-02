<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateCV.aspx.cs" Inherits="TeachingJob.publicArea.CV.UpdateCV" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>
        <asp:Literal ID="literalTitle" runat="server"></asp:Literal> - Curriculum - TeachinVietnam</title>
    <!--960 Grid System ==============================================================-->
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/960.css" />
    <!--Fogli di Stile ==============================================================-->
    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    <link href="~/images/icons/favicon.jpg" rel="shortcut icon" />
    <%--<link rel="stylesheet" href="css/print.css" type="text/css" media="print" />--%>
    <!--JQUERY ==============================================================-->
<%--    <script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>--%>
    <script src="../../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
 <%--    <script src="<%#this.ResolveClientUrl("https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js") %>"
        type="text/javascript"></script>
    <script src="<%#this.ResolveClientUrl("https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/jquery-ui.min.js") %>"
        type="text/javascript"></script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            var text = $('#content1').html();
            var extract = text.substring(0, 280) + "...";
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
            var pos_top = position.top;
            $('#content1').animate({ height: pos_top + 'px' }, function () {
                less();
            });
        }

        this.less = function () {
            $('.less').click(function () {
                $('#content1').animate({ height: '90px' }, function () {
                    var text = $('#content1').html();
                    var extract = text.substring(0, 280) + "...";
                    $('#content1').html(extract);
                    $('#button').html('<a href="#" class="more">Show More</a>');
                    more(text);
                });
                return false;
            });
        }
    </script>
    <!--PopOut-->
    
<!-- boxplus themes -->
<link rel="stylesheet" type="text/css" href="engines/popup/css/boxplus.css" />
<!--[if IE]><link rel="stylesheet" href="engines/popup/css/boxplus.ie.css" type="text/css" /><![endif]-->
<!--[if lt IE 8]><link rel="stylesheet" href="engines/popup/css/boxplus.ie7.css" type="text/css" /><![endif]-->
<link rel="stylesheet" type="text/css" href="engines/popup/css/boxplus.prettyphoto.css" title="boxplus-prettyphoto" />
<!--[if IE]><link rel="stylesheet" href="engines/popup/css/boxplus.prettyphoto.ie.css" type="text/css" title="boxplus-prettyphoto" /><![endif]-->

<!-- scripts --><%--
<script src="InternalUpdate/jsapi.js" type="text/javascript"></script>--%>
<script type="text/javascript">    google.load("jquery", "1.4");</script>
<script type="text/javascript" src="engines/popup/js/boxplus.js"></script>
<script type="text/javascript" src="engines/slider/js/boxplus.slider.js"></script>
<script type="text/javascript" src="engines/slider/js/boxplus.transition.js"></script>
<script type="text/javascript" src="engines/caption/js/boxplus.caption.js"></script>
<script type="text/javascript" src="engines/lang/boxplus.lang9ed2.js?lang=en"></script>

<script type="text/javascript">
// POP OUT WINDOW
    (function ($) {
        $.fn.preformatted = function (text) {
            if ($.browser.msie) {
                text = text.replace(/\n/g, '\r');
            }
            this.text(text);
        };

        /**
        * Sets up a simple accordion.
        */
        $.fn.accordion = function () {
            this.children(':even').click(function () {
                $(this).toggleClass('collapse').toggleClass('expand').next().slideToggle('slow');
                return false;
            }).addClass('expand').next().hide();
        };
    })(jQuery);

    jQuery(function ($) {
        $('.accordion').accordion();

        //
        // Image slider
        //

        var settingsSlider = {
            opacity: 1.0,
            duration: 800,
            delay: 0
        };
        $('#popup-configuration').boxplus().click(function () {
            $('.accordion').addClass('hidden');
        });
        $('#editProfile').boxplus().click(function () {
            $('.accordion').addClass('hidden');
        });
        $('#editPersonal').boxplus().click(function () {
            $('.accordion').addClass('hidden');
        });
    });
// ]]>
</script>
    <!--CONTACT FORM ==============================================================-->
    <script type="text/javascript" src="js/jquery_mail.js"></script>
    <!--SCROLL BOTTOM ==============================================================-->
    <script type="text/javascript" src="js/scroll.js"></script>
    <!--SCROLL FOLLOW ==============================================================-->
    <script type="text/javascript" src="js/ui.core.js"></script>
    <script type="text/javascript" src="js/scroll-follow.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#social').scrollFollow();
        }
        );
    </script>
    <!--COLORS ==============================================================-->
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
        }
        .more
        {
            font-size: 12px;
            font-weight: bold;
        }
    </style>
    <script type="text/javascript">        dark = '#3C5610'; light = '#A2C92A';</script>
</head>
<body>
    <form id="form1" runat="server">
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxToolkit:ToolkitScriptManager>
    <div class="container_12">
        <div id="content" class="grid_12">
            <!--===HEADER==============================================================================-->
            <div id="header" class="grid_10 push_1 alpha omega">
                <ul>
                    <li id="bigtitle">
                        <h1>
                            <asp:Label ID="lbl_CandidateName" runat="server" Text="" ToolTip="<%$Resources:Resource,Fullname %>"></asp:Label></h1>
                    </li>
                    <li id="subtitle">
                        <h3>
                            <asp:Label ID="lbl_Major" runat="server" Text="" ToolTip="<%$Resources:Resource,Major %>"></asp:Label></h3>
                    </li>
                </ul>
            </div>
            <div class="clear">
            </div>
            <!--=======================================================================================-->
            <!--===TITLE==============================================================================-->
            <div id="title" class="grid_10 push_1 alpha omega section">
                
                <div id="title_sx" class="grid_4 alpha">
                    <div id="photo">
                        <asp:Image ID="ImgAvatar" runat="server" CssClass="maxheight220" Width="200px"  /></div>
                </div>
                <div id="title_center" class="grid_2 alpha">
                    <ul>
                        <li>&nbsp; </li>
                        <li>
                            <h4 style="font-family:Calibri;">
                                <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,Birth %>"></asp:Literal></h4>
                        </li>
                        <li>
                            <h4 style="font-family:Calibri;">
                                Mail</h4>
                        </li>
                         <li>
                            <h4 style="font-family:Calibri;">
                                <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,Nativeof %>"></asp:Literal></h4>
                        </li>
                        <li>
                            <h4 style="font-family:Calibri;">
                                <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource,Phone %>"></asp:Literal></h4>
                        </li>
                        <li>
                            <h4 style="font-family:Calibri;">
                                <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource,Address %>"></asp:Literal></h4>
                        </li>
                    </ul>
                </div>
                <div id="title_dx" class="grid_4">
                <div class="lastupdatediv">
                                <asp:Label ID="lbl_LastUpdate" CssClass="lastupdate" runat="server" Text=""></asp:Label></div>
                    <ul>
                        <li>
                            <p class="p_big">
                                &nbsp;</p>
                        </li>
                        <li>
                            <p class="p_big">
                                <asp:Label ID="lbl_Dob" runat="server" Text=""></asp:Label></p>
                        </li>
                        <li>
                            <p class="p_big">
                                <asp:Label ID="lbl_Mail" runat="server" Text=""></asp:Label></p>
                        </li>
                        <li>
                            <p class="p_big">
                                <asp:Label ID="lbl_NativeOf" runat="server" Text="N/A"></asp:Label></p>
                        </li>
                        <li>
                            <p class="p_big">
                                <asp:Label ID="lbl_Phone" runat="server" Text="N/A"></asp:Label></p>
                        </li>
                        <li>
                            <p class="p_big">
                                <asp:Label ID="lbl_Address" runat="server" Text="N/A"></asp:Label></p>
                        </li>
                    </ul>
                </div>
                <div class="clear">
                </div>
                <div class="grid_10 alpha omega section_title">
                    <div id="social_button">
                        <h6 class="nav_down" id="nav_down">
                            <a href="#" style="color: #fff;font-size:26px; font-family:Calibri;"><asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource,PersonalDetails %>"></asp:Literal></a></h6>
                    </div>
                </div>
                <div class="clear">
                </div>
                <br />
                <br />
                <div class="floatright">
                    <a id="editPersonal" href="InternalUpdate/UpdatePersonal.aspx"><asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,Edit %>"></asp:Literal></a>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="clear">
            </div>
            <!--=======================================================================================-->
            <!--===EDUCATION==============================================================================-->
            <div class="grid_10 push_1 alpha omega section">
                <div class="grid_10 alpha omega section_title">
                    <h2>
                        <asp:Literal ID="Literal8" runat="server" Text="<%$Resources:Resource,Profile %>"></asp:Literal></h2>
                </div>
                <div class="clear">
                </div>
                <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -->
                <asp:Repeater ID="rp_Content" runat="server" >
                    <HeaderTemplate>
                        <table  cellpadding="0" cellspacing="0" class="table">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%--<div class="grid_10 alpha omega section_list">--%>
                        <div class="grid_10 alpha omega">
                            <tr>
                                <td class="col1" style="font-family:Calibri; padding-left:5px; padding-right:5px;vertical-align:top;  ">
                                    <h4>
                                        <%# Eval("Name") %></h4>
                                </td>
                                <td>
                                    <h5 style="font-family:Calibri; font-size:16px; padding-left:5px; padding-right:5px;">
                                        <%# Eval("Value") %>
                                    </h5>
                                </td>
                            </tr>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <div class="alignright">
                    <a id="editProfile" href="InternalUpdate/UpdateProfile.aspx"><asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,Edit %>"></asp:Literal></a>
                </div>
            </div>
            <div class="clear">
            </div>
            <div class="grid_10 push_1 alpha omega section">
                <asp:ListView ID="ListView1" runat="server">
                    <ItemTemplate>
                        <div class="grid_10 alpha omega section_title">
                            <h2>
                                <%# Eval("Name")%></h2>
                        </div>
                        <div class="clear">
                        </div>
                        <div class="grid_10 alpha omega section_list">
                            <ul>
                                <li class="section_content">
                                    <div id="content1" style="color: Black; line-height: 1.5;">
                                        <%# Eval("Value").ToString().Replace(Environment.NewLine, "<br />")%></div>
                                    <div id="button">
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="alignright">
                            <a id="popup-configuration" title="" href="InternalUpdate/StatementUpdate.aspx"><asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,Edit %>"></asp:Literal></a>

                        </div>
                        <div class="clear">
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                <!---- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -->
            </div>
            <div class="clear">
            </div>
            <div class="clear">
            </div>
            <!--=======================================================================================-->
            <!--===FOOTER==============================================================================-->
            <div id="footer" class="grid_10 push_1 alpha omega">
            </div>
            <div class="clear">
            </div>
            <div class="clear">
            </div>
            <!-- close content-->
        </div>
    </div>
    <!-- close container-->
    <script type="text/javascript">
        $(function () {
            var $elem = $('#content');

            $('#nav_down').click(
                    function (e) {
                        $('html, body').animate({ scrollTop: $elem.height() }, 800);
                    }
                );
        });
    </script>
    </form>
</body>
</html>
