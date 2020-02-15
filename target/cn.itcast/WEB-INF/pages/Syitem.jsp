<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 寒芒
  Date: 2019/12/15
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<style type="text/css">
    #images{
        width: 100px;
        height: 100px;
    }
</style>
<head>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        html, body {
            background-image: url(images/09.jpg);
            background-size:cover;
            background-size: 100%;
            background-repeat: no-repeat;
        } /*非常重要的样式让背景图片100%适应整个屏幕*/
        .bg {display: table;width: 100%;height: 100%;padding: 50px 0;text-align: center;color: #fff;background: url(images/08.jpg) no-repeat bottom center;background-color: #000;background-size: cover;}
        .my-navbar {padding:20px 0;transition: background 0.5s ease-in-out, padding 0.5s ease-in-out;}
        .my-navbar a{background:transparent !important;color:#fff !important}
        .my-navbar a:hover {color:#45bcf9 !important;background:transparent;outline:0}
        .my-navbar a {transition: color 0.5s ease-in-out;}/*-webkit-transition ;-moz-transition*/
        .top-nav {padding:0;background:#000;}
        button.navbar-toggle {background-color:#fbfbfb;}/*整个背景都是transparent透明的，会看不到，所以再次覆盖一下*/
        button.navbar-toggle > span.icon-bar {background-color:#dedede}
    </style>


    <title>订单页</title>
</head>
<body>


<nav class="navbar navbar-fixed-top my-navbar" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#example-navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="addaccount">添加商品</a>
        </div>
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="accountfindAll">修改商品</a></li>
                <li><a href="accountfindAll">删除商品</a></li>
                <li><a href="accountfindAll">查询商品</a> </li>
                <li><a href="findAllItem">查询购物车</a></li>
                <li><a href="findAllOrder">查询订单</a> </li>
                <li><a href="login-out">退出</a></li>


            </ul>

        </div>

    </div>
</nav>
<div class="bg"></div>


<script>
    $(window).scroll(function () {
        if ($(".navbar").offset().top > 50) {$(".navbar-fixed-top").addClass("top-nav");
        }else {$(".navbar-fixed-top").removeClass("top-nav");}
    })</script>










<table width="100%" border=1>
    <tr>
        <td>编号</td>
        <td>用户名</td>
        <td>商品名称</td>
        <td>商品数量</td>
        <td>总价格</td>
    </tr>
    <c:forEach items="${Syitem}" var="account">
    <tr>
        <td>${account.id}</td>
        <td>${account.username}</td>
        <td>${account.prname }</td>
        <td>${account.num}</td>
        <td>${account.total }</td>
    </tr>
    </c:forEach>
</body>
</html>
