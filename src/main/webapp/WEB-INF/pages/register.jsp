<%--
  Created by IntelliJ IDEA.
  User: 寒芒
  Date: 2019/12/4
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <title>注册页面</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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


<center>

<form action="save" method="post">
    <h2>用户注册</h2>
    姓名：<input type="text" name="username" id="username" required="required"placeholder="请输入用户名"  onblur="checkName()"/>
    <span id="username_span"></span><br/>
    密码：<input type="password" name="password" id="st2"  required="required" placeholder="请输入密码" onblur="checkPas()"/><br/>
    <input type="submit" value="保存" />&nbsp;&nbsp;<input type="reset" value="重置">
</form>
</center>


<script>
    /*自定义通过Id来获取元素的函数 */
    function $(id) {
        return document.getElementById(id)
    }

    /*提交按钮：提交前检测 */
    function checkPas() {
        // alert("111")
        //检测用户名是否为空
       // var st1 = $("username").value;
        //if(st1.length<6||st1.length>16){
          //  alert("用户名的长度为6-16位！");
           // return false ;
        //};
        //检测密码是否为11位数字
        var st2 = $("st2").value;
        if(st2.length<6 ){
            alert("密码不可以少于六位！");
            return false ;
        };
    }

    function  checkName() {
        var f=false;
        //javascript所有的变量都是以var定义的
        //javascript的变量属于弱类型
        //获取用户输入的用户名
        //var name = document.getElementById("username").value;
        var name = $("username").value;
        //去除字符串两端空格
        name=name.trim();
        //判断是否为空
        if(name==""){
            document.getElementById("username_span").innerHTML="用户名不能为空";
        }else if(name.length<6||name.length>16){
            document.getElementById("username_span").innerHTML="用户名的长度为6-16位";
        }
        else{
            document.getElementById("username_span").innerHTML="";
            //校验用户名是否存在
            //使用ajax异步校验用户名
            $.ajax({
                url:"/checkName",
                type:"post",
                data:{"username":name},//json数据格式的用户名从jsp传递给controller
                dataType:"json",
                async:false,//让ajax执行代码顺序同步
                success:function(data){
                    if(data.msg=="no"){
                        document.getElementById("username_span").innerHTML="用户名已存在";

                    }else{
                        document.getElementById("username_span").innerHTML="用户名可用";
                        f=true;
                    }
                }
            });

        }
        return f;


    }

</script>
</body>
</html>
