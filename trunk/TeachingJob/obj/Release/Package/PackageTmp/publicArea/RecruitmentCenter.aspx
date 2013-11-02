<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecruitmentCenter.aspx.cs" Inherits="TeachingJob.publicArea.RecruitmentCenter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<title>Hiring Advices - Teach in Vietnam</title>
    <link href="../css/preparation.css" rel="stylesheet" type="text/css" />
    <script src="../Styles/simple-tabs9fab.js?mt=1323683811" type="text/javascript"></script>
    <script src="../Styles/jquery-dialogfbf6.js?mt=1319121455" type="text/javascript"></script>
    <script src="../Styles/jquery.min.js" type="text/javascript"></script>
    <script type='text/javascript'>
        $(function () {
            $('#tabs').simpleTabs();

        });
        function postnewpanel() {
            document.getElementById('postnewdiv').style.display = 'inline';
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <div id="connect">
        <div class="module">
            <div class="preparation">
            <div class="skyTestimonial">
                <h2 class="heading-type huge-heading center contrast float-right ">
                    Connect with anytime, anywhere...<br />Share to success</h2>
                  
                </div>
                <div class="prepareStickyText">
                    <asp:Literal ID="literal_stickyText" runat="server"></asp:Literal>
                </div>
                <div class="simple-tabs-panel-container">
                    <ul id="tabs" class="heading-type regular vertical-tabs">
                        <asp:Repeater ID="repeater_tabs" runat="server">
                            <ItemTemplate>
                                <li class="simple-tab"><a href="#<%#Eval("Id").ToString().Replace(" ","-") %>"
                                    title="<%#Eval("Name") %>">
                                    <%#Eval("Name")%></a> </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                    
                    <asp:Repeater ID="repeater_Content" runat="server" OnItemDataBound="Content_DataBound">
                        <ItemTemplate>
                            <div class="panel custom-simple-tab-panel full-width" id="<%#Eval("Cate_id").ToString().Replace(" ","-") %>">
                                <div class="inner">
                                    <asp:Panel ID="Panel1" runat="server" Visible="false" CssClass="postnew">
                                        <a href="#postnew-panel" name="postnew" onclick="postnewpanel()">
                                            <asp:Image ID="Image1" runat="server" ImageUrl="../images/icons/addicon.png" ToolTip="<%$Resources:Resource,PostnewArticle %>" /></a>
                                    </asp:Panel>
                                    <h5 class="heading-type large-heading green">
                                        <asp:Label ID="lbl_ArticleTitle" runat="server" Text=""></asp:Label></h5>
                                    <hr />
                                    <p>
                                        <asp:Literal ID="literal_Body" runat="server"></asp:Literal>
                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="hide" id="postnewdiv">
                        <div class="panel custom-simple-tab-panel full-width" id="postnew-panel">
                            <div class="inner">
                                <h5 class="heading-type large-heading green">
                                    Post new Article</h5>
                                <hr />
                                <p>
                                    Fill article's details in this form
                                </p>
                                <table width="100%" class="tableprepare" cellpadding="10px" cellspacing="10px">
                                    <tr>
                                        <td class="cot15 ">
                                            Title
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_Title" runat="server" Width="300px" Height="20px" MaxLength="200"></asp:TextBox><br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="PostArticle"
                                                ControlToValidate="txt_Title" CssClass="literalNotification" ErrorMessage="Please enter article title"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                        <td class="cot15 ">
                                            Logo
                                        </td>
                                        <td>
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                            <br />
                                            <asp:Label ID="lbl_uploadStt" runat="server" Text="" CssClass="literalNotification"></asp:Label>
                                            <asp:CustomValidator ID="CustomValidator1" runat="server" ValidationGroup="PostArticle"
                                                CssClass="literalNotification" Display="Dynamic" OnServerValidate="FileUpload1_CustomValidation"
                                                ErrorMessage="Please select an image"></asp:CustomValidator>
                                        </td>
                                    </tr>--%>
                                    <tr>
                                        <td class="cot15  middleVertical" valign="top">
                                            Content
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_body" runat="server" TextMode="MultiLine" Rows="10" Columns="80"
                                                CssClass="noResizeHorizontal"></asp:TextBox><br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txt_body"
                                                ValidationGroup="PostArticle" CssClass="literalNotification" runat="server" ErrorMessage="Please enter article body"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                        <td class="cot15 ">
                                            Set as slider
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="cb_SetAsSlider" runat="server" Text="  Check this to set this article in silder" />
                                        </td>
                                    </tr>--%>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Button ID="btn_Post" runat="server" Text="Post" CssClass="standard-button orange small"
                                                ValidationGroup="PostArticle" OnClick="Post_Click" />
                                        </td>
                                    </tr>
                                </table>
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
</asp:Content>
