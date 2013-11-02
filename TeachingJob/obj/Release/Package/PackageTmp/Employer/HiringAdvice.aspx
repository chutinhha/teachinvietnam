<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HiringAdvice.aspx.cs" Inherits="TeachingJob.Employer.HiringAdvice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>
        <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource,HiringAdvices %>"></asp:Literal>
        - TeachinVietnam</title>
    <link href="../css/preparation.css" rel="stylesheet" type="text/css" />
    <script src="../Styles/simple-tabs9fab.js?mt=1323683811" type="text/javascript"></script>
    <script src="../Styles/jquery-dialogfbf6.js?mt=1319121455" type="text/javascript"></script>
    <%--<script src="../Styles/jquery.min.js" type="text/javascript"></script>--%>
    <script type='text/javascript'>
        $(function () {
            $('#tabs').simpleTabs();
        });
        function postnewpanel() {
            document.getElementById('postnewdiv').style.display = 'inline';
        }
        function showAnswerPanel(id) {
            document.getElementById(id).style.display = 'inline'
        }
        function hideAnswerPanel(id) {
            document.getElementById(id).style.display = 'none'
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="connect">
        <div class="module">
            <div class="hiringadvice">
                <div class="skyheight">
                    <h2 class="heading-type huge-heading center contrast float-right ">
                        Connect with anytime, anywhere...<br />
                        Share to succeed!</h2>
                </div>
                <div class="prepareStickyText">
                    <asp:Literal ID="literal_stickyText" runat="server"></asp:Literal>
                </div>
                <div class="simple-tabs-panel-container whitebg">
                    <div class="coluomleft">
                        <ul id="tabss" class="heading-type regular vertical-tabs no-padding">
                            <asp:Repeater ID="repeater_tabs" runat="server" OnItemDataBound="repeater_tabs_DataBound"
                                OnItemCommand="repeater_tabs_Command">
                                <ItemTemplate>
                                    <li class="simple-tab">
                                        <asp:LinkButton ID="lbtn_Cate" CssClass="lbtn" runat="server" CommandName="ViewArticleByCategory"></asp:LinkButton>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                    <div class="coluomright">
                        <div class="custom-simple-tab-panel1 full-width11">
                            <asp:Panel ID="Panel1" runat="server" CssClass="postnew">
                                <a href="#postnew-panel" name="postnew" onclick="postnewpanel()">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="../images/icons/addicon.png" ToolTip="<%$Resources:Resource,PostnewQuestion %>" /></a>
                            </asp:Panel>
                        </div>
                        <asp:Repeater ID="repeater_Content" runat="server" OnItemDataBound="Content_DataBound"
                            OnItemCommand="repeater_Content_ItemCommand">
                            <ItemTemplate>
                                <div class="float-left fullwidth">
                                    <div class="">
                                        <p class="paddingtop">
                                            <hr />
                                            <div class="hiringImageDiv">
                                                <asp:HyperLink ID="hpl_logo" runat="server" Width="100%">
                                                    <asp:Image ID="logo" runat="server" ImageAlign="Left" CssClass="imagepadding imagehiring" ImageUrl="~/images/companyLogo/no_image_100x100.jpg"  />
                                                </asp:HyperLink>
                                                <br />
                                                <asp:Label ID="lbl_Name" runat="server" CssClass="paddingleftImageDiv" Text=""></asp:Label>
                                            </div>
                                            <div class="hiringQuestionDiv">
                                                <span class="question">
                                                    <asp:HyperLink ID="hpl_ArticleTitle" runat="server">
                                                        <asp:Label ID="lbl_ArticleTitle" runat="server" Text=""></asp:Label>
                                                    </asp:HyperLink>
                                                </span>
                                                <br />
                                                <span class="uploaddedDate">
                                                    <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,Addedon %>"></asp:Literal>
                                                    <asp:Label ID="lbl_UploadDate" runat="server" Text=""></asp:Label>
                                                </span>
                                                <br />
                                                <br />
                                                <asp:Panel ID="pn_LatestComment" runat="server" Width="90%">
                                                    <span class="lastestcomment"><b><asp:Literal ID="LastestComment" runat="server"></asp:Literal></b></span>
                                                    <br />
                                                    <span class="detailComment"><asp:Literal ID="LastestCommentContent" runat="server"></asp:Literal></span>
                                                </asp:Panel>
                                                <br />
                                                <div id="answerDiv" class="hide andiv" runat="server">
                                                    <textarea name="answerText" rows="2" class="noResizeHorizontal" cols="80" onkeydown="checkTextAreaMaxLength(this,event,'1000');" ></textarea>
                                                    <br />
                                                    <asp:LinkButton ID="lbtn_Answer" runat="server" CommandName="PostYourAnswer" Text="<%$Resources:Resource,Answer %>"
                                                        CssClass="standard-button2 orange small btnanswer"></asp:LinkButton>
                                                    
                                                    <a href="#hide" id="CancelAnswer" runat="server" name="cancel">
                                                        <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource,Cancel %>"></asp:Literal>
                                                    </a>
                                                </div>
                                                <div class="float-right paddingrightImageDiv">
                                                    <a href="#answer" id="lnkAnswer" runat="server" name="postnew">
                                                        <img runat="server" id="answerBtn" src="~/images/icons/back-icon.png" title="<%$Resources:Resource,Answerthisquestion %>"
                                                            alt="Click to answer" />
                                                    </a>
                                                    <asp:LinkButton ID="lbtn_Remove" runat="server" CommandName="DeleteAdvice" Visible="false">
                                                        <asp:Image ID="img_Remove" runat="server" ImageUrl="~/images/icons/CRUD/delete-icon.png" />
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
                                        </p>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <div class="hide paddingtop10px" id="postnewdiv">
                            <div class="custom-simple-tab-panel full-width1" id="postnew-panel">
                                <div class="inner">
                                    <h5 class="heading-type large-heading green">
                                        <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,PostnewQuestion %>"></asp:Literal></h5>
                                    <hr />
                                    <p>
                                        <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,Pleaseenteryourquestion %>"></asp:Literal>
                                    </p>
                                    <table width="100%" class="tableprepare" cellpadding="10px" cellspacing="10px">
                                        <tr>
                                            <td class="cot15">
                                                <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,Question %>"></asp:Literal>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_Title" runat="server" Width="400px" MaxLength="200"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="PostArticle"
                                                    ControlToValidate="txt_Title" CssClass="literalNotification" ErrorMessage="<%$Resources:Resource,Pleaseenteryourquestion %>"
                                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="cot15 topvalign">
                                                <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource,Detail %>"></asp:Literal>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_Detail" runat="server" Width="400px" MaxLength="1500" 
                                                TextMode="MultiLine" CssClass="noResizeHorizontal" onkeydown="checkTextAreaMaxLength(this,event,'1500');"></asp:TextBox><br />
                                                <asp:Label ID="Label1" runat="server" Text="" CssClass="showRemainChars"></asp:Label>
                                                <br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="PostArticle"
                                                    ControlToValidate="txt_Detail" CssClass="literalNotification" ErrorMessage="<%$Resources:Resource,Pleaseenteryourdetail %>"
                                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:Button ID="btn_Post" runat="server" Text="<%$Resources:Resource,Post %>" CssClass="standard-button orange small"
                                                    ValidationGroup="PostArticle" OnClick="Post_Click" />
                                                <asp:Button ID="btn_Clear" runat="server" Text="<%$Resources:Resource,Cancel %>"
                                                    CssClass="standard-button small" OnClick="btn_Clear_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
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
    <script type="text/javascript">
        function textCounter(field, countfield, maxlimit) {
            var Label1 = document.getElementById(countfield);
            if (field.value.length > maxlimit)
                field.value = field.value.substring(0, maxlimit);
            Label1.innerText = (maxlimit - field.value.length) + ' characters remaining';
        }
    </script>
</asp:Content>
