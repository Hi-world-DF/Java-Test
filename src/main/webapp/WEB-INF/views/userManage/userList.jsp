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
    <style>
        body {
            width: 100%;
            height: 100%;
            margin: 0;
            overflow: hidden;
            background-color: #FFFFFF;
            font-family: "Microsoft YaHei", sans-serif;
        }
        .head{
            color: white;
            margin-top: -20px;
            height: 60px;
            width: 100%;
            background-color: #3632FE;
        }
        .head h2{
            padding-left: 30px;
            padding-top: 10px;
        }
        .search{
            width: 100%;
            float: left;
            font-size: 16px;
            text-align: center;
            margin-top: 5px;
        }
        .search input{
            margin-left: 5px;
            margin-right: 5px;
        }
        .list{
            text-align: center;
            height: 300px;
            width: 100%;
            float: left;
        }
        .datagrid-header-row td {
            background-color: #858585;
            color: #fff;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: larger;
            text-align: center;
        }
    </style>
</head>
<body>
<%--    头部--%>
    <div class="head" id="head">
        <h2>用户列表</h2>
    </div>
    <div class="search" id="search" name="search">
        <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
                <label for="userName">用户名：</label>
                <input type="text" class="easyui-context" id="userName">
                <label for="state">状态：</label>
                <input type="text" class="easyui-conbobox" id="state">
            </div>
            <button class="btn btn-primary" onclick="">搜索</button>
            <button class="btn btn-default" type="reset">重置</button>
        </form>
    </div>
    <div class="list" id="list" name="list">
        <div id="user-toolbar" style="text-align: right">
            <p style="margin: 5px 10px 5px 0px">
                <a id="addUser" class="btn btn-default easyui-linkbutton" onclick="addUserInfo()" data-options="iconCls:'icon-add',plain:true">添加用户</a>
                <a id="editUser" class="btn btn-default easyui-linkbutton" onclick="addUserInfo()" data-options="iconCls:'icon-edit',plain:true">编辑用户</a>
                <a id="deleteUser" class="btn btn-default easyui-linkbutton" onclick="addUserInfo()" data-options="iconCls:'icon-remove',plain:true">删除用户</a>
            </p>
        </div>
        <%--用户列表--%>
        <table class="table" id="userList"></table>
        <%--添加窗口--%>
        <div id="add" class="easyui-window" title="编辑用户" style="width: 400px;height: 250px" data-options="iconCls:'icon-edit',modal:true,closed:true">
            <form id="addUserInfo" method="post" style="text-align: center;margin-top: 20px" >
                 <%-- 隐藏id--%>
                <input type="hidden" name="id">
                <div class="layer-input-left" style="margin-top: 10px">
                    用户名:
                    <input id="username1" name="username" class="easyui-validatebox" date-options="required:true"/>
                </div>
                <div class="layer-input-left" style="margin-top: 10px">
                    密&nbsp;&nbsp;&nbsp;码:
                    <input id="password" name="password" class="easyui-comtext" date-options="required:true"/>
                </div>

                <div class="layer-input-left" style="margin-top: 10px">
                    状&nbsp;&nbsp;&nbsp;态:
                    <input id="state1" name="state" class="easyui-comtext" date-options="required:true"/>
                </div>

                <div style="margin-top: 10px">
                    <a id="saveUser" type="submit" class="btn btn-primary easyui-linkbutton"  data-options="iconCls:'icon-save',plain:true">保存</a>
                    <a id="cancel" class="btn btn-primary easyui-linkbutton"  data-options="iconCls:'icon-cancel',plain:true">取消</a>
                </div>
            </form>
        </div>
    </div>

