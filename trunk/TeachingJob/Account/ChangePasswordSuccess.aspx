<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="ChangePasswordSuccess.aspx.cs" Inherits="TeachingJob.Account.ChangePasswordSuccess" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <title>Password changed - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="col span-9 last" id="member-nav">
        <div class="module">
            <span style="font-size: 18px; font-weight: bold; line-height: 30px; padding-bottom: 15px;">
                <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,Dear %>"></asp:Literal>
                <asp:Label ID="lbl_Username" runat="server" Text="" CssClass="usernameColor"></asp:Label>,<br />
                <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,Yourpasswordhasbeenchanged %>"></asp:Literal>
                <br />
                <br />
            </span>
            <h4>
                <asp:HyperLink ID="hpl_appManagement" runat="server" NavigateUrl="~/Account/my-jobs.aspx">
                    <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,accounthomepage %>"></asp:Literal></asp:HyperLink>
            </h4>
        </div>
    </div>
    <div class="clear-floats">
    </div>
</asp:Content>
