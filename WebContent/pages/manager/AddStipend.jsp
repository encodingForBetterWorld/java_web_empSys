<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/pages/common/Header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#basic,#other,#eat,#house,#duty,#scot,#punishment").blur(function() {
			var t = $("#basic").val()*1 + $("#other").val()*1 + $("#eat").val()*1 + $("#house").val()*1 + $("#duty").val()*1 - $("#scot").val()*1

			$("#totalize").val(t);

		});
		

	});
	</script>
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
	<s:form action="/stipend/saveStipend" method="post" theme="simple">

员工工号：<s:select list="pageBean.list" listKey="id" listValue="username"
			name="user.id"></s:select>
		<br>
		<br>
基本薪金：<s:textfield name="st.basic" id="basic" value="1000" readonly="true" title="您可通过鼠标滚轴或输入框右侧的小按钮修改金额,通过额外补助补充差价"></s:textfield>元
		<br>
		<br>
饭补：<s:textfield name="st.eat" id="eat" value="0" readonly="true"></s:textfield>元
		<br>
		<br>
房补：<s:textfield name="st.house" id="house" value="0" readonly="true"></s:textfield>元
		<br>
		<br>
全勤奖：<s:textfield name="st.duty" id="duty" value="0" readonly="true"></s:textfield>元
		<br>
		<br>
赋税：<s:textfield name="st.scot" id="scot" value="0" readonly="true"></s:textfield>元
		<br>
		<br>
额外补助：<s:textfield name="st.other" id="other" value="0" readonly="true"></s:textfield>元
		<br>
共计：<s:textfield name="st.totalize" readonly="true" id="totalize"></s:textfield>元
		<br>
发放时间：<s:textfield name="st.granttime" id="datepicker" readonly="true" title="请您通过下面的小日历选择发放日期"></s:textfield>*
		<br>
		<s:submit value="添加"></s:submit>
		<s:reset value="重置"></s:reset>
	</s:form>
</body>
<%@ include file="/pages/common/Bottom.jsp"%>
</html>