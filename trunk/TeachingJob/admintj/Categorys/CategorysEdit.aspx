<%@ Page Title="" Language="C#" MasterPageFile="~/admintj/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="CategorysEdit.aspx.cs" Inherits="TeachingJob.admintj.CategorysEdit" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="title-grid">
        <span>Edit Category </span>
    </div>
    <table class="table table-bordered">
        <tr>
            <td class="span4">
                <p style="display:none">
                    <asp:LinkButton runat="server" CssClass="btn btn-success enable-process" ID="cmdUpdateDB">Update to DB</asp:LinkButton>
                </p>
                <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
                <telerik:RadTreeView ID="rtvCategory" runat="server" AllowNodeEditing="true">
                    <ContextMenus>
                        <telerik:RadTreeViewContextMenu ID="MainContextMenu" runat="server">
                            <Items>
                                <telerik:RadMenuItem Value="Edit" Text="Edit">
                                </telerik:RadMenuItem>
                                <telerik:RadMenuItem Value="Add" Text="New Category">
                                </telerik:RadMenuItem>
                                <telerik:RadMenuItem Value="AddChild" Text="New Child Category">
                                </telerik:RadMenuItem>
                            </Items>
                            <CollapseAnimation Type="none"></CollapseAnimation>
                        </telerik:RadTreeViewContextMenu>
                        <telerik:RadTreeViewContextMenu ID="RootContextMenu" runat="server">
                            <Items>
                                <telerik:RadMenuItem Value="AddFromRoot" Text="New Category">
                                </telerik:RadMenuItem>
                            </Items>
                            <CollapseAnimation Type="none"></CollapseAnimation>
                        </telerik:RadTreeViewContextMenu>
                    </ContextMenus>
                    <Nodes>
                        <telerik:RadTreeNode Value="0" ContextMenuID="RootContextMenu" AllowEdit="false"
                            Text="ListCategory" Font-Bold="true" Expanded="true">
                        </telerik:RadTreeNode>
                    </Nodes>
                </telerik:RadTreeView>
            </td>
            <td>
                <div class="content-gird">
                    <table class="tbl-td-border-none">
                        <tr>
                            <td class="lblAdmin">
                                <asp:HiddenField runat="server" ID="hdfType" Value="" />
                                <asp:HiddenField runat="server" ID="hdfIdEdit" Value="" />
                                Services Parent: &nbsp;&nbsp;
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="ddlServiceParent" Width="550px" DataTextField="Name"
                                    DataValueField="ID" 
                                    onselectedindexchanged="ddlServiceParent_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="lblAdmin">
                                Behind: &nbsp;&nbsp;
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="ddlBehind" Width="550px" DataTextField="Name"
                                    DataValueField="ID">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="lblAdmin">
                                Status: &nbsp;&nbsp;
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="ddlStatus" Width="550px" DataTextField="Name"
                                    DataValueField="ID">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="lblAdmin">
                                Name: &nbsp;&nbsp;
                            </td>
                            <td>
                                <asp:TextBox ID="txt_name" Width="530px" runat="server" Text=""></asp:TextBox>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="lblAdmin">
                                Image: &nbsp;&nbsp;
                            </td>
                            <td>
                                <asp:TextBox ID="txt_image"  Width="480px" runat="server" Text=""></asp:TextBox><a
                                    class="standard-button orange small" href="javascript:void(0)" onclick="OpenFileExplorerDialog(); return false;">Browser</a>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" class="lblAdmin">
                                Content: &nbsp;&nbsp;
                            </td>
                            <td>
                                <FCKeditorV2:FCKeditor Width="550px" Height="500px" ID="txt_content" runat="server"
                                    BasePath="/" FullPage="true">
                                </FCKeditorV2:FCKeditor>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="btn_submit" runat="server" Text="Add New" CssClass="standard-button orange small"
                                    OnClick="btn_submit_Click" />
                            </td>
                        </tr>
                    </table>
                    <div style="float: right; color: Red;">
                       
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="ServiceEdit"
                            CssClass="redColor" />
                    </div>
                    <br />

                </div>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        function OpenFileExplorerDialog() {
            var wnd = $find("<%= ExplorerWindow.ClientID %>");
            wnd.show();
        }

        function OnFileSelected(fileSelected) {
            document.getElementById("<%= txt_image.ClientID %>").value = fileSelected;
        }
    </script>
    <telerik:RadWindow runat="server" Width="550px" Height="560px" VisibleStatusbar="false"
        ShowContentDuringLoad="false" NavigateUrl="~/admintj/Common/BrowseFiles.aspx?url=~/Uploads/Image/Category"
        ID="ExplorerWindow" Modal="true" Behaviors="Close,Move">
    </telerik:RadWindow>
</asp:Content>


