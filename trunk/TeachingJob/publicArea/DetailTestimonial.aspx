<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="DetailTestimonial.aspx.cs" Inherits="TeachingJob.publicArea.DetailTestimonial"
    ValidateRequest="false" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>
        <asp:Literal ID="Literal2" runat="server"  Text="<%$Resources:Resource,Testimonials %>"></asp:Literal> - TeachinVietnam</title>
    <link href="../css/preparation.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="connect">
        <div class="module">
            <div class="testimonial">
                <div class="skyheight">
                    <h2 class="heading-type huge-heading center contrast">
                        <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,Connectwithanytime %>"></asp:Literal></h2>
                </div>
                <div class="prepareStickyText">
                    <asp:Literal ID="literal_stickyText" runat="server"></asp:Literal>
                </div>
                <div class="simple-tabs-panel-container full-width2">
                    <div class="panel custom-simple-tab-panel full-width1">
                        <asp:Panel ID="Panel1" runat="server" CssClass="postnewTestimonial">
                            <asp:HyperLink ID="hpl_Return" runat="server" NavigateUrl="~/publicArea/Testimonial.aspx">
                                <asp:Image ID="Image1" runat="server" ImageUrl="../images/icons/ReturnIcon.png" ToolTip="<%$Resources:Resource,Returntotestimoniallist %>" />
                            </asp:HyperLink>
                        </asp:Panel>
                        <div class="inner">
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
                                <span class="spanclass"><asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,Name %>"></asp:Literal></span>
                                <asp:Label ID="lbl_Name" runat="server" Text=""></asp:Label>
                                <br />
                                <span class="spanclass"><asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,Nativeof2 %>"></asp:Literal> </span>
                                <asp:Label ID="lbl_Citizenship" runat="server" Text=""></asp:Label>
                                <br />
                                <br />
                                <asp:Literal ID="literal_Body" runat="server"></asp:Literal>
                            </p>
                        </div>
                    </div>
                    <div class="paddingCommentDiv">
                        <asp:Panel ID="Panel_CommentList" runat="server">
                            <asp:Repeater ID="repeater_showComment" runat="server" OnItemDataBound="repeater_showComment_DataBound">
                                <HeaderTemplate>
                                    <span class="CommentTitle">
                                        <asp:Label ID="Label2" runat="server" Text="<%$Resources:Resource,Commentlist %>"></asp:Label></span>
                                    <hr />
                                    <table style="width: 100%;">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/images/icons/chat-icon.png" />
                                            <asp:Label ID="lbl_Name" runat="server" CssClass="literalNotification" Text=""></asp:Label>&nbsp;
                                            (<asp:Label ID="lbl_CreatedDate" runat="server" Text=""></asp:Label>)
                                            <br />
                                            <asp:Label ID="lbl_Email" CssClass="commentemail" runat="server" Text=""></asp:Label>
                                            <p class="commentbody">
                                                <asp:Literal ID="literal_Body" runat="server"></asp:Literal>
                                            </p>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
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
                        </asp:Panel>
                    </div>
                    <div id="addcommentlink" class="float-right cursorpointer">
                        <a id="showComment" onclick="showCommentBox()">
                            <asp:Image ID="Image3" runat="server" ImageUrl="../images/icons/addicon.png" ToolTip="Add a comment" />
                        </a>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="Panel_WriteComment" runat="server">
                                <div id="commentdiv" class="hide">
                                    <div class="paddingCommentDiv">
                                        <span class="CommentTitle">
                                            <asp:Label ID="Label111" runat="server" Text="<%$Resources:Resource,Writeyourcomment %>"></asp:Label></span>
                                        <hr />
                                        <table class="paddingcommenttable">
                                            <tr>
                                                <td class="spanclass cot15">
                                                    <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource,Fullname %>"></asp:Literal>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Fullname" runat="server" MaxLength="100" Width="300px"></asp:TextBox>
                                                    <br />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                                        ControlToValidate="txt_Fullname" ValidationGroup="PostComment" CssClass="literalNotification"
                                                        ErrorMessage="<%$Resources:Resource,Pleaseenteryourname %>"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="spanclass">
                                                    Email
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Email" runat="server" MaxLength="100" Width="300px"></asp:TextBox>
                                                    <br />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                                        ControlToValidate="txt_Email" ValidationGroup="PostComment" CssClass="literalNotification"
                                                        ErrorMessage="<%$Resources:Resource,Pleaseenteryouremail %>"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic"
                                                        ControlToValidate="txt_Email" ValidationGroup="PostComment" CssClass="literalNotification"
                                                        ErrorMessage="<%$Resources:Resource,Pleaseentertherightemail %>" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="spanclass middleVertical">
                                                    <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource,Content %>"></asp:Literal>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Content" runat="server" TextMode="MultiLine" Rows="8" Columns="80"
                                                        CssClass="noResizeHorizontal"></asp:TextBox>
                                                    <br />
                                                    <asp:Label ID="Label1" runat="server" Text="" CssClass="showRemainChars"></asp:Label>
                                                    <br />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                                                        ControlToValidate="txt_Content" ValidationGroup="PostComment" CssClass="literalNotification"
                                                        ErrorMessage="<%$Resources:Resource,Pleaseentercommentcontent %>"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                                <td>
                                                    <asp:Button ID="btn_PostComment" runat="server" Text="<%$Resources:Resource,Submit %>" CssClass="standard-button orange small"
                                                        ValidationGroup="PostComment" OnClick="btn_PostComment_Click" />
                                                    <asp:Button ID="btn_Clear" runat="server" Text="<%$Resources:Resource,Clear %>" CssClass="standard-button small"
                                                        OnClick="btn_Clear_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="clear-floats">
                                </div>
                            </asp:Panel>
                            <p class="commentstt">
                                <asp:Label ID="lbl_Status" runat="server" Visible="false" CssClass="literalNotification bold"
                                    Text="<%$Resources:Resource,Thanksforyourcomment %>"></asp:Label>
                            </p>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <!-- end of simple tabs panel -->
            </div>
        </div>
    </div>
    <!-- end of #connect div  -->
    <div class="clear-floats">
    </div>
    <script type="text/javascript">
        function showCommentBox() {
            document.getElementById('commentdiv').style.display = 'inline';
            document.getElementById('commentdiv').style = 'paddingCommentDiv';
            document.getElementById('addcommentlink').style.display = 'none';
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
