<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 寒芒
  Date: 2019/12/22
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>订单信息</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<style>
    body{
        background-attachment: fixed;
        background-size:cover;
    }</style>
<body background="images/09.jpg" >
<!-- 基本的胶囊式导航菜单-->
<ul class="nav nav-pills ">
    <li class="active"><a href="#">首页</a></li>
    <li><a href="findALLProduct">查看所有商品</a></li>
    <li><a href="findOneItem">查看购物车</a></li>
    <li><a href="findOneOrder">查看订单</a> </li>
    <li><a href="register"><span class="glyphicon glyphicon-user"></span>新用户注册</a></li>
    <li><a href="login"><span class="glyphicon glyphicon-log-in"></span>登录</a></li>
    <li><a href="login-out">注销登录</a></li>


</ul>



<table width="100%" border=1>
    <tr>
        <td>订单编号</td>
        <td>客户姓名</td>
        <td>商品名称</td>
        <td>商品数量</td>
        <td>商品总价</td>
        <td>电话</td>
        <td>地址</td>

    </tr>
    <c:forEach items="${moder}" var="account">
        <tr>
            <td>${account.id}</td>
            <td> ${account.username}</td>
            <td>${account.pa}</td>
            <td>${account.num}</td>
            <td>${account.total}</td>
            <td>${account.phone}</td>
            <td>${account.address}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
