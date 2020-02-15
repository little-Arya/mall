<%--
  Created by IntelliJ IDEA.
  User: 寒芒
  Date: 2019/12/11
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<style type="text/css">
    .goods_img{
        float: left;
        border: 1px solid #CCC;
        margin-right: 20px;
        width: 180px;
        height: 180px;
    }
    body{
        background-size:cover;
        background-size: 100%;
        background-repeat: no-repeat;
        background-attachment:fixed;
    }

    .bg {display: table;width: 100%;height: 100%;padding: 50px 0;text-align: center;color: #fff;background: url(images/08.jpg) no-repeat bottom center;background-color: #000;background-size: cover; background-attachment: fixed;}
    .my-navbar {padding:20px 0;transition: background 0.5s ease-in-out, padding 0.5s ease-in-out;}
    .my-navbar a{background:transparent !important;color:#fff !important}
    .my-navbar a:hover {color:#45bcf9 !important;background:transparent;outline:0}
    .my-navbar a {transition: color 0.5s ease-in-out;}/*-webkit-transition ;-moz-transition*/
    .top-nav {padding:0;background:#000;}
    button.navbar-toggle {background-color:#fbfbfb;}/*整个背景都是transparent透明的，会看不到，所以再次覆盖一下*/
    button.navbar-toggle > span.icon-bar {background-color:#dedede}

</style>
<head>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.1.min.js"></script>
    <script>
        $(function() {
            $(".add").click(function() {
                var t = $(this).parent().find('input[class*=text_box]');
                if(t.val()==""||undefined||null){
                    t.val(0);
                }
                t.val(parseInt(t.val()) + 1);

                setTotal();
            })
            $(".min").click(function() {
                var t = $(this).parent().find('input[class*=text_box]');
                if(t.val()==""||undefined||null){
                    t.val(0);
                }
                t.val(parseInt(t.val()) - 1)
                if(parseInt(t.val()) < 0) {
                    t.val(0);
                }
                setTotal();
            })
            $(".text_box").keyup(function(){
                var t = $(this).parent().find('input[class*=text_box]');
                if(parseInt(t.val())==""||undefined||null || isNaN(t.val())) {
                    t.val(0);
                }
                setTotal();
            })
            function setTotal() {
                var s = 0;
                $("#tab td").each(function() {
                    var t = $(this).find('input[class*=text_box]').val();
                    var p = $(this).find('span[class*=price]').text();
                    if(parseInt(t)==""||undefined||null || isNaN(t) || isNaN(parseInt(t))){
                        t=0;
                    }
                    <!-- s是计算得价格综合-->
                    s += parseInt(t) * parseFloat(p);

                });
                $("#total").html(s.toFixed(2));
            }
            setTotal();
        })

        $(function () {
            $("#submit").click(function () {
                alert("提交订单啦");
                var total=  $("#total").text();
                console.log(total);
                $("#inputtotal").val(total);
            })

        })

    </script>

    <script>
        $(window).scroll(function () {
            if ($(".navbar").offset().top > 50) {$(".navbar-fixed-top").addClass("top-nav");
            }else {$(".navbar-fixed-top").removeClass("top-nav");}
        })</script>


    <title>商品详情页</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>首页</title>
</head>

<body background="images/09.jpg">


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
            <a class="navbar-brand" href="index">首页</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="findALLProduct">查看所有商品</a></li>
                <li><a href="findOneItem">查看购物车</a></li>
                <li><a href="findOneOrder">查看订单</a> </li>
                <li><a href="register"><span class="glyphicon glyphicon-user"></span>新用户注册</a></li>
                <li><a href="login"><span class="glyphicon glyphicon-log-in"></span>登录</a></li>
                <li><a href="login-out">注销登录</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="bg"></div>




<div>

    <form  method="post" action="/saveitem" id="form">
        <table id="tab">
            <c:forEach items="${products}" var="item" varStatus="order" >
                <tr>
                    <td>
                        <div style=" width: 100%;height: 1px;
            border-top: solid #ACC0D8 2px;"></div>
                        <img  src="/upload/${item.img }" class="goods_img">
                        <div style="margin-left: 400px">
                            <input type="hidden" value="${item.id}" name="${item.id}">
                            <p name="name">${item.name}</p>
                            <span>单价:</span><span style="color: red;" class="price">${item.price}</span></br><br>
                            <input class="min" name="" type="button" value="-" />
                            <input class="text_box" name="${item.id}text_box" type="text" placeholder="0"/>
                            <input class="add" name="" type="button" value="+" /></br><br>
                            <span>描述：${item.detail}</span></div>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <nav class="navbar navbar-fixed-bottom "role="navigation">
            <p style="font-size: x-large;">总价：<label  id="total" style="color: red" ></label></p>
            <input type="hidden" id="inputtotal" name="total">
            <button type="submit" id="submit"  class="btn btn-primary btn-lg" style="right: 100px;margin-left: 1200px;" />结算</button>
        </nav>

    </form>

</div>
</body>
</html>