<script type="text/javascript">
    $(function () {
        $('.panel-title').css('font-size','40px');
        // 用户列表数据
        $("#userList").datagrid({
            url:"<%=path %>/user/getUserListPage",
            idField:"id",
            pagination:true,
            striped:true,
            rownumbers:true,
            toolbar:"user-toolbar",
            pageSize:10,
            pageList:[10,20,30,40,50],
            columns:[[
                {
                    field:"id",
                    title:"主键",
                    hidden:true
                },
                {
                    field:"ck",
                    width:50,
                    checkbox:true
                },
                {
                    field:"username",
                    title:"用户名",
                    align:"center",
                    width:300
                },
                {
                    field:"password",
                    title:"密码",
                    align:"center",
                    width:300
                },
                {
                    field:"state",
                    title:"状态",
                    align:"center",
                    width:200
                },
                {
                    field:"cz",
                    title:"操作",
                    align:"center",
                    width:280,
                    formatter:function (value,rec,index) {
                        var a = '<a href="#" class="easyui-tooltip ytFont link-iocn" title="编辑" style="margin-right: 5px" onclick="javascript:ConfigSp.updateUserInfo()">'
                        +'<span class="1-btn-text">编辑</span></a>';
                        var b = '<a href="#" class="easyui-tooltip ytFont link-iocn" title="删除" style="margin-left: 5px" onclick="javascript:ConfigSp.deleteUserInfo()">'
                            +'<span class="1-btn-text">删除</span></a>';
                        return a+b;
                    }
                }

            ]]
        });
        //弹出添加用户页面
        $("#addUser").click(function () {
            //清空表单
            $("#addUserInfo").form("clear");
            $("#add").window("open");
        });

        $("#cancel").click(function () {
            $("#add").window("close");
        });
        //保存修改信息
        $("#saveUser").click(function () {
            $("#addUserInfo").form("submit",{
                url:"<%=path %>/user/saveUserInfo",
                //表单提交的回调函数，true:提交，false:不提交
                onSubmit:function () {
                    //判断表单验证
                    return $("#addUserInfo").form("validate");
                },
                //提交到服务器完毕的回调函数，
                success:function (data) {
                    //data为服务器返回数据，类型：Sting
                    //要求controller 返回：成功（true）;失败（false,msg:错误信息）
                    //把data字符转换为对象类型
                    data = eval("("+data+")");
                    if(data.success){
                        $.messager.alert("提示","保存成功！","info");
                        //关闭窗口
                        $("#add").window("close");
                        //列表刷新
                        $("#userList").datagrid("reload");


                    }else{
                        $.messager.alert("提示","保存失败！"+data.msg,"error");
                    }
                }
            })
        });
        //编辑表单
        $("#editUser").click(function () {
            //判断只能选择一行
            var rows = $("#userList").datagrid("getSelections");
            if(rows.length!=1){
                $.messager.alert("提示","要选择一行数据修改！","warning");
                return ;
            }
            //表单回显
            $("#addUserInfo").form("load","<%=path %>/user/selectUserById?id="+rows[0].id);

            $("#add").window("open");
        });

        //（批量）删除用户
        $("#deleteUser").click(function () {
            //判断至少选取一条数据
            var rows = $("#userList").datagrid("getSelections");
            if(rows.length == 0){
                $.messager.alert("提示","至少选择一行数据！","warning");
                return ;
            }
            //格式：id=1&id=2&id=3...
            $.messager.confirm("提示","确认删除数据？",function (value) {
                if(value){
                    var idStr = "";
                    $(rows).each(function (i) {
                        idStr+= ("id=" + rows[i].id + "&");
                    });
                    idStr = idStr.substring(0,idStr.length - 1);
                    //传递到后台
                    $.post("<%=path %>/user/deleteUserInfo",idStr,function (data) {
                        if(data.success){
                            $.messager.alert("提示","删除成功！","info");
                            //列表刷新
                            $("#userList").datagrid("reload");


                        }else{
                            $.messager.alert("提示","删除失败！"+data.msg,"error");
                        }
                    },"json");
                }else {
                    $.messager.alert("提示","删除失败！"+data.msg,"error");
                }
            });
        });

    });

    

</script>
</body>
</html>
