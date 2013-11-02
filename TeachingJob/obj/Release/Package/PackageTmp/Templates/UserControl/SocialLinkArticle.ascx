<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SocialLinkArticle.ascx.cs" Inherits="TeachingJob.Templates.UserControl.SocialLinkArticle" %>

<asp:HyperLink ID="hplShareFB" runat="server"  Target="_blank">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/sitefiles/blog/facebook_22x22.png" />
</asp:HyperLink>
<asp:HyperLink ID="hplShareTW" runat="server" Target="_blank">
    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/sitefiles/blog/twitter_22x22.png" />
</asp:HyperLink>
<asp:HyperLink ID="hplShareLI" runat="server" Target="_blank">
    <asp:Image ID="Image4" runat="server" ImageUrl="~/images/sitefiles/blog/linkedin_22x22.png" />
</asp:HyperLink>
<asp:HyperLink ID="hplShareGM" runat="server" Visible="false">
    <asp:Image ID="Image3" runat="server" ImageUrl="~/images/sitefiles/blog/twitter_22x22.png" />
</asp:HyperLink>