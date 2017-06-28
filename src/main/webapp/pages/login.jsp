<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>北大青鸟办公自动化管理系统</title>
<style type="text/css">
*{ margin:0; padding:0;}
body{ font:12px 宋体; background:#4BB8EF url("<%=path %>/resources/images/bg.gif") repeat-x;}
img{ border:0;}

.login-top{ width:100%; height:186px; margin:147px auto 0; background:url("<%=path %>/resources/images/login_01.gif") no-repeat center 0;}
.login-area{ width:100%; height:140px; margin:0 auto; background:url("<%=path %>/resources/images/login_02.gif") no-repeat center 0;}
	.login-area form{ width:290px; margin:0 auto;}
	.login-area label{ clear:left; float:left; margin-top:13px; width:60px; font:600 14px 宋体;}
	.login-area input{ width:122px; height:16px; margin-top:11px; border:1px #767F94 solid; font:12px/16px 宋体;}
		input.login-sub{ width:204px; height:34px; border:0; background:url("<%=path %>/resources/images/login_sub.gif") no-repeat 90px 1px; *margin-top:5px;}
.login-copyright{ width:100%; height:30px; margin:18px auto 0; background:url("<%=path %>/resources/images/copyright.gif") no-repeat center 0;}

</style>
<script type="text/javascript" src="<%=path %>/resources/js/jquery-1.11.3.js"></script>
<sPath value="<%=path%>" id="sPath" name="sPath"/> 

</head>

<body> 
<script>
if (top.location !== self.location) {
    top.location=self.location;
}
</script>
<div class="login-top" ></div>
<div class="login-area">
	<form  id="loginForm" onsubmit="return false;">
    	<label>工&nbsp;&nbsp;号：</label><input type="text" id="username" name="username" />
        <label>密&nbsp;&nbsp;码：</label><input type="password" id="pwd" name="pwd"/>
        <input type="button" id="loginBtn"class="login-sub"  onclick="ajaxReq()" value="" />
    	<p id="loginAfter"></p>
    </form>
</div>
<div class="login-copyright"></div>
<script type="text/javascript">
   function ajaxReq(){
   var sPath = $("#sPath").attr("value");
   var password =$("#pwd").val();
   var userName=$("#username").val();
  jQuery.ajax({
		type : 'GET',
		contentType : 'application/json',
		url :sPath+'/login',
		dataType : 'json',
		data:{
		  "userName":userName,
		   "pwd":password
		},
		success : function(data) {
			 var htmlSrc=[];
			 if (data == '1') {
			 	htmlSrc.push('<span>登录成功!</span>');
				$("#loginAfter").html(htmlSrc.join(''));
				window.location.href=sPath+"/pages/index.jsp?v="+Math.random();
			}else{
				htmlSrc.push('<span>用户名或密码错误，请重试!</span>');
				$("#loginAfter").html(htmlSrc.join(''));
			}
		}
	});
  }	 
</script>

</body>

</html>