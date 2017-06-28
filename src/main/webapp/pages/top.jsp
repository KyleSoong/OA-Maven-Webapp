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
	<link href="<%=path %>/resources/css/style.css" rel="stylesheet" type="text/css" />

</head>

<body>
	<div class="top"><div class="global-width"><img src="<%=path %>/resources/images/logo.gif" class="logo"></img></div></div>
	<div class="status">
	<div class="global-width">
	<span class="usertype">【登录角色：${loginUser.role }】</span>
	${loginUser.userName }你好！欢迎访问青鸟办公管理系统！
	<a href="<%=path %>/logout" target="_top">[注销]</a>
	</div>
	</div>
</body>
</html>