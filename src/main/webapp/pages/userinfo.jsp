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
<script type="text/javascript" src="<%=path %>/resources/js/jquery-1.11.3.js"></script>
<script>
	function alter(){
		$('#userName').removeAttr('disabled');
		$('#id').removeAttr('disabled');
		$('#tel').removeAttr('disabled');
		$('#role').removeAttr('disabled');
		$('#mgr').removeAttr('disabled');
		$('#backbtn').show();
		$('#button').attr("onclick","return save();").val('保存');
	}
	function save(){
		if(confirm("是否保存用户数据？")){
			$('#userInfoForm').submit();
			return true;
		}else{
			return false;
			}
	}
	function cancelAlter(){
		$('#userName').attr('disabled','disabled');
		$('#tel').attr('disabled','disabled');
		$('#id').attr('disabled','disabled');
		$('#role').attr('disabled','disabled');
		$('#mgr').attr('disabled','disabled');
		$('#backbtn').hide();
		$('#button').attr("onclick","alter();").val('编辑');
	}
</script>
</head>

<body>
<%-- 	<div><a href="<%=path %>/logout">退出</a></div> --%>
	<div class="main">
		<form class="action" id="userInfoForm" action="<%=path %>/user/userinfo" method="post">
			<div class="t">个人信息</div>
			<div class="pages">
				<table width="50%" border="0" cellspacing="0" cellpadding="0"
					class="addform-base">
					<tr>
						<td>工号：</td>
						<td><input type="text" id="id" name="id" value="${user.id}" disabled="disabled"  readonly="readonly" />
						</td>
					</tr> 
					<tr>
						<td>名字：</td>
						<td><input type="text" id="userName" name="userName"
							value="${user.userName}" disabled="disabled" />
						</td>
					</tr>
					<tr>
						<td>手机：</td>
						<td><input type="text" id="tel" value="${user.tel}"
							name="tel" disabled="disabled" />
						</td>
					</tr>
					<tr>
						<td>职位：</td>
						<td><input type="text" id="role" name="role"
							value="${user.role}" readonly="readonly" disabled="disabled" />
						</td>
					</tr>
					<tr>
						<td>上司：</td>
						<td><input type="text" id="mgr" name="mgr"
							value="${user.mgr}" readonly="readonly" disabled="disabled" />
						</td>
					</tr>
<%-- 					<tr>
						<td>年龄：</td>
						<td><input type="text" id="age" value=""
							name="age" disabled="disabled" />
						</td>
					</tr>
					
					<tr>
						<td>性别：</td>
						<td><select name="sex" id="sex" disabled="disabled">
								<option value="女"
									<c:if test="${user.userSex=='女' }">selected="selected"</c:if>>女</option>
								<option value="男"
									<c:if test="${user.userSex=='男' }">selected="selected"</c:if>>男</option>
						</select>
						</td>
					</tr> 

					<tr>
						<td>地址：</td>
						<td><input type="text" id="addr" value="${user.userAddr}"
							name="addr" disabled="disabled" />
						</td>
					</tr> 
--%>
					<!--表单提交行-->
					<tr>					
						<td class="submit" align="right">
						<input type="button" name="button" id="button" value="编辑" onclick="alter()" class="submit_01" />
					</td><td align="left">
						<input type="reset" name="backbtn" id="backbtn" value="返回" 
							onclick="cancelAlter()" style="display:none;" class="submit_01"  />
						</td>
					</tr>
				</table>
				<p>&nbsp;</p>
			</div>
		</form>
	</div>
</body>
</html>