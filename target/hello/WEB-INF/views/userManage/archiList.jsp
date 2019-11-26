<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/12 0012
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>用户列表</title>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap-theme.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/icon.css">
    <script type="text/javascript" src="<%=path %>/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="<%=path %>/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.easyui.min.js"></script>
</head>
<body>
<table id="userList">

</table>
<script type="text/javascript">
    $(function () {
        $("#userList").datagrid({
            url:"<%=path %>/user/getUserList",
            columns:[[
                {
                    field:"id",
                    title:"ID",
                    width:100,
                    checkbox:true
                },
                {
                    field:"username",
                    title:"用户名",
                    width:200
                },
                {
                    field:"password",
                    title:"密码",
                    width:200
                }

            ]]
        });
    });
</script>
</body>
</html>
