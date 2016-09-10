<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/pages/common/Header.jsp"%>
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
    #ListJob-page-foot{
    margin-top:10px;
    }
    </style>
</head>
<body>
<div>
<s:form action="job/queryJob" method="post" enctype="multipart/form-data" theme="simple">
输入岗位名称<s:textfield name="queryJob.name"></s:textfield>
<s:submit value="查询岗位"></s:submit>


</s:form>

</div>

<div>
 <center>
<table border="1" class="list">
<tr><th>岗位名称</th><th>简介</th><th>岗位类别</th><th>创建日期</th><th>岗位人员</th><th>选择培训</th><th colspan="3">操作</th></tr>
<s:iterator value="pageBean.list">
<tr>
<td><a href='job/queryJobById?job.id=<s:property value="id" />' ><s:property value="name" /></a></td><td><s:property value="content" /></td>
<td><s:if test="jobtype==1">营销岗</s:if><s:elseif test="jobtype==2">技术岗</s:elseif><s:elseif test="jobtype==3">管理岗</s:elseif><s:elseif test="jobtype==4">其它</s:elseif></td>
<td><s:property value="createtime"/></td>
<td><a href='job/listJobUser?job.id=<s:property value="id" />' >查看</a></td>
<td><a href='job/selectEdu?job.id=<s:property value="id" />' >选择</a></td>
<td><a href='job/delJobById?job.id=<s:property value="id" />' id="delid">删除</a></td>

</tr>
</s:iterator>

</table>
   
        共<s:property value="pageBean.totalPage"/>页 
        共<s:property value="pageBean.allRows"/>条记录
        
        <s:if test="pageBean.currentPage == 1">
            首页	上一页
        </s:if>
        
        <s:else>
            <a href="job/queryJob">首页</a>
            
            <a href="job/queryJob?pageBean.currentPage=<s:property value="pageBean.currentPage - 1"/>">上一页</a>
        </s:else>
        
        <s:if test="pageBean.currentPage != pageBean.totalPage">
            <a href="job/queryJob?pageBean.currentPage=<s:property value="pageBean.currentPage + 1"/>">下一页</a>
            
            <a href="job/queryJob?pageBean.currentPage=<s:property value="pageBean.totalPage"/>">尾页</a>
        </s:if>
        
        <s:else>
            下一页	尾页
        </s:else>
        <div id="ListJob-page-foot">
    <form action="job/queryJob" onsubmit="return validate();">
    跳转至<input type="text" size="2" name="pageBean.currentPage" id="currentPage">页
    <input type="submit" value="跳转">
    </form>
        </div>

    </center>

</div>






	<%@ include file="/pages/common/Bottom.jsp"%>
</body>
</html>