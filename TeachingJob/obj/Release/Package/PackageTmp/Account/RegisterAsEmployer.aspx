<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="RegisterAsEmployer.aspx.cs" Inherits="TeachingJob.Account.RegisterAsEmployer"
    ValidateRequest="false" %>

<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
    <title>Register as employer - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        function ClientValidator_Country(sender, args) {
            var v = document.getElementById('<%#CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddlCitizenship").ClientID %>').value;
            if (v == '') {
                args.IsValid = false;  // field is empty
            }
            else {
                // do your other validation tests here...
                args.IsValid = true;
            }
        }
        function ClientValidator_City(sender, args) {
            var v = document.getElementById('<%#CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddlJobLocation").ClientID %>').value;
            var country = document.getElementById('<%#CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddlCitizenship").ClientID %>').value;
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
        //ClientValidator_ddl_SchoolType
        function ClientValidator_OrganizationType(sender, args) {
            var v = document.getElementById('<%#CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("OrganizationType").ClientID %>').value;
            if (v == '') {
                args.IsValid = false;  // field is empty
            }
            else {
                // do your other validation tests here...
                args.IsValid = true;
            }
        }
        function ClientValidator_ddl_SchoolType(sender, args) {
            var v = document.getElementById('<%#CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddl_SchoolType").ClientID %>').value;
            var country = document.getElementById('<%#CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("OrganizationType").ClientID %>').value;
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
    <script runat="server">        
        public void CreateEmployer_Click(object sender, EventArgs e)
        {
            Boolean sent = false;
            if (Page.IsValid)
            {
                try
                {
                    ProfileCommon pc = (ProfileCommon)ProfileCommon.Create(CreateUserWizard1.UserName, true);
                    pc.Employer.Salutation = ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddl_Salutation")).SelectedValue;
                    pc.Employer.FirstName = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txt_FirstName")).Text;
                    pc.Employer.MiddleName = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txt_Middle")).Text;
                    pc.Employer.LastName = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txt_LastName")).Text;
                    pc.Employer.Phone = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txt_PrimaryPhone")).Text;
                    pc.Organization.OrganizationName = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("OrganizationName_txt")).Text;

                    string username = CreateUserWizard1.UserName;
                    pc.Organization.Logo = fileUploadName((FileUpload)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("FileUpload1"),
                                                            (Label)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("lblStatus"), username);

                    pc.Organization.Website = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Website_txt")).Text;
                    pc.Organization.BriefInfo = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("BriefInfo_txt")).Text;
                    pc.Organization.Address1 = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Address1_txt")).Text;
                    pc.Organization.FaxNumber = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("FaxNumber_txt")).Text;
                    pc.Organization.PhoneNumber1 = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Phone1_txt")).Text;
                    pc.Organization.OrganizationType = ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("OrganizationType")).SelectedValue;
                    if (!String.IsNullOrEmpty(((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddl_SchoolType")).SelectedValue) && pc.Organization.OrganizationType.Contains("K-12"))
                    {
                        pc.Organization.SchoolType = ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddl_SchoolType")).SelectedValue;
                    }
                    else
                    {
                        pc.Organization.SchoolType = string.Empty;
                    }
                    pc.Organization.Country = ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddlCitizenship")).SelectedValue;
                    if (pc.Organization.Country.Contains("ietnam"))
                    {
                        pc.Organization.City = ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddlJobLocation")).SelectedValue;
                    }
                    else
                    {
                        pc.Organization.City = String.Empty;
                    }
                    pc.Organization.ZipCode = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ZipCode_txt")).Text;
                    pc.Save();

                    if (Roles.IsUserInRole(CreateUserWizard1.UserName, "Organization"))
                    {
                        Roles.RemoveUserFromRole(CreateUserWizard1.UserName, "Organization");
                    }
                    if (Roles.IsUserInRole(CreateUserWizard1.UserName, "Employee"))
                    {
                        Roles.RemoveUserFromRole(CreateUserWizard1.UserName, "Employee");
                    }

                    Roles.AddUserToRole(CreateUserWizard1.UserName, "Organization");


                    RegisterUsername = CreateUserWizard1.UserName;

                    string userName = CreateUserWizard1.UserName;
                    string emailAddress = CreateUserWizard1.Email;
                    string pwd = CreateUserWizard1.Password;
                    MembershipUser mu = Membership.GetUser(userName);
                    mu.IsApproved = false;
                    Membership.UpdateUser(mu);
                    //string pwd = mu.GetPassword();

                    // Lets get the user's id
                    Guid userId = (Guid)Membership.GetUser(userName).ProviderUserKey;
                    //String fullname = pc.Employer.FirstName + " " + pc.Employer.LastName;
                    // Now lets create an email message
                    StringBuilder emailMessage = new StringBuilder();
                    emailMessage.Append(String.Format("Dear {0},<br /><br />", pc.Employer.FirstName));
                    emailMessage.Append("You have successfully created a TeachinVietnam account as an Employer.<br />Here are the login details:<br />");
                    emailMessage.Append(String.Format("<table style='margin-left:25px;'><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>User ID:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{0}</td></tr><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>Password:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{1}</td></tr></table><br />", userName, pwd));
                    emailMessage.Append(String.Format("To activate your account and start advertising a job or enjoy many other benefits from us, please click <a href='{2}/publicArea/ActivateUser.aspx?userName={0}&Id={1}&lang=en'>here</a>.<br />", userName, userId.ToString(), Request.Url.GetLeftPart(UriPartial.Authority)));
                    emailMessage.Append(String.Format("Please <a href='{0}/ContactUs.aspx'>contact us</a> if you have a query or need any emergency assistance from us.", Request.Url.GetLeftPart(UriPartial.Authority)));
                    //emailMessage.Append("<br />Thank you for joining us.<br /><br />Sincerely,<br />TeachinVietnam team.<br/><hr />");

                    TeachingJob.Data.MailUtils mailUtils = new TeachingJob.Data.MailUtils(Request);
                    StringBuilder strBuilder = new StringBuilder();

                    strBuilder.Append(mailUtils.MailHeader());
                    strBuilder.Append(mailUtils.Body(emailMessage.ToString(), null, false, null, null, "en-US"));
                    strBuilder.Append(mailUtils.Seperator());

                    emailMessage.Clear();
                    emailMessage.Append(String.Format("Chào {0},<br /><br />", pc.Employer.FirstName));
                    emailMessage.Append("Bạn vừa đăng ký thành công tài khoản Nhà tuyển dụng trên TeachinVietnam.<br />Sau đây là thông tin để bạn đăng nhập vào trang TeachinVietnam:<br />");
                    emailMessage.Append(String.Format("<table style='margin-left:25px;'><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>User ID:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{0}</td></tr><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>Password:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{1}</td></tr></table><br />", userName, pwd));
                    emailMessage.Append(String.Format("Để kích hoạt tài khoản và bắt đầu tuyển dụng, trải nghiệm những dịch vụ hữu ích của chúng tôi, mời bạn click vào <a href='{2}/publicArea/ActivateUser.aspx?userName={0}&Id={1}&lang=vi'>đây</a>.<br />", userName, userId.ToString(), Request.Url.GetLeftPart(UriPartial.Authority)));
                    emailMessage.Append(String.Format("Vui lòng <a href='{0}/ContactUs.aspx'>liên hệ</a> với chúng tôi, nếu bạn có  bất cứ thắc mắc hoặc yêu cầu trợ giúp khẩn cấp nào từ phía chúng tôi.", Request.Url.GetLeftPart(UriPartial.Authority)));
                    //emailMessage.Append("<br />Cảm ơn bạn đã sử dụng dịch vụ của TeachinVietnam.<br /><br />Trân trọng!<br />Nhóm chăm sóc khách hàng<br />TeachinVietnam.");

                    strBuilder.Append(mailUtils.Body(emailMessage.ToString(), null, false, null, null, "vi-VN"));
                    strBuilder.Append(mailUtils.MailFooter());

                    // Send the email
                    TeachingJob.Data.Utils.SendMail(emailAddress, "TeachinVietnam account activation", strBuilder.ToString());
                    sent = true;
                }
                catch (System.Configuration.Provider.ProviderException pe)
                {
                    Roles.RemoveUserFromRole(CreateUserWizard1.UserName, "Employee");
                    Membership.DeleteUser(CreateUserWizard1.UserName);
                    Label lbl = ((Label)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("lbl_mess"));
                    lbl.Text = pe.Message;
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
        protected void CreateUserWizard1_Finish(object sender, EventArgs e)
        {
            //MembershipUser mu = Membership.GetUser(RegisterUsername);
            //    string userId = mu.ProviderUserKey.ToString();
            //    Label1.Text = userId;

            //Profile.GetProfile(RegisterUsername).
            //Profile.Save();
            Page.Response.Redirect("~/Account/myAccount.aspx");
        }
        protected void OnCreating(object sender, EventArgs e)
        {
            CreateUserWizard cuw = (CreateUserWizard)sender;
            cuw.UserName = cuw.Email;
            //FormsAuthentication.RedirectFromLoginPage(CreateUserWizard1.UserName, true);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class='col span-12'>
        <div class='component component-CurrentlyRecruiting' id='c-8'>
            <div class="module ">
                <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" EnableViewState="true"
                    DuplicateUserNameErrorMessage="<%$Resources:Resource,Theemailaddresshasalreadybeenused %>"
                    OnFinishButtonClick="CreateUserWizard1_Finish" OnContinueButtonClick="CreateUserWizard1_Finish"
                    CreateUserButtonStyle-CssClass="standard-button orange" OnCreatedUser="CreateEmployer_Click"
                    OnCreatingUser="OnCreating" OnPreRender="CreateUserWizard1_Binding" OnCreateUserError="createUserWizard_CreateUserError">
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
                                            <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,CreateanEmployerAccount %>"></asp:Literal>
                                        </h2>
                                    </div>
                                    <div class="standard-form">
                                        <div style="width: 50%; clear: none; float: left;">
                                            <h3 class="group-title top">
                                                <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,Logininformation %>"></asp:Literal></h3>
                                            <table class="375size">
                                                <tr>
                                                    <td class="cot3">
                                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" Visible="false">User Name:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="UserName" runat="server" CssClass="textEntry" Visible="false" MaxLength="100"
                                                            Width="60%"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail: <span class="literalNotification">*</span></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Email" runat="server" CssClass="textEntry" MaxLength="100" Width="60%"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="EmailRequired" Display="None" runat="server" ControlToValidate="Email"
                                                            CssClass="failureNotification" ErrorMessage="<%$Resources:Resource,Emailisrequired %>"
                                                            ToolTip="<%$Resources:Resource,Emailisrequired %>" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="CreateUserWizard1"
                                                            CssClass="failureNotification" Display="None" ControlToValidate="Email" ErrorMessage="<%$Resources:Resource,Emailvalidformat %>"
                                                            Text="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="ConfirmEmailLabel" runat="server" AssociatedControlID="Email" Text="<%$Resources:Resource,ConfirmEmail %>"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="ConfirmEmail" runat="server" CssClass="textEntry" MaxLength="100"
                                                            Width="60%"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ConfirmEmail"
                                                            CssClass="failureNotification" Display="None" ErrorMessage="<%$Resources:Resource,ConfirmEmailrequired %>"
                                                            ToolTip="Confirmation E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="<%$Resources:Resource,TheEmailConfirmationmustmatch %>"
                                                            Text="*" ControlToCompare="Email" Display="None" ControlToValidate="ConfirmEmail"
                                                            ValidationGroup="CreateUserWizard1" CssClass="failureNotification"></asp:CompareValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Text="<%$Resources:Resource,Password %>"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"
                                                            MaxLength="100" Width="60%"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                            CssClass="failureNotification" Display="None" ErrorMessage="<%$Resources:Resource,Passwordisrequired %>"
                                                            ToolTip="<%$Resources:Resource,Passwordisrequired %>" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword"
                                                            Text="<%$Resources:Resource,ConfirmPassword %>"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="passwordEntry" TextMode="Password"
                                                            MaxLength="100" Width="60%"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" Display="None"
                                                            CssClass="failureNotification" ErrorMessage="<%$Resources:Resource,ConfirmPasswordisrequired %>"
                                                            ID="ConfirmPasswordRequired" runat="server" ToolTip="<%$Resources:Resource,ConfirmPasswordisrequired %>"
                                                            ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="PasswordCompare" runat="server" Display="None" ControlToCompare="Password"
                                                            ControlToValidate="ConfirmPassword" CssClass="failureNotification" ErrorMessage="<%$Resources:Resource,PasswordConfirmationmustmatch %>"
                                                            ValidationGroup="CreateUserWizard1">*</asp:CompareValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                            <%---------------------------%><br />
                                            <h3 class="group-title">
                                                <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,Contactinformation %>"></asp:Literal></h3>
                                            <table width="100%">
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
                                                        <asp:TextBox ID="txt_FirstName" runat="server" MaxLength="100" Width="60%"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="None" runat="server"
                                                            CssClass="failureNotification" ErrorMessage="<%$Resources:Resource,EnterFirstName %>"
                                                            ControlToValidate="txt_FirstName" ValidationGroup="CreateUserWizard1" Text="*"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" Text="<%$Resources:Resource,MiddleInitial %>"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_Middle" runat="server" MaxLength="100" Width="60%"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lbl_LastName" runat="server" Text="<%$Resources:Resource,LastName %>"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_LastName" runat="server" MaxLength="100" Width="60%"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="None" runat="server"
                                                            CssClass="failureNotification" ErrorMessage="<%$Resources:Resource,EnterLastName %>"
                                                            ControlToValidate="txt_LastName" ValidationGroup="CreateUserWizard1" Text="*"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label2" runat="server" Text="<%$Resources:Resource,Phonespan %>"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_PrimaryPhone" runat="server" MaxLength="100" Width="60%" ToolTip="<%$Resources:Resource,Yourmobilephoneispreferred %>"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="None" runat="server"
                                                            ErrorMessage="<%$Resources:Resource,Pleaseinputthephonenumber %>" ControlToValidate="txt_PrimaryPhone"
                                                            ValidationGroup="CreateUserWizard1" Text="*" CssClass="failureNotification"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Text="*"
                                                            Display="None" ErrorMessage="<%$Resources:Resource,Phonemustbenumberfromdigits %>"
                                                            ControlToValidate="txt_PrimaryPhone" ValidationExpression="\d{7,12}" CssClass="failureNotification"
                                                            ValidationGroup="CreateUserWizard1"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                        </div>
                                        <div style="width: 50%; float: left; clear: right;">
                                            <h3 class="group-title top">
                                                <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,Organizationinfomation %>"></asp:Literal></h3>
                                            <table width="100%">
                                                <tr>
                                                    <td class="cot3">
                                                        <asp:Label ID="lbl_OrganizationName" runat="server" Text="<%$Resources:Resource,Organizationnamespan %>"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="OrganizationName_txt" runat="server" Width="90%" MaxLength="100"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="None"
                                                            ErrorMessage="<%$Resources:Resource,Pleaseinputtheorganizationname %>" ControlToValidate="OrganizationName_txt"
                                                            Text="*" ValidationGroup="CreateUserWizard1" CssClass="failureNotification"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lbl_Logo" runat="server" Text="<%$Resources:Resource,Logo2 %>"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:FileUpload ID="FileUpload1" runat="server" Width="200px" onchange="check_extension(this);" /><br />
                                                        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lbl_Website" runat="server" Text="<%$Resources:Resource,Website %>"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Website_txt" runat="server" MaxLength="200" Width="65%"></asp:TextBox>
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

                                                                if (ControlName.value.indexOf('K-12') != -1 || ControlName.value.indexOf('Mầm non') != -1) {
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
                                                            CssClass="failureNotification" ValidationGroup="CreateUserWizard1" Display="None"
                                                            Text="*" ClientValidationFunction="ClientValidator_OrganizationType"></asp:CustomValidator>
                                                        <div id="example5" style="padding-top: 5px; display: none">
                                                            <asp:DropDownList ID="ddl_SchoolType" runat="server" CssClass="input" ToolTip="<%$Resources:Resource,Canbeselected %>">
                                                            </asp:DropDownList>
                                                            <asp:CustomValidator ID="CustomValidator5" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseinputtheorganizationtype2 %>"
                                                                CssClass="failureNotification" ValidationGroup="CreateUserWizard1" Display="None"
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
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator8" runat="server"
                                                            ErrorMessage="<%$Resources:Resource,Pleaseinputtheaddress %>" ControlToValidate="Address1_txt"
                                                            Text="*" ValidationGroup="CreateUserWizard1" CssClass="failureNotification"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblPhone1" runat="server" Text="<%$Resources:Resource,Phonespan %>"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Phone1_txt" runat="server" Width="65%" MaxLength="100" ToolTip="<%$Resources:Resource,Yourlandlineispreferred %>"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseinputtheorganizationphone %>"
                                                            ControlToValidate="Phone1_txt" Text="*" Display="None" ValidationGroup="CreateUserWizard1"
                                                            CssClass="failureNotification"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Text="*"
                                                            Display="None" ErrorMessage="<%$Resources:Resource,Phonemustbenumberfromdigits %>"
                                                            ControlToValidate="Phone1_txt" ValidationExpression="\d{7,12}" CssClass="failureNotification"
                                                            ValidationGroup="CreateUserWizard1"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lbl_FaxNumber" runat="server" Text="<%$Resources:Resource,Faxnumber %>"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="FaxNumber_txt" runat="server" MaxLength="100" Width="65%"></asp:TextBox>
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
                                                            OnSelectedIndexChanged="Country_IndexChanged" ViewStateMode="Enabled" Width="65%">
                                                        </asp:DropDownList>
                                                        <asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseinputthecountry %>"
                                                            CssClass="failureNotification" ValidationGroup="CreateUserWizard1" Display="None"
                                                            Text="*" ClientValidationFunction="ClientValidator_Country"></asp:CustomValidator>
                                                        <div id="city" style="display: none; padding-top: 10px;">
                                                            <br />
                                                            <br />
                                                            <asp:DropDownList ID="ddlJobLocation" runat="server" CssClass="input" ToolTip="<%$Resources:Resource,Pleaseselectalocation %>"
                                                                Width="65%">
                                                            </asp:DropDownList>
                                                            <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseinputtheorganizationlocation %>"
                                                                CssClass="failureNotification" ValidationGroup="CreateUserWizard1" Display="None"
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
                                                <tr>
                                                    <td colspan="2" valign="middle">
                                                        <div class="term">
                                                            <asp:CheckBox ID="cb_TermAgreement" runat="server" Text="<%$Resources:Resource,Ivereadagreeto %>"
                                                                CssClass="lineheight10 AcceptedAgreement" />
                                                            <asp:CustomValidator ID="CustomValidator1" Display="None" EnableClientScript="true"
                                                                ClientValidationFunction="CheckBoxRequired_ClientValidate" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseconfirmthat %>"
                                                                Text="*" ValidationGroup="CreateUserWizard1" CssClass="failureNotification"></asp:CustomValidator>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="clear-floats">
                                        </div>
                                    </div>
                                </div>
                                <span class="failureNotification"><span class="literalNotification">
                                    <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal></span>
                                    <asp:Label ID="lbl_mess" runat="server" Text="" CssClass="failureNotification"></asp:Label>
                                    <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="failureNotification"
                                        ValidationGroup="CreateUserWizard1" />
                                </span>
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
