<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="/pages/common/Header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <style>
    #register-page input{
        margin-top:10px;
    }
    #register-page select{
    margin-top:10px;
    }
	#showPhoto{
		width:120px;
	height:140px;
	margin :10px 0 0 10px;
	}
    </style>
</head>
<body>
<div id="register-page">
    <s:form action="/user/register" method="post" theme="simple">
        <img src="<%=basePath%>resources/photo/img1.jpg" id="showPhoto"><br>
  选择照片:<s:select list="#{'1':'头像一','2':'头像二','3':'头像三','4':'头像四'}" name="user.userPic" id="choosePhoto"></s:select><br>
    工号：<s:textfield name="user.username" id="tip" title="请注意：录入的员工工号不能为空，不能重复录入"></s:textfield><lable id="tip2" title="*表示该项不能为空">*</lable><br>
    密码：<s:textfield name="user.password" id="tip1" title="请注意：设置的初始密码务必为123"></s:textfield>*<br>
    是否为管理员:<input type="checkbox" name="user.isadmin" value="1"/><br>
    简介：<s:textfield name="user.content"></s:textfield><br>
    分配岗位：<s:select list="pageBean.list" listKey="id" listValue="name"
    name="job.id"></s:select><br>
    性别:<s:radio list="#{'0':'男','1':'女'}" name="user.sex" value="0"></s:radio><br>
    用工形式：	<s:select list="#{'1':'正式员工','2':'临时工','3':'实习员工','4':'其它'}" name="user.worktype"></s:select><br>
    生日：<s:textfield name="user.birthday" id="datepicker" readonly="true"></s:textfield><br>
    <br>
    <s:submit value="注册"></s:submit>
    </s:form>
</div>

<script type="text/javascript">
	$("#choosePhoto").change(function(){
		var url = "<%=basePath%>resources/photo/img"+this.value+".jpg";
		$("#showPhoto").attr('src',url);
	})
</script>

</body>
</html>
<%@ include file="/pages/common/Bottom.jsp" %>