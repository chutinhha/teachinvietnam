<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PostJobSuccess.aspx.cs" Inherits="TeachingJob.memberArea.PostJobSuccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<title>Post job success - Teach in Vietnam</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col span-9 last" id="member-nav">
        <div class="module">
            <h2>
                <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,Dear %>"></asp:Literal>
                <asp:Literal ID="lbl_Username" runat="server"></asp:Literal>,
                <br />
            </h2>
            <h4>
                <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,Yourjobwillbeactivated %>"></asp:Literal>
                <br />
                <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,Wishyousuccesstorecruittalents %>"></asp:Literal>
            </h4>
            <h4>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Employer/EmployerSite.aspx" Text="<%$Resources:Resource,Pleaseclickheretoyourmanagement %>"></asp:HyperLink>
                
            </h4>
        </div>
    </div>
    <div class="clear-floats">
    </div>
</asp:Content>
