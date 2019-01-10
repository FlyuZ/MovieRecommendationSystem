<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminHome.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 
	</script>
	
	
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- pignose css -->
<link href="css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />

<!-- //pignose css -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/mystyle.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- cart -->
	<script src="js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
	<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
<script src="js/jquery.easing.min.js"></script>
	<style type = "text/css">
      
	  #div2{margin-left:300px;height:100%;width:20%;float:left;background:orange;opacity: 0.8;}
	  #div21{text-align:center;height:35%;line-height:55px;}
      #div22{text-align:center;height:65%;weight:20%;}
      #div211{height:60%;}
      #div212{height:40%;}
	  #div3{height:84.5%;width:50%;float:left;}
	  #div31{height:10%;width:80%;margin-left:10%;background:url("");margin-bottom:5%;}
	  #div32{height:10%;width:80%;margin-left:10%;background:url();}
	  #font1{font-weight:bold;font-size:30px;font-family:黑体;}
    </style>
  </head>
  
  <body>
 
     
 

 	<div class="ban-top">
	<div class="container">
		<div class="top_nav_left">
			<nav class="navbar navbar-default">
			  <div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
				  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				  </button>
				</div>
				<!-- 导航-->
				<div  class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
				  
					
					<div width="50%" style="float:left">
					    <ul class="nav navbar-nav menu__list">
					        <li class="active menu__item menu__item--current"><a class="menu__link" href="movieAll?userID=${user.userId }">首页<span class="sr-only">(current)</span></a></li>
					        <li class="dropdown menu__item"></li>
					
					        <li class=" menu__item"><a class="menu__link" href="#">同城</a></li>
					        <li class=" menu__item"><a class="menu__link" href="#">时间</a></li>
					        <li class=" menu__item"><a class="menu__link" href="#">更多</a></li>
					        <li class=" menu__item"><a class="menu__link" href="#">帮助</a></li>
					        <li class=" menu__item"><a class="menu__link" href="contact.html">联系我们</a></li>
					    </ul>
					</div>
					<div style="float:left; height:1px;width:390px">
				    
				    </div>
                    
					<div width="10%"style="float:left">
						<ul class="nav navbar-nav menu__list">
						<c:if test="${login_mark==1 }">
							<c:if test="${user.status==1 }">
								<li class=" menu__item"><a class="menu__link" href="movieAdmin?userID=${user.userId }">管理</a></li>
							</c:if>
						</c:if>
						
						<c:if test="${login_mark!=1 }">
							<li class=" menu__item"><a class="menu__link" href="movieLogin">登录</a></li>
					        <li class=" menu__item"><a class="menu__link" href="register.html">注册</a></li>
						</c:if>
				        </ul>	
				    </div>
				</div>
				
				
				
			  </div>
			</nav>	
		</div>
		
	</div>
</div>



<div class="header-bot">
	<div class="container">
		<div class="col-md-2 header-left">
			<h1><a href="home.html"><img src="images/预览图.jpg" width="80px" height="120px"></a></h1>
		</div>
		<div class="col-md-7 header-middle">
		   
			<form action="movieSelect">
			    <input type="hidden" name="userID" value="${user.userId }"/>
				<div class="search" >
					<c:if test="${key==null }">
						<input type="search" name="key" value="请输入关键词" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'search';}" required>
					</c:if>
					<c:if test="${key!=null }">
						<input type="search" name="key" value="${key }" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'search';}" required>
					</c:if>
				</div>
				<div class="sear-sub">
					<input type="submit" value=" ">
				</div>	
			</form>
		</div>
		<div class="col-md-3 header-right footer-bottom">
			<ul>
				<li><a href="movieUser?userID=${user.userId }" class="use1" ><span>个人中心</span></a></li>
				<li><a class="fb" href="http://www.baidu.com"></a></li>
				<li><a class="twi" href="#"></a></li>
				<li><a class="insta" href="#"></a></li>
				<li><a class="you" href="#"></a></li>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
 	
	<div id="div2">
		<div id="div21">
			<div id="namecard" class="namecard">
				<div class="shadow-img"></div>
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
		</div>
		<div id="div22">
			<br/><br/><br/><br/><br/>
<!-- 			<div id="div31"> -->
<!-- 				<a style = "text-decoration:none;color:black;" href = "********添加电影action">添加电影</a> -->
<!-- 				<br/><br/><br/> -->
<!-- 			</div> -->
<!-- 			<div id="div32"> -->
<!-- 				<a style = "text-decoration:none;color:black;" href = "********解冻action">解冻用户</a> -->
<!-- 			</div> -->
		</div>
	</div>
	
	<div id="div3">
	<!-- 可以再actioin里定义一个属性:private String iframeSrc。在“添加电影的action”里令iframeSrc="http://localhost:8080/FilmRecommend/admin/addFilm.jsp"；
	在解冻action里令iframeSrc="http://localhost:8080/FilmRecommend/admin/unFreeze.jsp" -->
		<iframe src="movieUnfreeze" width="100%" height="100%"></iframe>
	</div>
	


  </body>
</html>
