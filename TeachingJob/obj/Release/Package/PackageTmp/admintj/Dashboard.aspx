<%@ Page Title="" Language="C#" MasterPageFile="~/admintj/AdminSite.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="TeachingJob.admintj.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="main">
          
        <div class="speedbar">
         <a href="#">Light life Admin Panel</a> &rsaquo; <a href="#">Dashboard</a>
        </div>
        
  	   <!--Reports-->
       <ul class="reports">
           <li><a href="#" class="report"><span class="add"></span>New news</a></li>    
           <li><a href="#" class="report"><span class="add"></span>New post</a></li> 
           <li><a href="#" class="report"><span class="add"></span>New users</a></li> 
           <li><a href="#" class="report last-report"><span class="add"></span>New messages</a></li> 
        </ul>
        
        <!--Reports end-->
        
        <!--Statistic-->
        <div class="grid-1">
           <div class="title-grid">Charts</div>
           <div class="content-gird">
         		<div class="autoUpdate" style="width:730px;height:200px;"></div>
           </div>
        </div>  
		<!--Statistic end-->
        
        <!--Pictures-->
        <div class="grid-2">
           <div class="title-grid">Pictures</div>
           <div class="content-gird">
          		 <ul class="gallery">
            	   <li><a class="fancybox" href="images/fullscreen/1.jpg">  <img src="images/thumbnails/t_1.jpg" alt=""  /></a>
                         <ul class="img_options">
                            <li><a class="zoom fancybox" href="images/fullscreen/1.jpg"><span>View</span></a></li> 
                         </ul>
                   </li>
                   <li><a class="fancybox" href="images/fullscreen/2.jpg">  <img src="images/thumbnails/t_2.jpg" alt=""  /></a>
                         <ul class="img_options">
                            <li><a class="zoom fancybox" href="images/fullscreen/2.jpg"><span>View</span></a></li> 
                         </ul>
                   </li>
                   <li><a class="fancybox" href="images/fullscreen/3.jpg">  <img src="images/thumbnails/t_3.jpg" alt=""  /></a>
                         <ul class="img_options">
                            <li><a class="zoom fancybox" href="images/fullscreen/3.jpg"><span>View</span></a></li> 
                         </ul>
                   </li>
                   <li><a class="fancybox" href="images/fullscreen/4.jpg">  <img src="images/thumbnails/t_4.jpg" alt=""  /></a>
                         <ul class="img_options">
                            <li><a class="zoom fancybox" href="images/fullscreen/4.jpg"><span>View</span></a></li> 
                         </ul>
                   </li>
                   <li><a class="fancybox" href="images/fullscreen/5.jpg">  <img src="images/thumbnails/t_5.jpg" alt=""  /></a>
                         <ul class="img_options">
                            <li><a class="zoom fancybox" href="images/fullscreen/5.jpg"><span>View</span></a></li> 
                         </ul>
                   </li>
                   <li><a class="fancybox" href="images/fullscreen/6.jpg">  <img src="images/thumbnails/t_6.jpg" alt=""  /></a>
                         <ul class="img_options">
                            <li><a class="zoom fancybox" href="images/fullscreen/6.jpg"><span>View</span></a></li> 
                         </ul>
                   </li>
                   <li><a class="fancybox" href="images/fullscreen/7.jpg">  <img src="images/thumbnails/t_7.jpg" alt=""  /></a>
                         <ul class="img_options">
                            <li><a class="zoom fancybox" href="images/fullscreen/7.jpg"><span>View</span></a></li> 
                         </ul>
                   </li>
                   <li><a class="fancybox" href="images/fullscreen/8.jpg">  <img src="images/thumbnails/t_8.jpg" alt=""  /></a>
                         <ul class="img_options">
                            <li><a class="zoom fancybox" href="images/fullscreen/8.jpg"><span>View</span></a></li> 
                         </ul>
                   </li>
                   <li><a class="fancybox" href="images/fullscreen/9.jpg">  <img src="images/thumbnails/t_9.jpg" alt=""  /></a>
                         <ul class="img_options">
                            <li><a class="zoom fancybox" href="images/fullscreen/9.jpg"><span>View</span></a></li> 
                         </ul>
                   </li>
                   <li><a class="fancybox" href="images/fullscreen/10.jpg">  <img src="images/thumbnails/t_10.jpg" alt=""  /></a>
                         <ul class="img_options">
                            <li><a class="zoom fancybox" href="images/fullscreen/10.jpg"><span>View</span></a></li> 
                         </ul>
                   </li>
                   <li><a class="fancybox" href="images/fullscreen/11.jpg">  <img src="images/thumbnails/t_11.jpg" alt=""  /></a>
                         <ul class="img_options">
                            <li><a class="zoom fancybox" href="images/fullscreen/11.jpg"><span>View</span></a></li> 
                         </ul>
                   </li>
                   <li><a class="fancybox" href="images/fullscreen/12.jpg">  <img src="images/thumbnails/t_12.jpg" alt=""  /></a>
                         <ul class="img_options">
                            <li><a class="zoom fancybox" href="images/fullscreen/12.jpg"><span>View</span></a></li> 
                         </ul>
                   </li>
				</ul>
                <div class="clear"> </div>
                </div>
        </div>
		<!--Pictures end-->
        
        <!--Buttons-->
        <div class="grid-2 last">
           <div class="title-grid">Buttons</div>
           <div class="content-gird">
          	 <ul class="buttons">
                <li><a class="button-a gray" href="#"><span>Link Button</span></a></li>
                <li><input type="submit" class="button-a gray" value="Input type submit"></li>
                <li><button class="button-a gray">Button gray</button></li>
                
             </ul>
             <div class="clear"></div>
          	 <ul class="buttons">
                <li><a class="button-a blue" href="#"><span>Link Button</span></a></li>
                <li><input type="submit" class="button-a blue" value="Input type submit"></li>
                <li><button class="button-a blue">Button blue</button></li>
                
             </ul>
             <div class="clear"></div>
             <ul class="buttons">
                <li><a class="button-a dark-blue" href="#"><span>Link Button</span></a></li>
                <li><input type="submit" class="button-a dark-blue" value="Input type submit"></li>
                <li><button class="button-a dark-blue">Button dark</button></li>
                
             </ul>
             <div class="clear"></div>
             <ul class="buttons">
                <li><a class="button-a red" href="#"><span>Link Button</span></a></li>
                <li><input type="submit" class="button-a red" value="Input type submit"></li>
                <li><button class="button-a red">Button red..</button></li>
             </ul>

            
             <div class="clear"></div>
           </div>
        </div>
        <!--Buttons end-->
        
        <!--Accordion-->
        <div id="accordion">
          <h3><a>Accordion</a></h3>
          <div>Merry Christmas y'all.</div>
          <h3><a>Accordion</a></h3>
          <div>Merry Christmas y'all.</div>
          <h3><a>Accordion</a></h3>
          <div>Merry Christmas y'all.</div>
          <h3><a>Accordion</a></h3>
          <div>Merry Christmas y'all.</div>
		</div>
        <div class="clear"></div>
		<!--Accordion end-->
        
        <!--Alerts-->
        <div class="grid-1">
           <div class="title-grid">Alerts</div>
           <div class="content-gird">
           		<div class="alert green hideit"><span class="green-icon"></span> SUCCESS: Success message!</div>
                <div class="alert orange hideit"><span class="orange-icon"></span>WARNING: This is a warning message.</div>
         		<div class="alert red hideit"><span class="red-icon"></span>FAILURE: Oops sorry.</div>
                <div class="alert blue hideit"><span class="blue-icon"></span>INFORMATION: This is a message for information</div>
                
           </div>
        </div>
		<!--Alerts end-->
        
        <!--Articles-->
        <div class="grid-1">
           <div class="title-grid">Articles</div>
           <div class="content-gird">
            <div class="articles">
         		<div class="article">
                	<span class="identifier">1</span>
                    <div class="article-content">
                    	<span class="article-title"><a href="#">Loading bar</a></span>
                          <ul class="article-action">
                             <li><a href="#" class="article-edit tip-top" title="Edit">edit</a></li>
                             <li><a href="#" class="article-delete tip-top" title="Delete">delete</a></li>
                         </ul>
                        <span class="article-description">I worked on the little loading bar a little bit today. Also bumped up the text contrast a little bit. Merry Christmas y'all. You should also probably follow...</span>
                        <span class="article-author">Posted: <a href="#">Erik Deiner</a></span>
                    </div>
                </div>
                
                <div class="article">
                	<span class="identifier">2</span>
                    <div class="article-content">
                    	<span class="article-title"><a href="#">Loading bar</a></span>
                          <ul class="article-action">
                             <li><a href="#" class="article-edit tip-top" title="Edit">edit</a></li>
                             <li><a href="#" class="article-delete tip-top" title="Delete">delete</a></li>
                         </ul>
                        <span class="article-description">I worked on the little loading bar a little bit today. Also bumped up the text contrast a little bit. Merry Christmas y'all. You should also probably follow...</span>
                        <span class="article-author">Posted: <a href="#">Erik Deiner</a></span>
                    </div>
                </div>
                
                <div class="article">
                	<span class="identifier">3</span>
                    <div class="article-content">
                    	<span class="article-title"><a href="#">Loading bar</a></span>
                          <ul class="article-action">
                             <li><a href="#" class="article-edit tip-top" title="Edit">edit</a></li>
                             <li><a href="#" class="article-delete tip-top" title="Delete">delete</a></li>
                         </ul>
                        <span class="article-description">I worked on the little loading bar a little bit today. Also bumped up the text contrast a little bit. Merry Christmas y'all. You should also probably follow...</span>
                        <span class="article-author">Posted: <a href="#">Erik Deiner</a></span>
                    </div>
                </div>
                
                <div class="article">
                	<span class="identifier">4</span>
                    <div class="article-content">
                    	<span class="article-title"><a href="#">Loading bar</a></span>
                          <ul class="article-action">
                             <li><a href="#" class="article-edit tip-top" title="Edit">edit</a></li>
                             <li><a href="#" class="article-delete tip-top" title="Delete">delete</a></li>
                         </ul>
                        <span class="article-description">I worked on the little loading bar a little bit today. Also bumped up the text contrast a little bit. Merry Christmas y'all. You should also probably follow...</span>
                        <span class="article-author">Posted: <a href="#">Erik Deiner</a></span>
                    </div>
                </div>
                
                
              </div>
             <div class="clear"></div>
           </div>
        </div>
		<!--Articles end-->
        
   </div>

</asp:Content>
