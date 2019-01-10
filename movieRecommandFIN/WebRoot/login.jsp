<%--
  Created by IntelliJ IDEA.
  User: Flyuz
  Date: 2018/12/14
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script src="js/jquery.easing.min.js"></script>
	<style type="text/css">
	    body{background-image:url(images/login.jpg);
		     background-repeat:no-repeat;
			 background-size: cover;
			 }
	    #main{
		    margin-top:250px;
			weight:100%;
			height:600px;	
			
		}
		#div_left{
			width:35%;
			height:600px;

			float:left;
		}

		#div_middle{
			width:30%;
			height:600px;
			background:white;
			float:left;
			background-color:rgba(255,255,255,0.15);
			border-radius:30px
} 
		}
		#div_right{
			width:35%;
			height:600px;		

			float:left;
		}
		#div_label1{margin-top:100px;opacity: 1;}
		#div_label2{margin-top:250px;}
		#div_label{margin-top:50px;opacity: 1;}
		input{background-color:rgba(255,255,255,0.20);font-size:20px;}
		#div_start{
		    
	        width:100%;
			height:400px;
		}
	</style>
</head>

<body>
    
    <script type="text/javascript">
	    $(function(){
		    $("#div_left").hide();
			$("#div_middle").hide();
			$("#div_right").hide();
			var $button=$("#button");
		    $button.click(function(){
		        $("#div_start").css("display","none");
				$("#div_left").show();
			    $("#div_middle").show();
			    $("#div_right").show();
		    });
		});

	</script>
<div id="main">
    <div id="div_start">
	    <ul style="list-style-type:none">
		    <li>
                 <h1 align="center">欢 迎 登 录 电 影 推 荐 系 统</h1>
            </li>
			
			<div id="div_label2">
            <li align="center">
                <input type="submit" id="button" value="登录login" style="width:200px;height:40px;border-radius:10px" />
            </li>
		</div>
		</ul>
	</div>

	<div id="div_left"></div>
	<div id="div_middle">
    <form action="movieIslogin" method="post">
	<ul style="list-style-type:none">
	    <div id="div_label1">
            <li>
                 <h1 align="center">登录</h1>
            </li>
		</div>
		<div id="div_label">
            <li align="center">
                <label><font size="5">用户名：</font></label>
                <input type="text" name="userID" style="width:300px;height:30px;border-radius:10px"/>
            </li>
		</div>
		<div id="div_label">
            <li align="center">
                <label ><font size="5">密码：</font></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="password" name="passwd"  style="width:300px;height:30px;border-radius:10px"/>
            </li>
		</div>
		<div id="div_label">
            <li align="center">
                <input type="submit" value="登录" style="width:200px;height:40px;border-radius:10px"/>
            </li>
		</div>
    </ul>	
    </form>
    <form action="movieRegister">
      <ul style="list-style-type:none">
    	<div id="div_label">
            <li align="center">
                <input type="submit" value="注册" style="width:200px;height:40px;border-radius:10px"/>
            </li>
		</div>
	  </ul>
    </form>
	</div>
	<div id="div_right"></div>
</div>
</body>
</html>