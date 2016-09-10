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
    table{
    margin:20px auto;
    }
    </style>
<body>
<div>


<table border="1" class="list">
<h1>培训课程</h1>
<tr><th>培训名称</th><th>教学目的</th><th>开始时间</th><th>结束时间</th><th>培训资料</th><th>教师名称</th><th>创建时间</th><th>影响</th><th>概述</th>
<s:iterator value="edus">
<tr>
<td><s:property value="name"/></td><td><s:property value="purpose"/></td><td><s:property value="begintime"/></td><td><s:property value="endtime"/></td><td><s:property value="datum"/></td><td><s:property value="teacher"/></td><td><s:property value="createtime"/></td><td><s:property value="effect"/></td><td><s:property value="summarize"/></td>
</tr>
</s:iterator>
</table>

<!input type="button" name="back" value="返回" onclick="javascript:history.go(-1);"/>
</div>
</body>
<%@ include file="/pages/common/Bottom.jsp" %>