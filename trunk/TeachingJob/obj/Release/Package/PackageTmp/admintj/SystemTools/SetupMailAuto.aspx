<%@ Page Title="" Language="C#" MasterPageFile="~/admintj/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="SetupMailAuto.aspx.cs" Inherits="TeachingJob.admintj.SetupMailAuto"
    ValidateRequest="false" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>SQL Query</title>
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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:TreeView>
<Nodes >
<asp:TreeNode>
    
</asp:TreeNode>
</Nodes>
</asp:TreeView>
    <div class="main">
        <div class="grid-1">
            <div class="title-grid">
               Mail Auto Schedule
            </div>
            <div class="content-gird">
                <h4>
                   Mail Auto Schedule</h4>
                <%--<CKEditor:CKEditorControl ID="txt_content_en" BasePath="~/Scripts/ckeditor"
                    runat="server"></CKEditor:CKEditorControl>--%>
                <table>
                    <tr>
                        <td valign="top" style="font-weight:bold;padding-right:5px">
                            Day send: 
                        </td>
                        <td>
                            <asp:CheckBoxList runat="server" ID="lbDayOfWeek">
                                
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                    <tr>
                        <td  valign="top" style="font-weight:bold;padding-right:5px">
                            Hour send:   
                        </td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlHour">
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                                <asp:ListItem Value="5">5</asp:ListItem>
                                <asp:ListItem Value="6">6</asp:ListItem>
                                <asp:ListItem Value="7">7</asp:ListItem>
                                <asp:ListItem Value="8">8</asp:ListItem>
                                <asp:ListItem Value="9">9</asp:ListItem>
                                <asp:ListItem Value="10">10</asp:ListItem>
                                <asp:ListItem Value="11">11</asp:ListItem>
                                <asp:ListItem Value="12">12</asp:ListItem>
                                <asp:ListItem Value="13">13</asp:ListItem>
                                <asp:ListItem Value="14">14</asp:ListItem>
                                <asp:ListItem Value="15">15</asp:ListItem>
                                <asp:ListItem Value="16">16</asp:ListItem>
                                <asp:ListItem Value="17">17</asp:ListItem>
                                <asp:ListItem Value="18">18</asp:ListItem>
                                <asp:ListItem Value="19">19</asp:ListItem>
                                <asp:ListItem Value="20">20</asp:ListItem>
                                <asp:ListItem Value="21">21</asp:ListItem>
                                <asp:ListItem Value="22">22</asp:ListItem>
                                <asp:ListItem Value="23">23</asp:ListItem>
                                <asp:ListItem Value="24">24</asp:ListItem>
                            </asp:DropDownList>giờ
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <br />
                <asp:Button ID="btn_submit" runat="server" Text="Update" CssClass="standard-button orange small"
                    OnClick="btn_submit_Click" ValidationGroup="sendMailGroup" />
                <br />
               
            </div>
        </div>
    </div>
</asp:Content>
