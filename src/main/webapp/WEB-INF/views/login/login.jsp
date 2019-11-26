<%--
  Created by IntelliJ IDEA.
  User: wangdf
  Date: 2019/11/11 0011
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap-theme.css">
    <script type="text/javascript" src="<%=path %>/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="<%=path %>/js/bootstrap.js"></script>
    <title>登陆</title>
    <style>
        body{
            background-image: url("<%=path %>/images/loginBG.jpg");
            background-repeat: no-repeat;
        }
        .loginForm{
            width: 400px;
            height: 200px;
            margin-top: 200px;
            margin-left: 900px;
        }
    </style>
</head>
<body>
<div class="login">
    <form class="loginForm" name="login" action="<%=path %>/login/loginCheck"  method="post">
        <div class="form-group">
            <span>${msg1}</span><br>
            <label for="username">UserName</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Username">
        </div>
        <div class="form-group">
            <span>${msg2}</span><br>
            <label for="Password">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
        <button type="reset" class="btn btn-default">Reset</button>
    </form>
</div>
</body>
</html>
