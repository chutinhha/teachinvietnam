<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Testimonial.aspx.cs" Inherits="TeachingJob.publicArea.Testimonial" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>

<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
    <title>Testimonials - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../css/preparation.css" rel="stylesheet" type="text/css" />
    <script type='text/javascript'>
        $(function () {
            $('#tabs').simpleTabs();

        });
        function postnewpanel() {
            document.getElementById('postnewdiv').style.display = 'inline';
        }
    </script>
    <script type="text/javascript">
        function textCounter(field, countfield, maxlimit) {
            var Label1 = document.getElementById(countfield);
            if (field.value.length > maxlimit)
                field.value = field.value.substring(0, maxlimit);
            Label1.innerText = (maxlimit - field.value.length) + ' characters remaining';
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="connect">
        <div class="module">
            <div class="testimonial">
                <div class="skyTestimonial">
                    <h2 class="heading-type huge-heading center contrast">
                        <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,Connectwithanytime %>"></asp:Literal></h2>
                </div>
                <div class="prepareStickyText1">
                    <asp:Literal ID="literal_stickyText" runat="server"></asp:Literal>
                </div>
                <div class="simple-tabs-panel-container full-width2">
                    <div class="hide" id="postnewdiv">
                        <div class="panel custom-simple-tab-panel full-width2" id="postnew-panel">
                            <div class="inner">
                                <h5 class="heading-type large-heading green">
                                    <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,PostnewArticle %>"></asp:Literal></h5>
                                <hr />
                                <p>
                                    <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,Fillarticle %>"></asp:Literal>
                                </p>
                                <table width="100%" class="tableprepare" cellpadding="10px" cellspacing="10px">
                                    <tr>
                                        <td class="cot15 ">
                                            <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,NameTestimonial %>"></asp:Literal>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_Title" runat="server" Width="300px" Height="20px" MaxLength="200"></asp:TextBox><br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="PostArticle"
                                                ControlToValidate="txt_Title" CssClass="literalNotification" ErrorMessage="Please enter article title"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="cot15 ">
                                            <asp:Literal ID="Literal8" runat="server" Text="<%$Resources:Resource,Citizenship %>"></asp:Literal>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_citizenship" runat="server" Width="300px" Height="20px" MaxLength="200"></asp:TextBox><br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="PostArticle"
                                                ControlToValidate="txt_citizenship" CssClass="literalNotification" ErrorMessage="Please enter your citizenship"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="cot15 ">
                                            <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource,Photosharing %>"></asp:Literal>
                                        </td>
                                        <td>
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                            <br />
                                            <asp:Label ID="lbl_uploadStt" runat="server" Text="" CssClass="literalNotification"></asp:Label>
                                            <%--<asp:CustomValidator ID="CustomValidator1" runat="server" ValidationGroup="PostArticle"
                                                CssClass="literalNotification" Display="Dynamic" OnServerValidate="FileUpload1_CustomValidation"
                                                ErrorMessage="Please select an image"></asp:CustomValidator>--%>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                        <td class="cot15 ">
                                            <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource,Setasslider %>"></asp:Literal>
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="cb_SetAsSlider" runat="server" Text="  Check this to set this article in silder" />
                                        </td>
                                    </tr>--%>
                                    <tr>
                                        <td class="cot15  middleVertical" valign="top">
                                            <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource,yourstory %>"></asp:Literal>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_body" runat="server" TextMode="MultiLine" Rows="10" Columns="80"
                                                CssClass="noResizeHorizontal"></asp:TextBox><br />
                                            <asp:Label ID="Label1" runat="server" Text="" CssClass="showRemainChars"></asp:Label>
                                                <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txt_body"
                                                ValidationGroup="PostArticle" CssClass="literalNotification" runat="server" ErrorMessage="Please enter article body"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <recaptcha:RecaptchaControl ID="recaptcha" runat="server" Theme="white" PublicKey="6LfyvNUSAAAAAGNDbYxN3oERQ76zxbhcjeOetplH"
                                                PrivateKey="6LfyvNUSAAAAAK7l2yetCGOHEA-lPf6TSgxn54h9" />
                                            <br />
                                            <asp:Label ID="lbl_captStt" runat="server" Text="" CssClass="literalNotification hide"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Button ID="btn_Post" runat="server" Text="<%$Resources:Resource,Post %>" CssClass="standard-button orange small"
                                                ValidationGroup="PostArticle" OnClick="Post_Click" />
                                            <asp:Button ID="Button1" runat="server" Text="<%$Resources:Resource,Cancel %>" CssClass="standard-button small"
                                                OnClick="Cancel_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <asp:Repeater ID="repeater_Content" runat="server" OnItemDataBound="Content_DataBound">
                        <HeaderTemplate>
                            <div class="panel custom-simple-tab-panel full-width1">
                                <asp:Panel ID="Panel1" runat="server" CssClass="postnewTestimonial">
                                    <a href="#postnew-panel" name="postnew" onclick="postnewpanel()">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="../images/icons/addicon.png" ToolTip="<%$Resources:Resource,PostnewArticle %>" /></a>
                                </asp:Panel>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="inner customPanel">
                                <h5 class="heading-type large-heading green">
                                    <asp:HyperLink ID="hpl_ArticleTitle" runat="server">
                                        <asp:Label ID="lbl_ArticleTitle" runat="server" Text=""></asp:Label>
                                    </asp:HyperLink>
                                </h5>
                                <hr />
                                <p class="paddingtop">
                                    <asp:HyperLink ID="hpl_logo" runat="server">
                                        <asp:Image ID="logo" runat="server" Height="140px" Width="220px" ImageAlign="Left"
                                            CssClass="imagepadding" />
                                    </asp:HyperLink>
                                    <span class="spanclass">
                                        <asp:Literal ID="Literal9" runat="server" Text="<%$Resources:Resource,Name %>"></asp:Literal></span>
                                    <asp:Label ID="lbl_Name" runat="server" Text=""></asp:Label>
                                    <br />
                                    <span class="spanclass">
                                        <asp:Literal ID="Literal10" runat="server" Text="<%$Resources:Resource,Nativeof2 %>"></asp:Literal>
                                    </span>
                                    <asp:Label ID="lbl_Citizenship" runat="server" Text=""></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Literal ID="literal_Body" runat="server"></asp:Literal>
                                </p>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                            </div>
                        </FooterTemplate>
                    </asp:Repeater>
                    <div class="pager bottom">
                        <p>
                            &nbsp;</p>
                        <ul id="pager0" class="pager">
                            <cc1:CollectionPager ID="CollectionPager1" BackText="Prev &amp;nbsp;" LabelText=""
                                NextText="&amp;nbsp; Next" ShowFirstLast="False" SliderSize="5" PagingMode="PostBack"
                                runat="server" BackNextLocation="Split" PageNumbersDisplay="Numbers" ResultsLocation="None"
                                BackNextDisplay="HyperLinks" HideOnSinglePage="true">
                            </cc1:CollectionPager>
                        </ul>
                        <div class="clear-floats">
                        </div>
                    </div>
                    <div class="clear-floats">
                    </div>
                </div>
                <!-- end of simple tabs panel -->
            </div>
        </div>
    </div>
    <!-- end of #connect div  -->
    <div class="clear-floats">
    </div>

</asp:Content>
