<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> 电影详情 </title>
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- pignose css -->
<link href="css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />


<!-- //pignose css -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
  <style>
  .text_top{
    margin-top:12px;
  }
  .comment{
  	width:60%;
  	background-color:orange;
  }
  .movie{
			width:60%;
			height:350px;
	   }
  .movie_message{
   text-align:left;
  	width:50%;
  	font-size:20px;
  	margin-top:80px;
  	color:#FFFFFF;
  }
  .main{
/*   	background: url(images/main-bg.jpg) center bottom; */
	background: url(images/bg/6.jpg) center bottom;
	background-size: cover;
/* 	background-color: #EAEAEA; */
	width:60%;
	margin-right: auto; 
	margin-left: auto;
  }
  .ulone{
  list-style-type:none;
  margin:0;
  padding:0;
  }
  .lione{display:inline;}
  .img1{
  position:relative;
  left:500px;
  }
  * {
            margin: 0;
            padding: 0;
        }

        #box {
            list-style: none;
            height: 28px;
            width: 135px;
            overflow: hidden;
        }
		.child{
			position:relative;
		}
        .image {
            height: 28px;
            width: 27px;
            float: left;
            background: url(https://img-blog.csdn.net/20170111195511514?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbXlkcmVhbWhvcGU=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center) repeat-x;
        }

        .imageOne {
            height: 28px;
            width: 27px;
           float: left;
           
            background: url(https://img-blog.csdn.net/20170111195511514?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbXlkcmVhbWhvcGU=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center) repeat-x 0 -28px;

        }
  </style>
   <script>
   <%!
   		int submit_score = 0;
   %>
        window.onload = function () {
            var box = document.getElementById("box");
            var images = box.getElementsByTagName("li");
            var info = document.getElementById('info');
            var starshow = 0;
            
            for (var i = 0; i < images.length; i++) {
                images[i].onmouseover = (function (num) {
                    return function () {
                        
                        for (var j = 0; j < images.length; j++) {
                            if (j <= num) {
                                
                                images[j].className = "imageOne";
                            } else {
                                images[j].className = "image";
                            }
                        }
                    };
                }(i));
                images[i].onmouseup = (function (i) {
                    return function () {
                        starshow = 1+i;
                        submit_score = starshow;
//                         info.innerHTML = '你打了'+starshow+'分!';
						document.getElementById("grade_id").value = starshow;
                    };
                }(i));
            }
        };

    </script>
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

<!--��Ӱ����-->
<div class="main" align="center">
	<div class="movie">
		    <div style="float:left">
				<div class="men-pro-item simpleCart_shelfItem">
					<div class="men-thumb-item">		    
						<img src="${movie.imgSrc }" alt="" class="pro-image-front">
						<img src="${movie.imgSrc }" alt="" class="pro-image-back">
						<div class="men-cart-pro">
							<div class="inner-men-cart-pro">
								<a href="#" class="link-product-add-cart">${movie.movieName }</a>
							</div>
						</div>
						<span class="product-new-top">热映</span>
										
					</div>
					<div class="item-info-product ">
						<h4><a href="single.html">${movie.movieName }</a></h4>
						<div class="info-product-price">
							<span class="item_price"><font size="3px" style="color:white">评分：${movie.avgScore }</font></span>										
						</div>
						<a href="#" class="item_add single-item hvr-outline-out button2">在线购票</a>									
					</div>
				</div>
				
			</div>
			<div class="movie_message" style="float:left">
				<h3 class="text_top">导演：${movie.director }</h3>
				<h3 class="text_top">主演：
				<c:forEach var="var_actor" items="${movie.actorList }">
					${var_actor }/
				</c:forEach></h3>
				<h3 class="text_top">类型：
				<c:forEach var="var_label" items="${movie.movieLabelList }">
					${var_label }/
				</c:forEach></h3>
			</div>
<!--此处获取电影详情-->
	</div>

	<div >   
    	<p style="font-size:20px;color:#FFFFFF">评价:</p>
    	<ul id = "box" style="height: 72px; ">
			<li class="image"></li>
			<li class="image"></li>
			<li class="image"></li>
			<li class="image"></li>
			<li class="image"></li>
			<li class="image"></li>
			<li class="image"></li>
			<li class="image"></li>
			<li class="image"></li>
			<li class="image"></li>
		</ul>
		<div id="info"></div> 
	</div>
	<div>
		<p style="font-size:20px;color:#FFFFFF" >元芳你怎么看？</p>
<!-- 		<input type="text" id="xdx" value=""/> -->
		<div>
			<form method="post" action="movieAddComment">
				<textarea style="border-radius:10px" rows="7" name="comment" cols="100">
				</textarea>
<%-- 				<%request.setAttribute("grade", submit_score); %> --%>
				<input type="hidden" name="grade" id="grade_id" value=""/>
				<input type="hidden" name="userID" value="${user.userId }"/> 
				<input type="hidden" name="movieID" value="${movie.movieId }"/>
				<input type="hidden" name="movieName" value="${movie.movieName }"/>
				<input type="hidden" name="userName" value="${user.userName }"/>
				<input type="submit"  style="border-radius:10px" value="提交"/>
			</form>
		</div>
	</div>
	<div>
		<p style="font-size:20px;color:#FFFFFF">精彩评论</p>
	
		<div>
			<ul >
	    		<c:forEach  items="${commentList }" var="var_comment">
		   		<li class="ulone">
		   		 <div class="comment" style="border-radius:10px">
		   		   用户:${var_comment.userName }<br/>
		   		    ${var_comment.comment }<br/>
		   		      评分:${var_comment.score }&nbsp;<br/>
		   		    <c:if test="${user.status==1 }">
		   		    	<a href="movieDeleteComment?userID=${user.userId }&movieID=${movie.movieId }">删除</a>
			        	<a href="movieDongjie?userID=${user.userId }&movieID=${movie.movieId }">冻结</a>
			        </c:if>
			       </div><br/>
		   	    </li>
		   	    
				</c:forEach>
			</ul><!--/.button-group filters-button-group-->
		</div>
	</div>
</div>
 </body>
</html>
