<%@ Page Title="" Language="C#" MasterPageFile="~/admintj/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="ImageUpload.aspx.cs" Inherits="TeachingJob.admintj.ImageUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Image Upload - TeachinVietnam</title>
<style type="text/css">
#upload{margin-top:20px}
#upload tr td{padding-right: 10px; padding-bottom:5px}
#FileTable table tr td{padding:10px; text-align:center}
#FileTable table tr th{padding:10px}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <div class="grid-1">
            <div class="title-grid">
            </div>
            <div class="content-gird">
                <h3 style="padding-bottom: 5px">Image Upload</h3>
                <hr style="margin:0 !important" />
                <div>
                    <p style="margin-top:10px;line-height:1.6em">
                        Uploaded image will be saved in <b>/UserData/ImageUpload/</b><br />
                        Please follow this combination when you call your image: 
                        <b>http://teachinvietnam.org/UserData/ImageUpload/ + yourImageName</b><br />
                        File must not exceed 5mb.
                    </p>
                    <table id="upload">
                        <tr>
                            <td><b><asp:Literal ID="Literal1" runat="server" Text="Please select: "></asp:Literal></b></td>
                            <td><asp:FileUpload ID="fileupload" runat="server" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="btnSave" runat="server" Text="Save" style="padding:5px 8px" OnClick="btnSave_Click" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><asp:Label ID="lblStatus" runat="server" CssClass="redColor"></asp:Label></td>
                        </tr>
                    </table>
                    
                    <hr />
                    <div id="FileTable">
                    <asp:GridView ID="gvUploadFile" runat="server" CellPadding="4" AllowPaging="true" AllowSorting="true" PageSize="20"
                        ForeColor="#333333" GridLines="None" Width="100%" OnRowDataBound="gvUploadFile_OnDataBound">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
