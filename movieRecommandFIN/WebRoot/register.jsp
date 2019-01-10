<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script src="js/jquery.easing.min.js"></script>
	<style type="text/css">
		.span1{
			font-size:5;
			color:red;
        }
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
	<script type="text/javascript">
		function checkRegister(){
			userNameSpan.innerText = "";
			pswSpan.innerText = "";
			surePswSpan.innerText = "";
		    var len = document.getElementById("userName").value;
			if(len < 2 || len > 10){
			    userNameSpan.innerText = "用户名必须大于两位小于十位";
			}
		    
		    //密码检查
		    var passwd = document.getElementById("passwd");
			var repasswd = document.getElementById("check_passwd");
			len = passwd.value.length;
		    if(len<3){
		    	pswSpan.innerText = "密码位数最少3位";
		    	return  false;
		    }else{
		    	if(passwd.value != repasswd.value){
		    		surePswSpan.innerText = "";
		    		return  false;
		    	}
		    }
			register_form.submit();
			
	}
	</script>
</head>

<body>
<script type="text/javascript">
   $(function(){
        $("#warn").hide();
	    $("#check_passwd").focus(function(){
	        $("#warn").show();
	        var passwd1=$("#passwd").val();
		    var passwd2=$("#check_passwd").val();
		    if(passwd1==passwd2){
		        $("#warn").hide();
		    }
        });
		$("#check_passwd").blur(function(){
	        var passwd1=$("#passwd").val();
		    var passwd2=$("#check_passwd").val();
		    if(passwd1==passwd2){
		        $("#warn").hide();
		    }else{
			    $("#warn").show();
			}
        });
	 });

    </script>
<div id="main">

	<div id="div_left"></div>
	<div id="div_middle">
    <form name="register_form" action="movieDoRegister" method="post">
	<ul style="list-style-type:none">
	    <div id="div_label1">
            <li>
                 <h1 align="center">注册</h2>
<!--             <span class="required_notification"></span> -->
            </li>
		</div>

		<div id="div_label">
            <li>
                <label><font size="5">UserID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></label>
                <input align="center" type="text" name="userID" style="width:300px;height:30px;border-radius:10px" />
            </li>
		</div>

		<div id="div_label">
            <li>
                <label><font size="5">用户名：&nbsp;&nbsp;&nbsp;</font></label>
                <input align="center" type="text" id="userName" name="userName" style="width:300px;height:30px;border-radius:10px" /><br/>
				<span id = "userNameSpan" class = "span1"></span>
            </li>
		</div>
		<div id="div_label">
            <li>
                <label><font size="5">密码：</font></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input align="center" type="password" id="passwd" name="passwd"  style="width:300px;height:30px;border-radius:10px"/><br/>
				<span id = "pswSpan" class = "span1"></span>
            </li>
		</div>
		<div id="div_label">
            <li>
                <label ><font size="5">确认密码：</font></label>
                <input align="center" type="password" id="check_passwd" name="check_passwd"  style="width:300px;height:30px;border-radius:10px"/></br>
				<span id = "surePswSpan" class = "span1"></span>
				<label><font size="5" color="red" id="warn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;两次密码输入不一致</font></label>
            </li>
		</div>
		<div id="div_label">
            <li align="center">
                <input align="center" value="注册" type="button" style="width:200px;height:40px;border-radius:10px" onclick="checkRegister()"/>
            </li>
		</div>
		
    </ul>	
    </form>
	</div>
	<div id="div_right"></div>
</div>

</body>
</html>