<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<form class="action">
			<div class="t">邮件</div>
			<div class="pages">
				<table width="90%" border="1" cellspacing="0" cellpadding="0"
					class="addform-base">
					<tr>
						<td>发件人：</td>
						<td>${email.fromUser}
						</td>
					</tr> 
					<tr>
						<td>收件人：</td>
						<td>${email.toUser}
						</td>
					</tr> 
					<tr>
						<td>邮件标题：</td>
						<td>${email.subject}
						</td>
					</tr>
					<tr>
						<td>邮件内容：</td>
						 <td>
						 <textarea name="textarea" id="textarea" cols="70" rows="15" readonly="readonly">
						 ${email.content}</textarea>
						 </td>
					</tr>
					<tr>
						<td>附件：</td>
						<td>
							<c:if test="${email.attach!=null}"><a href="<%=path%>/email/download?attachFile=${email.attach}">${email.attach}</a></c:if>
							<c:if test="${email.attach=='' }">无</c:if>
						</td>
					</tr>
					<!-- <tr>					
						<td colspan="2" class="submit" align="center">
						<input type="button" name="button" id="button" value="发送邮件" class="submit_01" />
						</td>
					</tr> -->
				</table>
				<p align="center"><input type="button" value="返回" onclick="history.go(-1)" class="submit_01"/></p>
			</div>
		</form>
	</div> 
</body>
</html>