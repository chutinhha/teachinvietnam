<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemberOnly.aspx.cs" Inherits="TeachingJob.memberArea.MemberOnly" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script runat="server">
    public void Page_PreRender()
    {
        Label1.Text = Profile.Country;
        Label2.Text = Profile.Gender;
        Label3.Text = Convert.ToString(Profile.Age);
    }
    protected void btn_GetProfile(object sender, EventArgs e)
    {
        Membership.GetUser(TextBox1.Text);
        Label1.Text = Profile.Country;
        Label2.Text = Profile.Gender;
        Label3.Text = Convert.ToString(Profile.Age);
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
Welcome to the members-only page. You have successfully logged in.
    <asp:Table ID="Table1" runat="server">
    <asp:TableRow>
    <asp:TableCell>Input your username to get profile</asp:TableCell>
    <asp:TableCell>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><asp:Button ID="Button1"
            runat="server" Text="GetProfile" OnClick="btn_GetProfile" /></asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
    <asp:TableCell>Country:</asp:TableCell>
        <asp:TableCell>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
    <asp:TableCell>Gender:</asp:TableCell>
        <asp:TableCell>
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
    <asp:TableCell>Age:</asp:TableCell>
        <asp:TableCell>
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></asp:TableCell>
    </asp:TableRow>
    </asp:Table>
</asp:Content>
