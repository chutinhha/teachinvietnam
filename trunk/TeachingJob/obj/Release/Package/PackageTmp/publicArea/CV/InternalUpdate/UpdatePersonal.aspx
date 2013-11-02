<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePersonal.aspx.cs"
    Inherits="TeachingJob.publicArea.CV.InternalUpdate.UpdatePersonal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update personal</title>
    <style type="text/css">
        .style1
        {
            width: 250px;
            vertical-align: top;
        }
    </style>
    <script type="text/javascript">
        $('#<%=FileUpload1_em.ClientID %>').bind('change', function () {
            if (this.files[0].size > 5242880) {
                var FileUpload = document.getElementById('<%=FileUpload1_em.ClientID %>');
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
                var FileUpload = document.getElementById('<%=FileUpload1_em.ClientID %>');
                FileUpload.value = '';
                return false;
            }
        }
    </script>
    <script runat="server">
        string username;
        MembershipUser mu = Membership.GetUser();
        protected void Page_PreRender(object sender, EventArgs e)
        {
            string email = mu.Email;
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
        protected void UpdateProfile_em_Click(object sender, EventArgs e)
        {
            try
            {
                //System.Threading.Thread.CurrentThread.CurrentCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                //System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("en-US");

                if (FileUpload1_em.HasFile)
                {
                    Profile.Employee.Avatar = fileUploadName_candidate(FileUpload1_em, lbl_Status_em, mu.UserName);
                    System.Reflection.Assembly ass = System.Reflection.Assembly.Load("App_GlobalResources");
                    System.Resources.ResourceManager rm = new System.Resources.ResourceManager("Resources.Resource", ass);
                    lbl_Status_em.Text = rm.GetString("Photoisupdatedsuccessfully");
                }
                Profile.Employee.FirstName = txt_FirstName_em.Text.Trim();
                Profile.Employee.LastName = txt_LastName_em.Text.Trim();

                Profile.Employee.Gender = ddl_Gender_em.SelectedValue;
                Profile.Employee.Phone = txt_Phone_em.Text.Trim();
                Profile.Employee.Citizenship = ddl_Citizenship_em.SelectedValue;
                Profile.Employee.PresentLocation = txt_presentLocation.Text.Trim();

                if (txt_Dob_em.Text.Trim() != "")
                {
                    Profile.Employee.DateOfBirth = Convert.ToDateTime(txt_Dob_em.Text);
                }
                Profile.CV.LastUpdated = DateTime.Now;
                Profile.Save();
                Response.Redirect("~/publicArea/CV/UpdateCV.aspx?cvname=" + UserId + "&stt=updated");
            }
            catch (System.FormatException fe)
            {
                Response.Redirect("~/publicArea/CV/UpdateCV.aspx?cvname=" + UserId + "&stt=fe");
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <h3>
        <span style="text-align: center;">
            <asp:Label ID="Label3" runat="server" Text="<%$Resources:Resource,Personalinformation %>"></asp:Label></span>
    </h3>
    <br />
    <table width="100%">
        <tr>
            <td class="cot3">
                <span class="h4tag">
                    <asp:Label ID="lbl_FirstName_em" runat="server" Text="<%$Resources:Resource,FirstName %>"></asp:Label></span>
            </td>
            <td class="cot4">
                <asp:TextBox ID="txt_FirstName_em" runat="server" CssClass="input" Font-Size="Smaller"
                    MaxLength="100" ForeColor="Black"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txt_FirstName_em"
                    Display="Dynamic" ValidationGroup="CreateUserWizard1" CssClass="failureNotification"
                    Text="*" runat="server" ErrorMessage="<%$Resources:Resource,EnterFirstName %>"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="cot3">
                <span class="h4tag">
                    <asp:Label ID="lbl_LastName_em" runat="server" Text="<%$Resources:Resource,LastName %>"></asp:Label></span>
            </td>
            <td>
                <asp:TextBox ID="txt_LastName_em" runat="server" CssClass="input" Font-Size="Smaller"
                    MaxLength="100" ForeColor="Black"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txt_LastName_em"
                    Display="Dynamic" ValidationGroup="CreateUserWizard1" CssClass="failureNotification"
                    Text="*" runat="server" ErrorMessage="<%$Resources:Resource,EnterLastName %>"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <span class="h4tag">
                    <asp:Label ID="lbl_Avatar_em" runat="server" Text="<%$Resources:Resource,Profileimage %>"></asp:Label></span>
            </td>
            <td>
                <asp:Image ID="img_Avatar_em" runat="server" ImageUrl="~/images/companyLogo/no_image_100x100.jpg"
                    CssClass="maxheight" />
            </td>
        </tr>
        <tr>
            <td>
                <span class="h4tag">
                    <asp:Label ID="lbl_EditImg_em" runat="server" Text="<%$Resources:Resource,Editphoto %>"></asp:Label></span>
            </td>
            <td>
                <asp:FileUpload ID="FileUpload1_em" runat="server" CssClass="input" Font-Size="Smaller"
                    ForeColor="Black" onchange="check_extension(this);" /><br />
                <asp:Label ID="lbl_Status_em" runat="server" Text="" CssClass="redlbl"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="cot3">
                <span class="h4tag">
                    <asp:Label ID="lbl_Dob_em" runat="server" Text="<%$Resources:Resource,Dob %>"></asp:Label></span>
            </td>
            <td>
                <asp:TextBox ID="txt_Dob_em" runat="server" CssClass="input" Font-Size="Smaller"
                    MaxLength="100" ForeColor="Black"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="<%$Resources:Resource,YourDoBisnotvalid %>"
                    ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ControlToValidate="txt_Dob_em"
                    Text="*" ValidationGroup="UpdateCandidateGroup" CssClass="failureNotification"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td style="font-style: italic; font-size: 12px;">
                <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,Formatmmddyyy %>"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td class="cot3">
                <span class="h4tag">
                    <asp:Label ID="lbl_Gender_em" runat="server" Text="<%$Resources:Resource,Gender2 %>"></asp:Label></span>
            </td>
            <td>
                <asp:DropDownList ID="ddl_Gender_em" runat="server">
                    <asp:ListItem Value="m" Text="<%$Resources:Resource,Male %>"> </asp:ListItem>
                    <asp:ListItem Value="f" Text="<%$Resources:Resource,Female %>"></asp:ListItem>
                    <asp:ListItem Value="n" Text="<%$Resources:Resource,Other %>"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="cot3">
                <span class="h4tag">
                    <asp:Label ID="lbl_presentLocation" runat="server" Text="<%$Resources:Resource,Address2 %>"></asp:Label></span>
            </td>
            <td>
                <asp:TextBox ID="txt_presentLocation" runat="server" Width="300px" CssClass="input"
                    MaxLength="200" Font-Size="Smaller" ForeColor="Black"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="cot3">
                <span class="h4tag">
                    <asp:Label ID="lbl_Phone_em" runat="server" Text="<%$Resources:Resource,Telephone %>"></asp:Label></span>
            </td>
            <td>
                <asp:TextBox ID="txt_Phone_em" runat="server" CssClass="input" Font-Size="Smaller"
                    MaxLength="100" ForeColor="Black" ToolTip="your mobile phone is preferred"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Phone allows just number."
                    ValidationExpression="^[0-9]+$" ControlToValidate="txt_Phone_em" Text="*" ValidationGroup="UpdateCandidateGroup"
                    CssClass="failureNotification"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="cot3">
                <span class="h4tag">
                    <asp:Label ID="lbl_Citizen_em" runat="server" Text="<%$Resources:Resource,CountryofCitizenship %>"></asp:Label></span>
            </td>
            <td class="cot4">
                <asp:DropDownList ID="ddl_Citizenship_em" runat="server" CssClass="input">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="ddl_Citizenship_em"
                    Display="Dynamic" ValidationGroup="CreateUserWizard1" CssClass="failureNotification"
                    Text="*" runat="server" ErrorMessage="<%$Resources:Resource,selectcitizenship %>"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="UpdateCandidateGroup"
                    CssClass="literalNotification" />
                <asp:Label ID="lblfe" runat="server" Text="" CssClass="literalNotification"></asp:Label>
                <br />
                <asp:Button ID="btn_UpdateProfile_em" CssClass="standard-button orange small" runat="server"
                    Text="<%$Resources:Resource,Update %>" OnClick="UpdateProfile_em_Click" ValidationGroup="UpdateCandidateGroup" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
