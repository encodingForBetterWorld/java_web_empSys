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


    <s:iterator value="ls">
    <div class="panel">
    <div class="panel-top">
   欢迎使用人事管理系统！
    </div>
    <div class="panel-comment">
    欢迎<s:property value="jobname"/><s:property value="username"/>登陆本系统！<a href='user/logout?user.id=<s:property value="id" />'>注销</a>
    </div>
    <div class="panel-content">
    <div class="panel-l">
    <ul>
    <div id="accordion">
        <h3>资料管理</h3>
        <div>
        <a href='<%=basePath%>user/queryPersonById?user.id=<s:property value="id"/>' id="tip" title="如果您想完善个人信息，请点击这里">完善个人资料</a>
        </div>
        <h3>个人信息</h3>
        <div>
        <a href='<%=basePath%>user/queryStipendByUsername?user.id=<s:property value="id"/>' id="tip2" title="点这里查询您的薪水单，您的薪水将在发放日期到账，如有疑问请联系财务部">薪水记录</a><br>
        <a href='<%=basePath%>user/queryInstitutionByUsername?user.id=<s:property value="id"/>' id="tip3" title="点这里查询您的处罚单，处罚生效后，罚款将从您的当月工资里扣除，如有疑问请联系财务部">惩罚记录</a><br>
        <a href='<%=basePath%>user/queryEducateByUser?user.id=<s:property value="id"/>' id="tip1" title="点这里查询您所属岗位的培训，如有疑问请联系部门经理">培训课程</a>
        </div>
    </div>
    </ul>
    </div>
    <div class="panel-r">
    <iframe src='./pages/welcome.jsp' id="show_box"></iframe>
    </div>
    </div>
    </div>

    </s:iterator>
    <s:hidden name="user.id"></s:hidden>
    <s:hidden name="user.username"></s:hidden>

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