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
<!input type="button" name="back" value="返回" onclick="javascript:history.go(-1);"/>
<div><a href='<%=basePath%>user/showInstitutionById?user.id=<s:property value="user.id"/>' id="tip" title="点击这里显示您之前隐藏的所有记录">显示隐藏的记录</a></div>
<table  border="1" class="list">
<tr><th>工号</th><th>原因</th><th>罚款金额</th><th>备注</th><th>处罚生效日期</th><th>操作</th></tr>
<s:iterator value="inss">
<tr>
<td><s:property value="name"/></td><td><s:if test="typeFlag==1">迟到</s:if><s:elseif test="typeFlag==2">早退</s:elseif><s:elseif test="typeFlag==3">违约</s:elseif><s:elseif test="typeFlag==4">旷工</s:elseif><s:elseif test="typeFlag==5">其它</s:elseif></td>
<td><s:property value="money"/>元</td><td><s:property value="explains"/></td><td><s:property value="createtime"/></td>
<td><a href='user/hiddenInstitutionById?ins.id=<s:property value="id" />'>隐藏</a></td>
</tr>
</s:iterator>
</table>

</div>
</body>
<%@ include file="/pages/common/Bottom.jsp" %>