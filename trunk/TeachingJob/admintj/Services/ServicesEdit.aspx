<%@ Page Title="" Language="C#" MasterPageFile="~/admintj/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="ServicesEdit.aspx.cs" Inherits="TeachingJob.admintj.ServicesEdit" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Services administration</title>
    <style type="text/css">
        .standard-button
        {
            text-align: center;
            border: 0;
            font-size: 1.6em;
            font-family: Calibri;
            line-height: 20px;
            padding: 5px 13px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            color: #222 !important;
            font-weight: bold;
            text-decoration: none;
            display: inline-block;
            border: 1px solid #aaa;
            border: 0px solid #ccc;
        }
        .standard-button::-moz-focus-inner
        {
            border: 0;
            padding: 0;
            margin: 0;
        }
        .standard-button:hover
        {
            background-image: none;
            background-color: #bbb;
            cursor: pointer;
        }
        
        .clearbtn
        {
            background-image: none;
            background-color: #bbb;
            cursor: pointer;
        }
        
        .standard-button.dark, .standard-button.contrast, .standard-button.green, .standard-button.orange, .standard-button.blue
        {
            color: #fff !important;
            text-decoration: none;
            -webkit-text-shadow: none;
            -moz-text-shadow: none;
            text-shadow: none;
        }
        
        .standard-button.blue
        {
            background: #2898D0;
            background: -moz-linear-gradient(top,#2898D0 0%,#2898D0 50%,#2898D0 51%,#2898D0 100%);
            background: -webkit-gradient(linear,left top,left bottom,color-stop(0%,#2898D0),color-stop(50%,#2898D0),color-stop(51%,#2898D0),color-stop(100%,#2898D0));
            background: linear-gradient(top,#2898D0 0%,#2898D0 50%,#2898D0 51%,#2898D0 100%); /* W3C */
            border: 1px solid #2898D0;
            -moz-box-shadow: 0 1px 0 0 #2898D0 inset;
            -webkit-box-shadow: 0 1px 0 0 #2898D0 inset;
            box-shadow: 0 1px 0 0 #2898D0 inset;
        }
        .standard-button.blue:hover
        {
            background-image: none;
            background-color: #2290C8;
            cursor: pointer;
        }
        .standard-button.orange
        {
            background: #ff820b;
        }
        .orangeButton
        {
            background: #ff810a;
        }
        .standard-button.orange:hover
        {
            background-image: none;
            background-color: #3eb365;
            cursor: pointer;
        }
        
        .standard-button.large
        {
            font-size: 1.8em;
            padding: 10px 30px;
        }
        .standard-button.small
        {
            font-size: 14px;
            padding: 4px 15px;
        }
        .lblAdmin{font-weight:bold}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <div class="grid-1">
            <div class="title-grid">
                Edit Services</div>
            <div class="content-gird">
                <table>
                    <tr>
                        <td class="lblAdmin">
                            Services Parent: &nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlServiceParent"  Width="620px" DataTextField="Name" DataValueField="ID">
                                
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="lblAdmin">
                            Name: &nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="txt_name" Width="600px" runat="server" Text=""></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" class="lblAdmin">
                            Content: &nbsp;&nbsp;
                        </td>
                        <td>
                            <FCKeditorV2:FCKeditor Width="620px" Height="500px" ID="txt_content" runat="server" BasePath="/" FullPage="true">
                            </FCKeditorV2:FCKeditor>
                        </td>
                    </tr>
                    <tr>
                        <td class="lblAdmin">
                            Image: &nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:FileUpload runat="server" ID="fuImage" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button ID="btn_submit" runat="server" Text="Add New" 
                                CssClass="standard-button orange small" onclick="btn_submit_Click"/>
                        </td>
                    </tr>
                </table>
                 <div style="float: right; color: Red;">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="ServiceEdit"
                        CssClass="redColor" />
                </div>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is required"
                    ControlToValidate="txt_name" Display="Dynamic" ValidationGroup="ServiceEdit"
                    Text="*" CssClass="redColor"></asp:RequiredFieldValidator>
            </div>
        </div>
    </div>
</asp:Content>
