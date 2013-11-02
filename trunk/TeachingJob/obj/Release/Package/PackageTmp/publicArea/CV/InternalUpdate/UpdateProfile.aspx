<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateProfile.aspx.cs"
    Inherits="TeachingJob.publicArea.CV.InternalUpdate.UpdateProfile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update personal</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .more
        {
            display: none;
        }
        .show{display:inline;}
        .noResizeHorizontal
        {
            resize: vertical;
        }
        .style1
        {
            width: 250px;
            vertical-align: top;
        }
    </style>
    <script type="text/javascript">
        function checkTextAreaMaxLength(textBox, e, length) {

            var mLen = textBox["MaxLength"];
            if (null == mLen)
                mLen = length;

            var maxLength = parseInt(mLen);
            if (!checkSpecialKeys(e)) {
                if (textBox.value.length > maxLength - 1) {
                    if (window.event)//IE
                        e.returnValue = false;
                    else//Firefox
                        e.preventDefault();
                }
            }
        }
        function checkSpecialKeys(e) {
            if (e.keyCode != 8 && e.keyCode != 46 && e.keyCode != 37 && e.keyCode != 38 && e.keyCode != 39 && e.keyCode != 40)
                return false;
            else
                return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="standard-form1 ">
        <h3 class="group-title top">
            <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,ProfileInfomation %>"></asp:Literal>
        </h3>
        <br />
        <table cellpadding="5px" cellspacing="5" style="width: 100%">
            <tr>
                <td class="style1">
                    <span class="h4tag">
                        <asp:Label ID="lbl_EduLeveltxt" runat="server" Text="<%$Resources:Resource,EduLevelspan %>"
                            CssClass="bold"></asp:Label></span>
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
                    <span class="h4tag">
                        <asp:Label ID="lbl_Majortxt" runat="server" Text="<%$Resources:Resource,Majorspan %>"
                            CssClass="bold"></asp:Label></span>
                </td>
                <td>
                    <asp:TextBox ID="txt_Major" runat="server" Width="410px" CssClass="input" Font-Size="Smaller"
                        MaxLength="200" ForeColor="Black"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseenteryourmajor %>"
                        Text="*" CssClass="failureNotification" Display="Dynamic" ControlToValidate="txt_Major"
                        ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <span class="h4tag">
                        <asp:Label ID="lbl_SpokenLang" runat="server" Text="<%$Resources:Resource,Languagesproficiency %>"
                            CssClass="bold"></asp:Label></span>
                </td>
                <td>
                    <asp:DropDownList ID="ddl_lang1" runat="server" CssClass="input" AutoPostBack="true"
                        Width="220px">
                    </asp:DropDownList>
                    &nbsp;
                    <asp:DropDownList ID="ddl_lang1_lvl" runat="server" CssClass="input" Width="150px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style1">
                </td>
                <td>
                    <asp:DropDownList ID="ddl_lang2" runat="server" CssClass="input" AutoPostBack="true"
                        Width="220px">
                    </asp:DropDownList>
                    &nbsp;
                    <asp:DropDownList ID="ddl_lang2_lvl" runat="server" CssClass="input" Width="150px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style1">
                </td>
                <td>
                    <asp:DropDownList ID="ddl_lang3" runat="server" CssClass="input" AutoPostBack="true"
                        Width="220px">
                    </asp:DropDownList>
                    &nbsp;
                    <asp:DropDownList ID="ddl_lang3_lvl" runat="server" CssClass="input" Width="150px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <span class="h4tag">
                        <asp:Label ID="lbl_YearOfExp" runat="server" Text="<%$Resources:Resource,YearsofExperiencespan %>"
                            CssClass="bold"></asp:Label></span>
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
                    <span class="h4tag">
                        <asp:Label ID="lbl_RelatedExp" runat="server" Text="<%$Resources:Resource,RelatedExperience %>"
                            CssClass="bold"></asp:Label></span>
                </td>
                <td>
                    <asp:TextBox ID="txt_RelatedExp" runat="server" Width="380px" CssClass="input" Font-Size="Smaller"
                        MaxLength="200" ForeColor="Black"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <span class="h4tag">
                        <asp:Label ID="lbl_MostRecentPosition" runat="server" Text="<%$Resources:Resource,MostRecentPositionspan %>"
                            CssClass="bold"></asp:Label></span>
                </td>
                <td>
                    <asp:TextBox ID="txt_MostRecentPosition" runat="server" Width="380px" CssClass="input"
                        MaxLength="200" Font-Size="Smaller" ForeColor="Black"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseenteryourrecentposition %>"
                        Text="*" CssClass="failureNotification" Display="Dynamic" ControlToValidate="txt_MostRecentPosition"
                        ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <span class="h4tag">
                        <asp:Label ID="lbl_CurrentJobLevel" runat="server" Text="<%$Resources:Resource,CurrentJobLevelspan %>"></asp:Label></span>
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
                <td class="style1">
                    <span class="h4tag">
                        <asp:Label ID="lbl_Achievementtxt" runat="server" Text="<%$Resources:Resource,Achievements %>"
                            CssClass="bold"></asp:Label></span>
                </td>
                <td>
                    <asp:TextBox ID="txt_Achievement" runat="server" TextMode="MultiLine" Width="380px"
                        MaxLength='1000' onkeyDown="checkTextAreaMaxLength(this,event,'1000');" CssClass="input noResizeHorizontal"
                        Font-Size="Smaller" ForeColor="Black"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <span class="h4tag">
                        <asp:Label ID="lbl_Skill" runat="server" Text="<%$Resources:Resource,SkillsInterests %>"
                            CssClass="bold"></asp:Label></span>
                </td>
                <td>
                    <asp:TextBox ID="txt_Skill" runat="server" TextMode="MultiLine" Width="380px" CssClass="input noResizeHorizontal"
                        Font-Size="Smaller" ForeColor="Black" MaxLength='1000' onkeyDown="checkTextAreaMaxLength(this,event,'1000');"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <span class="h4tag">
                        <asp:Label ID="lbl_Membership" runat="server" Text="<%$Resources:Resource,Memberships %>"
                            CssClass="bold"></asp:Label></span>
                </td>
                <td>
                    <asp:TextBox ID="txt_Membership" runat="server" TextMode="MultiLine" Width="380px"
                        CssClass="input noResizeHorizontal" Font-Size="Smaller" MaxLength='1000' onkeyDown="checkTextAreaMaxLength(this,event,'1000');"
                        ForeColor="Black"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <span class="h4tag">
                        <asp:Label ID="lbl_Employment" runat="server" Text="<%$Resources:Resource,Desiredemploymentspan %>"
                            CssClass="bold"></asp:Label></span>
                </td>
                <td>
                    <asp:DropDownList ID="ddl_Employment" runat="server" CssClass="input">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server"
                        ErrorMessage="<%$Resources:Resource,Pleaseselectyourdesiredcategory %>" Text="*"
                        CssClass="failureNotification" ControlToValidate="ddl_Employment" ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style1"></td>
                <td><asp:DropDownList ID="ddl_Employment2" runat="server" CssClass="input">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td class="style1"></td>
                <td>
                    <asp:DropDownList ID="ddl_Employment3" runat="server" CssClass="input">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td class="style1">
                    <span class="h4tag">
                        <asp:Label ID="lbl_JobLevel" runat="server" Text="<%$Resources:Resource,Desiredjoblevelspan %>"
                            CssClass="bold"></asp:Label></span>
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
                    <span class="h4tag">
                        <asp:Label ID="lbl_DesiredLocation" runat="server" Text="<%$Resources:Resource,Desiredlocationspan %>"
                            CssClass="bold"></asp:Label></span>
                </td>
                <td>
                    <asp:DropDownList ID="ddl_DesiredLocation" runat="server" CssClass="input">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseenteryourdesiredlocation %>"
                        Text="*" CssClass="failureNotification" Display="Dynamic" ControlToValidate="ddl_DesiredLocation"
                        ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                </td>
                <td>
                    <asp:DropDownList ID="ddl_DesiredLocation2" runat="server" CssClass="input">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style1">
                </td>
                <td>
                    <asp:DropDownList ID="ddl_DesiredLocation3" runat="server" CssClass="input">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <span class="h4tag">
                        <asp:Label ID="lbl_SalaryExpect" runat="server" Text="<%$Resources:Resource,Salaryexpectation %>"
                            CssClass="bold"></asp:Label>
                    </span>
                </td>
                <td>
                    <script type="text/javascript">
                        function displaySalaryPanel(panelID) {
                            if (panelID == 'example5') {
                                document.getElementById('example5').style.display = 'inline';
                            } else {
                                document.getElementById('example5').style.display = 'none';
                            }
                        }
                    </script>
                    <input type="radio" name="salaryType" <%if(SalaryType!=null){if(SalaryType==false){ %> checked="checked" <%}} %> value="Negotiable" onclick="displaySalaryPanel('example55')" />
                    <span class="fontsize12">
                        <asp:Literal ID="Literal27" runat="server" Text="<%$Resources:Resource,Negotiable %>"></asp:Literal></span>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" id="example5-show" name="salaryType" <%if(SalaryType!=null){if(SalaryType==true){ %> checked="checked" <%}} %> value="Specified" onclick="displaySalaryPanel('example5')" />
                    <span class="fontsize12">
                        <asp:Literal ID="Literal28" runat="server" Text="<%$Resources:Resource,Specified %>"></asp:Literal></span>
                    <br />
                    <div id="example5" <%if(SalaryType!=null){if(SalaryType==true){ %> class="show" <%}else{ %> class="more" <%}}else{ %> class="more" <%} %>>
                     <span style="font-size:smaller">   <asp:Literal ID="Literal12" runat="server" Text="<%$Resources:Resource,From %>"></asp:Literal></span>
                        <asp:TextBox ID="txt_SalaryFrom" runat="server" CssClass="input" Width="100px"></asp:TextBox>
                        <span style="font-size:smaller"><asp:Literal ID="Literal13" runat="server" Text="<%$Resources:Resource,To %>"></asp:Literal></span>
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
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseinputyourexpectedsalary %>"
                            Text="*" CssClass="failureNotification" Display="Dynamic" ControlToValidate="txt_SalaryFrom"
                            ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txt_SalaryFrom"
                            ValidationGroup="AdsCv" Display="Dynamic" ValidationExpression="(\+|-)?[0-9]+(\.[0-9]*)?"
                            runat="server" ErrorMessage="<%$Resources:Resource,Salarymustbeinnumber %>" Text="*"
                            CssClass="failureNotification"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseinputyourexpectedsalary %>"
                            Text="*" CssClass="failureNotification" Display="Dynamic" ControlToValidate="txt_SalaryTo"
                            ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txt_SalaryTo"
                            ValidationGroup="AdsCv" ValidationExpression="(\+|-)?[0-9]+(\.[0-9]*)?" runat="server"
                            ErrorMessage="<%$Resources:Resource,Salarymustbeinnumber %>" Display="Dynamic"
                            Text="*" CssClass="failureNotification"></asp:RegularExpressionValidator>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <span class="h4tag">
                        <asp:Label ID="lbl_DesiredTravel" runat="server" Text="<%$Resources:Resource,Desiredtravelspan %>"
                            CssClass="bold"></asp:Label></span>
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
                    <span class="h4tag">
                        <asp:Literal ID="Literal30" runat="server" Text="<%$Resources:Resource,CurrentResidencespan %>"></asp:Literal></span>
                </td>
                <td>
                    <asp:TextBox ID="txt_CurrentResidence" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseenteryourcurrentlivinglocation %>"
                        Text="*" CssClass="failureNotification" Display="Dynamic" ControlToValidate="txt_CurrentResidence"
                        ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <span class="h4tag">
                        <asp:Label ID="lbl_Relocated" runat="server" Text="<%$Resources:Resource,Willingtorelocate %>"
                            CssClass="bold"></asp:Label></span>
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
                    <span class="h4tag">
                        <asp:Label ID="lbl_HowSoonAvai" runat="server" Text="<%$Resources:Resource,Howsoonarespan %>"
                            CssClass="bold"></asp:Label></span>
                </td>
                <td>
                    <asp:TextBox ID="txt_HowSoonAvai" runat="server" CssClass="input" Font-Size="Smaller"
                        MaxLength="200" ForeColor="Black"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseenteryourdesired %>"
                        Text="*" CssClass="failureNotification" Display="Dynamic" ControlToValidate="txt_HowSoonAvai"
                        ValidationGroup="AdsCv"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;
                </td>
            </tr>
        </table>
        <div class="clear-floats">
        </div>
        <div class="term">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="AdsCv"
                CssClass="literalNotification" />
            <asp:Button ID="btnPostJob" runat="server" Text="<%$Resources:Resource,Submit %>"
                CssClass="standard-button orange small" ValidationGroup="AdsCv" OnClick="btnPostCV_Click" />
        </div>
    </div>
    </form>
</body>
</html>
