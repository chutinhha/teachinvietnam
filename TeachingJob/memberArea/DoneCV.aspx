<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="DoneCV.aspx.cs" Inherits="TeachingJob.memberArea.DoneCV" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<title>Successful created CV - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col span-9 last" id="member-nav">
        <div class="module">
            <span style="font-size:18px; font-weight:bold; line-height:30px; padding-bottom:15px;">
                <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,Hi %>"></asp:Literal>
                <asp:Label ID="lbl_Username" runat="server" Text="" CssClass="usernameColor"></asp:Label>,<br />
            </span>
            <span style="font-size:12px; font-weight:bold; line-height:20px;">
                <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,Youhavesuccessfullysubmitted %>"></asp:Literal>
            </span >
            <br />
            <br />
            <h4>
                <asp:HyperLink ID="hpl" runat="server" Target="_blank" Text="<%$Resources:Resource,Clickheretoreview %>" ></asp:HyperLink>
                <br />
                <asp:HyperLink ID="hpl_appManagement" runat="server" NavigateUrl="~/Account/my-jobs.aspx" Text="<%$Resources:Resource,Clickheretoyouraccounthomepage %>"></asp:HyperLink>
            </h4>
        </div>
    </div>
    <div class="clear-floats">
    </div>
</asp:Content>
