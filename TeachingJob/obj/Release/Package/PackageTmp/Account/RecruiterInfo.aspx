<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="RecruiterInfo.aspx.cs" Inherits="TeachingJob.Account.RecruiterInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Update information - TeachinVietnam</title>
    <script type="text/javascript">
        function ClientValidator_Country(sender, args) {
            var v = document.getElementById('<%= ddlCitizenship.ClientID %>').value;
            if (v == '') {
                args.IsValid = false;  // field is empty
            }
            else {
                // do your other validation tests here...
                args.IsValid = true;
            }
        }
        function ClientValidator_City(sender, args) {
            var v = document.getElementById('<%= ddlJobLocation.ClientID %>').value;
            var country = document.getElementById('<%= ddlCitizenship.ClientID %>').value;
            if (country == 'Vietnam') {
                if (v == '') {
                    args.IsValid = false;  // field is empty
                }
                else {
                    // do your other validation tests here...
                    args.IsValid = true;
                }
            } else {
                args.IsValid = true;
            }
        }
        function ClientValidator_OrganizationType(sender, args) {
            var v = document.getElementById('<%= OrganizationType.ClientID %>').value;
            if (v == '') {
                args.IsValid = false;  // field is empty
            }
            else {
                // do your other validation tests here...
                args.IsValid = true;
            }
        }
        function ClientValidator_ddl_SchoolType(sender, args) {
            var v = document.getElementById('<%= ddl_SchoolType.ClientID %>').value;
            var country = document.getElementById('<%= OrganizationType.ClientID %>').value;
            if (country.indexOf('K-12') != -1) {
                if (v == '') {
                    args.IsValid = false;  // field is empty
                }
                else {
                    // do your other validation tests here...
                    args.IsValid = true;
                }
            } else {
                args.IsValid = true;
            }
        }
        function showhideOnStartUp() {
            var country = document.getElementById('<%= ddlCitizenship.ClientID %>').value;

            if (country == 'Vietnam') {
                document.getElementById('city').style.display = 'inline';
            } else {
                document.getElementById('city').style.display = 'none';
            }

            var v = document.getElementById('<%= OrganizationType.ClientID %>').value;
            if (v.indexOf('K-12') != -1) {
                document.getElementById('example5').style.display = 'inline';
            } else {
                document.getElementById('example5').style.display = 'none';
            }
        }

    </script>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnl_Employer" runat="server">
        <div class='col span-12'>
            <div class='component component-CurrentlyRecruiting' id='c-8'>
                <div class="module ">
                    <div id="currently-recruiting-outer">
                        <div class="module-title">
                            <h2>
                                <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,Profileyoumight %>"></asp:Literal></h2>
                        </div>
                        <div class="standard-form">
                            <div style="width: 50%; clear: none; float: left;">
                                <h3 class="group-title">
                                    <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,Contactinformation %>"></asp:Literal></h3>
                                <table width="100%">
                                    <tr>
                                        <td class="cot3">
                                            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Email" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="cot3">
                                            <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource,Salutation %>"></asp:Literal>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddl_Salutation" runat="server" CssClass="input">
                                                <asp:ListItem Value="Mr.">Mr. </asp:ListItem>
                                                <asp:ListItem Value="Mrs.">Mrs. </asp:ListItem>
                                                <asp:ListItem Value="Ms.">Ms. </asp:ListItem>
                                                <asp:ListItem Value="Dr.">Dr.</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_FirstName" runat="server" Text="<%$Resources:Resource,FirstName %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_FirstName" runat="server" MaxLength="100"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="failureNotification"
                                                ErrorMessage="<%$Resources:Resource,EnterFirstName %>" ControlToValidate="txt_FirstName"
                                                ValidationGroup="CreateUserWizard1" Text="*"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text="<%$Resources:Resource,MiddleInitial %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_Middle" runat="server" MaxLength="100"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_LastName" runat="server" Text="<%$Resources:Resource,LastName %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_LastName" runat="server" MaxLength="100"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="failureNotification"
                                                ErrorMessage="<%$Resources:Resource,EnterLastName %>" ControlToValidate="txt_LastName"
                                                ValidationGroup="CreateUserWizard1" Text="*"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text="<%$Resources:Resource,Phonespan %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_PrimaryPhone" runat="server" MaxLength="100" ToolTip="Your mobile phone is preferred."></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Text="*"
                                                Display="Dynamic" ErrorMessage="<%$Resources:Resource,Phonemustbenumberfromdigits %>"
                                                ControlToValidate="txt_PrimaryPhone" ValidationExpression="\d{7,12}" CssClass="failureNotification"
                                                ValidationGroup="CreateUserWizard1"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,PersonalImage %>"></asp:Literal>
                                        </td>
                                        <td>
                                            <asp:Image ID="Img_PersonalImage" runat="server" CssClass="maxheight" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,Change %>"></asp:Literal>
                                        </td>
                                        <td>
                                            <asp:FileUpload ID="FileUpload_PersonalImage" runat="server" onchange="return check_extension2(this.value,'<%=FileUpload1.ClientID %>');" /><br />
                                            <asp:Label ID="lbl_ppStt" CssClass="literalNotification" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </div>
                            <div style="width: 50%; float: left; clear: right;">
                                <h3 class="group-title top">
                                    <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource,Organizationinfomation %>"></asp:Literal></h3>
                                <table>
                                    <tr>
                                        <td class="cot3">
                                            <asp:Label ID="lbl_OrganizationName" runat="server" Text="<%$Resources:Resource,Organizationnamespan %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="OrganizationName_txt" runat="server" Width="90%" MaxLength="100"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseinputtheorganizationname %>"
                                                ControlToValidate="OrganizationName_txt" Text="*" ValidationGroup="CreateUserWizard1"
                                                CssClass="failureNotification"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_Logo" runat="server" Text="<%$Resources:Resource,Logo2 %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Image ID="img_Logo" runat="server" CssClass="maxheight" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text="<%$Resources:Resource,Change %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:FileUpload ID="FileUpload1" runat="server" Width="200px" onchange="check_extension(this);" />
                                            <br />
                                            <asp:Label ID="lblStatus" CssClass="literalNotification" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_Website" runat="server" Text="<%$Resources:Resource,Website %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Website_txt" runat="server" MaxLength="200"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_OrganizationType" runat="server" Text="<%$Resources:Resource,Organizationtype %>"></asp:Label>
                                        </td>
                                        <td>
                                            <script type="text/javascript">
                                                function displaySalaryPanel(ddlId) {
                                                    var ControlName = document.getElementById(ddlId.id);

                                                    if (ControlName.value.indexOf('K-12') != -1) {
                                                        document.getElementById('example5').style.display = 'inline';
                                                    } else {
                                                        document.getElementById('example5').style.display = 'none';
                                                    }
                                                }
                                            </script>
                                            <asp:DropDownList ID="OrganizationType" runat="server" CssClass="input" onchange="displaySalaryPanel(this)"
                                                OnSelectedIndexChanged="OrganizationType_IndexChanged" ViewStateMode="Enabled"
                                                ToolTip="<%$Resources:Resource,Pleasesellectaschooltype %>">
                                            </asp:DropDownList>
                                            <asp:CustomValidator ID="CustomValidator4" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseinputtheorganizationtype %>"
                                                CssClass="failureNotification" ValidationGroup="CreateUserWizard1" Display="Dynamic"
                                                Text="*" ClientValidationFunction="ClientValidator_OrganizationType"></asp:CustomValidator>
                                            <div id="example5" style="padding-top: 5px; display: none">
                                                <asp:DropDownList ID="ddl_SchoolType" runat="server" CssClass="input" ToolTip="<%$Resources:Resource,Canbeselected %>">
                                                </asp:DropDownList>
                                                <asp:CustomValidator ID="CustomValidator5" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseinputtheorganizationtype2 %>"
                                                    CssClass="failureNotification" ValidationGroup="CreateUserWizard1" Display="Dynamic"
                                                    Text="*" ClientValidationFunction="ClientValidator_ddl_SchoolType"></asp:CustomValidator>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="topvalign">
                                            <asp:Label ID="lbl_BriefInfo" runat="server" Text="<%$Resources:Resource,Briefinformation %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="BriefInfo_txt" runat="server" TextMode="MultiLine" Width="90%" CssClass="noResizeHorizontal"
                                                Height="80px" MaxLength='10000' onkeyDown="checkTextAreaMaxLength(this,event,'10000');"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_Address1" runat="server" Text="<%$Resources:Resource,Addressspan %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Address1_txt" runat="server" Width="90%" MaxLength="100"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseinputtheaddress %>"
                                                ControlToValidate="Address1_txt" Text="*" ValidationGroup="CreateUserWizard1"
                                                CssClass="failureNotification"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPhone1" runat="server" Text="<%$Resources:Resource,Phonespan %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Phone1_txt" runat="server" Width="90%" MaxLength="100" ToolTip="<%$Resources:Resource,Yourlandlineispreferred %>"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Text="*"
                                                Display="Dynamic" ErrorMessage="<%$Resources:Resource,Phonemustbenumberfromdigits %>"
                                                ControlToValidate="Phone1_txt" ValidationExpression="\d{7,12}" CssClass="failureNotification"
                                                ValidationGroup="CreateUserWizard1"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_FaxNumber" runat="server" Text="<%$Resources:Resource,Faxnumber %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="FaxNumber_txt" runat="server" MaxLength="100"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_Citizenship" runat="server" Text="<%$Resources:Resource,Countryspan %>"></asp:Label>
                                        </td>
                                        <td>
                                            <script type="text/javascript">
                                                function showhidecitizen(ddlId) {
                                                    var ControlName = document.getElementById(ddlId.id);

                                                    if (ControlName.value == 'Vietnam') {
                                                        document.getElementById('city').style.display = 'inline';
                                                    } else {
                                                        document.getElementById('city').style.display = 'none';
                                                    }
                                                }
                                            </script>
                                            <asp:DropDownList ID="ddlCitizenship" runat="server" CssClass="input" onchange="showhidecitizen(this)"
                                                OnSelectedIndexChanged="Country_IndexChanged" ViewStateMode="Enabled">
                                            </asp:DropDownList>
                                            <asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseinputthecountry %>"
                                                CssClass="failureNotification" ValidationGroup="CreateUserWizard1" Display="Dynamic"
                                                Text="*" ClientValidationFunction="ClientValidator_Country"></asp:CustomValidator>
                                            <div id="city" style="display: none; padding-top: 10px;">
                                                <asp:DropDownList ID="ddlJobLocation" runat="server" CssClass="input" ToolTip="<%$Resources:Resource,Pleaseselectalocation %>">
                                                </asp:DropDownList>
                                                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseinputtheorganizationlocation %>"
                                                    CssClass="failureNotification" ValidationGroup="CreateUserWizard1" Display="Dynamic"
                                                    Text="*" ClientValidationFunction="ClientValidator_City"></asp:CustomValidator>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_ZipCode" runat="server" Text="<%$Resources:Resource,ZipCode %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ZipCode_txt" runat="server" MaxLength="100"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="clear-floats">
                            </div>
                        </div>
                        <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="failureNotification"
                            ValidationGroup="CreateUserWizard1" />
                        <asp:Button ID="btn_CancelUpdate" runat="server" Text="<%$Resources:Resource,Return %>"
                            OnClick="Cancel_Click" CssClass="standard-button small float-right" />
                        <asp:Button ID="btn_UpdateProfile" CssClass="standard-button orange float-right"
                            runat="server" Text="<%$Resources:Resource,Update %>" OnClick="UpdateProfile_Click"
                            ValidationGroup="CreateUserWizard1" />
                        <div class="clear-floats">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <script type="text/javascript">
        $('#<%=FileUpload1.ClientID %>').bind('change', function () {
            if (this.files[0].size > 5242880) {
                var FileUpload = document.getElementById('<%=FileUpload1.ClientID %>');
                FileUpload.value = '';
                alert('File size can not exceed 5 MB');
            }
        });
        $('#<%=FileUpload_PersonalImage.ClientID %>').bind('change', function () {
            if (this.files[0].size > 5242880) {
                var FileUpload = document.getElementById('<%=FileUpload_PersonalImage.ClientID %>');
                FileUpload.value = '';
                alert('File size can not exceed 5 MB');
            }
        });


        var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];
        function check_extension(filename) {
            var sFileName = filename.value;
            var blnValid = false;
            for (var j = 0; j < _validFileExtensions.length; j++) {
                var sCurExtension = _validFileExtensions[j];
                if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
                    blnValid = true;
                    break;
                }
            }
            if (!blnValid) {
                alert("Your file is invalid. Please select image only.");
                var FileUpload = document.getElementById('<%=FileUpload1.ClientID %>');
                FileUpload.value = '';
                return false;
            }
        }
        function check_extension2(filename) {
            var sFileName = filename.value;
            var blnValid = false;
            for (var j = 0; j < _validFileExtensions.length; j++) {
                var sCurExtension = _validFileExtensions[j];
                if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
                    blnValid = true;
                    break;
                }
            }
            if (!blnValid) {
                alert("Your file is invalid. Please select image only.");
                var FileUpload = document.getElementById('<%=FileUpload_PersonalImage.ClientID %>');
                FileUpload.value = '';
                return false;
            }
        }
    </script>
</asp:Content>
