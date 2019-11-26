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
    <form id="addUserInfo" enctype="multipart/form-data" method="post">
        <div class="table-area div-box">
            <div class="box-title">基本信息</div>
            <div class="layer-input-box">
                <ul class="layer-input-main">
                    <li style="width: 49%">
                        <div class="layer-input-left">
                            <em>*</em>
                            用户名
                        </div>
                        <div class="layer-input-right">
                            <input id="userName" name="userName" class="easyui-comtext" date-options="required:true"/>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </form>
</body>
</html>
