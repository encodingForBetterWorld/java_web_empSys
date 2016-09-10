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
<s:form action="/job/updateJob" method="post" theme="simple">
修改<s:property value="job.name"></s:property>的岗位信息<br>
岗位类别:<s:select list="#{'1':'营销岗','2':'技术岗','3':'管理岗','4':'其它'}" name="job.jobtype"></s:select><br>
概述：<s:textfield name="job.content"></s:textfield><br>
<s:hidden name="job.id"></s:hidden>
<s:hidden name="job.name"></s:hidden>
<s:submit value="修改"></s:submit>
</s:form>
</body>
 <%@ include file="/pages/common/Bottom.jsp" %>
</html>