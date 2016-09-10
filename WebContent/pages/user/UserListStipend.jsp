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
<!input type="button" name="back" value="返回" onclick="javascript:history.go(-1);"/>
<div><a href='<%=basePath%>user/showStipendById?user.id=<s:property value="user.id"/>' id="tip" title="点击这里显示您之前隐藏的所有记录">显示隐藏的记录</a></div>
<table border="1" class="list">
<tr><th>工号</th><th>基本薪水</th><th>饭补</th><th>宿补</th><th>全勤奖</th><th>赋税</th><th>额外</th><th>发放日期</th><th>总计</th><th>操作</th></tr>
<s:iterator value="sts">
<tr>
<td><s:property value="name"/></td><td><s:property value="basic"/>元</td><td><s:property value="eat"/>元</td><td><s:property value="house"/>元</td><td><s:property value="duty"/>元</td><td><s:property value="scot"/>元</td><td><s:property value="other"/>元</td><td><s:property value="granttime"/></td><td><s:property value="totalize"/>元</td>
<td><a href='user/hiddenStipendById?st.id=<s:property value="id" />'>隐藏</a></td>
</tr>
</s:iterator>
</table>
<s:hidden name="user.id"></s:hidden>
</body>
<%@ include file="/pages/common/Bottom.jsp" %>