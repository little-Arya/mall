<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 寒芒
  Date: 2019/12/9
  Time: 13:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style type="text/css">
    #images{
        width: 250px;
        height: 250px;
    }
</style>
<head>

    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        html, body {
            background-image: url(images/16.jpg);
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

    <title>修改信息页面</title>
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
            <a class="navbar-brand" href="#">添加商品</a>
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


<center>
    <form action="doupdata?id=<%=request.getAttribute("ids")%>" method="post">
    <input type="hidden" name="id" value="${ids}"><br/>
        名称:<input type="text" name="name" style="width: 250px" value="<%=request.getAttribute("name")%>"><br/>
        价格:<input type="text" name="price" style="width: 250px" value="<%=request.getAttribute("price")%>"><br/>
        <img id="images" src="/upload/<%=request.getAttribute("img")%>"><br>
        <input type="hidden" name="img" value="<%=request.getAttribute("img")%>"><br/>
        描述：

        <textarea rows="10" cols="30" name="detail"><%=request.getAttribute("detail")%></textarea>
        <br>
    <input type="submit" value="提交">
    </form>
</center>




</table>
</body>
</html>
