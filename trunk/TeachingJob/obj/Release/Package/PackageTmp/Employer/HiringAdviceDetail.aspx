<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HiringAdviceDetail.aspx.cs" Inherits="TeachingJob.Employer.HiringAdviceDetail" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
    <title>
        <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource,HiringAdvices %>"></asp:Literal>
        - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../css/comment.css" rel="stylesheet" type="text/css" />
    <link href="../css/preparation.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="connect">
        <div class="module">
            <div class="hiringadvice">
                <div class="skyheight">
                    <h2 class="heading-type huge-heading center contrast float-right ">
                        Connect with anytime, anywhere...<br />
                        Share to success</h2>
                </div>
                <div class="prepareStickyText">
                    <asp:Literal ID="literal_stickyText" runat="server"></asp:Literal>
                </div>
                <div class="simple-tabs-panel-container full-width2">
                    <div class="panel custom-simple-tab-panel full-width1">
                        <asp:Panel ID="Panel1" runat="server" CssClass="returnlist">
                            <asp:HyperLink ID="hpl_Return" runat="server" NavigateUrl="~/Employer/HiringAdvice.aspx">
                                <asp:Image ID="Image1" runat="server" ImageUrl="../images/icons/ReturnIcon.png" ToolTip="<%$Resources:Resource,Returntolist %>" />
                            </asp:HyperLink>
                        </asp:Panel>
                        <div class="inner">
                            <div class="hiringImageDiv">
                                <asp:HyperLink ID="hpl_logo" runat="server" Width="100%">
                                    <asp:Image ID="logo" runat="server" ImageAlign="Left" CssClass="imagepadding imagehiring" />
                                </asp:HyperLink>
                            </div>
                            <div>
                                <div class="hiringQuestionDiv">
                                    <div class="question">
                                        <asp:HyperLink ID="hpl_ArticleTitle" runat="server">
                                            <asp:Label ID="lbl_ArticleTitle" runat="server" Text=""></asp:Label>
                                        </asp:HyperLink>
                                    </div>
                                    <span class="uploaddedDate">
                                        <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,Addedon %>"></asp:Literal>
                                        <asp:Label ID="lbl_UploadDate" runat="server" Text=""></asp:Label>
                                        <asp:Literal ID="Literal3" runat="server" Text="by"></asp:Literal>
                                        <asp:Label ID="lbl_Name" runat="server" Text=""></asp:Label>
                                    </span>
                                </div>
                                <br />
                                <div class="showdetail">
                                    <asp:Literal ID="literal_detail" runat="server"></asp:Literal>
                                </div>
                                <br />
                                <div id="answerDiv" class="hide">
                                    <asp:TextBox ID="txt_Answer" runat="server" Rows="2" Width="50%"></asp:TextBox>
                                    <asp:Button ID="btn_Answer" runat="server" Text="<%$Resources:Resource,Answer %>"
                                        CssClass="standard-button2 orange small" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="addcommentlink" class="float-right cursorpointer paddingright10px">
                        <a id="showComment" onclick="showCommentBox()">
                            <asp:Image ID="Image3" runat="server" ImageUrl="../images/icons/addicon.png" ToolTip="<%$Resources:Resource,Answerthisquestion %>" />
                        </a>
                    </div>
                    <asp:Panel ID="Panel_WriteComment" runat="server">
                        <div id="commentdiv" class="hide">
                            <div class="paddingCommentDiv">
                                <hr />
                                <table class="paddingcommenttable">
                                    <tr>
                                        <td class="spanclass middleVertical cot20">
                                            <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,Youranswer %>"></asp:Literal>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_Content" runat="server" TextMode="MultiLine" Rows="2" Columns="80"
                                                MaxLength="5000" CssClass="noResizeHorizontal"></asp:TextBox>
                                                <br /><asp:Label ID="Label1" runat="server" Text="" CssClass="showRemainChars"></asp:Label>
                                            <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                                                ControlToValidate="txt_Content" ValidationGroup="PostComment" CssClass="literalNotification"
                                                ErrorMessage="<%$Resources:Resource,Pleaseenteranswercontent %>"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Button ID="btn_PostComment" runat="server" Text="<%$Resources:Resource,Submit %>"
                                                CssClass="standard-button orange small" ValidationGroup="PostComment" OnClick="btn_PostComment_Click" />
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
                    <%--<p class="commentstt">
                        <asp:Label ID="lbl_Status" runat="server" Visible="false" CssClass="literalNotification bold"
                            Text="Thanks for your answer"></asp:Label>
                    </p>--%>
                    <div class="paddingCommentDiv">
                        <asp:Panel ID="Panel_CommentList" runat="server">
                            <asp:Repeater ID="repeater_showComment" runat="server" OnItemDataBound="repeater_showComment_DataBound"
                                OnItemCommand="repeater_showComment_ItemCommand">
                                <HeaderTemplate>
                                    <span class="CommentTitle">
                                        <asp:Label ID="Label2" runat="server" Text="<%$Resources:Resource,Answerlist %>"></asp:Label></span>
                                        <hr />
                                    <%--<table style="width: 100%;">--%>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%--<tr>
                                        <td>
                                            <hr />
                                            <div class="float-left paddingright10px">
                                                <asp:Image ID="Img_PersonalImage" runat="server" ImageUrl="~/images/icons/chat-icon.png"
                                                    CssClass="MaxHeightPersonalImage" />
                                            </div>
                                            <div>
                                                <asp:Label ID="lbl_Name" runat="server" CssClass="commentTitle" Text=""></asp:Label>&nbsp;
                                                (<asp:Label ID="lbl_CreatedDate" runat="server" Text=""></asp:Label>)
                                                <asp:LinkButton ID="lbtn_Remove" runat="server" CommandName="DeleteComment" Visible="false">
                                                    <asp:Image ID="img_Remove" runat="server" ImageUrl="~/images/icons/CRUD/delete-icon.png" />
                                                </asp:LinkButton>
                                            </div>
                                            <div class="uploaddedDate">
                                                <asp:Label ID="lbl_OrgName" CssClass="commentemail" runat="server" Text=""></asp:Label>
                                            </div>
                                            <p class="commentbody1">
                                                <asp:Literal ID="literal_Body" runat="server"></asp:Literal>
                                            </p>
                                        </td>
                                    </tr>--%>
                                    <div id="comment">
                                    <asp:Image ID="Img_PersonalImage" runat="server" ImageUrl="~/images/icons/chat-icon.png"
                                                    CssClass="avatar" />
	                                <div class="post" style="margin-left:62px;">
		                                <h2>
			                                <a href="#" class="classatag">#</a>&nbsp;reply: 
                                            <asp:Literal ID="literal_RepTo" runat="server"></asp:Literal>
		                                </h2>
                                        <asp:LinkButton ID="lbtn_Remove" runat="server" CommandName="DeleteComment" Visible="false">
                                            <asp:Image ID="img_Remove" runat="server" ImageUrl="~/images/icons/CRUD/delete-icon.png" />
                                        </asp:LinkButton>
		                                <asp:Literal ID="literal_Body" runat="server"></asp:Literal>
		                                <div class="postfoot">
			                                <asp:Label ID="lbl_CreatedDate" runat="server" Text=""></asp:Label> | <a><asp:Label ID="lbl_Name" runat="server" CssClass="commentusername"></asp:Label></a> <%--| <asp:Label ID="lbl_OrgName" CssClass="commentemail" runat="server" Text=""></asp:Label>--%>
		                                </div>
	                                </div>
                                    </div>
                                </ItemTemplate>
                                <FooterTemplate>
                                   <%-- </table>--%>
                                </FooterTemplate>
                            </asp:Repeater>
                            <div class="pager bottom">
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
