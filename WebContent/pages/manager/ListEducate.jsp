<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/pages/common/Header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$("#delid").click(function(){
		var i=confirm('是否删除？');
		if(i==true){
			return true;
		}
		return false;
	});
})

        function validate()
        {
        	
           var page = document.getElementById("currentPage").value;           
            if(<s:property value="pageBean.totalPage"/> && page > <s:property value="pageBean.totalPage"/>)
            {
                alert("你输入的页数大于最大页数,请重新输入!");                
                return false;
            }
            
            return true;
        }
    
</script>
    <style>
    table{
    margin:20px auto;
    }
    #ListEducate-page-foot{
    margin-top:10px;
    }
    </style>
</head>
<body>
<div>
<s:form action="/edu/queryEdu" method="post" enctype="multipart/form-data" theme="simple">
培训名称：<s:textfield name="queryEdu.name"></s:textfield><s:submit value="查询"></s:submit>
</s:form>
</div>
<div>
<table border="1" class="list">
<tr><th>名称</th><th>教学目的</th><th>开始时间</th><th>结束时间</th><th>培训资料</th><th>教师名称</th><th>创建时间</th><th>影响</th><th colspan="3">操作</th></tr>
<s:iterator value="pageBean.list">
<tr>
<td><a href='<%=basePath%>edu/queryEduById?edu.id=<s:property value="id"/>'><s:property value="name"/></a></td><td><s:property value="purpose"/></td><td><s:property value="begintime"/></td><td><s:property value="endtime"/></td><td><s:property value="datum"/></td><td><s:property value="teacher"/></td><td><s:property value="createtime"/></td><td><s:property value="effect"/></td><td><s:property value="summarize"/></td>
<td><a href='<%=basePath%>edu/delEducateById?edu.id=<s:property value="id"/>'id="delid">删除</a></td>
</tr>
</s:iterator>
</table>
   <center>
    
    
    
        共<s:property value="pageBean.totalPage"/>页 
        共<s:property value="pageBean.allRows"/>条记录
        
        <s:if test="pageBean.currentPage == 1">
            首页	上一页
        </s:if>
        
        <s:else>
            <a href="<%=basePath%>edu/queryEdu">首页</a>
            
            <a href="<%=basePath%>edu/queryEdu?pageBean.currentPage=<s:property value="pageBean.currentPage - 1"/>">上一页</a>
        </s:else>
        
        <s:if test="pageBean.currentPage != pageBean.totalPage">
            <a href="edu/queryEdu?pageBean.currentPage=<s:property value="pageBean.currentPage + 1"/>">下一页</a>
            
            <a href="edu/queryEdu?pageBean.currentPage=<s:property value="pageBean.totalPage"/>">尾页</a>
        </s:if>
        
        <s:else>
            下一页	尾页
        </s:else>
        
     <form action="edu/queryEdu" onsubmit="return validate();" id="ListEducate-page-foot">
            跳转至<input type="text" size="2" name="pageBean.currentPage" id="currentPage">页
            <input type="submit" value="跳转">
        </form>
    </center>
</div>
</body>
<%@ include file="/pages/common/Bottom.jsp" %>
</html>