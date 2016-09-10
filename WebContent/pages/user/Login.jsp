<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/pages/common/loginHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>人事管理系统-登录</title>
	
</head>
    <style>
    body{
    	background-image: url(<%=basePath%>resources/images/bg.jpg);
    	background-size:100%;
    }
    input{
    margin-top:10px;
    }
    </style>
<body>
<div id="login-content">
		<h1 id="login-title">
		人事管理系统
		</h1>
		<s:form action="/user/getUserInfo" method="post" theme="simple">
		工号：<s:textfield name="user.username" class="easyui-validatebox textbox" data-options="prompt:'Enter User Name.',required:true,validType:'length[3,10]'"></s:textfield><br>
		密码：<s:password name="user.password" class="easyui-validatebox textbox" data-options="prompt:'Enter User Name.',required:true,validType:'length[3,10]'"></s:password><br>
		<s:hidden name="user.isadmin"></s:hidden>
		<s:hidden name="user.id"></s:hidden>
		<s:submit value="登录"></s:submit>
		</s:form>
</div>
</body>
<%@ include file="/pages/common/Bottom.jsp" %>
</html>