<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="TeachingJob.Course.Courses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SearchArea" runat="server">
<div id="quick-search-autocomplete" class="quick-search">
                                        <div class="search-area-line-1">
                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server"
                                                TargetControlID="txt_Search" WatermarkText="<%$ Resources:Resource, Enteryourkeywordtxt %>">
                                            </ajaxToolkit:TextBoxWatermarkExtender>
                                            <asp:TextBox ID="txt_Search" runat="server" CssClass="keywords-autocomplete waterMarkedText"
                                                Height="26px" Width="77%"></asp:TextBox>
                                            <asp:Button ID="btn_Search" runat="server" Text="<%$ Resources:Resource, Searchtxt %>"
                                                CssClass="standard-button orange"/>
                                        </div>
                                        <div class="clear-floats">
                                        </div>
                                        <div class="search-area-line-2">
                                            <asp:DropDownList ID="DropDownList1" runat="server">
                                                <asp:ListItem>Item1</asp:ListItem>
                                                <asp:ListItem>Item2</asp:ListItem>
                                                <asp:ListItem>Item3</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="DropDownList2" runat="server">
                                            <asp:ListItem>Item1</asp:ListItem>
                                                <asp:ListItem>Item2</asp:ListItem>
                                                <asp:ListItem>Item3</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="DropDownList3" runat="server">
                                            <asp:ListItem>Item1</asp:ListItem>
                                                <asp:ListItem>Item2</asp:ListItem>
                                                <asp:ListItem>Item3</asp:ListItem>
                                            </asp:DropDownList>
                                            
                                        </div>
                                        <br />
                                        <p class="statline col span-8">
                                            <asp:Label ID="lbl_AvaiJob" runat="server" Text="<%$ Resources:Resource, jobAvai %>"
                                                EnableViewState="false"></asp:Label>
                                            <asp:Label ID="lbl_AvaiResumes" runat="server" Text="" Visible="false" EnableViewState="false"></asp:Label>
                                            <br />
                                        </p>
                                    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
