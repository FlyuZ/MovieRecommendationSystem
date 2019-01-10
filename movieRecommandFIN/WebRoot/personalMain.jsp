<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>
<!-- Basic Page Needs
================================================== -->
<title>Home</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">

<!-- Mobile Specific Metas 
================================================== -->
<meta content="width=device-width,initial-scale=1" name="viewport">

<!-- Favicons
================================================== -->
<link rel="shortcut icon" href="images/favicon.png">
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="images/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="images/apple-touch-icon-114x114.png">

<!--fonts
====================================================-->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700%7cOswald:400,700" rel="stylesheet">
<!--stylesheets
====================================================-->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">  
<link rel="stylesheet" type="text/css" href="css/style3.css">
<link rel="stylesheet" type="text/css" href="css/simpletextrotator.css"> 

<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]--> 
<script src="js2/jquery.min.js"></script> <!-- JQUERY -->
</head>
<body>

<!--FRONT PAGE/ SPLASH SCREEN SECTION-->

<div class="loading-screen"></div>
   <form action="movieAll">
     <input type="hidden"  name="userID" value="${user.userId }" />
     <input type="submit" style="opacity:0.5;border-radius:10px"  value="返回首页"/>
   </form>
<div id="frontpage"> 
	<div class="shadow-img"></div> 
	<img src="images/front-image.jpg" class="front-img img-responsive" alt ="Front-image"><!--IMAGE FOR FRONT SCREEN-->
	<!--将John更改为${user.userName }-->
	<h1><span class="invert">${user.userName }</span></h1><!--PROFILE NAME-->
	<div class="frontclick"><img src="images/click.png" alt="" class="img-responsive"><span class="pulse"></span></div>
</div>
<!--FRONT PAGE/ SPLASH SCREEN SECTION ENDS-->
<!--container-->
<div class="container">
	<div id="content" class="row hidden">
		<div class="col-sm-4">
			<!--namecard-->
			<div id="namecard" class="namecard">
				<div class="shadow-img"></div>
				<!--将John更改为${user.userName }-->
				<h1 class="maintitle"><span class="invert">${user.userName}</span></h1><!--PROFILE NAME-->
				<h3 class="invert sub-maintitle"> 
					<span class="rotate">
					<c:forEach  items="${user.userLabelList }" var="var_label">
					     ${var_label },
					</c:forEach>
					</span><!--SUBTITLE AFTET NAME-->
				</h3>
				<!--更改头像的图片路径src-->
				<img id="profile-img" class="profile-img transparent" src="${user.profilePictureSrc}" ><!--PROFILE IMAGE-->
			</div><!--/#namecard-->
			<!--menu-->
			<div id="menu-container">
				<!--PAGE MENU-->
				<ul class="nav-menu no-padding">
					<li class="nav-btn selected" title="Home" data-page="home">
						<div class="hover-background"></div>
						<span>个人信息</span><i class="fa fa-user fa-fw"></i>
					</li>
					<li class="nav-btn" id="resume-btn" title="Resume"  data-page="resume">
						<div class="hover-background"></div>
						<span>猜你喜欢</span><i class="fa fa-file-text fa-fw"></i>
					</li>
				    <li class="nav-btn folio-btn" data-filter="*" title="Portfolio" data-page="portfolio">
						<div class="hover-background"></div>
						<span>参与评论</span><i class="fa fa-suitcase fa-fw"></i>
					</li>
		
				</ul><!--/.nav-menu __PAGE MENU ENDS-->

				<!--SOCIAL NAV MENU-->
				<div class="social-menu-container">
					<ul class="social-menu no-padding">                     
						<li><a href=""><i class="fa fa-facebook"></i></a></li>
						<li><a href=""><i class="fa fa-google-plus"></i></a></li>
						<li><a href=""><i class="fa fa-youtube"></i></a></li>
						<li><a href=""><i class="fa fa-pinterest-p"></i></a></li>
						<li><a href=""><i class="fa fa-linkedin"></i></a></li>
					</ul>
				</div><!--/.social-menu-container-->
			</div><!--#menu-container-->
		</div>
		<div class="col-sm-8 page-segment">
			<ul class="page-container no-padding">
				<!--HOME/PROFILE PAGE-->
				<li id="home" class="selected">
					<div class="title-container hidden">
						<div class="shadow-img"></div> 
						<h2 class="rotate-out">Welcome To <span class="invert">My Profile</span></h2><!--HOME TITLE-->                          
					</div>
					<div class="description hidden">
						<div class="watermark-home"></div> 

						<div class="fade-text transparent">
							<!--DESCRIPTION ON HOME-->
							<!--将John更改为${user.userName }-->
							<div class="strong-text">Hello, I am <span>${user.userName }</span></div>
							<!--添加一个forEach，循环输出个人label，共三个标签，用逗号分隔-->
							<div class="focus-text"><span>
							<c:forEach  items="${user.userLabelList }" var="var_label">
					           ${var_label }
					        </c:forEach>
							</span></div>
			                <!--DESCRIPTION ON HOME ENDS-->
						</div>

						<!--ALL PERSONAL DETAILS-->
						<h3 class="personal-info-title title">Personal Info</h3>
						<form>
							<ul class="personal-info">
								<li class="rotate-out rotated"><label>昵称</label><span>${user.userName }</span></li>   
                                <c:forEach  items="${user.userLabelList }" var="var_label">
								<li class="rotate-out rotated"><label>标签</label><span> ${var_label }</span></li>					              
					            </c:forEach>													
								<li class="rotate-out rotated"><label>个性签名</label><span>${user.signature}</span></li>
							</ul><!--/ul.personal-info-->
