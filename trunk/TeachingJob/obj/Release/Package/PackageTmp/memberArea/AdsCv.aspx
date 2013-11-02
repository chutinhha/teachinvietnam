<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="AdsCv.aspx.cs" Inherits="TeachingJob.memberArea.AdsCv" ValidateRequest="false" %>

<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
    <title>
        <asp:Literal ID="Literal29" runat="server" Text="<%$Resources:Resource,CreateanewResume%>"></asp:Literal>
        - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../css/content.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .more
        {
            display: none;
        }
    </style>
    <script type="text/javascript">
        function textCounter(field, countfield, maxlimit) {
            var Label1 = document.getElementById(countfield);
            if (field.value.length > maxlimit)
                field.value = field.value.substring(0, maxlimit);
            Label1.innerText = (maxlimit - field.value.length) + ' characters remaining';
        }
    </script>
    <script type="text/javascript">
        function showLanglvl1(input) {
            var langlvl = document.getElementById("<%=ddl_lang1_lvl.ClientID %>");
            if (input.selectedIndex != 0) {
                langlvl.disabled = false;
            } else {
                langlvl.disabled = true;
            }
        }
        function showLanglvl2(input) {
            var langlvl = document.getElementById("<%=ddl_lang2_lvl.ClientID %>");
            if (input.selectedIndex != 0) {
                langlvl.disabled = false;
            } else {
                langlvl.disabled = true;
            }
        }
        function showLanglvl3(input) {
            var langlvl = document.getElementById("<%=ddl_lang3_lvl.ClientID %>");
            if (input.selectedIndex != 0) {
                langlvl.disabled = false;
            } else {
                langlvl.disabled = true;
            }
        }
        function showHide(shID) {
            if (document.getElementById(shID)) {
                if (document.getElementById(shID + '-show').style.display != 'none') {
                    document.getElementById(shID + '-show').style.display = 'none';
                    document.getElementById(shID).style.display = 'block';
                    document.getElementById(shID).style.padding = '5px 0 0 0';
                }
                else {
                    document.getElementById(shID + '-show').style.display = 'inline';
                    document.getElementById(shID).style.display = 'none';
                }
            }
        }
        function Confirm() {
            if (confirm("Are you sure to delete book?")) {
                location.href = "~/";
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class='col span-9'>
        <div class='component component-CurrentlyRecruiting'>
            <div class="module ">
                <div id="currently-recruiting-outer">
                    <div class="module-title">
                        <h2>
                            <asp:Label ID="Label1" runat="server" Text="<%$Resources:Resource,Pleaseentertheinformation %>"></asp:Label></h2>
                    </div>
                    <div class="standard-form1 ">
                        <h3 class="group-title top">
                            <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,CVInformation %>"></asp:Literal>
                        </h3>
                        <h3>
                            <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,Hi %>"></asp:Literal>
                            <asp:Literal ID="lbl_fullname" runat="server"></asp:Literal>!
                            <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,Createyouronlineresume %>"></asp:Literal>
                        </h3>
                        <ul style="padding-left: 15px; margin-top: -10px; padding-bottom: 15px; font-style: italic;">
                            <li>
                                <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,SubmityourResume %>"></asp:Literal></li>
                            <li>
                                <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource,ShowcaseyourResume %>"></asp:Literal></li>
                        </ul>
                        <table style="width: 100%">
                            <tr>
                                <td class="style1">
                                    <asp:Label ID="lbl_EduLeveltxt" runat="server" Text="<%$Resources:Resource,EduLevelspan %>"
                                        CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_EduLevel" runat="server" CssClass="input">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseselectyouredulevel %>"
                                        Text="*" CssClass="failureNotification" Display="Dynamic" ControlToValidate="ddl_EduLevel"
                                        ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <asp:Label ID="lbl_Majortxt" runat="server" Text="<%$Resources:Resource,Majorspan %>"
                                        CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Major" runat="server" Width="410px" CssClass="input" MaxLength="200"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseenteryourmajor %>"
                                        Text="*" CssClass="failureNotification" Display="Dynamic" ControlToValidate="txt_Major"
                                        ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <asp:Label ID="lbl_SpokenLang" runat="server" Text="<%$Resources:Resource,Languagesproficiency %>"
                                        CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_lang1" ToolTip="<%$Resources:Resource,Mothertongueispreferred %>"
                                        runat="server" CssClass="input" AutoPostBack="false" Width="220px" onchange="showLanglvl1(this)">
                                    </asp:DropDownList>
                                    &nbsp;
                                    <asp:DropDownList ID="ddl_lang1_lvl" runat="server" CssClass="input" Enabled="false"
                                        Width="150px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseenteryourlanguageprofiency %>"
                                        Text="*" CssClass="failureNotification" Display="Dynamic" ControlToValidate="ddl_lang1"
                                        ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                                    <br />
                                    <a href="#" id="tr1-show" class="showLink" onclick="showHide('tr1');return false;">
                                        <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource,Addmore %>"></asp:Literal></a>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                </td>
                                <td id="tr1" class="more">
                                    <asp:DropDownList ID="ddl_lang2" runat="server" CssClass="input" AutoPostBack="false"
                                        Width="220px" onchange="showLanglvl2(this)">
                                    </asp:DropDownList>
                                    &nbsp;
                                    <asp:DropDownList ID="ddl_lang2_lvl" runat="server" CssClass="input" Enabled="false"
                                        Width="150px">
                                    </asp:DropDownList>
                                    <br />
                                    <a href="#" id="tr2-show" class="showLink" onclick="showHide('tr2');return false;">
                                        <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource,Addmore %>"></asp:Literal></a>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                </td>
                                <td id="tr2" class="more">
                                    <asp:DropDownList ID="ddl_lang3" runat="server" CssClass="input" AutoPostBack="false"
                                        Width="220px" onchange="showLanglvl3(this)">
                                    </asp:DropDownList>
                                    &nbsp;
                                    <asp:DropDownList ID="ddl_lang3_lvl" runat="server" CssClass="input" Enabled="false"
                                        Width="150px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <asp:Label ID="lbl_YearOfExp" runat="server" Text="<%$Resources:Resource,YearsofExperiencespan %>"
                                        CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_YearOfExp" runat="server" CssClass="input">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseselectyouryearofexperience %>"
                                        Text="*" CssClass="failureNotification" Display="Dynamic" ControlToValidate="ddl_YearOfExp"
                                        ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <asp:Label ID="lbl_RelatedExp" runat="server" Text="<%$Resources:Resource,RelatedExperience %>"
                                        CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_RelatedExp" runat="server" Width="380px" CssClass="input" MaxLength="200"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <asp:Label ID="lbl_MostRecentPosition" runat="server" Text="<%$Resources:Resource,MostRecentPositionspan %>"
                                        CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_MostRecentPosition" runat="server" Width="380px" CssClass="input"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseenteryourrecentposition %>"
                                        Text="*" CssClass="failureNotification" Display="Dynamic" ControlToValidate="txt_MostRecentPosition"
                                        ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_CurrentJobLevel" runat="server" Text="<%$Resources:Resource,CurrentJobLevelspan %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_CurrentJobLevel" runat="server" CssClass="input">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseselectyourcurrentjoblevel %>"
                                        Text="*" CssClass="failureNotification" Display="Dynamic" ControlToValidate="ddl_CurrentJobLevel"
                                        ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" valign="top">
                                    <asp:Label ID="lbl_Achievementtxt" runat="server" Text="<%$Resources:Resource,Achievements %>"
                                        CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Achievement" runat="server" Width="380px" CssClass="input noResizeHorizontal"
                                        TextMode="MultiLine" MaxLength='1000' onkeyDown="checkTextAreaMaxLength(this,event,'1000');"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" valign="top">
                                    <asp:Label ID="lbl_Skill" runat="server" Text="<%$Resources:Resource,SkillsInterests %>"
                                        CssClass="bold"></asp:Label>
                                </td>
                                <td style="max-height: 50px; overflow: hidden;">
                                    <asp:TextBox ID="txt_Skill" runat="server" Width="380px" CssClass="input noResizeHorizontal"
                                        TextMode="MultiLine" MaxLength='1000' onkeyDown="checkTextAreaMaxLength(this,event,'1000');"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" valign="top">
                                    <asp:Label ID="lbl_Membership" runat="server" Text="<%$Resources:Resource,Memberships %>"
                                        CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Membership" runat="server" Width="380px" MaxLength='1000' onkeyDown="checkTextAreaMaxLength(this,event,'1000');"
                                        CssClass="input noResizeHorizontal" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <asp:Label ID="lbl_Employment" runat="server" Text="<%$Resources:Resource,Desiredemploymentspan %>"
                                        CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_Employment" runat="server" CssClass="input">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseselectyourdesiredcategory %>"
                                        Text="*" CssClass="failureNotification" ControlToValidate="ddl_Employment" ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                                    <a href="#" id="cate2-show" class="showLink" onclick="showHide('cate2');return false;">
                                        <asp:Literal ID="Literal8" runat="server" Text="<%$Resources:Resource,Addmore %>"></asp:Literal></a>
                                    <div id="cate2" class="more">
                                        <asp:DropDownList ID="ddl_Employment2" runat="server" CssClass="input">
                                        </asp:DropDownList>
                                        <a href="#" id="cate3-show" class="showLink" onclick="showHide('cate3');return false;">
                                            <asp:Literal ID="Literal9" runat="server" Text="<%$Resources:Resource,Addmore %>"></asp:Literal></a>
                                    </div>
                                    <div id="cate3" class="more">
                                        <asp:DropDownList ID="ddl_Employment3" runat="server" CssClass="input">
                                        </asp:DropDownList>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <asp:Label ID="lbl_JobLevel" runat="server" Text="<%$Resources:Resource,Desiredjoblevelspan %>"
                                        CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_JobLevel" runat="server" CssClass="input">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseselectyourdesiredjoblevel %>"
                                        Text="*" CssClass="failureNotification" Display="Dynamic" ControlToValidate="ddl_JobLevel"
                                        ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <asp:Label ID="lbl_EmploymentType" runat="server" Text="<%$Resources:Resource,Desiredemploymenttypespan %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_EmploymentType" runat="server" CssClass="input">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseselectyourdesiredemploymenttype %>"
                                        Text="*" CssClass="failureNotification" Display="Dynamic" ControlToValidate="ddl_EmploymentType"
                                        ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <asp:Label ID="lbl_DesiredLocation" runat="server" Text="<%$Resources:Resource,Desiredlocationspan %>"
                                        CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_DesiredLocation" runat="server" CssClass="input" Width="120px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseenteryourdesiredlocation %>"
                                        Text="*" CssClass="failureNotification" Display="Dynamic" ControlToValidate="ddl_DesiredLocation"
                                        ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                                    <a href="#" id="example-show" class="showLink" onclick="showHide('example');return false;">
                                        <asp:Literal ID="Literal10" runat="server" Text="<%$Resources:Resource,Addmore %>"></asp:Literal></a>
                                    <div id="example" class="more">
                                        <asp:DropDownList ID="ddl_DesiredLocation2" runat="server" CssClass="input" Width="120px">
                                        </asp:DropDownList>
                                        <a href="#" id="example1-show" class="showLink" onclick="showHide('example1');return false;">
                                            <asp:Literal ID="Literal11" runat="server" Text="<%$Resources:Resource,Addmore %>"></asp:Literal></a>
                                    </div>
                                    <div id="example1" class="more">
                                        <asp:DropDownList ID="ddl_DesiredLocation3" runat="server" CssClass="input" Width="120px">
                                        </asp:DropDownList>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <asp:Label ID="lbl_SalaryExpect" runat="server" Text="<%$Resources:Resource,Salaryexpectation %>"
                                        CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <script type="text/javascript">
                                        function displaySalaryPanel(panelID) {
                                            if (panelID == 'example5') {
                                                document.getElementById('example5').style.display = 'inline';
                                                ValidatorEnable(document.getElementById('<%= RequiredFieldValidator6.ClientID %>'), true);
                                                ValidatorEnable(document.getElementById('<%= RegularExpressionValidator1.ClientID %>'), true);
                                                ValidatorEnable(document.getElementById('<%= RequiredFieldValidator7.ClientID %>'), true);
                                                ValidatorEnable(document.getElementById('<%= RegularExpressionValidator2.ClientID %>'), true);
                                            } else {
                                                document.getElementById('example5').style.display = 'none';
                                                ValidatorEnable(document.getElementById('<%= RequiredFieldValidator6.ClientID %>'), false);
                                                ValidatorEnable(document.getElementById('<%= RegularExpressionValidator1.ClientID %>'), false);
                                                ValidatorEnable(document.getElementById('<%= RequiredFieldValidator7.ClientID %>'), false);
                                                ValidatorEnable(document.getElementById('<%= RegularExpressionValidator2.ClientID %>'), false);
                                            }
                                        }
                                    </script>
                                    <input type="radio" name="salaryType" checked="checked" value="Negotiable" onclick="displaySalaryPanel('example55')" /><asp:Literal
                                        ID="Literal27" runat="server" Text="<%$Resources:Resource,Negotiable %>"></asp:Literal>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" id="example5-show" name="salaryType" value="Specified" onclick="displaySalaryPanel('example5')" /><asp:Literal
                                        ID="Literal28" runat="server" Text="<%$Resources:Resource,Specified %>"></asp:Literal>
                                    <br />
                                    <div id="example5" class="more">
                                        <asp:Literal ID="Literal12" runat="server" Text="<%$Resources:Resource,From %>"></asp:Literal>
                                        <asp:TextBox ID="txt_SalaryFrom" runat="server" CssClass="input" Width="100px"></asp:TextBox>
                                        <asp:Literal ID="Literal13" runat="server" Text="<%$Resources:Resource,To %>"></asp:Literal>
                                        <asp:TextBox ID="txt_SalaryTo" runat="server" CssClass="input" Width="100px"></asp:TextBox>
                                        <asp:DropDownList ID="ddl_SalaryCurrency" runat="server" CssClass="input2">
                                            <asp:ListItem Value="USD">USD</asp:ListItem>
                                            <asp:ListItem Value="VND">VND</asp:ListItem>
                                        </asp:DropDownList>
                                        /
                                        <asp:DropDownList ID="ddl_SalaryPaidType" runat="server" CssClass="input2">
                                            <asp:ListItem Value="month" Text="<%$Resources:Resource,month2 %>"></asp:ListItem>
                                            <asp:ListItem Value="week" Text="<%$Resources:Resource,week %>"></asp:ListItem>
                                            <asp:ListItem Value="hour" Text="<%$Resources:Resource,hour %>"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseinputyourexpectedsalary %>"
                                            Text="*" CssClass="failureNotification" Display="None" ControlToValidate="txt_SalaryFrom"
                                            Enabled="false" ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txt_SalaryFrom"
                                            ValidationGroup="AdsCv" Display="Dynamic" ValidationExpression="(\+|-)?[0-9]+(\.[0-9]*)?"
                                            Enabled="false" runat="server" ErrorMessage="<%$Resources:Resource,Salarymustbeinnumber %>"
                                            Text="*" CssClass="failureNotification"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseinputyourexpectedsalary %>"
                                            Text="*" CssClass="failureNotification" Display="None" ControlToValidate="txt_SalaryTo"
                                            Enabled="false" ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txt_SalaryTo"
                                            Enabled="false" ValidationGroup="AdsCv" ValidationExpression="(\+|-)?[0-9]+(\.[0-9]*)?"
                                            runat="server" ErrorMessage="<%$Resources:Resource,Salarymustbeinnumber %>" Display="Dynamic"
                                            Text="*" CssClass="failureNotification"></asp:RegularExpressionValidator>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="left" style="color: Black; font-weight: normal;">
                                    <br />
                                    <span style="font-size: 16px; font-family: Arial;"><b>
                                        <asp:Literal ID="Literal14" runat="server" Text="<%$Resources:Resource,Finallyletusknow %>"></asp:Literal>
                                    </b></span>
                                    <br />
                                    <asp:Literal ID="Literal15" runat="server" Text="<%$Resources:Resource,SomeEmployersseek %>"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <asp:Label ID="lbl_DesiredTravel" runat="server" Text="<%$Resources:Resource,Desiredtravelspan %>"
                                        CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_DesiredTravel" runat="server" CssClass="input">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseinputyourdesiredtravel %>"
                                        Text="*" CssClass="failureNotification" Display="Dynamic" ControlToValidate="ddl_DesiredTravel"
                                        ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Literal ID="Literal30" runat="server" Text="<%$Resources:Resource,CurrentResidencespan %>"></asp:Literal>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CurrentResidence" runat="server" CssClass="input" Width="300px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseenteryourcurrentlivinglocation %>"
                                        Text="*" CssClass="failureNotification" Display="Dynamic" ControlToValidate="txt_CurrentResidence"
                                        ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <asp:Label ID="lbl_Relocated" runat="server" Text="<%$Resources:Resource,Willingtorelocate %>"
                                        CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_Relocated" runat="server" CssClass="input">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseenteryourwillingtorelocate %>"
                                        Text="*" CssClass="failureNotification" Display="Dynamic" ControlToValidate="ddl_Relocated"
                                        ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <asp:Label ID="lbl_HowSoonAvai" runat="server" Text="<%$Resources:Resource,Howsoonarespan %>"
                                        CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_HowSoonAvai" runat="server" CssClass="input"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseenteryourdesired %>"
                                        Text="*" CssClass="failureNotification" Display="Dynamic" ControlToValidate="txt_HowSoonAvai"
                                        ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="middleVertical">
                                    <asp:Label ID="Label2" runat="server" Text="<%$Resources:Resource,Yourpersonalstatement %>"
                                        CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Statement" runat="server" TextMode="MultiLine"
                                        Rows="10" Width="100%" CssClass="noResizeHorizontal text11"></asp:TextBox>
                                        <br />
                                    <asp:Label ID="Label3" runat="server" Text="" CssClass="showRemainChars"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <div class="clear-floats">
                        </div>
                        <div class="term alignright">
                            <asp:CheckBox ID="cb_Seachable" runat="server" Text="<%$Resources:Resource,MyProfileissearchable %>"
                                CssClass="myProfileIsSearchableColor" Height="12px" />
                        </div>
                    </div>
                    <div class="button alignright" style="width: 100%">
                        <div style="float: left; text-align: left;">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="failureNotification"
                                ValidationGroup="AdsCv" />
                            <asp:Label ID="lbl_Status" runat="server" Text="" CssClass="redlbl font12em"></asp:Label></div>
                        <asp:Button ID="btnPostJob" runat="server" Text="<%$Resources:Resource,Submit %>"
                            CssClass="standard-button orange" OnClick="btnPostCV_Click" ValidationGroup="AdsCv" />
                        <asp:Button ID="btn_Clear" runat="server" Text="<%$Resources:Resource,Clear %>" OnClick="Clear_Click"
                            CssClass="standard-button small clearbtn" />
                    </div>
                    <div class="clear-floats">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col span-3 last" id="member-nav">
        <div class="module">
            <p class="home">
                <span class="icon"></span><a href="~/Account/my-jobs.aspx" runat="server">
                    <asp:Literal ID="Literal17" runat="server" Text="<%$Resources:Resource,Myjobsmanagement %>"></asp:Literal></a></p>
            <div id="my-jobs">
                <h3>
                    <span class="icon"></span>
                    <asp:Literal ID="Literal18" runat="server" Text="<%$Resources:Resource,MyJobs %>"></asp:Literal></h3>
                <ul>
                    <li><a href="~/memberArea/AppManagement.aspx" runat="server">
                        <asp:Literal ID="Literal16" runat="server" Text="<%$Resources:Resource,Myjobapplications %>"></asp:Literal></a></li>
                    <li><a id="A21" href="~/memberArea/ManageSavedJob.aspx" runat="server">
                        <asp:Literal ID="Literal19" runat="server" Text="<%$Resources:Resource,Managesavedjobs %>"></asp:Literal></a></li>
                    <%--<li><a href="~/memberArea/my-job-alert.aspx" runat="server">My job Alert</a></li>
                    <li><a href="~/memberArea/stop-email-alert.aspx" runat="server">Stop email Alert</a></li>--%>
                </ul>
            </div>
            <div id="my-cvs">
                <h3>
                    <span class="icon"></span>
                    <asp:Literal ID="Literal20" runat="server" Text="<%$Resources:Resource,MyCVs %>"></asp:Literal></h3>
                <ul>
                    <li class="rightselected"><a href="AdsCv.aspx">
                        <asp:Literal ID="Literal21" runat="server" Text="<%$Resources:Resource,CreateaCV %>"></asp:Literal></a></li>
                    <li><a href="../publicArea/CV/Detail.aspx?cvname=<%= UserId %>" target="_blank">
                        <asp:Literal ID="Literal22" runat="server" Text="<%$Resources:Resource,Reviewresume %>"></asp:Literal></a></li>
                    <li><a href="../publicArea/CV/UpdateCV.aspx?cvname=<%= UserId %>" target="_blank">
                        <asp:Literal ID="Literal23" runat="server" Text="<%$Resources:Resource,Updateyourresume %>"></asp:Literal></a>
                    </li>
                </ul>
            </div>
            <div id="my-account">
                <h3>
                    <span class="icon"></span>
                    <asp:Literal ID="Literal24" runat="server" Text="<%$Resources:Resource,MyAccount %>"></asp:Literal></h3>
                <ul>
                    <li><a runat="server" href="~/memberArea/CV/privacy-setting.aspx">
                        <asp:Literal ID="Literal25" runat="server" Text="<%$Resources:Resource,PrivacySettings %>"></asp:Literal></a></li>
                    <li><a runat="server" href="~/Account/ChangePassword.aspx">
                        <asp:Literal ID="Literal26" runat="server" Text="<%$Resources:Resource,ChangePassword %>"></asp:Literal></a></li>
                    <li>
                        <asp:LoginView ID="HeadLoginView" runat="server" EnableViewState="true">
                            <LoggedInTemplate>
                                <asp:LoginStatus ID="HeadLoginStatus" runat="server" LogoutAction="Redirect" LogoutText="<%$ Resources:Resource, Logouttxt %>"
                                    LogoutPageUrl="~/" />
                            </LoggedInTemplate>
                        </asp:LoginView>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="clear-floats">
    </div>
</asp:Content>
