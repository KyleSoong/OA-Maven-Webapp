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
<div class="main">
	<div class="nav" id="nav">
    	<div class="t"></div>
    	<dl class="open">
        	<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';"> 信息管理</dt>
            <dd><a href="<%=path %>/user/userinfo" target="mainFrame">个人信息</a></dd>
        </dl>        
    	<dl class="open">
        	<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">邮件管理</dt>
            <dd><a href="<%=path %>/email/send" target="mainFrame">写邮件</a></dd>
            <dd><a href="<%=path %>/email/sent?p=1" target="mainFrame">已发邮件</a></dd>
            <dd><a href="<%=path %>/email/inbox?p=1" target="mainFrame">收邮件</a></dd>
            <dd><a href="<%=path %>/email/trash?p=1" target="mainFrame">垃圾邮件</a></dd>
        </dl>
        <dl>
        	<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">考勤管理</dt>
            <dd><a href="<%=path %>/leave/ask" target="mainFrame">休假</a></dd>
            <dd><a href="<%=path %>/leave/check" target="mainFrame">审核</a></dd>
        </dl>
        <dl>
        	<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">权限管理</dt>
            <dd><a href="<%=path %>/user/person" target="mainFrame">个人账户</a></dd>
            <dd><a href="<%=path %>/pages/adduser.jsp" target="mainFrame">管理账户</a></dd>
        </dl>
    </div>
  </div>
</body>
</html>