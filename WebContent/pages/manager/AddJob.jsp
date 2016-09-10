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
<s:form action="/job/saveJob" method="post" theme="simple">
岗位名称：<s:textfield name="job.name" id="tip" title="请注意：录入的岗位名称不能为空，不能重复录入"></s:textfield><lable id="tip2" title="*表示该项不能为空">*</lable><br>
岗位类别:<s:select list="#{'1':'营销岗','2':'技术岗','3':'管理岗','4':'其它'}" name="job.jobtype"></s:select><br>
概述：<s:textfield name="job.content" id="tip1" title="请在这里简单描述下公司的基本信息"></s:textfield>*<br>
<s:submit value="添加"></s:submit>
</s:form>
</body>
 <%@ include file="/pages/common/Bottom.jsp" %>
</html>