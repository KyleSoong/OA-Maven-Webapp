<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
</head>

<body>

<div class="main"><div class="global-width">
	
    <div class="action">
    	<div class="t">收件箱</div>
   		<div class="pages">
                <table width="90%" border="0" cellspacing="0" cellpadding="0" class="list">
                  <tr  align="center">
					<td width="10%">发件人</td>
					<td width="20%">主题</td>
					<td width="30%">内容</td>
					<td width="10%">未读</td>
					<td width="20%">时间</td>
					<td width="10%">操作</td>  
                  </tr>
                 
        <c:forEach items="${page.pagedata}" var="mail" varStatus="satus">
		<tr  align="center"> 
			<td>${mail.fromUser }</td>
			<td><a href="<%=path%>/email/read/${mail.id }">${mail.subject}</a></td>
			<td>${mail.content }</td>
			<td>
				<c:if test="${mail.isread == 1}">已读</c:if>
				<c:if test="${mail.isread == 0 or mail.isread == null}">未读</c:if>
			</td>
			<td>
	 			<fmt:formatDate value="${mail.sentDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
			<td>
				<a href="<%=path%>/email/moveToTrash/${mail.id}"><img src="<%=path %>/resources/images/delete.gif" width="16" height="16" /></a>
			</td>
		</tr>
 		</c:forEach>
        <tr>
        <td colspan="6" align="center">    
         	共${page.rowSum}条记录&nbsp;共${page.pageSum}页&nbsp;当前第${page.currentPage}页    
         	
         	<c:if test="${page.currentPage=='1'}">第一页  上一页</c:if>
	 		<c:if test="${page.currentPage > 1}">    
		        <a href="<%=path %>/email/inbox?p=1">第一页</a>    
				<a href="<%=path %>/email/inbox?p=${page.currentPage-1}">上一页</a>    
         	</c:if>
         	
         	<c:if test="${page.currentPage==page.pageSum }">下一页  最后一页</c:if>
         	<c:if test="${page.currentPage < page.pageSum}">    
				<a href="<%=path %>/email/inbox?p=${page.currentPage+1}">下一页</a>    
				<a href="<%=path %>/email/inbox?p=${page.pageSum}">最后一页</a>    
         	</c:if>        
     	</td>        
        </tr>
        </table>
        </div>
        
<div id="flt">
</div>
        
        
    </div>
</div></div>

</body>
</html>