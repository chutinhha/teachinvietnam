<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SocialReference.ascx.cs"
    Inherits="TeachingJob.Templates.UserControl.SocialReference" %>
    <link type="text/css" href="~/Styles/addthis.css" />
<%--<div class="addthis-smartlayers at4-share-outer-right">
        <div id="at4-share" class="at-vertical-menu at-vertical-menu-right addthis_32x32_style ats-transparent at4-show">
           <a class="at4-share-btn at-svc-twitter">
                <label title="Twitter">
                    Twitter</label><span class="aticon at300bs at15nc at15t_twitter" title="Twitter"></span>
            </a>
             <asp:HyperLink ID="hpl_ShareTwitter" runat="server" CssClass="at4-share-btn at-svc-twitter" Target="_blank">
                    <label title="Twitter">
                    Twitter</label><span class="aticon at300bs at15nc at15t_twitter" title="Twitter"></span>
            </asp:HyperLink>
            <asp:HyperLink ID="hpl_ShareFacebook" runat="server" CssClass="at4-share-btn at-svc-twitter" Target="_blank">
                    <label title="Twitter">
                    Facebook</label><span class="aticon at300bs at15nc at15t_twitter" title="Twitter"></span>
            </asp:HyperLink>
           <a class="at4-share-btn at-svc-facebook">
                <label title="Facebook">
                    Facebook</label>
                <span class="aticon at300bs at15nc at15t_facebook" title="Facebook"></span></a>
            <a class="at4-share-btn at-svc-print">
                <label title="Print">
                    Print</label><span class="aticon at300bs at15nc at15t_print" title="Print"></span></a>
            <a class="at4-share-btn at-svc-gmail">
                <label title="Gmail">
                    Gmail</label><span class="aticon at300bs at15nc at15t_gmail" title="Gmail"></span></a>
            <a class="at4-share-btn at-svc-compact">
                <label title="More Options">
                    More Options</label>
                <span class="aticon at300bs at15nc at15t_compact" title="More Options"></span>
            </a>
            <div class="at-share-close-control">
                <div id="at4-scc" class="at4-arrow right at4-hide" title="Hide">
                    Hide</div>
            </div>
        </div>
        <div id="at4-soc" class="at-share-open-control-right ats-transparent at4-hide">
            <div class="at4-arrow left" title="Show">
                Show</div>
        </div>
    </div>
--%>
<div class="addthis-smartlayers at4-follow-outer">
    <div id="at4-follow" class="at4-follow at4-follow-24 ats-transparent animated fadeInRight at4-show">
        <div class="at4-follow-inner">
            <div id="at4-fcc" class="at4-follow-close-control at4-show">
                <div id="at4-fcc" class="at4-arrow right" title="Hide">
                    Hide</div>
            </div>
            <div class="at4-follow-container addthis_24x24_style">
                <asp:HyperLink ID="hpl_ShareFacebook" runat="server" CssClass="aticon at-follow-btn" Target="_blank">
                    <span class="at4-icon-fw aticon-facebook" svc="facebook" svcid="teachinvietnam" title="Follow on Facebook">
                        Facebook</span></asp:HyperLink> 
                <asp:HyperLink ID="hpl_ShareTwitter" runat="server" CssClass="aticon at-follow-btn" Target="_blank">
                <span class="at4-icon-fw aticon-twitter"
                    svc="twitter" svcid="vietnamteachers" title="Follow on Twitter">Twitter</span>
                </asp:HyperLink> 
                <a class="aticon at-follow-btn" href="http://www.linkedin.com/in/YOUR-PROFILE" target="_blank">
                    <span class="at4-icon-fw aticon-linkedin" svc="linkedin" svcid="YOUR-PROFILE" title="Follow on LinkedIn">
                        LinkedIn</span></a>
            </div>
        </div>
    </div>
    <div id="at4-foc" class="at-follow-open-control ats-transparent animated fadeOutRight at4-hide">
        <div class="at4-arrow left" title="Show">
            Show</div>
    </div>
</div>
