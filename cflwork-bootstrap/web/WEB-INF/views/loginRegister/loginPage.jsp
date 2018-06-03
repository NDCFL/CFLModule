<%--
  Created by IntelliJ IDEA.
  User: jb9
  Date: 2018/5/28
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>APP</title>
    <link type="text/css" rel="stylesheet" href="<%=path%>/static/css/normalize.css" />
    <link type="text/css" rel="stylesheet" href="<%=path%>/static/css/demo.css"/>
    <!--必要样式-->
    <link type="text/css" rel="stylesheet" href="<%=path%>/static/css/component.css" />
    <!--[if IE]>
    <script src="<%=path%>/static/js/html5.js"></script>
    <![endif]-->
</head>

<body>
<div class="container demo-1">
    <div class="content">
        <div id="large-header" class="large-header">
            <canvas id="demo-canvas"></canvas>
            <div class="logo_box">
                <h3>欢迎登录</h3>
                <p class="tip-error" style="text-align: center;color: red;"></p>
                <form action="#" name="f" method="post">
                    <div class="input_outer">
                        <span class="u_user"></span>
                        <input id="account" name="account" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入账户">
                    </div>
                    <div class="input_outer">
                        <span class="us_uer"></span>
                        <input id="loginpassword" name="password" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入密码">
                    </div>
                    <div class="mb2"><a class="act-but submit" id="login" style="color: #FFFFFF">登录</a></div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js" tppabs="http://yanshi.sucaihuo.com/jquery/24/2484/demo/js/TweenLite.min.js"></script>
<script src="<%=path%>/static/js/plugins/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/TweenLite.min.js" tppabs="http://yanshi.sucaihuo.com/jquery/24/2484/demo/js/TweenLite.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/EasePack.min.js" tppabs="http://yanshi.sucaihuo.com/jquery/24/2484/demo/js/EasePack.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/rAF.js" tppabs="http://yanshi.sucaihuo.com/jquery/24/2484/demo/js/rAF.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/demo-1.js" tppabs="http://yanshi.sucaihuo.com/jquery/24/2484/demo/js/demo-1.js"></script>
</body>
<script>
    $("#login").click(function(){
        var loginphone = $("#account").val();
        var loginpassword = $("#loginpassword").val();
        if(!loginphone){
            $(".tip-error").html("账户不能为空");
            return;
        }
        if(!loginpassword){
            $(".tip-error").html("密码不能为空");
            return;
        }
        var load=layer.load(0, {shade: false});
        $.post(
            "/user/getInfo",
            {
                phone:loginphone,
                password:loginpassword
            },
            function(data) {
                layer.close(load);
                $(".tip-error").html(data.message);
                if(data.message.indexOf("成功")>-1){
                    location.href="<%=path%>/appUrl/appUrlPage";
                }
            },
            "json"
        );
    });
</script>
</html>