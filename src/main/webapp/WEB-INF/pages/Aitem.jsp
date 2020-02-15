<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 寒芒
  Date: 2019/12/15
  Time: 0:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<style>
    body{
        background-size:cover;
        background-size: 100%;
        background-repeat: no-repeat;
        background-attachment:fixed;

    }
</style>
<head>
    <title>购物车详情页</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body  background="images/09.jpg">
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

<form action="/addOrders" method="post">


<table width="100%" border=1>
<tr>
    <td>订单编号</td>
    <td>用户名</td>
    <td>商品名称</td>
    <td>数量</td>
    <td>总价格</td>
    <td>操作</td>
</tr>
<c:forEach items="${Aitem}" var="list">
    <tr>
        <td>${list.id}</td>
        <td>${list.username}</td>
        <td>${list.prname }</td>
        <td>${list.num}</td>
        <td>${list.total }</td>
        <td><a href="deleteCartById?id=${list.id }">删除</a></td>
    </tr>
    <input type="hidden" name="id" value="${list.id}">
    <input type="hidden" name="username" value="${list.username}"/>
    <input type="hidden" name="pid" value="${list.pid}"/>
    <input type="hidden" name="prname" value="${list.prname}"/>
    <input type="hidden" name="num" value="${list.num}"/>
    <input type="hidden" name="total" value="${list.total}"/>
</c:forEach>
</table>
    <br><br><br><br>

    <center>
    收货地址： <input type="text" name="address" required="required" style="width: 250px"><br>
    电话号码：<input type="text" name="phone" required="required" style="width: 250px"><br>
    <input type="submit" value="提交">
    </center>

</form>

</body>
</html>
