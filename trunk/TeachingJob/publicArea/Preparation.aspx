<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Preparation.aspx.cs" Inherits="TeachingJob.publicArea.Preparation"
    ValidateRequest="false" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
    <title>Preparation - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../css/preparation.css" rel="stylesheet" type="text/css" />
    <script src="../Styles/simple-tabs9fab.js?mt=1323683811" type="text/javascript"></script>
    <script src="../Styles/jquery-dialogfbf6.js?mt=1319121455" type="text/javascript"></script>
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
                    <h2 class="heading-type huge-heading center contrast float-right">
                        Connect with anytime, anywhere...</h2>
                </div>
                <div class="nav-icons">
                    <ul>
                        <li class="iphone"><a href="#"></a></li>
                        <li class="email"><a href="#"></a></li>
                        <li class="twitter"><a href="#"></a></li>
                        <li class="facebook"><a href="#"></a></li>
                    </ul>
                </div>
                <div class="prepareStickyText">
                    <asp:Literal ID="literal_stickyText" runat="server"></asp:Literal>
                </div>
                <div class="simple-tabs-panel-container">
                    <ul id="tabs" class="heading-type regular vertical-tabs no-padding">
                        <asp:Repeater ID="repeater_tabs" runat="server">
                            <ItemTemplate>
                                <li class="simple-tab"><a href="#<%#Eval("Title").ToString().Replace(" ","-") %>"
                                    title="<%#Eval("Title") %>">
                                    <%#Eval("Title") %></a> </li>
                            </ItemTemplate>
                        </asp:Repeater>
                        <li class="simple-tab"><a href="#" runat="server" title="Testimonials" onclick="window.location.href='Testimonial.aspx';">
                            Testimonials</a> </li>
                    </ul>
                    <asp:Repeater ID="repeater_Content" runat="server" OnItemDataBound="Content_DataBound">
                        <ItemTemplate>
                            <div class="panel custom-simple-tab-panel full-width" id="<%#Eval("Title").ToString().Replace(" ","-") %>">
                                <div class="inner">
                                    <asp:Panel ID="Panel1" runat="server" Visible="false" CssClass="postnew2">
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
                                    <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,PostnewArticle %>"></asp:Literal></h5>
                                <hr />
                                <p>
                                    <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,Fillarticlesdetailsinthisform %>"></asp:Literal>
                                </p>
                                <table width="100%" class="tableprepare" cellpadding="10px" cellspacing="10px">
                                    <tr>
                                        <td class="cot15 ">
                                            <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,titletxt %>"></asp:Literal>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_Title" runat="server" Width="500px" Height="20px" MaxLength="200"></asp:TextBox><br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="PostArticle"
                                                ControlToValidate="txt_Title" CssClass="literalNotification" ErrorMessage="<%$Resources:Resource,Pleaseenterarticletitle %>"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="cot15  middleVertical" valign="top">
                                            <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,Content %>"></asp:Literal>
                                        </td>
                                        <td>
                                            <%--<asp:TextBox ID="txt_body" runat="server" TextMode="MultiLine" Rows="10" Columns="80"
                                                CssClass="noResizeHorizontal TinyMceWidth"></asp:TextBox>--%>
                                            <CKEditor:CKEditorControl ID="txt_body" BasePath="~/Scripts/ckeditor" runat="server"></CKEditor:CKEditorControl><br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Button ID="btn_Post" runat="server" Text="<%$Resources:Resource,Post %>" CssClass="standard-button orange small"
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
