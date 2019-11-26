<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/21 0021
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap-theme.css">
    <script type="text/javascript" src="<%=path %>/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="<%=path %>/js/bootstrap.js"></script>
</head>
<body>
    <div class="jumbotron" style="padding-left: 50px">
        <h1>Hello, 欢迎来到大数据中心!</h1>
        <p>项目源码：<a>https://github.com/Hi-world-DF/Java-Test</a></p>
        <p>
            This is a small project,an exercise in getting started
            with the SSM framework for Java.Thanks you take a look
            at this project,which will continue to be updated and
            will be updated by github's masters.The technology of
            the project will continue to increase and update.
        </p>
        <p><a class="btn btn-primary btn-lg" role="button">Learn more</a></p>

    </div>
</body>
</html>
