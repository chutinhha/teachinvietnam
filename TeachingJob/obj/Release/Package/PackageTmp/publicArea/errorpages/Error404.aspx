<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error404.aspx.cs" Inherits="TeachingJob.publicArea.errorpages.Error404" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>404 page error</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <script type="text/javascript" src="js/iepngfix_tilebg.js">
</script>
<script type="text/javascript" src="js/cufon-yui.js" ></script>
<script type="text/javascript" src="js/akaDora_400.font.js" ></script>

<script type="text/javascript">
    Cufon.replace('.oops');
</script>

</head>
<body>
<div class="wrapper">
  <div class="main-page">
    <%--<div class="header">
      <div class="logo"><a href="#"><img src="images/logo.png" alt="logo" width="170" height="30" /></a></div>
      <div class="clear"></div><!-- /clear -->
    </div>--%><!-- /header -->
    <div class="content">
      <div class="error-image"><img src="images/404.png" alt="404 image" width="229" height="96" /></div>
      <div class="error-text"> 
		<div class="oops">Oops, you’ve encountered an error!</div>
        <p>it appears the page you were looking for doesn't exist. Sorry about that.</p>
      </div><!-- /content -->
      <div class="search">
        <%--<div class="input-box">
          <input onfocus="if(this.value=='Where would you like to go')this.value=''" onblur="if(this.value=='')this.value='Where would you like to go'" name="search" type="text" value="Where would you like to go" />
        </div><!-- /input-box -->
        <input class="submit" type="submit" value="Search" />--%>
      </div><!-- /search -->
    </div><!-- /content -->
    <div class="footer">
      <div class="nav-links">
        <ul>
          <li><a href="~/" runat="server">Home</a></li>
          <li><a runat="server" href="~/ContactUs.aspx">Contact us</a></li>
          <%--<li><a href="#">Services</a></li>
          <li><a href="#">Portfolio</a></li>
          <li><a href="#">Blog </a></li>
          <li><a href="#">Contact us</a></li>--%>
        </ul>
      </div><!-- /nav-links -->
      <%--<div class="feed-icons">
        <ul>
          <li><a href="#"><img src="images/twitter_24.png" alt="twitter" /></a></li>
          <li><a href="#"><img src="images/facebook_24.png" alt="facebook" /></a></li>
          <li><a href="#"><img src="images/flickr_24.png" alt="flickr" /></a></li>
          <li><a href="#"><img src="images/rss_24.png" alt="rss" /></a></li>
          <li><a href="#"><img src="images/delicious_24.png" alt="delicious" /></a></li>
          <li><a href="#"><img src="images/stumbleupon_24.png" alt="stumbleupon" /></a></li>
        </ul>
      </div>--%>
      <div class="clear"></div><!-- /clear -->
    </div><!-- /footer -->
  </div><!-- /main-page -->
</div>
   <%-- <form id="form1" runat="server">
    <div>
        <h1>Sorry, Your request is not avalable, please check it again!</h1>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Please click here to go back to homepage!</asp:HyperLink>
    </div>
    </form>--%>
</body>
</html>
