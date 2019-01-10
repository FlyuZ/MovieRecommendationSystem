<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en" >

<head>

<title>2018年度电影</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/style.css">

</head>

<body class="loading">

 <form action="../movieAll">
   <input type="hidden"  name="userID" value="<%=request.getParameter("userID")%>" />
   <input type="submit" style="opacity:0.5;border-radius:10px"  value="返回首页"/>
   
 </form>
<main>
	
	<div id="slider">
		
		<div class="slider-inner">
			<div id="slider-content">
				<div class="meta">电影</div>
				<h2 id="slide-title">我不是药神 </h2>
				<span data-slide-title="0">我不是药神</span>
				<span data-slide-title="1">大佛普拉斯</span>
				<span data-slide-title="2">红海行动</span>
				<span data-slide-title="3"><font color="black">狗十三</font> </span>
				<span data-slide-title="4">无双</span>
				<span data-slide-title="5">无名之辈</span>
				<span data-slide-title="6">暴裂无声</span>
				<span data-slide-title="7">血观音</span>
				<span data-slide-title="8">大象席地而坐</span>
				<span data-slide-title="9">无问西东</span>
				<div class="meta">热评</div>
				<div id="slide-status">愿世界变好，不是因为救世主，而是追光者</div>
				<span data-slide-status="0">愿世界变好，不是因为救世主，而是追光者</span>
				<span data-slide-status="1">人類可以搭乘太空船到達月球，但卻沒辦法看穿每個人心裡的宇宙。</span>
				<span data-slide-status="2">勇者无惧，强者无敌！</span>
				<span data-slide-status="3"><font color="black">失物招领，你的青春</font> </span>
				<span data-slide-status="4">巨星云集，意味深长</span>
				<span data-slide-status="5">些无名之辈自以为聪明，却又实际愚钝地向前行走着</span>
				<span data-slide-status="6">故事没有幽默，是一个纯粹悲伤的放羊娃故事</span>
				<span data-slide-status="7">在这社会里没有人是局外人</span>
				<span data-slide-status="8">不以为然的伤害，只会越来越深</span>
				<span data-slide-status="9">三代人的传承，也不过就是要活得真实</span>
				
			</div>
		</div>

		
		<img src="img/timg1.jpg" />
		<img src="img/timg2.jpg" />
		<img src="img/timg3.jpg" />
		<img src="img/timg4.jpg" />
		<img src="img/timg5.jpg" />
		<img src="img/timg6.jpg" />
		<img src="img/timg7.jpg" />
		<img src="img/timg8.jpg" />
		<img src="img/timg9.jpg" />
		<img src="img/timg10.jpg" />

		<div id="pagination">
			<button class="active" data-slide="0"></button>
			<button data-slide="1"></button>
			<button data-slide="2"></button>
			<button data-slide="3"></button>
			<button data-slide="4"></button>
			<button data-slide="5"></button>
			<button data-slide="6"></button>
			<button data-slide="7"></button>
			<button data-slide="8"></button>
			<button data-slide="9"></button>
			
		</div>

	</div>
</main>


<script type="text/javascript" src='js/three.min.js'></script>
<script type="text/javascript" src='js/imagesloaded.pkgd.js'></script>
<script type="text/javascript" src='js/TweenMax.min.js'></script>
<script type="text/javascript" src="js/index.js"></script>


</body>

</html>
