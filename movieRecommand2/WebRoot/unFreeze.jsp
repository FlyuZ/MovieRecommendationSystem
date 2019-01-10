<!--<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'unFreeze.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	
	<style type="text/css">
	
.data-table {
    margin: 10px 0;
}
.data-table table {
    width: 200%;
    border-collapse: collapse; //设置表格边框合并为单一边框
}
.data-table caption {
	
    height: 60px;
    line-height: 60px;
    font-weight: 700;
    font-size:150%;
    text-align:center;
}
.data-table thead th
{
    text-align: left;
    color:#fff;
    background-color: black;
}
.data-table tbody td {
    padding:8px;
    height: 19px;
    line-height: 19px;
    font-weight: 400;
}

.data-table tbody tr {
    background-color: #F0F0F0;
    color: black;
}
.data-table tbody tr:nth-child(even) {
    background-color: white;
}
	</style>
	
    <script type="text/javascript">
    	function ApplyStyle(s){
        	document.getElementById("mytab").className=s.innerText;
   		 }
    </script>
    
  </head>
  
  <body>
    <table class="data-table" width="90%" id="mytab" border="1"  align="center">
      <caption>
        已冻结用户表
      </caption>
      <tr background="blue">
         <th>用户ID</th>
        <th>用户名</th>
        <th>操    作</th>
      </tr>
	  <s:iterator var="userFreeze" value="userList">
      	<tr class="a1">
      	 <td><s:property value="#userFreeze.userId" /></td>
      	 <td><s:property value="#userFreeze.userName" /></td>
      	 <td><a href="movieDoUnfreeze?userID=${userFreeze.userId}">解冻 </a></td>
        </tr>
      </s:iterator>
<!--       <tr> -->
<!--       	<td>1</td> -->
<!--       	<td>lwy</td> -->
<!--       	<td><a href="">解冻 </a></td> -->
<!--       </tr>	 -->
<!--       <tr> -->
<!--       	<td>2</td> -->
<!--       	<td>ljy</td> -->
<!--       	<td><a href="">解冻 </a></td> -->
<!--       </tr> -->
<!--       <tr> -->
<!--       	<td>3</td> -->
<!--       	<td>xdx</td> -->
<!--       	<td><a href="">解冻 </a></td> -->
<!--       </tr> -->
<!--       <tr> -->
<!--       	<td>2</td> -->
<!--       	<td>ljy</td> -->
<!--       	<td><a href="">解冻 </a></td> -->
<!--       </tr> -->
<!--       <tr> -->
<!--       	<td>2</td> -->
<!--       	<td>ljy</td> -->
<!--       	<td><a href="">解冻 </a></td> -->
<!--       </tr> -->
<!--       <tr> -->
<!--       	<td>2</td> -->
<!--       	<td>ljy</td> -->
<!--       	<td><a href="">解冻 </a></td> -->
<!--       </tr> -->
    </table>
    
  </body>
</html>

