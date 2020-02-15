
<%--
  Created by IntelliJ IDEA.
  User: 寒芒
  Date: 2019/12/8
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>



<title>登录页面</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style  type="text/css">
    body {
        background-image: url(images/07.jpg);
        background-size:cover;
        background-size: 100%;
        background-repeat: no-repeat;

    }

    #login_frame {
        width: 400px;
        height: 260px;
        padding: 13px;
        position: absolute;
        left: 50%;
        top: 50%;
        margin-left: -200px;
        margin-top: -200px;
        background-color: rgba(240, 255, 255, 0.5);
        border-radius: 10px;
        text-align: center;
    }

    form p > * {
        display: inline-block;
        vertical-align: middle;
    }

    #image_logo {
        margin-top: 22px;
        width: 40px;
    }

    .label_input {
        font-size: 14px;
        font-family: 宋体;
        width: 65px;
        height: 28px;
        line-height: 28px;
        text-align: center;
        color: white;
        background-color: #3CD8FF;
        border-top-left-radius: 5px;
        border-bottom-left-radius: 5px;
    }

    .text_field {
        width: 278px;
        height: 28px;
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
        border: 0;
    }

    #login_control {
        padding: 0 28px;
    }
</style>
</head>

<body background="images/09.jpg">



<!-- 基本的胶囊式导航菜单-->
<ul class="nav nav-pills">
    <li class="active"><a href="index">首页</a></li>
    <li><a href="findALLProduct">查看所有商品</a></li>
    <li><a href="findOneItem">查看购物车</a></li>
    <li><a href="findOneOrder">查看订单</a> </li>
    <li><a href="register"><span class="glyphicon glyphicon-user"></span>新用户注册</a></li>
    <li><a href="login"><span class="glyphicon glyphicon-log-in"></span>登录</a></li>
    <li><a href="login-out">注销登录</a></li>


</ul>



<div id="login_frame">
    <p id="image_logo"><img src="images/06.png" align="center"></p>

    <form method = "POST" action = "loginServlet">

        <p><label class="label_input">用户名</label><input type = "text" name = "username"class="text_field"required="required"placeholder="请输入登录账号" autofocus/><br><br></p>
        <p><label class="label_input">密码</label><input type = "password" name = "password"class="text_field"required="required"placeholder="请输入密码"/><br><br></p>


        <div class="radio-box">
            <input type="radio" id="radio-2" checked name="type" value="2" />
            <label for="radio-1">学生</label>&nbsp;&nbsp;
            <input type="radio" id="radio-1"  name="type" value="1" />
            <label for="radio-2">管理员</label>&nbsp;&nbsp;<a href="register">注册</a>
        </div>

        <div id="login_control">

            <input type = "submit" value = "登陆">&nbsp;&nbsp;&nbsp;
            <input type = "reset" value = "重置"></div>
    </form>
</div>




</body>
</html>
