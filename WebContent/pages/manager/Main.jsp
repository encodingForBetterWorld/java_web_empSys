<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/pages/common/Header.jsp" %>

<script>
  $(function() {
    $( "#accordion" ).accordion({
      collapsible: true
    });
  });
</script>

<div class="panel">
	<div class="panel-top">
		欢迎使用人事管理系统！
	</div>
	<div class="panel-comment">
		欢迎您，管理员<s:property value="user.username" />！<a href='user/logout?user.id=<s:property value="user.id" />'>注销</a>
	</div>
	<div class="panel-content">
		<div class="panel-l">
			<ul>
			<div id="accordion">
			<h3>员工管理</h3>
                <div>
                
					<a href='user/selectJob?job.id=<s:property value="id" />' id="tip" title="点击这里为公司增添员工，在这里您可以为员工设置权限并分配岗位">添加员工</a>
				
				
					<a href="<%=basePath%>pages/manager/ListUser.jsp" id="tip1" title="点击这里您可以查询到本公司的所有已注册员工，如果您想进行人事调动，员工信息的修改和删除请先查询员工">查询人员资料</a>
				
                </div>
		    <h3>岗位管理</h3>
                <div>
				
					<a href="<%=basePath%>pages/manager/AddJob.jsp" id="tip2" title="点击这里为公司增添岗位">添加岗位</a>
				
					<a href="<%=basePath%>pages/manager/ListJob.jsp" id="tip3" title="点击这里您可以查询到本公司的所有已注册岗位，如果您想为岗位安排培训资料，删除和修改岗位请先查询岗位">查询岗位资料</a>
				
				</div>
			<h3>培训管理</h3>
			    <div>
				
					<a href="<%=basePath%>pages/manager/AddEducate.jsp" id="tip4" title="点击这里为公司增添培训">添加培训</a>
				
					<a href="<%=basePath%>pages/manager/ListEducate.jsp" id="tip5" title="点击这里您可以查询到本公司的所有已注册培训，如果您想进行培训的修改和删除请先查询培训">查询培训资料</a>
				
				</div>
			<h3>薪水管理</h3>
			    <div>
				
					<a href='stipend/selectUser?user.id=<s:property value="id" />' id="tip6" title="点击这里为员工发放薪水">发放薪水</a>
				
					<a href="<%=basePath%>pages/manager/ListStipend.jsp" id="tip7" title="点击这里您可以查询到本公司所有员工的薪水记录，如果您想进行记录的修改和删除请先查询薪水">查询薪水记录</a>
				
				</div>
			<h3>处罚管理</h3>
			    <div>
				
					<a href='institution/selectUser?user.id=<s:property value="id" />' id="tip8" title="点击这里为员工记录处罚">惩罚员工</a>
				
					<a href="<%=basePath%>pages/manager/ListInstitution.jsp" id="tip9" title="点击这里您可以查询到本公司所有员工的处罚记录，如果您想进行记录的修改和删除请先查询处罚">查询惩罚记录</a>
				
				</div>
			</div>
			</ul>
		</div>
		<div class="panel-r">
			<iframe src='./pages/welcome.jsp' id="show_box"></iframe>
		</div>
	</div>
</div>

<script type="text/javascript">
	$('#accordion').on('click',function(e){
		if(e.target.tagName == 'A'){
			e.preventDefault();
			var curl = $(e.target).attr('href');
			
			$("#show_box").attr('src',curl);
		}
	})
</script>

<%@ include file="/pages/common/Bottom.jsp" %>