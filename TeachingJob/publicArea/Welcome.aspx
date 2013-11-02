<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="TeachingJob.publicArea.Welcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<title><asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,Hi %>"></asp:Literal>  - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        <div class="col span-9 last" id="member-nav">
        
        <div class="module">
            <h2>
                <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,Hi %>"></asp:Literal> 
                <asp:Literal ID="lbl_Username" runat="server"></asp:Literal>, 
                <br />
                <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,Youraccountisactivatedsuccessfully %>"></asp:Literal></h2>
             <br />
             <h4>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Account/my-jobs.aspx"><asp:Literal ID="Literal4" runat="server"  Text="<%$Resources:Resource,Pleaseclickheretomanageyourjob %>"></asp:Literal></asp:HyperLink>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/memberArea/AdsCv.aspx"><asp:Literal ID="Literal5" runat="server"  Text="<%$Resources:Resource,Pleaseclickheretocomplete %>"></asp:Literal></asp:HyperLink>
             </h4>
            
        </div>
    </div>
    <div class="clear-floats">
    </div>
</asp:Content>
