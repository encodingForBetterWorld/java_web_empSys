<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath()+"/";
%>

<base href="<%=basePath %>">
<style>
body{
background:url("<%=basePath%>resources/images/listbg.jpg");
    font-size: 30px;
    text-align: left;
    padding: 10px;
    color: black;
}
</style>


