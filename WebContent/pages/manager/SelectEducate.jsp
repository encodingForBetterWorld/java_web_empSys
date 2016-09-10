<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/pages/common/Header.jsp"%>
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
<form action="job/updateSelectCourse" method="post">
<center>
<s:hidden name="job.id" ></s:hidden>
为<s:property value="job.name" />分配培训课程
<table><tr><th>名称</th><th>选择</th>

<s:iterator value="edus">
<tr>
<td><s:property value="name" /></td><td>
<s:if test="selectids.contains(id)">
<input type="checkbox" value="<s:property value="id" />" name="eduids" checked="checked" />
</s:if>
<s:else>

<input type="checkbox" value="<s:property value="id" />" name="eduids"/>
</s:else>

</td>

</tr>



</s:iterator>
<s:submit value="确定"></s:submit>
</table>
</center>

</form>
</body>
</html>