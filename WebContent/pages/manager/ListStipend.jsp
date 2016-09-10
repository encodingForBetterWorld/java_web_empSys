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
</head>
    <style>
    table{
    margin:20px auto;
    }
    </style>
<body>
<div>
<s:form action="/stipend/queryStipend" method="post" enctype="multipart/form-data" theme="simple">
输入员工工号查询薪水<s:textfield name="st.name"></s:textfield><s:submit value="查询"></s:submit>
</s:form>
</div>
<div>
<table border="1" class="list">
<tr><th>工号</th><th>基本薪水</th><th>饭补</th><th>宿补</th><th>全勤奖</th><th>赋税</th><th>额外</th><th>发放日期</th><th>总计</th>
<s:iterator value="pageBean.list">
<tr>
<td><a href='<%=basePath%>stipend/queryStipendById?st.id=<s:property value="id"/>'><s:property value="name"/></a></td><td><s:property value="basic"/>元</td><td><s:property value="eat"/>元</td><td><s:property value="house"/>元</td><td><s:property value="duty"/>元</td><td><s:property value="scot"/>元</td><td><s:property value="other"/>元</td><td><s:property value="granttime"/></td><td><s:property value="totalize"/>元</td>
<td><a href='<%=basePath%>stipend/delStipendById?st.id=<s:property value="id"/>'id="delid">删除</a></td>
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
            <a href="stipend/queryStipend">首页</a>
            
            <a href="stipend/queryStipend?pageBean.currentPage=<s:property value="pageBean.currentPage - 1"/>">上一页</a>
        </s:else>
        
        <s:if test="pageBean.currentPage != pageBean.totalPage">
            <a href="stipend/queryStipend?pageBean.currentPage=<s:property value="pageBean.currentPage + 1"/>">下一页</a>
            
            <a href="stipend/queryStipend?pageBean.currentPage=<s:property value="pageBean.totalPage"/>">尾页</a>
        </s:if>
        
        <s:else>
            下一页	尾页
        </s:else>
        
     <form action="stipend/queryStipend" onsubmit="return validate();">
            跳转至<input type="text" size="2" name="pageBean.currentPage" id="currentPage">页
            <input type="submit" value="跳转">
        </form>
    </center>
</div>
</body>
<%@ include file="/pages/common/Bottom.jsp" %>
</html>