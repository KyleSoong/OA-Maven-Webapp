<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<form class="action" method="post" enctype="multipart/form-data" action="<%=path %>/email/send">
			<div class="t">写邮件</div>
			<div class="pages">
				<table width="90%" border="0" cellspacing="0" cellpadding="0"
					class="addform-base">
		 			<tr>
						<td>发件人：</td>
						<td><input type="text" value="${loginUser.userName}" readonly="readonly"/>
							<input type="text" value="${loginUser.id}" name="fromUser" hidden="true"/>
						</td>
					</tr>
					<tr>
						<td>收件人：</td>
						<td><select name="toUser" id="toUser">
								<c:forEach var="user" items="${users}">
									<option value="${user.id}">${user.id}"${user.userName}"</option>
								</c:forEach>
						</select>
						</td>
					</tr> 
					<tr>
						<td>邮件标题：</td>
						<td><input type="text" id="subject" name="subject" size="60" />
						</td>
					</tr>
 					<tr>
						<td>邮件内容：</td>
						<td><textarea name="content" id="content" cols="70" rows="15"></textarea>
						</td>
					</tr>
					<tr>
						<td>上传附件：</td>
						<td><input type="file" name="attachFile" id="attachFile" /> <span>(上传附件不能大于9M)</span>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="submit" align="center"><input
							type="submit" name="submit" id="button" value="发送邮件"
							class="submit_01" /></td>
					</tr> 
				</table>
				<p>&nbsp;</p>
			</div>
		</form>
	</div>
<!-- 	<script>
	   $(function(){
	      //请求用户列表数据显示在收件人栏
	   
	   })
	</script> -->
</body>
</html>