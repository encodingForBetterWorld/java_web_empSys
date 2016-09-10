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
    input{
    margin-top:10px;
    }
    select{
    margin-top:10px;
    }

    </style>
<body>
<s:form action="/edu/updateEducate" method="post" theme="simple">
修改<s:property value="edu.name"></s:property>的培训信息<br>
教学目的：<s:textfield name="edu.purpose"></s:textfield><br>
开始时间：<s:textfield name="edu.begintime" id="datepicker" readonly="true"></s:textfield>*<br>
结束时间：<s:textfield name="edu.endtime" id="datepicker1" readonly="true"></s:textfield>*<br>
培训资料：<s:textfield name="edu.datum"></s:textfield><br>
教师名称：<s:textfield name="edu.teacher"></s:textfield><br>
影响：<s:textfield name="edu.effect"></s:textfield><br>
概述：<s:textfield name="edu.summarize"></s:textfield><br>
<s:hidden name="edu.id"></s:hidden>
<s:hidden name="edu.name"></s:hidden>
<s:submit value="修改"></s:submit>
</s:form>
</body>
<%@ include file="/pages/common/Bottom.jsp" %>
</html>