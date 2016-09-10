<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/pages/common/Header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <style>
    table{
    margin:20px auto;
    }
    </style>
</head>
<body>
<input type="button" name="back" value="返回" onclick="javascript:history.go(-1);"/>
<table  border="1" class="list">
<tr><th>工号</th><th>姓名</th><th>所属岗位</th><th>用工形式</th><th>生日</th><th>性别</th><th>简介</th>
<s:iterator value="users">
<tr>
<td><s:property value="username"/></td><td><s:property value="realname"/></td><td><s:property value="jobname"/></td>
<td><s:if test="worktype==1">正式员工</s:if><s:elseif test="worktype==2">临时工</s:elseif><s:elseif test="worktype==3">实习员工</s:elseif><s:elseif test="worktype==4">其它</s:elseif></td>
<td><s:property value="birthday"/></td>
<td><s:if test="sex==0">男</s:if><s:elseif test="sex==1">女</s:elseif></td>
<td><s:property value="content"/></td>
</tr>
</s:iterator>
</table>
</body>
<%@ include file="/pages/common/Bottom.jsp" %>