<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pending.aspx.cs" Inherits="TeachingJob.publicArea.Pending" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<title><asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,Thankyouforregistering %>"></asp:Literal> - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col span-9 last" id="member-nav">
        
        <div class="module">
            <h2>
                <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,Thankyouforregistering %>"></asp:Literal><br /> 
                <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,Pleasecheckyourregisteredemail %>"></asp:Literal></h2>
            <br />
            <h4><asp:HyperLink ID="hpl" runat="server" NavigateUrl="~/" Text="<%$Resources:Resource,returntoHomepage %>"></asp:HyperLink></h4>
        </div>
    </div>
    <div class="clear-floats">
    </div>
</asp:Content>
