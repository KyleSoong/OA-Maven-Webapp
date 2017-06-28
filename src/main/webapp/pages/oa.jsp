<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>北大青鸟办公自动化管理系统</title>
<link href="<%=path %>/resources/css/style.css" rel="stylesheet" type="text/css" />
</head>

<frameset rows="120,*" cols="*" frameborder="no" border="0" framespacing="0" >

	<frame src="top.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" />

	<frameset rows="*"cols="30%,70%" frameborder="no" border="0" framespacing="0">
		<frame src="left.jsp"  name="leftFrame" noresize="noresize" scrolling="no" id="leftFrame" />
		<frame src="<%=path %>/user/userinfo" name="mainFrame" noresize="noresize" scrolling="no" id="mainFrame"/>
	</frameset>
	
</frameset>

<body>	

</body>
</html>