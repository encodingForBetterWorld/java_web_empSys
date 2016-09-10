<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/pages/common/Header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <style>
    input{
    margin-top:10px;
    }
    select{
    margin-top:10px;
    }

    </style>
<s:form action="/user/updateuserjob" method="post" theme="simple">
将原<s:property value="user.jobname"/>的<s:property value="user.username"/>调配到<s:select list="jobs" listKey="id" listValue="name" name="job.id"></s:select>
<s:hidden name="user.id"></s:hidden>

<s:submit value="确认调配"></s:submit>
</s:form>
</body>
</html>
<%@ include file="/pages/common/Bottom.jsp" %>