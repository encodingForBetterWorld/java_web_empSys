<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/pages/common/Header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<h1 id="login-title">
		您已退出，期待您的<a href="<%=basePath%>pages/user/Login.jsp"> 再次使用</a>~谢谢！
		</h1>		
</body>
<%@ include file="/pages/common/Bottom.jsp" %>
</html>