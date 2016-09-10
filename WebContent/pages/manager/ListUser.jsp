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
    #ListUser-page-foot{
        margin-top:10px;
    }
    </style>
</head>
<body>
    <div id="ListUser-page">
        <s:form action="/user/queryUser" method="post" enctype="multipart/form-data" theme="simple">
        请输入工号：<s:textfield name="queryuser.username"></s:textfield><s:submit value="查询"></s:submit>
        </s:form>
        </div>
        <div>
        <table border="1" class="list">
        <tr><th>工号</th><th>姓名</th><th>所属岗位</th><th>性别</th><th>生日</th><th>用工形式</th><th>简介</th><th>创建时间</th><th>最近登录时间</th><th>最近注销时间</th><th colspan="3">操作</th></tr>
        <s:iterator value="pageBean.list">
        <tr>
        <td><a href='<%=basePath%>user/queryUserById?user.id=<s:property value="id"/>'><s:property value="username"/></a></td><td><s:property value="realname"/></td><td><s:property value="jobname"/></td>
        <td><s:if test="sex==0">男</s:if><s:elseif test="sex==1">女</s:elseif></td><td><s:property value="birthday"/></td>
        <td><s:if test="worktype==1">正式员工</s:if><s:elseif test="worktype==2">临时工</s:elseif><s:elseif test="worktype==3">实习员工</s:elseif><s:elseif test="worktype==4">其它</s:elseif></td>
        <td><s:property value="content"/></td><td><s:property value="createtime"/></td><td><s:property value="logintime"/></td><td><s:property value="logouttime"/></td>
        <td><a href='<%=basePath%>user/queryJobById?user.id=<s:property value="id"/>'>岗位调动</a><td>
        <td><a href='<%=basePath%>user/delUserById?user.id=<s:property value="id"/>' id="delid">删除</a></td>
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
        <a href="<%=basePath%>user/queryUser">首页</a>

        <a href="<%=basePath%>user/queryUser?pageBean.currentPage=<s:property value="pageBean.currentPage - 1"/>">上一页</a>
        </s:else>

        <s:if test="pageBean.currentPage != pageBean.totalPage">
        <a href="user/queryUser?pageBean.currentPage=<s:property value="pageBean.currentPage + 1"/>">下一页</a>

        <a href="user/queryUser?pageBean.currentPage=<s:property value="pageBean.totalPage"/>">尾页</a>
        </s:if>

        <s:else>
        下一页	尾页
        </s:else>
        <div id="ListUser-page-foot">
    <form action="user/queryUser" onsubmit="return validate();">
    跳转至<input type="text" size="2" name="pageBean.currentPage" id="currentPage">页
    <input type="submit" value="跳转"> <input type="submit" value="显示所有员工">
    </form>
        </div>

        </center>
        </div>
    </div>
</body>
<%@ include file="/pages/common/Bottom.jsp" %>
</html>