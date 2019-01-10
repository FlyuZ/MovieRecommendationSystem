<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- pignose css -->
<link href="css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />


<!-- //pignose css -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
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
<style type="text/css">
        #main{margin-top=0px;width:100%;height:2000px;background:white;}
		#left{margin-left:100px;margin-right:30px;width:50%;height:100%;float:left;}
		#right{margin-left:30px;margin-right:100px;margin-top:50px;width:25%;height:100%;float:left;}
		#foot{margin-top:20px;width:100%;height:300px;}
		#list{list-style:none;margin-left:80px;margin-top:10px;font-size:20pt;}

		#footer{margin-top:20px;text-align:center;weight:100%;height:20px;}
		#footer ul{list-style-type:none;overflow: hidden;}
		#footer ul li{display:inline;list-style:none;font-size:10pt;margin-left:30px;font-color:orange;}

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

<div id="main" class="">

    <div id="left" class="product-easy">
	    
		
		<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
		<script type="text/javascript">
							$(document).ready(function () {
								$('#horizontalTab').easyResponsiveTabs({
									type: 'default', //Types: default, vertical, accordion           
									width: 'auto', //auto or any width like 600px
									fit: true   // 100% fit in a container
								});
							});
							
		</script>

            <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;"> 
					<div>
<%-- 					<c:if test="${select_judge!=1 }"> --%>
					<ul class="resp-tabs-list">
				    	<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><a href="movieAll?userID=${user.userId }"><span>全部</span></a></li>
						<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><a href="movieType?movieType=love&userID=${user.userId }"><span>爱情</span></a></li> 
						<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><a href="movieType?movieType=cartoon&userID=${user.userId }"><span>动漫</span></a></li> 
						<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><a href="movieType?movieType=filter&userID=${user.userId }"><span>惊悚</span></a></li>
                    	<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><a href="movieType?movieType=action&userID=${user.userId }"><span>动作</span></a></li>
                    	<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><a href="movieType?movieType=comedy&userID=${user.userId }"><span>喜剧</span></a></li>
                    	<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><a href="movieType?movieType=fiction&userID=${user.userId }"><span>科幻</span></a></li>
                    			
					</ul>
					</div>

				
				<div class="resp-tabs-container">
					<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
						<c:forEach  items="${movieList }" var="movie2" begin="${page_number }" step="1" end="${page_end }">
					    <div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
								    
									<img src="${movie2.imgSrc }" alt="" class="pro-image-front">
									<img src="${movie2.imgSrc }" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="movieDetail?movieID=${movie2.movieId }&userID=${user.userId }" class="link-product-add-cart">${movie2.movieName }</a>
											</div>
										</div>
										<span class="product-new-top">热映</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="single.html">${movie2.movieName }</a></h4>
									<div class="info-product-price">
										<span class="item_price"><font size="3px">评分：${movie2.avgScore }</font></span>
										
									</div>
									<a href="#" class="item_add single-item hvr-outline-out button2">在线购票</a>									
								</div>
							</div>
						</div>
						</c:forEach>
						

						<div class="clearfix"></div>	
					</div>	
				</div>

				
			
				<div align="center" style="margin-top:100px;">
				<tr>
                    <td colspan="3">

                        <c:if test="${type==0 }">
                        	<a href="movieAll?page_number=${page_number }&type=${type }&mark=1&user.userId=${user.userId }&user.pwd=${user.pwd }&user.status=${user.status }" >上一页</a>&nbsp;&nbsp;&nbsp;
                        	<a href="movieAll?page_number=${page_number }&type=${type }&mark=2&user.userId=${user.userId }&user.pwd=${user.pwd }&user.status=${user.status }" >下一页</a>&nbsp;&nbsp;&nbsp;
                    	</c:if>
						<c:if test="${type==1 }">
                        	<a href="movieType?page_number=${page_number }&type=${type }&mark=1&movieType=${movieType }&user.userId=${user.userId }&user.pwd=${user.pwd }&user.status=${user.status }" >上一页</a>&nbsp;&nbsp;&nbsp;
                        	<a href="movieType?page_number=${page_number }&type=${type }&mark=2&movieType=${movieType }&user.userId=${user.userId }&user.pwd=${user.pwd }&user.status=${user.status }" >下一页</a>&nbsp;&nbsp;&nbsp;
                    	</c:if>
                    	<c:if test="${type==2 }">
                        	<a href="movieSelect?key=${key }&page_number=${page_number }&type=${type }&mark=1&movieType=${movieType }&user.userId=${user.userId }&user.pwd=${user.pwd }&user.status=${user.status }" >上一页</a>&nbsp;&nbsp;&nbsp;
                        	<a href="movieSelect?key=${key }&page_number=${page_number }&type=${type }&mark=2&movieType=${movieType }&user.userId=${user.userId }&user.pwd=${user.pwd }&user.status=${user.status }" >下一页</a>&nbsp;&nbsp;&nbsp;
                    	</c:if>
                    </td>
                </tr>
				</div>
				
			</div>

		</div>

	<div id="right" class="">
	    <div align="center"><a href="./year/year.jsp?userID=${user.userId }"><img src="images/right1.png" weight="400px" height="300px" vspace="50px"></a></div>
	    <div align="center"><font size="30px" >年度榜单</font></div>
		<div>
		    <ul style="list-style-type:none">
			    <li id="list"><a href="#"><font color="orange">1.《我不是药神》 9.0分</font></a></li>
				<li id="list"><a href="#"><font color="orange">2.《大佛普拉斯》 8.7分</font></a><li>
				<li id="list"><a href="#"><font color="orange">3.《红海行动》 8.3分</font></a><li>
				<li id="list"><a href="#"><font color="orange">4.《狗十三》 8.3分</font></a><li>
				<li id="list"><a href="#"><font color="orange">5.《无双》 8.1分</font></a><li>
				<li id="list"><a href="#"><font color="orange">6.《无名之辈》 8.2分</font></a><li>
				<li id="list"><a href="#"><font color="orange">7.《暴裂无声》 8.2分</font></a><li>
				<li id="list"><a href="#"><font color="orange">8.《血观音》 8.3分</font></a><li>
				<li id="list"><a href="#"><font color="orange">9.《大象席地而坐》 8.1分</font></a><li>
				<li id="list"><a href="#"><font color="orange">10.《无问西东》 7.6分</font></a><li>

			</ul>
		</div>

	</div>
