<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="myAccount.aspx.cs" Inherits="TeachingJob.Account.myAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script runat="server">
        string username;
        MembershipUser mu = Membership.GetUser();
        
        public void Page_PreRender()
        {
            string email = mu.Email;

            if (Roles.GetRolesForUser(Page.User.Identity.Name).Contains("Organization"))
            {
                //pnl_Employer.Visible = true;
                //pnl_Employee.Visible = false;

                //username = mu.UserName;
                //UserName.Text = mu.UserName;
                //Email.Text = email;
                //ddl_Salutation.SelectedItem.Text = Profile.Employer.Salutation;
                //txt_FirstName.Text = Profile.Employer.FirstName;
                //txt_Middle.Text = Profile.Employer.MiddleName;
                //txt_LastName.Text = Profile.Employer.LastName;
                //txt_PrimaryPhone.Text = Profile.Employer.Phone;
                //txt_SecondPhone.Text = Profile.Employer.SecondaryPhone;
                //if (Profile.Organization.Logo == "NA.png" || Profile.Organization.Logo == "" || Profile.Organization.Logo == null)
                //{
                //    img_Logo.ImageUrl = "~/images/companyLogo/no_image_100x100.jpg";
                //}
                //else
                //{
                //    img_Logo.ImageUrl = "~/images/employer/logo/" + mu.UserName + "/" + Profile.Organization.Logo;
                //}
                //OrganizationName_txt.Text = Profile.Organization.OrganizationName;
                //Website_txt.Text = Profile.Organization.Website;
                //ListItem selectedItem_Type = OrganizationType.Items.FindByValue(Profile.Organization.OrganizationType);
                //if (selectedItem_Type != null)
                //{
                //    selectedItem_Type.Selected = true;
                //}
                //BriefInfo_txt.Text = Profile.Organization.BriefInfo;
                //Address1_txt.Text = Profile.Organization.Address1;
                //Address2_txt.Text = Profile.Organization.Address2;
                //Phone1_txt.Text = Profile.Organization.PhoneNumber1;
                //FaxNumber_txt.Text = Profile.Organization.FaxNumber;
                //State_txt.Text = Profile.Organization.StateProvince;
                //ListItem selectedItem_City = ddlJobLocation.Items.FindByValue(Profile.Organization.City);
                //if (selectedItem_City != null)
                //{
                //    selectedItem_City.Selected = true;
                //}
                //ListItem selectedItem_Country = ddlCitizenship.Items.FindByValue(Profile.Organization.Country);
                //if (selectedItem_Country != null)
                //{
                //    selectedItem_Country.Selected = true;
                //}
                //ZipCode_txt.Text = Profile.Organization.ZipCode;

            }
            else if (Roles.GetRolesForUser(Page.User.Identity.Name).Contains("Employee"))
            {
                //pnl_Employer.Visible = false;
                //pnl_Employee.Visible = true;

                //UserName_em.Text = mu.UserName;
                //Email_em.Text = email;
                txt_FirstName_em.Text = Profile.Employee.FirstName;
                txt_LastName_em.Text = Profile.Employee.LastName;
                if (Profile.Employee.DateOfBirth.ToShortDateString() != "1/1/0001")
                {
                    txt_Dob_em.Text = Profile.Employee.DateOfBirth.ToShortDateString();
                }
                else
                {
                    txt_Dob_em.Text = "";
                }
                txt_Phone_em.Text = Profile.Employee.Phone;
                txt_presentLocation.Text = Profile.Employee.PresentLocation;
                ListItem selected_Gender = ddl_Gender_em.Items.FindByValue(Profile.Employee.Gender);
                if (selected_Gender != null)
                {
                    selected_Gender.Selected = true;
                }
                ListItem selected_Citizen = ddl_Citizenship_em.Items.FindByValue(Profile.Employee.Citizenship);
                if (selected_Citizen != null)
                {
                    selected_Citizen.Selected = true;
                }
                if (Profile.Employee.Avatar == "NA.png" || Profile.Employee.Avatar == "" || Profile.Employee.Avatar == null)
                {
                    img_Avatar_em.ImageUrl = "~/images/companyLogo/no_image_100x100.jpg";
                }
                else
                {
                    img_Avatar_em.ImageUrl = TeachingJob.Data.General.CAN_LOGO + mu.UserName + "/" + Profile.Employee.Avatar;
                }
            }
            else
                Response.Redirect("~/publicArea/errorpages/Error403.aspx");
        }
        protected void UpdateProfile_em_Click(object sender, EventArgs e)
        {
            if (FileUpload1_em.HasFile)
            {
                Profile.Employee.Avatar = fileUploadName_candidate(FileUpload1_em, lbl_Status_em, mu.UserName);
                lbl_Status_em.Text = "Photo is updated successfully!";
            }
            Profile.Employee.FirstName = txt_FirstName_em.Text.Trim();
            Profile.Employee.LastName = txt_LastName_em.Text.Trim();
            if (txt_Dob_em.Text.Trim() != "")
            {
                Profile.Employee.DateOfBirth = Convert.ToDateTime(txt_Dob_em.Text);
            }
            Profile.Employee.Gender = ddl_Gender_em.SelectedValue;
            Profile.Employee.Phone = txt_Phone_em.Text.Trim();
            Profile.Employee.Citizenship = ddl_Citizenship_em.SelectedValue;
            Profile.Employee.PresentLocation = txt_presentLocation.Text.Trim();
            Response.Redirect("~/memberArea/AdsCv.aspx");
        }
        //protected void UpdateProfile_Click(object sender, EventArgs e)
        //{
        //    if (FileUpload1.HasFile)
        //    {
        //        Profile.Organization.Logo = fileUploadName(FileUpload1, lblStatus, mu.UserName);
        //        lblStatus.Text = "Photo is updated successfully!";
        //    }
        //    Profile.Employer.Salutation = ddl_Salutation.SelectedValue;
        //    Profile.Employer.FirstName = txt_FirstName.Text.Trim();
        //    Profile.Employer.MiddleName = txt_Middle.Text.Trim();
        //    Profile.Employer.LastName = txt_LastName.Text.Trim();
        //    Profile.Employer.Phone = txt_PrimaryPhone.Text.Trim();
        //    Profile.Employer.SecondaryPhone = txt_SecondPhone.Text.Trim();

        //    Profile.Organization.Country = ddlCitizenship.SelectedValue;
        //    Profile.Organization.City = ddlJobLocation.SelectedValue;
        //    Profile.Organization.OrganizationName = OrganizationName_txt.Text.Trim();
        //    Profile.Organization.Website = Website_txt.Text.Trim();
        //    Profile.Organization.OrganizationType = OrganizationType.SelectedValue;
        //    Profile.Organization.BriefInfo = BriefInfo_txt.Text.Trim();
        //    Profile.Organization.Address1 = Address1_txt.Text.Trim();
        //    Profile.Organization.Address2 = Address2_txt.Text.Trim();
        //    Profile.Organization.PhoneNumber1 = Phone1_txt.Text.Trim();
        //    Profile.Organization.FaxNumber = FaxNumber_txt.Text.Trim();
        //    Profile.Organization.StateProvince = State_txt.Text.Trim();
        //    Profile.Organization.ZipCode = ZipCode_txt.Text.Trim();
        //}
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--<asp:Panel ID="pnl_Employer" runat="server">
        <div class='col span-12'>
            <div class='component component-CurrentlyRecruiting' id='c-8'>
                <div class="module ">
                    <div id="currently-recruiting-outer">
                        <div class="module-title">
                            <h2>Profile you might want to share in your post.</h2>
                        </div>
                        <div class="standard-form">
                            <div style="width: 50%; clear: none; float: left;">
                                <h3 class="group-title top">
                                    Login information</h3>
                                
                                <table class="375size">
                                    <tr>
                                        <td class="cot1">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="UserName" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Email" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_CureentPwdLabelText" runat="server" Text="Current password:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbl_CurrentPwd" runat="server" Text="********"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">New password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm new password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                            <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                                ControlToValidate="ConfirmPassword" CssClass="failureNotification" Display="Dynamic"
                                                ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
                                        </td>
                                    </tr>
                                </table> 
                                
                                <br />
                                <h3 class="group-title">
                                    Personal information</h3>
                                <table width="100%">
                                    <tr>
                                        <td class="cot1">
                                            Salutation:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddl_Salutation" runat="server">
                                                <asp:ListItem Value="Mr.">Mr. </asp:ListItem>
                                                <asp:ListItem Value="Mrs.">Mrs. </asp:ListItem>
                                                <asp:ListItem Value="Ms.">Ms. </asp:ListItem>
                                                <asp:ListItem Value="Dr.">Dr.</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            First Name:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_FirstName" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Middle Initial:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_Middle" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Last Name:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_LastName" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Primary Phone:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_PrimaryPhone" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                                            runat="server" ErrorMessage="Phone allows just number." 
                                            ValidationExpression="^[0-9]+$" ControlToValidate="txt_PrimaryPhone" 
                                            Text="*" ValidationGroup="RegisterUserValidationGroup" CssClass="failureNotification" ></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="cot1">
                                            Secondary Phone:&nbsp;
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_SecondPhone" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </div>
                            <div style="width: 50%; float: left; clear: right;">
                                <h3 class="group-title top">
                                    Organization infomation</h3>
                                <table width="100%">
                                    <tr>
                                        <td class="style1">
                                            <asp:Label ID="lbl_OrganizationName" runat="server" Text="Organization name:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="OrganizationName_txt" runat="server" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_Logo" runat="server" Text="Logo:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Image ID="img_Logo" runat="server" ImageUrl="~/images/companyLogo/no_image_100x100.jpg"
                                                CssClass="maxheight" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_EditLogo" runat="server" Text="Edit logo:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:FileUpload ID="FileUpload1" runat="server" Width="200px" /><br />
                                            <asp:Label ID="lblStatus" runat="server" Text="" CssClass="redlbl"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_Website" runat="server" Text="Website:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Website_txt" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_OrganizationType" runat="server" Text="Organization type:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="OrganizationType" runat="server" CssClass="input">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_BriefInfo" runat="server" Text="Brief information:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="BriefInfo_txt" runat="server" TextMode="MultiLine" Width="200px"
                                                Height="180px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_Address1" runat="server" Text="Address 1:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Address1_txt" runat="server" Width="200px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_Address2" runat="server" Text="Address 2:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Address2_txt" runat="server" Width="200px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPhone1" runat="server" Text="Phone 1:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Phone1_txt" runat="server" Width="100px"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                                            runat="server" ErrorMessage="Phone allows just number." 
                                            ValidationExpression="^[0-9]+$" ControlToValidate="Phone1_txt" 
                                            Text="*" ValidationGroup="RegisterUserValidationGroup" CssClass="failureNotification" ></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_FaxNumber" runat="server" Text="Fax number:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="FaxNumber_txt" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblState" runat="server" Text="State/Province:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="State_txt" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_Location" runat="server" Text="Location:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlJobLocation" runat="server" CssClass="input">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_Citizenship" runat="server" Text="Country:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlCitizenship" runat="server" CssClass="input">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_ZipCode" runat="server" Text="Zip/Postal Code:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ZipCode_txt" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="clear-floats">
                            </div>
                            
                        </div>
                        <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="literalNotification"
                                    ValidationGroup="RegisterUserValidationGroup" />
                        <asp:Button ID="btn_UpdateProfile" CssClass="standard-button orange" runat="server"
                            Text="Update" OnClick="UpdateProfile_Click" ValidationGroup="RegisterUserValidationGroup" />
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>--%>
    <asp:Panel ID="pnl_Employee" runat="server">
        <div class='col span-8'>
            <div class='component component-CurrentlyRecruiting'>
                <div class="module ">
                    <div id="">
                        <div class="module-title">
                            <h2>Please enter the information below to complete your CV.</h2>
                        </div>
                        <div class="standard-form2">
                            <%--<h3 class="group-title top">
                                Login information</h3>
                            <table width="100%">
                                <tr>
                                    <td class="cot3">
                                        <asp:Label ID="UserNameLabel_em" runat="server">User Name:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="UserName_em" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="EmailLabel_em" runat="server">E-mail:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Email_em" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="CurrentPasswordLabel_em" runat="server">Current password:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="CurrentPassword_em" runat="server" Text="********"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="PasswordLabel_em" runat="server">New password:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password_em" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="ConfirmPasswordLabel_em" runat="server" AssociatedControlID="ConfirmPassword_em">Confirm new password:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ConfirmPassword_em" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <div class="clear-floats">
                            </div>
                            <br />--%>
                            <h3 class="group-title">
                                Personal information</h3>
                            <table width="100%">
                                <tr>
                                    <td class="cot3">
                                        <asp:Label ID="lbl_FirstName_em" runat="server" Text="First name:"></asp:Label>
                                    </td>
                                    <td class="cot4">
                                        <asp:TextBox ID="txt_FirstName_em" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="cot3">
                                        <asp:Label ID="lbl_LastName_em" runat="server" Text="Last name:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_LastName_em" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbl_Avatar_em" runat="server" Text="Profile photo:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Image ID="img_Avatar_em" runat="server" ImageUrl="~/images/companyLogo/no_image_100x100.jpg"
                                            CssClass="maxheight" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbl_EditImg_em" runat="server" Text="Edit photo:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:FileUpload ID="FileUpload1_em" runat="server" /><br />
                                        <asp:Label ID="lbl_Status_em" runat="server" Text="" CssClass="redlbl"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="cot3">
                                        <asp:Label ID="lbl_Dob_em" runat="server" Text="Date of birth:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Dob_em" runat="server"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please input a valid datetime format." 
                                        ValidationExpression="^((0?[13578]|10|12)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[01]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1}))|(0?[2469]|11)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[0]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1})))$" 
                                        ControlToValidate="txt_Dob_em" Text="*" ValidationGroup="UpdateCandidateGroup" CssClass="failureNotification"></asp:RegularExpressionValidator>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td style="font-style: italic;">
                                        Format: mm/dd/yyyy
                                    </td>
                                </tr>
                                <tr>
                                    <td class="cot3">
                                        <asp:Label ID="lbl_Gender_em" runat="server" Text="Gender:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddl_Gender_em" runat="server">
                                            <asp:ListItem Value="m">Male </asp:ListItem>
                                            <asp:ListItem Value="f">Female</asp:ListItem>
                                            <asp:ListItem Value="b">Other</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="cot3">
                                        <asp:Label ID="lbl_presentLocation" runat="server" Text="Present location:" ></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_presentLocation" runat="server" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="cot3">
                                        <asp:Label ID="lbl_Phone_em" runat="server" Text="Phone:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Phone_em" runat="server" ></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" 
                                            runat="server" ErrorMessage="Phone allows just number." 
                                            ValidationExpression="^[0-9]+$" ControlToValidate="txt_Phone_em" 
                                            Text="*" ValidationGroup="UpdateCandidateGroup" CssClass="failureNotification" ></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="cot3">
                                        <asp:Label ID="lbl_Citizen_em" runat="server" Text="Native citizen of:"></asp:Label>
                                    </td>
                                    <td class="cot4">
                                        <asp:DropDownList ID="ddl_Citizenship_em" runat="server" CssClass="input">
                                        </asp:DropDownList>
                                        
                                    </td>
                                </tr>
                               
                            </table>
                            <div class="clear-floats">
                            </div>
                        </div>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="UpdateCandidateGroup" CssClass="failureNotification"/>
                        <asp:Button ID="btn_UpdateProfile_em" CssClass="standard-button orange float-right" runat="server" 
                            Text="Next" OnClick="UpdateProfile_em_Click" ValidationGroup="UpdateCandidateGroup" />
                    </div>
                    <div class="clear-floats">
                            </div>
                </div>
            </div>
        </div>
        <div class="col span-3 last" id="member-nav">
        <div class="module">
            <p class="home">
                <span class="icon"></span><a href="../Account/my-jobs.aspx">My jobs management</a></p>
            <div id="my-jobs">
                <h3>
                    <span class="icon"></span>My Jobs</h3>
                <ul>
                    <li><a href="../memberArea/AppManagement.aspx">My job applications</a></li>
                    <li><a href="../memberArea/Saved-jobs.aspx">Saved jobs</a></li>
                    <li><a href="../memberArea/my-job-alert.aspx">My job Alert</a></li>
                    <li><a href="../memberArea/stop-email-alert.aspx">Stop email Alert</a></li>
                </ul>
            </div>
            <div id="my-cvs">
                <h3>
                    <span class="icon"></span>My CVs</h3>
                <ul>
                    <li><a href="../publicArea/CV/Detail.aspx?cvname=<%= Username %>" target="_blank">Review
                        resume</a></li>
                    <li><a href="../memberArea/AdsCv.aspx">Update your resume</a></li>
                </ul>
            </div>
            <div id="my-account">
                <h3>
                    <span class="icon"></span>My Account</h3>
                <ul>
                    <li><a href="../memberArea/CV/privacy-setting.aspx">Privacy Settings</a></li>
                    <li><a href="ChangePassword.aspx">Change Password</a></li>
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
    </asp:Panel>
</asp:Content>
