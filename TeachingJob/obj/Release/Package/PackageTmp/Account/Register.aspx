<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="TeachingJob.Account.Register" EnableViewState="true" %>

<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
<title>Candidate registration - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

    <script runat="server">
        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            Boolean sent = false;
            System.Threading.Thread.CurrentThread.CurrentCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
            System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("en-US");
            if (Page.IsValid)
            {
                try
                {
                    ProfileCommon p = (ProfileCommon)ProfileCommon.Create(CreateUserWizard1.UserName, true);
                    p.Employee.FirstName = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txt_FirstName")).Text;
                    p.Employee.LastName = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txt_LastName")).Text;


                    p.Employee.DateOfBirth = dob;

                    p.Employee.Gender = ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddl_Gender")).SelectedValue;
                    p.Employee.Phone = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txt_Phone")).Text;
                    //dang loi citizenship o day
                    p.Employee.Citizenship = ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddl_Citizenship")).Text;
                    p.Employee.Avatar = fileUploadName((FileUpload)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("FileUpload1"),
                                                    (Label)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("lbl_Status"), CreateUserWizard1.UserName);
                    p.Employee.PresentLocation = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txt_presentLocation")).Text;
                    p.Employee.IsRegisterIntership = ((CheckBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("cb_registerIntership")).Checked;
                    p.Save();

                    if (Roles.IsUserInRole(CreateUserWizard1.UserName, "Organization"))
                    {
                        Roles.RemoveUserFromRole(CreateUserWizard1.UserName, "Organization");
                    }
                    if (Roles.IsUserInRole(CreateUserWizard1.UserName, "Employee"))
                    {
                        Roles.RemoveUserFromRole(CreateUserWizard1.UserName, "Employee");
                    }
                    Roles.AddUserToRole(CreateUserWizard1.UserName, "Employee");

                    string userName = CreateUserWizard1.UserName;
                    string emailAddress = CreateUserWizard1.Email;
                    string pwd = CreateUserWizard1.Password;
                    MembershipUser mu = Membership.GetUser(userName);
                    mu.IsApproved = true;
                    Membership.UpdateUser(mu);
                    //string pwd = mu.GetPassword();

                    // Lets get the user's id
                    Guid userId = (Guid)Membership.GetUser(userName).ProviderUserKey;

                    // Now lets create an email message
                    StringBuilder emailMessage = new StringBuilder();

                    emailMessage.Append(String.Format("Dear {0},<br /><br />", p.Employee.FirstName));
                    emailMessage.Append("You’ve just registered TeachinVietnam account as a jobseeker.<br />Here are the login details:<br />");
                    emailMessage.Append(String.Format("<table style='margin-left:25px;'><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>User ID:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{0}</td></tr><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>Password:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{1}</td></tr></table><br />", userName, pwd));
                    emailMessage.Append(String.Format("To activate your account, please <a href='{2}/publicArea/ActivateUser.aspx?userName={0}&Id={1}&lang=en'>click here</a>.<br />", userName, userId.ToString(), Request.Url.GetLeftPart(UriPartial.Authority)));
                    emailMessage.Append(String.Format("Please <a href='{0}/ContactUs.aspx'>contact us</a> if you have any problem with the website.", Request.Url.GetLeftPart(UriPartial.Authority)));
                    //emailMessage.Append("<br />This e-mail is generated automatically. Please do not reply to it<br />Thank you for using TeachinVietnam.<br /><br />Best regards,<br />TeachinVietnam team.<br/><hr />");

                    StringBuilder strBuilder = new StringBuilder();

                    TeachingJob.Data.MailUtils mailUtils = new TeachingJob.Data.MailUtils(Request);
                    strBuilder.Append(mailUtils.MailHeader());
                    strBuilder.Append(mailUtils.Body(emailMessage.ToString(), null, false, null, null, "en-US"));
                    strBuilder.Append(mailUtils.Seperator());

                    emailMessage.Clear();
                    emailMessage.Append(String.Format("Chào {0},<br /><br />", p.Employee.FirstName));
                    emailMessage.Append("Bạn vừa đăng ký tài khoản ứng viên trên TeachinVietnam.<br />Sau đây là thông tin để bạn đăng nhập vào trang TeachinVietnam:<br />");
                    emailMessage.Append(String.Format("<table style='margin-left:25px;'><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>User ID:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{0}</td></tr><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>Password:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{1}</td></tr></table><br />", userName, pwd));
                    emailMessage.Append(String.Format("Để kích hoạt tài khoản, mời bạn click <a href='{2}/publicArea/ActivateUser.aspx?userName={0}&Id={1}&lang=vi'>vào đây</a>.<br />", userName, userId.ToString(), Request.Url.GetLeftPart(UriPartial.Authority)));
                    emailMessage.Append(String.Format("Vui lòng <a href='{0}/ContactUs.aspx'>liên hệ</a> với chúng tôi, nếu bạn có bất cứ thắc mắc nào khi sử dụng website này.", Request.Url.GetLeftPart(UriPartial.Authority)));
                    //emailMessage.Append("<br />Đây là email tự động, vui lòng không trả lời (reply) email này.<br />Cảm ơn  bạn đã sử dụng dịch vụ của chúng tôi.<br /><br />Thân mến!<br />Nhóm chăm sóc khách hàng<br />TeachinVietnam.");

                    strBuilder.Append(mailUtils.Body(emailMessage.ToString(), null, false, null, null, "vi-VN"));

                    strBuilder.Append(mailUtils.MailFooter());


                    // Send the email
                    TeachingJob.Data.Utils.SendMail(emailAddress, "TeachinVietnam account activation.", strBuilder.ToString());
                    sent = true;
                }
                catch (Exception)
                {
                    Roles.RemoveUserFromRole(CreateUserWizard1.UserName, "Employee");
                    Membership.DeleteUser(CreateUserWizard1.UserName);
                    Response.Redirect("~/publicArea/errorpages/ErrorNetworkNotFound.aspx");
                }
                if (sent == true)
                {
                    Response.Redirect("~/publicArea/Pending.aspx", true);
                }
            }
        }
        protected void OnCreating(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                CreateUserWizard cuw = (CreateUserWizard)sender;
                cuw.UserName = cuw.Email;

                string month = ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddl_Month")).SelectedValue;
                string day = ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddl_Day")).SelectedValue;
                string year = ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddl_Year")).SelectedValue;

                DateTime temp;
                if (DateTime.TryParse(month + "/" + day + "/" + year, out temp))
                {
                    dob = temp;
                }
                else
                {
                    dob = DateTime.Parse("01/01/1900");
                }
            }
        }
        DateTime dob;
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class='col span-8'>
        <div class='component component-CurrentlyRecruiting'>
            <div class="module ">
                <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" DuplicateUserNameErrorMessage="The email address has already been used. Please enter another one. Thank you!"
                    OnFinishButtonClick="CreateUserWizard1_Finish" OnContinueButtonClick="CreateUserWizard1_Finish"
                    OnCreatingUser="OnCreating" OnCreatedUser="CreateUserWizard1_CreatedUser" CreateUserButtonStyle-CssClass="standard-button orange">
                    <LayoutTemplate>
                        <asp:PlaceHolder ID="wizardStepPlaceholder" runat="server"></asp:PlaceHolder>
                        <asp:PlaceHolder ID="navigationPlaceholder" runat="server"></asp:PlaceHolder>
                    </LayoutTemplate>
                    <WizardSteps>
                        <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                            <ContentTemplate>
                                <div id="currently-recruiting-outer">
                                    <div class="module-title">
                                        <h2>
                                            <asp:Label ID="Label1" runat="server" Text="<%$Resources:Resource,Createanewaccountasjobseeker %>"></asp:Label></h2>
                                    </div>
                                    <div class="standard-form2">
                                        <h3 class="group-title top">
                                            <asp:Label ID="Label2" runat="server" Text="<%$Resources:Resource,Logininformation %>"></asp:Label></h3>
                                        <table width="100%">
                                            <asp:TextBox ID="UserName" runat="server" CssClass="textEntry" MaxLength="20" Visible="false"></asp:TextBox>
                                            <tr>
                                                <td class="cot3">
                                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail: <span class="literalNotification">*</span></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Email" runat="server" CssClass="textEntry" MaxLength="100" Width="50%"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="EmailRequired" Display="None" runat="server" ControlToValidate="Email"
                                                        CssClass="failureNotification" ErrorMessage="<%$Resources:Resource,Emailisrequired %>"
                                                        ToolTip="<%$Resources:Resource,Emailisrequired %>" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="None"
                                                        runat="server" ValidationGroup="CreateUserWizard1" CssClass="failureNotification"
                                                        ControlToValidate="Email" ErrorMessage="<%$Resources:Resource,Emailvalidformat %>"
                                                        Text="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lbl_confirmEmail" runat="server" Text="<%$Resources:Resource,ConfirmEmail %>"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_confirmEmail" runat="server" MaxLength="100" Width="50%"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="None" runat="server"
                                                        ErrorMessage="<%$Resources:Resource,ConfirmEmailrequired %>" CssClass="failureNotification"
                                                        Text="*" ControlToValidate="txt_confirmEmail" ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="CompareValidator1" Display="None" runat="server" ErrorMessage="<%$Resources:Resource,TheEmailConfirmationmustmatch %>"
                                                        CssClass="failureNotification" ControlToValidate="txt_confirmEmail" ControlToCompare="Email"
                                                        ValidationGroup="CreateUserWizard1" Text="*"></asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Text="<%$Resources:Resource,Password %>"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" Width="45%" MaxLength="100"
                                                        TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="PasswordRequired" Display="None" runat="server"
                                                        ControlToValidate="Password" CssClass="failureNotification" ErrorMessage="<%$Resources:Resource,Passwordisrequired %>"
                                                        ToolTip="<%$Resources:Resource,Passwordisrequired %>" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="None"
                                                        runat="server" ErrorMessage="<%$Resources:Resource,PasswordCustomError %>" ValidationExpression="^([a-zA-Z0-9]{6,20})$"
                                                        ValidationGroup="CreateUserWizard1" ControlToValidate="Password" Text="*" CssClass="failureNotification"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword"
                                                        Text="<%$Resources:Resource,ConfirmPassword %>"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="passwordEntry" Width="45%"
                                                        MaxLength="100" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="failureNotification"
                                                        Display="None" ErrorMessage="<%$Resources:Resource,ConfirmPasswordisrequired %>"
                                                        ID="ConfirmPasswordRequired" runat="server" ToolTip="Confirm Password is required."
                                                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="PasswordCompare" runat="server" Display="None" ControlToCompare="Password"
                                                        ControlToValidate="ConfirmPassword" CssClass="failureNotification" ErrorMessage="<%$Resources:Resource,PasswordConfirmationmustmatch %>"
                                                        ValidationGroup="CreateUserWizard1">*</asp:CompareValidator>
                                                </td>
                                            </tr>
                                        </table>
                                        <div class="clear-floats">
                                        </div>
                                        <br />
                                        <h3 class="group-title">
                                            <asp:Label ID="Label3" runat="server" Text="<%$Resources:Resource,Personalinformation %>"></asp:Label></h3>
                                        <table width="100%">
                                            <tr>
                                                <td class="cot3">
                                                    <asp:Label ID="lbl_FirstName" runat="server" Text="<%$Resources:Resource,FirstName %>"></asp:Label>
                                                </td>
                                                <td class="cot4">
                                                    <asp:TextBox ID="txt_FirstName" runat="server" MaxLength="100"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txt_FirstName"
                                                        Display="None" ValidationGroup="CreateUserWizard1" CssClass="failureNotification"
                                                        Text="*" runat="server" ErrorMessage="<%$Resources:Resource,EnterFirstName %>"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="cot3">
                                                    <asp:Label ID="lbl_LastName" runat="server" Text="<%$Resources:Resource,LastName %>"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_LastName" runat="server" MaxLength="100"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txt_FirstName"
                                                        Display="None" ValidationGroup="CreateUserWizard1" CssClass="failureNotification"
                                                        Text="*" runat="server" ErrorMessage="<%$Resources:Resource,EnterLastName %>"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lbl_Avatar" runat="server" Text="<%$Resources:Resource,Profileimage %>"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:FileUpload ID="FileUpload1" runat="server" onchange="check_extension(this);" /><br />
                                                    <asp:Label ID="lbl_Status" runat="server" Text="" CssClass="redlbl"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="cot3">
                                                    <asp:Label ID="lbl_Dob" runat="server" Text="<%$Resources:Resource,Dob %>"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddl_Month" runat="server" CssClass="input" EnableViewState="true">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ddl_Month"
                                                        Display="None" ValidationGroup="CreateUserWizard1" CssClass="failureNotification"
                                                        Text="*" runat="server" ErrorMessage="<%$Resources:Resource,EnterDob %>"></asp:RequiredFieldValidator>
                                                    <asp:DropDownList ID="ddl_Day" runat="server" CssClass="input" EnableViewState="true">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="ddl_Day"
                                                        Display="None" ValidationGroup="CreateUserWizard1" CssClass="failureNotification"
                                                        Text="*" runat="server" ErrorMessage=""></asp:RequiredFieldValidator>
                                                    <asp:DropDownList ID="ddl_Year" runat="server" CssClass="input" EnableViewState="true">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="ddl_Year"
                                                        Display="None" ValidationGroup="CreateUserWizard1" CssClass="failureNotification"
                                                        Text="*" runat="server" ErrorMessage=""></asp:RequiredFieldValidator>
                                                    <asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="<%$Resources:Resource,YourDoBisnotvalid %>"
                                                        ValidationGroup="CreateUserWizard1" Display="None" CssClass="failureNotification"
                                                        Text="*" OnServerValidate="Dob_Format_Validator"></asp:CustomValidator>
                                                    <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="<%$Resources:Resource,EnterDob %>"
                                                        ValidationGroup="CreateUserWizard1" Display="None" CssClass="failureNotification"
                                                        Text="*" OnServerValidate="Dob_Validator"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="cot3">
                                                    <asp:Label ID="lbl_Gender" runat="server" Text="<%$Resources:Resource,Gender2 %>"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddl_Gender" runat="server" CssClass="input" EnableViewState="true">
                                                        <asp:ListItem Value="n" Selected="True" Text=""></asp:ListItem>
                                                        <asp:ListItem Value="m" Text="<%$Resources:Resource,Male %>"> </asp:ListItem>
                                                        <asp:ListItem Value="f" Text="<%$Resources:Resource,Female %>"></asp:ListItem>
                                                        <asp:ListItem Value="n" Text="<%$Resources:Resource,Other %>"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="cot3">
                                                    <asp:Label ID="lbl_presentLocation" runat="server" Text="<%$Resources:Resource,Address2 %>"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_presentLocation" runat="server" Width="300px" MaxLength="200"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="cot3">
                                                    <asp:Label ID="lbl_Phone" runat="server" Text="<%$Resources:Resource,Telephone %>"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Phone" runat="server" MaxLength="100" ToolTip="<%$Resources:Resource,Yourmobilephoneispreferred %>"></asp:TextBox>
                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="None" ControlToValidate="txt_Phone"
                                                        ValidationGroup="CreateUserWizard1" CssClass="failureNotification" Text="*" runat="server"
                                                        ErrorMessage="<%$Resources:Resource,enterphonenumber %>"></asp:RequiredFieldValidator>--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="cot3">
                                                    <asp:Label ID="lbl_Citizen" runat="server" Text="<%$Resources:Resource,CountryofCitizenship %>"></asp:Label>
                                                </td>
                                                <td class="cot4">
                                                    <asp:DropDownList ID="ddl_Citizenship" runat="server" CssClass="input" Width="50%"
                                                        EnableViewState="true">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="ddl_Citizenship"
                                                        Display="None" ValidationGroup="CreateUserWizard1" CssClass="failureNotification"
                                                        Text="*" runat="server" ErrorMessage="<%$Resources:Resource,selectcitizenship %>"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                        </table>
                                        <div class="clear-floats">
                                        </div>
                                        <br />
                                        <div class="term">
                                            <asp:CheckBox ID="cb_TermAgreement" runat="server" Text="<%$Resources:Resource,Ivereadagreeto %>"
                                                Height="12px" CssClass="paddingbot AcceptedAgreement" />
                                            <asp:CustomValidator ID="CustomValidator4" Display="None" ClientValidationFunction="CheckBoxRequired_ClientValidate"
                                                EnableClientScript="true" runat="server" ErrorMessage="<%$Resources:Resource,confirmterm %>"
                                                Text="*" ValidationGroup="CreateUserWizard1" CssClass="failureNotification"></asp:CustomValidator>
                                            <%--<br />
                                            <asp:CheckBox ID="CheckBox1" runat="server" Text="<%$Resources:Resource,workpermit %>"
                                                Checked="true" Height="12px" CssClass="paddingbot" />--%>
                                            <br />
                                            <asp:CheckBox ID="cb_registerIntership" runat="server" Text=" I'd like to join teachinvietnam intership program."
                                                Height="12px" CssClass="paddingbot" />
                                            </table>
                                        </div>
                                    </div>
                                    <span class="literalNotification">
                                        <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
                                        <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="failureNotification"
                                            ValidationGroup="CreateUserWizard1" />
                                    </span>
                                </div>
                            </ContentTemplate>
                        </asp:CreateUserWizardStep>
                        <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                        </asp:CompleteWizardStep>
                    </WizardSteps>
                </asp:CreateUserWizard>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function CheckBoxRequired_ClientValidate(sender, e) {
            e.IsValid = jQuery(".AcceptedAgreement input:checkbox").is(':checked');
        }
        $('#MainContent_CreateUserWizard1_CreateUserStepContainer_FileUpload1').bind('change', function () {
            if (this.files[0].size > 5242880) {
                var FileUpload = document.getElementById('MainContent_CreateUserWizard1_CreateUserStepContainer_FileUpload1');
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
                var FileUpload = document.getElementById('MainContent_CreateUserWizard1_CreateUserStepContainer_FileUpload1');
                FileUpload.value = '';
                return false;
            }
        }
    </script>
</asp:Content>