</div>


<div id="foot">  
    <div id="footer">
	    <ul>
		     
	    </ul>
    </div>

	<div id="footer">
	    <ul >
		    <li>京网文[2018]6767-101号</li>
			<li>中国互联网诚信联盟</li>
			<li>出版物经营许可证</li>
			<li>信息网络传播视听节目许可证088433号</li>
			<li>广播电视节目制作经营许可(京)字第1763号</li>
			<li>京ICP证12138号</li>
			<li>经营性网站备案信息</li>
		
		</ul>
	</div>

    <div id="footer">
	    <ul >
		    <li>京公网备126487212号</li>
			<li>增值电信业务经营许可证B2-212212138</li>
			<li>互联网药品信息服务证书(京)2014-3-04</li>
			<li>食品经营许可证JY1176668382008</li>
		</ul>
	</div>

	

	<div id="footer">
	    <ul >
		    <li>中国互联网举报中心</li>
			<li>网络举报app下载</li>
			<li>反盗版和反盗链权利声明</li>
			<li>违法和不良信息举报电话400-923-7171</li>
			<li>举报邮箱jubao@qiyi.com</li>
				
		</ul>
	</div>

	<div id="footer">
	    <ul>
		    
			<li>版权所有，盗版必究</li>
		
		</ul>
	</div>

	<div id="footer">
	    <ul>
		    
			<li><font color="orange">Copyright?2018 软件工程小组 All Rights Reserved</font></li>
		
		</ul>
	</div>
</div>


</body>

</html>