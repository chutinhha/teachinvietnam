<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/Masterpage/HomeIntership.Master" AutoEventWireup="true" CodeBehind="SubmitYourInternship.aspx.cs" Inherits="TeachingJob.Templates.Pages.SubmitYourInternship" %>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
<%@ Register TagPrefix="tj" TagName="IntershipAds" Src="~/Templates/UserControl/IntershipAds.ascx" %>
<%@ Register TagPrefix="tj" TagName="SocialLink" Src="~/Templates/UserControl/SocialLinkArticle.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
<title>Submit Your Internship - Free call back - Teach in Vietnam</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
<link type="text/css" href="/Styles/intership.css" rel="Stylesheet" media="screen" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<div id="intershipPage">
        <div id="home-heading">
            <div class="articleWrapper">
                <div class="internshipartiletitle">
                    <div class="header"><h4>Vietnam teaching job</h4></div>
                    <div class="sharelink">
                        <tj:SocialLink ID="SocialLink" runat="server" />
                    </div>
                </div>
                <div class="clear-floats2">
                    <asp:Label ID="lblInternshipDescription" runat="server"></asp:Label>
                </div>
                <div id="guide-form">
                    <h4 style="color:#595959; border-bottom:1px solid gray">
                        Your details</h4>
                        <div class="clear-floats"></div>
                    <div class="float-left">
                    <table>
                        <tr>
                            <td class="td-width">
                                Title
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlTitle" runat="server">
                                    <asp:ListItem Value="">Please select..</asp:ListItem>
                                    <asp:ListItem Value="Dr.">Dr.</asp:ListItem>
                                    <asp:ListItem Value="Mr.">Mr.</asp:ListItem>
                                    <asp:ListItem Value="Drs.">Drs.</asp:ListItem>
                                    <asp:ListItem Value="Miss.">Miss.</asp:ListItem>
                                    <asp:ListItem Value="Ms.">Ms.</asp:ListItem>
                                    <asp:ListItem Value="Prof.">Prof.</asp:ListItem>
                                    <asp:ListItem Value="Reverend">Reverend</asp:ListItem>
                                    <asp:ListItem Value="Sir.">Sir.</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-width">
                                First Name
                            </td>
                            <td>
                                <asp:TextBox ID="txtFirstName" runat="server" Width="200px"></asp:TextBox>
                                <div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="literalNotification"
                                        Display="Dynamic" ControlToValidate="txtFirstName" ValidationGroup="InternshipGuide" ErrorMessage="Please enter your first name."></asp:RequiredFieldValidator></div>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-width">
                                Last Name
                            </td>
                            <td>
                                <asp:TextBox ID="txtLastName" runat="server" Width="200px"></asp:TextBox>
                                <div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="literalNotification"
                                        Display="Dynamic" ControlToValidate="txtLastName" ValidationGroup="InternshipGuide" ErrorMessage="Please enter your last name."></asp:RequiredFieldValidator></div>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-width">
                                Email Address
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmailAddress" runat="server" Width="200px"></asp:TextBox>
                                <div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="literalNotification"
                                        Display="Dynamic" ControlToValidate="txtEmailAddress" ValidationGroup="InternshipGuide" ErrorMessage="Please enter your email."></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" CssClass="literalNotification"
                                        runat="server" ValidationGroup="InternshipGuide" ControlToValidate="txtEmailAddress" ErrorMessage="<%$Resources:Resource,validmailformat %>"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-width">
                                Phone Number
                            </td>
                            <td>
                                <asp:TextBox ID="txtPhoneNumber" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-width">
                                Country
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlCountry" runat="server" OnDataBound="Citizenship_DataBound">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-width">
                                When should we call?
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlWhenShouldWeCall" runat="server" >
                                    <asp:ListItem Value="">Please select..</asp:ListItem>
                                    <asp:ListItem Value="AnyTime">Any time</asp:ListItem>
                                    <asp:ListItem Value="AsSoonAsPossible">As soon as possible</asp:ListItem>
                                    <asp:ListItem Value="Morning">Morning</asp:ListItem>
                                    <asp:ListItem Value="Afternoon">Afternoon</asp:ListItem>
                                    <asp:ListItem Value="Evening">Evening</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-width">
                                Attach CV and Degree
                            </td>
                            <td>
                                <asp:FileUpload ID="FileUpload1" runat="server" Width="200px" onchange="check_extension(this);" />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <recaptcha:RecaptchaControl ID="recaptcha" runat="server" Theme="white" PublicKey="6LfyvNUSAAAAAGNDbYxN3oERQ76zxbhcjeOetplH"
                                                        PrivateKey="6LfyvNUSAAAAAK7l2yetCGOHEA-lPf6TSgxn54h9"  />
                                <div><asp:Label ID="lbl_captStt" runat="server" CssClass="literalNotification"></asp:Label></div>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-width">
                            </td>
                            <td>
                                <asp:Button ID="btn_Submit" runat="server" Text="Submit &raquo;"
                                    CssClass="standard-button orange small" ValidationGroup="InternshipGuide" OnClick="btn_Submit_Click" />
                            </td>
                        </tr>
                    </table>
                    </div>
                    <div style="padding-left:35px" class="float-left">
                        <img src="../../images/sitefiles/featured-job.png" alt="Internship Guide" />
                    </div>
                </div>
            </div>
        </div>
        <div id="home-subContent">
            <tj:IntershipAds ID="ads" runat="server" />
        </div>
        <div class="clear-floats">
        </div>
    </div>
    <script type="text/javascript">
        $('#<%=FileUpload1.ClientID %>').bind('change', function () {
            if (this.files[0].size > 5242880) {
                var FileUpload = document.getElementById('<%=FileUpload1.ClientID %>');
                FileUpload.value = '';
                alert('File size can not exceed 5 MB');
            }
        });

        var _validFileExtensions = [".pdf", ".doc", ".docx", ".xls", ".xlsx"];
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
                alert("Your file is invalid. Please select document file only.");
                var FileUpload = document.getElementById('<%=FileUpload1.ClientID %>');
                FileUpload.value = '';
                return false;
            }
        }
        </script>
</asp:Content>