<!-- 							<input > -->
							<input >
						</form>
						
					</div>
				</li><!--/#home-->

				<!--RESUME PAGE-->
				<li id="resume" class="hidden">
					<div class="title-container">
						<div class="shadow-img"></div>
						<h2 class="rotate-out rotated"><span class="invert">猜你喜欢</span></h2> <!--RESUME TITLE-->
					</div>
					<div class="abs-child">
						<ul class="button-group filters-button-group">
						<li class="button is-checked">Show All</li>
						</ul><!--/.button-group filters-button-group-->
					</div>
					<div class ="sec-porfolio description"> 
						<div class="row">
							<!--PORTFOLIO ITEM CONTAINER-->
							<div class="folio-container">
								<ul class="folio-item"><!--PORTFOLIO INDIVIDAUAL ITEM-->
								    <!--forEach显示电影-->
									<c:forEach  items="${movieList }" var="movie2">
										<li class="view view-tenth">  
											<img src="${movie2.imgSrc }" alt="logs"/><!--PORTFOLIO INDIVIDAUAL ITEM IMAGE--> 
											<div class="mask">  
												<a href="movieDetail?movieID=${movie2.movieId }&userID=${user.userId }"><h2>${movie2.movieName }</h2></a> <!--PORTFOLIO INDIVIDAUAL ITEM TITLE-->                               
												<!-- Button trigger modal -->
												<!--点击电影查看详情-->
												<a role="button" class="info" href="">Read More</a><!--PORTFOLIO INDIVIDAUAL ITEM MODAL LINK BY 'data-target'-->
											</div>  
										</li>
									</c:forEach>	
								</ul>
							</div>
							<!--PORTFOLIO ITEM CONTAINER ENDS-->
						</div>                          
					</div>
				</li>
				<!--/#resume-->
				<!--PORTFOLIO PAGE-->
				<li id="portfolio" class="hidden">
					<div class="title-container">
						<div class="shadow-img"></div>
						<h2 class="rotate-out rotated">Portfolio</h2> <!--PORTFOLIO TITLE-->                         
					</div>

					<!--PORTFOLIO CATEGORY LIST-->    
					<div class="abs-child">
						<ul class="button-group filters-button-group">
							<li class="button is-checked">Show All</li>
						</ul><!--/.button-group filters-button-group-->
					</div>
					<div class ="sec-porfolio description">
						<div class="row">
							<!--PORTFOLIO ITEM CONTAINER-->
							<div class="folio-container"> 
						<div class="abs-child">
							<ul class="button-group filters-button-group">
	    						<c:forEach  items="${commentList }" var="var_comment">
		   						 <li class="txt is-checked">
		   						 	《${var_comment.movieName }》</br>
		   						 	${var_comment.comment }</br>
		   						 	评分:${var_comment.score }&nbsp;<br/>
		   						 </li>
								</c:forEach>
							</ul><!--/.button-group filters-button-group-->
						</div>
								    <!--forEach用户参与评论-->
									<!--<c:forEach  items="${commentList }" var="var_comment">
										${var_comment.movieName }&nbsp;${var_comment.comment }&nbsp;${var_comment.score }&nbsp;<br/>
									</c:forEach>-->	
						</div>
						</div>		                        
					</div>
				</li><!--/#portfolio-->

				<!--CONTACT PAGE没有用到，但是不能删除，jquery代码加载了这个页面-->
				<li id="contact" class="hidden">
					<div class="title-container" >
						<div class="shadow-img"></div>               
					   <h2 class="rotate-out rotated">Contact</h2><!--CONTACT PAGE TITLE-->
					</div>
					<div class="description">                           
						<div class="row">
							<div class="col-sm-12">
								<div class="map-container">
									<div id="map" style="width:100%;height:325px;"></div><!--GOOGLE MAP-->
								</div>
							</div>

							<div class="col-sm-5">
								<!--CONTACT DESCRIPTION-->
								<h3 class="title">Contact Info</h3>
								<h6 class="sm-title"><span class="address-icon"><i class="fa fa-map-marker"></i></span>311B, Jalalabad, Sylhet</h6>
								<h6 class="sm-title"><span class="address-icon"><i class="fa fa-phone"></i></span>+8801979791001</h6>
								<h6 class="sm-title"><span class="address-icon"><i class="fa fa-envelope"></i></span>nurealamsabbir@authlab.io</h6>
								<!--/CONTACT DESCRIPTION ENDS-->
							</div>
							<div class="col-sm-7">

								<div class="mail-container">
									<div class="cnmail result">
										<div class="msg success-msg"><i class="icon svg-check"><!--?xml version="1.0" encoding="utf-8"?-->  <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="32" height="32" viewBox="0 0 32 32"> <path d="M16 2.688c-7.375 0-13.313 5.938-13.313 13.313s5.938 13.313 13.313 13.313c7.375 0 13.313-5.938 13.313-13.313s-5.938-13.313-13.313-13.313zM16 28.25c-6.75 0-12.25-5.5-12.25-12.25s5.5-12.25 12.25-12.25c6.75 0 12.25 5.5 12.25 12.25s-5.5 12.25-12.25 12.25zM22.688 11.25l-8.563 8.313-3-3c-0.313-0.313-0.813-0.313-1.125 0s-0.313 0.813 0 1.125l3.563 3.563c0.125 0.125 0.313 0.188 0.563 0.188 0.188 0 0.375-0.063 0.5-0.188l9.125-8.875c0.375-0.313 0.375-0.813 0.063-1.125s-0.813-0.313-1.125 0z"></path> </svg> </i><span> You email has been stored!</span></div>
										<div class="msg error-msg"><i class="icon svg-close-circle"><!--?xml version="1.0" encoding="utf-8"?-->  <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="32" height="32" viewBox="0 0 32 32"> <path d="M6.563 6.563c-5.188 5.188-5.188 13.688 0 18.875s13.688 5.188 18.875 0c5.188-5.188 5.188-13.625 0-18.875-5.188-5.188-13.625-5.188-18.875 0zM24.688 24.688c-4.813 4.75-12.563 4.75-17.375 0-4.75-4.813-4.75-12.563 0-17.375 4.813-4.75 12.563-4.75 17.375 0 4.75 4.813 4.75 12.563 0 17.375zM10.75 10l-0.813 0.75 5.313 5.25-5.25 5.25 0.75 0.75 5.25-5.25 5.25 5.25 0.75-0.75-5.25-5.25 5.313-5.25-0.813-0.75-5.25 5.25z"></path> </svg> </i><span> Sorry! Something went wrong!</span></div>
									</div>
									<h3 class="title invert">Don't Forget To Mail Me</h3>
									<!--CONTACT FORM-->
									<form action="sendmail.php" class="form-horizontal" id="contact-form">
										<div class="form-group">
											<input name="name" class="form-control required" placeholder="Name" data-placement="top" type="text">
										</div>                                    
										<div class="form-group">
											<input name="email" class="form-control email" placeholder="Email" type="text">
										</div>                   
										<div class="form-group">
											<textarea name="message" class="form-control" placeholder="Message" rows="3"></textarea>
										</div>
										<div class="form-group">
											<button type="submit" class="btn btn-success">SEND</button>
										</div>

									</form><!--/#contact-form-->
								</div>                      
								
							</div>                          
							
						</div>
					</div>
				</li><!--/#contact-->
			</ul> 
            
		</div><!--/.page-segment -->
		<!--  <h6 class="copyright-text">Copyright © 2015 John Doe</h6> --> <!--if anyone wants copyright Texts--> 
	</div>
</div><!--/.container -->
<!--PORTFOLIO IMAGE MODAL LIST-->
<!--javascript files
=============================================================-->
<script type="text/javascript" src="js2/jQueryTween-aio-min.js"></script> <!-- JQUERY Tween Plugin -->
<script type="text/javascript" src="js2/jquery.tabslet.min.js"></script> <!-- JQUERY Tab plugin-->     
<script type="text/javascript" src="js2/progressbar.min.js"></script> <!-- JQUERY Progressbar Plugin-->
<script type="text/javascript" src="js2/jquery.simple-text-rotator.min.js"></script> <!-- JQUERY Text Rotator-->
<script type="text/javascript" src="js2/bootstrap.min.js"></script> <!-- Bootstrap file-->
<script src="http://ditu.google.cn/maps/api/js?key=AIzaSyBPNkCVoBW_Jzl6x-hgGU6e7QW1QMwKles"></script>
<script type="text/javascript" src='js2/isotope.pkgd.min.js'></script>
<script type="text/javascript" src="js2/custom.js"></script>
</body>
</html>
