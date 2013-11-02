<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecoveryPasswordSuccess.aspx.cs" Inherits="TeachingJob.Account.RecoveryPasswordSuccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<title>Password restored - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="col span-9 last" id="member-nav">
        <div class="module">
            <span style="font-size:18px; font-weight:bold; line-height:30px; padding-bottom:15px;">
                <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,Hi %>"></asp:Literal><br />
                <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,Yourpasswordbeenrestored %>"></asp:Literal>
            </span> 
           <h4>
               <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,Clickheretologin %>"></asp:Literal>
           </h4>
        </div>
    </div>
    <div class="clear-floats">
    </div>
</asp:Content>
