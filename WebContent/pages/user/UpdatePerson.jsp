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
    .photo{
	width:120px;
	height:140px;
	margin :10px 0 0 10px;
}
#showPhoto{
		width:120px;
	height:140px;
	margin :10px 0 0 10px;
	}
    </style>
<body>
<div>在下面完善<s:property value="user.username"></s:property>的个人资料<br></div>
用工形式:<s:if test="user.worktype==1">正式员工</s:if><s:elseif test="user.worktype==2">临时工</s:elseif><s:elseif test="user.worktype==3">实习员工</s:elseif><s:elseif test="user.worktype==4">其它</s:elseif>

<br>
<img src="<%=basePath%>resources/photo/<s:if test="user.userPic==1">img1.jpg</s:if><s:elseif test="user.userPic==2">img2.jpg</s:elseif><s:elseif test="user.userPic==3">img3.jpg</s:elseif><s:elseif test="user.userPic==4">img4.jpg</s:elseif>" id="showPhoto">
    <br>

<s:form action="/user/updatePerson" method="post" theme="simple">
选择照片:<s:select list="#{'1':'头像一','2':'头像二','3':'头像三','4':'头像四'}" name="user.userPic" id="choosePhoto"></s:select><br>
姓名：<s:textfield name="user.realname" id="tip" title="请务必在此填写您的真实姓名"></s:textfield><br>
密码：<s:textfield name="user.password" id="tip1" title="请您在设置密码时使用字母、数字和符号的组合，以防您的账号被人冒用"></s:textfield><br>
性别:<s:radio list="#{'0':'男','1':'女'}" name="user.sex" value="0"></s:radio><br>
生日：<s:textfield name="user.birthday" id="datepicker" readonly="true"></s:textfield><br>
简介：<s:textfield name="user.content" id="tip2" title="请您在这里简单介绍下自己"></s:textfield><br>
<s:hidden name="user.username"></s:hidden>
<s:hidden name="user.id"></s:hidden>
<s:hidden name="user.isadmin"></s:hidden>
<s:hidden name="user.worktype"></s:hidden>
<s:hidden name="user.jobname"></s:hidden>
<s:hidden name="user.logintime"></s:hidden>
<s:hidden name="user.logouttime"></s:hidden>
<s:hidden name="user.job.id"></s:hidden>
<s:submit value="更新"></s:submit>
</s:form>

<script type="text/javascript">
	$("#choosePhoto").change(function(){
		var url = "<%=basePath%>resources/photo/img"+this.value+".jpg";
		$("#showPhoto").attr('src',url);
	})
</script>
</body>
<%@ include file="/pages/common/Bottom.jsp" %>
</html>
