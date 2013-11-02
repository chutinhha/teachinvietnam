<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RequestSuccess.aspx.cs" Inherits="TeachingJob.publicArea.CV.RequestSuccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<title>TeachinVietnam - Contact employee success</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="col span-9 last" id="member-nav">
        <div class="module">
            <h2>
                <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,Dear %>"></asp:Literal>
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>,
            </h2>
            <h4>
                <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,Yourcontacthasbeensentsuccessfully %>"></asp:Literal>
                <br />
                <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,Wishyousuccesstorecruittalents %>"></asp:Literal>
            </h4>
            <h4>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Employer/EmployerSite.aspx" Text="<%$Resources:Resource,Pleaseclickheretoyourmanagement %>"></asp:HyperLink>
            </h4>
        </div>
        
    </div>
    <div class="clear-floats">
    </div>
</asp:Content>
