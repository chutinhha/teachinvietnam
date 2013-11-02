<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="TeachingJob.publicArea.CV.Detail"
    ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>
        <asp:Literal ID="literalTitle" runat="server"></asp:Literal> - TeachinVietnam</title>
    <!--960 Grid System ==============================================================-->
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/960.css" />
    <!--Fogli di Stile ==============================================================-->
    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    <link href="~/images/icons/favicon.jpg" rel="shortcut icon" />

    <script src="../../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
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
        .displaynone
        {
            display: none;
        }
        .fontsize15
        {
            font-size: 15px;
        }
    </style>
    <script type="text/javascript">        dark = '#3C5610'; light = '#A2C92A';</script>
    <script type="text/javascript">
        function textCounter(field, countfield, maxlimit) {
            var Label1 = document.getElementById(countfield);
            if (field.value.length > maxlimit)
                field.value = field.value.substring(0, maxlimit);
            Label1.innerText = (maxlimit - field.value.length) + ' characters remaining';
        }
    </script>
    <script runat="server">
        public String getCvname() { return cvname; }
        string cvname;
        ProfileCommon userProfile;
        protected void Page_PreRender(object sender, EventArgs e)
        {
            string contact = Request.Params["contact"];
            if (contact != null && contact == "send")
            {
                Panel1.Visible = true;
            }
            cvname = Request.Params["cvname"];
            HyperLink1.NavigateUrl = "Detail.aspx?cvname=" + cvname + "&contact=send";
            if (cvname == null || cvname.Trim()=="")
            {
                Response.Redirect("../errorpages/Error404.aspx");
            }
            SqlConnection.ClearAllPools();
            MembershipUser mu = Membership.GetUser(new Guid(cvname));
            
            System.Reflection.Assembly ass = System.Reflection.Assembly.Load("App_GlobalResources");
            System.Resources.ResourceManager rm = new System.Resources.ResourceManager("Resources.Resource", ass);
            
            userProfile = Profile.GetProfile(mu.UserName);
            lbl_CandidateName.Text = userProfile.Employee.FirstName + " " + userProfile.Employee.LastName;
            literalTitle.Text = lbl_CandidateName.Text + " - " + userProfile.CV.Major;
            lbl_Major.Text = userProfile.CV.Major;
            try
            {
                //ImgAvatar.ImageUrl = TeachingJob.Data.General.CAN_LOGO + mu.UserName + "/" + userProfile.Employee.Avatar;
                ImgAvatar.ImageUrl = TeachingJob.Data.Utils.validateImage(TeachingJob.Data.General.CAN_LOGO + mu.UserName , userProfile.Employee.Avatar);
            }
            catch (Exception)
            {
                Response.Redirect("~/publicArea/errorpages/error404.aspx");
            }
            
            DateTime dt = new DateTime(userProfile.Employee.DateOfBirth.Year, userProfile.Employee.DateOfBirth.Month, userProfile.Employee.DateOfBirth.Day);
            lbl_Dob.ToolTip = String.Format("{0:MMM d, yyyy}", dt);
            lbl_Dob.Text = dt.ToShortDateString();

            if (Convert.ToDateTime(userProfile.CV.LastUpdated).Year == 0001)
            {
                lbl_LastUpdate.Text = "";
            }
            else
            {
                lbl_LastUpdate.Text = rm.GetString("Lastupdateat") + " " + userProfile.CV.LastUpdated.ToString();
            }
            if (userProfile.CV.DisplayEmail == true)
            {
                lbl_Mail.Text = mu.UserName;
            }
            else
            {
                lbl_Mail.Text = "Privacy";
            }
            if (userProfile.CV.DisplayAddress == true && userProfile.Employee.PresentLocation != "")
            {
                lbl_Address.Text = userProfile.Employee.PresentLocation;
            }
            else
            {
                lbl_Address.Text = "Privacy";
            }
            if (userProfile.CV.DisplayPhone == true && userProfile.Employee.Phone != "")
            {
                lbl_Phone.Text = userProfile.Employee.Phone;
            }
            else
            {
                lbl_Phone.Text = "Privacy";
            }

            List<TeachingJob.publicArea.CV.objValue> objList = new List<TeachingJob.publicArea.CV.objValue>();
            if (userProfile.Employee.Citizenship != "")
            {
                //objList.Add(new TeachingJob.publicArea.CV.objValue("Native of: ", userProfile.Employee.Citizenship));
                lbl_NativeOf.Text = userProfile.Employee.Citizenship;
            }

            if (userProfile.CV.EduLevel != "")
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("EduLevel"), userProfile.CV.EduLevel));
            }
            if (userProfile.CV.Major != "")
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("SpecializationMajor"), userProfile.CV.Major));
            }
            if (userProfile.CV.Language != "")
            {
                string lang = userProfile.CV.Language +" - "+ userProfile.CV.Language_lvl;
                if (userProfile.CV.Language2 != "")
                {
                    lang += "<br /> " + userProfile.CV.Language2 + " - " + userProfile.CV.Language2_lvl;
                }
                if (userProfile.CV.Language3 != "")
                {
                    lang += "<br /> " + userProfile.CV.Language3 + " - " + userProfile.CV.Language3_lvl;
                }
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("LanguageSpoken"), lang));
            }
            if (userProfile.CV.YearsofExperience != "")
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("Yearsofexperience"), userProfile.CV.YearsofExperience));
            }
            if (userProfile.CV.RelatedExperience != "")
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("RelatedExperience2"), userProfile.CV.RelatedExperience));
            }
            if (userProfile.CV.MostRecentPosition != "")
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("MostRecentPosition"), userProfile.CV.MostRecentPosition));
            }
            if (userProfile.CV.CurrentJobLevel != "")
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("CurrentJobLevel2"), userProfile.CV.CurrentJobLevel));
            }
            if (userProfile.CV.Achievements != "")
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("Achievements2"), userProfile.CV.Achievements));
            }
            if (userProfile.CV.SkillsInterests != "")
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("SkillsInterests2"), userProfile.CV.SkillsInterests));
            }
            if (userProfile.CV.Memberships != "")
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("Memberships2"), userProfile.CV.Memberships));
            }
            if (userProfile.CV.DesiredEmployment != "")
            {
                string category = userProfile.CV.DesiredEmployment;
                if (userProfile.CV.DesiredEmployment2 != "")
                {
                    category += "<br /> " + userProfile.CV.DesiredEmployment2;
                }
                if (userProfile.CV.DesiredEmployment3 != "")
                {
                    category += "<br /> " + userProfile.CV.DesiredEmployment3;
                }
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("DesiredEmployment"), category));
            }
            if (userProfile.CV.DesiredJobLevel != "")
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("desiredjoblevel"), userProfile.CV.DesiredJobLevel));
            }
            if (userProfile.CV.EmploymentType != "")
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("DesiredEmploymenttype"), userProfile.CV.EmploymentType));
            }
            if (userProfile.CV.DesiredLocations != "")
            {
                string location = userProfile.CV.DesiredLocations;
                if (userProfile.CV.DesiredLocations2 != "")
                {
                    location += "<br /> " + userProfile.CV.DesiredLocations2;
                }
                if (userProfile.CV.DesiredLocations3 != "")
                {
                    location += "<br /> " + userProfile.CV.DesiredLocations3;
                }

                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("Iminterested"), location));
            }
            if (userProfile.CV.SalaryType.ToString() == "True")
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("Salaryexpectation2"), userProfile.CV.SalaryFrom + " - " + userProfile.CV.SalaryTo + " " + userProfile.CV.SalaryCurrency + "/" + userProfile.CV.SalaryPaidType));
            }
            else
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("Salaryexpectation2"), rm.GetString("Negotiable")));
            }
            if (userProfile.CV.DesiredTravel != "")
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("Desiredtravel"), userProfile.CV.DesiredTravel));
            }
            if (userProfile.CV.CurrentResidence != "")
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("CurrentResidence"), userProfile.CV.CurrentResidence));
            }
            if (userProfile.CV.WillingToRelocate != "")
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("Willingtorelocate2"), userProfile.CV.WillingToRelocate));
            }
            if (userProfile.CV.HowSoonToWork != "")
            {
                objList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("Howsoonareyouavailabletowork"), userProfile.CV.HowSoonToWork));
            }
            
            rp_Content.DataSource = objList;
            rp_Content.DataBind();


            if (userProfile.CV.PersonalStatement != "")
            {
                List<TeachingJob.publicArea.CV.objValue> statementList = new List<TeachingJob.publicArea.CV.objValue>();
                statementList.Add(new TeachingJob.publicArea.CV.objValue(rm.GetString("PersonalStatement2"), userProfile.CV.PersonalStatement));
                ListView1.DataSource = statementList;
                ListView1.DataBind();
            }

            objName.Value = userProfile.Employee.FirstName;

            
            txt_Subject.Text = txt_OrgName.Text + " " + rm.GetString("contactswithyouvia");

            lbl_OrgName.CssClass = "fontsize15";
            if (Page.User.Identity.IsAuthenticated)
            {
                MembershipUser currentUser = Membership.GetUser();
                ProfileCommon currentUserProfile = Profile.GetProfile(currentUser.UserName);

                if (User.IsInRole("Organization"))
                {
                    txt_OrgName.Text = currentUserProfile.Organization.OrganizationName;
                }
                else if (User.IsInRole("Employee"))
                {
                    lbl_OrgName.Text = rm.GetString("Fullname");
                    txt_OrgName.Text = currentUserProfile.Employee.FirstName + " " + currentUserProfile.Employee.LastName;
                }
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
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
            <!--===CONTACT FORM==============================================================================-->
            <asp:Panel ID="Panel1" runat="server" Visible="false">
                <div id="contact" class="grid_10 push_1 alpha omega section">
                    <div class="grid_10 alpha omega section_title">
                        <h2>
                            <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,ContactMe %>"></asp:Literal>
                            </h2>
                        <div class="closeButton">
                            <a href="Detail.aspx?cvname=<%=getCvname() %>">
                                <asp:Label ID="Label1" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:Label></a>
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="grid_10 alpha omega">
                        <div class="border">
                            <div id="risposta">
                                <asp:ValidationSummary ID="ValidationSummary1" CssClass="literalNotification" DisplayMode="BulletList"
                                    runat="server" ValidationGroup="Contact" />
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="grid_5 alpha contact_sx">
                            <ul>
                                <li>
                                    <h4>
                                        <asp:Label ID="lbl_OrgName" runat="server" Text="<%$Resources:Resource,Organization %>"></asp:Label></h4>
                                    <div class="border">
                                        <asp:TextBox ID="txt_OrgName" runat="server" MaxLength="200"></asp:TextBox>
                                    </div>
                                </li>
                                <%--<li><h4>Email</h4>
                                    <div class="border">
                                        <asp:TextBox ID="txt_Email" runat="server" MaxLength="200"></asp:TextBox>
                                    </div>
                                </li>--%>
                                <li>
                                    <h4>
                                        <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,Subject %>"></asp:Literal></h4>
                                    <div class="border">
                                        <asp:TextBox ID="txt_Subject" runat="server" MaxLength="200"></asp:TextBox>
                                    </div>
                                </li>
                                <li>
                                    <h4>
                                    </h4>
                                    <asp:Button ID="invia" runat="server" Text="" ValidationGroup="Contact" OnClick="SendContact_Click" />
                                </li>
                            </ul>
                        </div>
                        <div class="grid_5 omega contact_dx">
                            <ul>
                                <li>
                                    <div class="border">
                                        <asp:TextBox ID="txt_Message" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </li>
                                <li>
                                <div class="border"><span style="background-color:#f3f3f3">
                                    <asp:Label ID="Label2" runat="server" Text="" CssClass="showRemain"></asp:Label></span></div>
                                </li>
                            </ul>
                            
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_OrgName"
                        ValidationGroup="Contact" Text=" " ErrorMessage="<%$Resources:Resource,Pleaseinputorganizationname %>"
                        Display="None"></asp:RequiredFieldValidator>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_Email"
                        ValidationGroup="Contact" Text=" " ErrorMessage="<%$Resources:Resource,Pleaseinputcontactemail %>"
                        Display="None"></asp:RequiredFieldValidator>--%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_Subject"
                        ValidationGroup="Contact" Text=" " ErrorMessage="<%$Resources:Resource,Pleaseinputmailsubject %>"
                        Display="None"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Text=" "
                        ControlToValidate="txt_Message" ValidationGroup="Contact" ErrorMessage="<%$Resources:Resource,Pleaseinputmailcontent %>"
                        Display="None"></asp:RequiredFieldValidator>
                    <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="Contact"
                        CssClass="failureNotification" ControlToValidate="txt_Email" ErrorMessage="<%$Resources:Resource,validformat %>"
                        Text="" Display="None" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>--%>
                    <div class="clear">
                    </div>
                    <asp:HiddenField ID="objName" runat="server" />
                </div>
                <div class="clear">
                </div>
            </asp:Panel>
            <!--=======================================================================================-->
            <!--===TITLE==============================================================================-->
            <div id="title" class="grid_10 push_1 alpha omega section">
                <%--<div class="grid_10 alpha omega section_title">
                    <h2>
                        Personal Details</h2>
                </div>
                <div class="clear">
                </div>--%>
                <div id="title_sx" class="grid_4 alpha">
                    <div id="photo">
                        <asp:Image ID="ImgAvatar" runat="server" CssClass="maxheight220" Width="200px" /></div>
                </div>
                <div id="title_center" class="grid_2 alpha">
                    <ul>
                        <li>&nbsp; </li>
                        <li>
                            <h4 style="font-family: Calibri;">
                                <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,Birth %>"></asp:Literal></h4>
                        </li>
                        <li>
                            <h4 style="font-family: Calibri;">
                                Mail</h4>
                        </li>
                        <li>
                            <h4 style="font-family: Calibri;">
                                <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,Nativeof %>"></asp:Literal></h4>
                        </li>
                        <li>
                            <h4 style="font-family: Calibri;">
                                <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource,Phone %>"></asp:Literal></h4>
                        </li>
                        <li>
                            <h4 style="font-family: Calibri;">
                                <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource,Address %>"></asp:Literal></h4>
                        </li>
                    </ul>
                </div>
                <div id="title_dx" class="grid_4">
                    <div class="lastupdatediv">
                        <asp:Label ID="lbl_LastUpdate" CssClass="lastupdate" runat="server" Text=""></asp:Label>
                    </div>
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
                            <a href="#" style="color: #fff; font-size: 26px; font-family: Calibri;">
                                <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource,PersonalDetails %>"></asp:Literal></a></h6>
                    </div>
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
                    <h2><asp:Literal ID="Literal8" runat="server" Text="<%$Resources:Resource,Profile %>"></asp:Literal>
                        </h2>
                </div>
                <div class="clear">
                </div>
                <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -->
                <asp:Repeater ID="rp_Content" runat="server">
                    <HeaderTemplate>
                        <table cellpadding="0" cellspacing="0" class="table">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%--<div class="grid_10 alpha omega section_list">--%>
                        <div class="grid_10 alpha omega">
                            <tr>
                                <td class="col1" style="font-family: Calibri; padding-left: 5px; padding-right: 5px; vertical-align:top; ">
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
            </div>
            <div class="clear">
            </div>
            <div class="grid_10 push_1 alpha omega section">
                <asp:ListView ID="ListView1" runat="server">
                    <ItemTemplate>
                        <div class="grid_10 alpha omega section_title">
                            <h2>
                                <%# Eval("Name") %></h2>
                        </div>
                        <div class="clear">
                        </div>
                        <div class="grid_10 alpha omega section_list">
                            <ul>
                                <li class="section_content">
                                    <div id="content1" style="line-height: 1.5;">
                                        <%# Eval("Value").ToString().Replace(Environment.NewLine,"<br />") %></div>
                                    <div id="button">
                                    </div>
                                    <%--<div class="date">
                                        <span>Some-text</span></div>--%>
                                </li>
                            </ul>
                        </div>
                        <div class="clear">
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                <!---- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -->
            </div>
            <div class="clear">
            </div>
            <!--=======================================================================================-->
            <!--===FOOTER==============================================================================-->
            <div id="footer" class="grid_10 push_1 alpha omega">
            </div>
            <div class="clear">
            </div>
            <!--=======================================================================================-->
            <div id="social">
                <ul>
                    <li id="social_top"></li>
                    <li>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Detail.aspx?contact=send">
                            <asp:Image ID="Image1" runat="server" ImageUrl="img/social/Mail-icon.png" Height="24px" Width="24px" AlternateText="email" ToolTip="<%$Resources:Resource,ContacttothisCV %>" />
                            <%--<img src="img/social/Mail-icon.png" alt="email" height="24px" width="24px" title="<%$Resources:Resource,ContacttothisCV %>" />--%>
                        </asp:HyperLink>
                    </li>
                    <li>
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Save_Click">
                            <asp:Image ID="Image2" runat="server" ImageUrl="img/social/Check-icon.png" Height="24px" Width="24px" AlternateText="save cv" ToolTip="<%$Resources:Resource,SavethisResume %>" />
                            <%--<img src="img/social/Check-icon.png" alt="save cv" height="24px" width="24px" title="<%$Resources:Resource,SavethisResume %>" />--%>
                        </asp:LinkButton>
                    </li>
                    <%--<li><a href="#">
                        <img src="img/social/facebook.png" alt="save" height="24px" width="24px" /></a></li>--%>
                    <%--<li><a href="#">
                        <img src="img/social/Check-icon.png" height="24px" width="24px" alt="" />
                    </a></li>--%>
                    <!--
<li><a href="#"><img src="img/social/flickr.png" /></a></li>
<li><a href="#"><img src="img/social/friendfeed.png" /></a></li>
<li><a href="#"><img src="img/social/google.png" /></a></li>
<li><a href="#"><img src="img/social/msn.png" /></a></li>
<li><a href="#"><img src="img/social/myspace.png" /></a></li>
<li><a href="#"><img src="img/social/skype.png" /></a></li>
<li><a href="#"><img src="img/social/yahoo.png" /></a></li>
<li><a href="#"><img src="img/social/youtube.png" /></a></li>

<li><a href="curriculum.doc"><img src="img/social/download.png" alt="download"/></a></li>
-->
                    <li id="social_bottom"></li>
                </ul>
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
