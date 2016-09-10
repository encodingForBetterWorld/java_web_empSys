<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/pages/common/Header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <style>
    input{
    margin-top:10px;
    }
    select{
    margin-top:10px;
    }

    </style>
</head>
<body>
<s:form action="/institution/updateInstitution" method="post" theme="simple">
修改工号为<s:property value="ins.name"></s:property>员工的惩罚<br>
罚款金额:<s:textfield name="ins.money" id="spinner" readonly="true" title="您可通过鼠标滚轴或输入框右侧的小按钮修改金额"></s:textfield>元<br>
原因：<s:select list="#{'1':'迟到','2':'早退','3':'违约','4':'旷工','5':'其它'}" name="ins.typeFlag"></s:select><br>
备注：<s:textfield name="ins.explains"></s:textfield><br>
处罚生效日期：<s:textfield name="ins.createtime" id="datepicker" readonly="true" title="请您通过下面的小日历选择处罚生效日期"></s:textfield>*<br>
<s:hidden name="ins.id"></s:hidden>
<s:hidden name="ins.name"></s:hidden>
<s:hidden name="ins.version"></s:hidden>
<s:hidden name="ins.user.id"></s:hidden>
<s:submit value="修改"></s:submit>
</s:form>
</body>
<%@ include file="/pages/common/Bottom.jsp" %>
</html>