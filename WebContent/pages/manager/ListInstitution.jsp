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
            if(page > <s:property value="pageBean.totalPage"/>)
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
    </style>
</head>
<body>
<div>
<s:form action="/institution/queryInstitution" method="post" enctype="multipart/form-data" theme="simple">
输入员工工号查询奖惩记录<s:textfield name="ins.name"></s:textfield><s:submit value="查询"></s:submit>
</s:form>
</div>
<div>
<table border="1" class="list">
<tr><th>工号</th><th>罚款金额</th><th>原因</th><th>备注</th><th>处罚生效日期</th><th colspan="3">操作</th></tr>
<s:iterator value="pageBean.list">
<tr>
<td><a href='<%=basePath%>institution/queryInstitutionById?ins.id=<s:property value="id"/>'><s:property value="name"/></a></td><td><s:property value="money"/>元</td>
<td><s:if test="typeFlag==1">迟到</s:if><s:elseif test="typeFlag==2">早退</s:elseif><s:elseif test="typeFlag==3">违约</s:elseif><s:elseif test="typeFlag==4">旷工</s:elseif><s:elseif test="typeFlag==5">其它</s:elseif></td>
<td><s:property value="explains"/></td>
<td><s:property value="createtime"/></td>
<td><a href='<%=basePath%>institution/delInstitutionById?ins.id=<s:property value="id"/>'id="delid">删除</a></td>
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
            <a href="institution/queryInstitution">首页</a>
            
            <a href="institution/queryInstitution?pageBean.currentPage=<s:property value="pageBean.currentPage - 1"/>">上一页</a>
        </s:else>
        
        <s:if test="pageBean.currentPage != pageBean.totalPage">
            <a href="institution/queryInstitution?pageBean.currentPage=<s:property value="pageBean.currentPage + 1"/>">下一页</a>
            
            <a href="institution/queryInstitution?pageBean.currentPage=<s:property value="pageBean.totalPage"/>">尾页</a>
        </s:if>
        
        <s:else>
            下一页	尾页
        </s:else>
        
     <form action="institution/queryInstitution" onsubmit="return validate();">
            跳转至<input type="text" size="2" name="pageBean.currentPage" id="currentPage">页
            <input type="submit" value="跳转">
        </form>
    </center>
</div>
</body>
<%@ include file="/pages/common/Bottom.jsp" %>
</html>