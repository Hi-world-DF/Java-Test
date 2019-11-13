<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/11 0011
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap-theme.css">
    <script type="text/javascript" src="<%=path %>/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="<%=path %>/js/bootstrap.js"></script>
    <title>首页</title>
    <style>
        body {
            width: 100%;
            height: 100%;
            margin: 0;
            overflow: hidden;
            background-color: #FFFFFF;
            font-family: "Microsoft YaHei", sans-serif;
        }
        .pageSidebar{
            width: 240px;
            height:100%;
            padding-bottom: 30px;
            overflow: auto;
            background-color: #e3e3e3;
        }
        .splitter {
            width: 5px;
            height: 100%;
            bottom: 0;
            left: 240px;
            position: absolute;
            overflow: hidden;
            background-color: #fbfbfb;
        }
        .pageContent{
            height: 100%;
            min-width: 768px;
            left: 246px;
            top: 0;
            right: 0;
            z-index: 3;
            padding-bottom: 30px;
            position: absolute;
        }
        .pageContainer{
            bottom: 0;
            left:0;
            right: 0;
            top: 53px;
            overflow: auto;
            position: absolute;
            width: 100%;
        }
        .footer {
            width: 100%;
            height: 30px;
            line-height: 30px;
            margin-top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            position: absolute;
            z-index: 10;
            background-color: #8085a6;
        }
        .navbar-collapse{
            padding-left: 5px;
            padding-right: 5px;
        }
        .nav>li{
            text-align: center;
        }
        .nav>li>a{
            color:#444;
            margin: 0 5px;
        }
        .nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover{
            background-color: #010101;
        }
        .dropdown-menu{
            min-width: 200px;
            margin-left: 40px;
            background-color: rgba(251, 251, 251, 0.98);
        }
        .dropdown-menu>li>a{
            padding: 10px 15px;
        }
    </style>
</head>
<body>
    <!--顶部导航栏部分-->
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" title="logoTitle" href="#">大数据中心</a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li role="presentation">
                        <a href="#">当前用户：<span class="badge">TestUser</span></a>
                    </li>
                    <li>
                        <a href="/login/gotoLoginPage">
                            <span class="glyphicon glyphicon-lock"></span>退出登录</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- 中间主体内容部分 -->
    <div class="pageContainer">
        <!-- 左侧导航栏 -->
        <div class="pageSidebar">
            <ul class="nav nav-stacked nav-pills">
                <li role="presentation">
                    <a href="/user/gotoUserManage" target="mainFrame" >用户管理</a>
                </li>
                <li role="presentation">
                    <a href="nav2.html" target="mainFrame">建筑管理</a>
                </li>
                <li role="presentation">
                    <a href="nav3.html" target="mainFrame">网格管理</a>
                </li>
                <li role="presentation">
                    <a href="nav4.html" target="mainFrame">其他管理</a>
                </li>
            </ul>
        </div>
        <!-- 左侧导航和正文内容的分隔线 -->
        <div class="splitter"></div>
        <!-- 正文内容部分 -->
        <div class="pageContent">
            <iframe src="/user/gotoUserManage" id="mainFrame" name="mainFrame" frameborder="0" width="100%"  height="100%" frameBorder="0"></iframe>
        </div>
    </div>
    <!-- 底部页脚部分 -->
    <div class="footer">
        <p class="text-center">
            2019 &copy; DFWang.
        </p>
    </div>
<script>
    $(".nav li").click(function() {
        $(".active").removeClass('active');
        $(this).addClass("active");
    });
</script>
</body>
</html>
