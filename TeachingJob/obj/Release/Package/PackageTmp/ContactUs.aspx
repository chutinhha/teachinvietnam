<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ContactUs.aspx.cs" Inherits="TeachingJob.ContactUs" ValidateRequest="false" %>

<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Contact us - TeachinVietnam</title>
    <link href="~/css/content.css" type="text/css" rel="stylesheet" media="screen" />
    <script type="text/javascript">
        function checkTextAreaMaxLength(textBox, e, length) {

            var mLen = textBox["MaxLength"];
            if (null == mLen)
                mLen = length;

            var maxLength = parseInt(mLen);
            if (!checkSpecialKeys(e)) {
                if (textBox.value.length > maxLength - 1) {
                    if (window.event) {//IE
                        e.returnValue = false;
                    }
                    else {//Firefox
                        e.preventDefault();
                    }
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
    <style type="text/css">
        .margin
        {
            margin-left: 230px;
        }
        .skyheight
        {
            height: 310px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="connect">
        <div class="module">
            <div class="sky">
                <div class="skyheight">
                    <h2 class="heading-type huge-heading center contrast">
                        Connect with TeachinVietnam
                        <br />
                        anytime, anyplace, anywhere...
                    </h2>
                </div>
                <div class="simple-tabs-panel-container">
                    <div class="panel custom-simple-tab-panel full-width1" id="contact-panel">
                        <div class="inner">
                            <div class="form-section1 left">
                                <h2 class="large-heading heading-type">
                                    <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,Ifyouhave %>"></asp:Literal></h2>
                                <p>
                                    <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,Pleasecontactus %>"></asp:Literal></p>
                                <div class="contact-form">
                                    <div>
                                        <div class="standard-form floated right">
                                            <p class="info">
                                                <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,Youremailaddress %>"></asp:Literal></p>
                                            <fieldset>
                                                <div class="input-group">
                                                    <label>
                                                        <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,Reasonforcontact %>"></asp:Literal></label>
                                                    <asp:DropDownList ID="ddl_Subject" runat="server">
                                                        <asp:ListItem Value="" Selected="True" Text="<%$Resources:Resource,Pleaseselect %>"></asp:ListItem>
                                                        <asp:ListItem Value="I would like to advertise a job" Text="<%$Resources:Resource,Iwouldliketoadvertiseajob %>"></asp:ListItem>
                                                        <asp:ListItem Value="I would like to report an error with a job" Text="<%$Resources:Resource,Iwouldliketoreportanerrorwithajob %>"></asp:ListItem>
                                                        <asp:ListItem Value="I would like some help using the website" Text="<%$Resources:Resource,Iwouldlikesomehelpusingthewebsite %>"></asp:ListItem>
                                                        <asp:ListItem Value="I have good ideas for the website" Text="<%$Resources:Resource,Ihavegoodideasforthewebsite %>"></asp:ListItem>
                                                        <asp:ListItem Value="Other" Text="<%$Resources:Resource,OtherReason %>"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="literalNotification"
                                                        ControlToValidate="ddl_Subject" runat="server" ValidationGroup="Contact" ErrorMessage="<%$Resources:Resource,Pleaseselectyourreason %>"
                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="input-group">
                                                    <label>
                                                        <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource,YourName %>"></asp:Literal></label>
                                                    <div>
                                                        <asp:TextBox ID="txt_name" runat="server" Width="200px" MaxLength="100"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="literalNotification"
                                                            runat="server" ControlToValidate="txt_name" ValidationGroup="Contact" Display="Dynamic"
                                                            ErrorMessage="<%$Resources:Resource,Pleaseenteryourname %>"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="input-group">
                                                    <label>
                                                        <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource,EmailAddress %>"></asp:Literal></label>
                                                    <asp:TextBox ID="txt_email" runat="server" Width="250px" MaxLength="100"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="literalNotification"
                                                        ControlToValidate="txt_email" Display="Dynamic" ValidationGroup="Contact" runat="server"
                                                        ErrorMessage="<%$Resources:Resource,Pleaseenteryourmail %>"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" CssClass="literalNotification"
                                                        runat="server" ValidationGroup="Contact" ControlToValidate="txt_email" ErrorMessage="<%$Resources:Resource,validmailformat %>"
                                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                                                </div>
                                                <div class="input-group">
                                                    <label>
                                                        <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource,Telephoneno %>"></asp:Literal></label>
                                                    <asp:TextBox ID="txt_Phone" runat="server" MaxLength="100"></asp:TextBox>
                                                </div>
                                                <div class="input-group">
                                                    <label>
                                                        <asp:Literal ID="Literal8" runat="server" Text="<%$Resources:Resource,Message %>"></asp:Literal></label>
                                                    <asp:TextBox ID="txt_Message" Rows="10" Columns="80" runat="server" TextMode="MultiLine"
                                                        MaxLength="10000" onkeyDown="checkTextAreaMaxLength(this,event,'10000');" CssClass="noResizeHorizontal"></asp:TextBox>
                                                    <br />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="literalNotification margin"
                                                        ControlToValidate="txt_Message" Display="Dynamic" ValidationGroup="Contact" runat="server"
                                                        ErrorMessage="<%$Resources:Resource,Pleaseenteryourmessage %>"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="input-group">
                                                <label>
                                                    <asp:Literal ID="Literal15" runat="server"></asp:Literal>&nbsp;</label><label class="captcha">
                                                    <recaptcha:RecaptchaControl ID="recaptcha" runat="server" Theme="white" PublicKey="6LfyvNUSAAAAAGNDbYxN3oERQ76zxbhcjeOetplH"
                                                        PrivateKey="6LfyvNUSAAAAAK7l2yetCGOHEA-lPf6TSgxn54h9"  />
                                                    <br />
                                                        <asp:Label ID="lbl_captStt" runat="server" Text="" CssClass="literalNotification"></asp:Label>    
                                                    </label>
                                                </div>
                                                <div class="input-group buttons">
                                                    <asp:Button ID="btn_Submit" runat="server" Text="<%$Resources:Resource,Submityourfeedback %>"
                                                        CssClass="standard-button orange small" ValidationGroup="Contact" OnClick="ContactUs_Click" />
                                                    <asp:HyperLink ID="hpl_Cancel" runat="server" CssClass="standard-button small" Text="<%$Resources:Resource,Cancel %>"></asp:HyperLink>
                                                    
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="contact-info1">
                                <h3>
                                    Teach in Vietnam</h3>
                                <p>
                                    <b>
                                        <asp:Literal ID="Literal9" runat="server" Text="<%$Resources:Resource,Callusat %>"></asp:Literal></b>
                                    <br />
                                    <asp:Literal ID="Literal10" runat="server" Text="<%$Resources:Resource,CallusatNo %>"></asp:Literal>
                                    <br /><br />
                                    <b>Hotline: </b>
                                    <br />01662025930
                                    <br /><br />
                                    <b>
                                        <asp:Literal ID="Literal11" runat="server" Text="<%$Resources:Resource,Ormailusat %>"></asp:Literal></b>
                                    <br />
                                    <a href="mailTo:info@teachinvietnam.org" title="Mail us">info@teachinvietnam.org</a>
                                    
                                </p>
                                <p style="width:180px;">
                                    <b>
                                        <asp:Literal ID="Literal13" runat="server" Text="<%$Resources:Resource,ByPost %>"></asp:Literal></b>
                                    <br />
                                    <asp:Literal ID="Literal14" runat="server" Text="<%$Resources:Resource,contactaddress %>"></asp:Literal>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- end of #contact -->
                    <div class="clear-floats">
                    </div>
                </div>
                <!-- end of simple tabs panel -->
            </div>
        </div>
    </div>
</asp:Content>
