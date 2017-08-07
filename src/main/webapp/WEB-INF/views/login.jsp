<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta http-equiv="x-ua-compatible" content="IE=edge,chrome=1"/>
    <title></title>

    <link rel="icon" href="../static/core/images/ico_img/act.png" type="image/x-icon"/>
    <link rel="shortcut icon" href="../static/core/images/ico_img/act.png" type="image/x-icon"/>
    <link rel="apple-touch-icon" href="../static/core/images/ico_img/act.png"/>
    <link rel="apple-touch-icon-precomposed" href="../static/core/images/ico_img/act.png"/>

    <link rel="stylesheet" href="${ctx}/static/css/login.css"/>
    <script type="text/javascript" src="${ctx}/static/js/jquery-1.11.1.min.js"></script>

</head>

<body>

<div style="border-bottom: 4px solid #6DB110; min-width: 1060px;">
    <div style="height: 85px; margin: 0 auto; position: relative; width: 980px;">
        <img src="" style="width: 300px; height: 75px;">
    </div>
</div>

<div class="login_container">
    <div class="login_box">

        <div class="left">
            <img src="" style="width: 450px; height: 300px;"/>
        </div>

        <form id="loginForm" name="loginForm" action="${ctx}/passport/login" method="post">
            <div class="right">
                <div class="form_box">
                    <div class="item">
                        <div class="label">
                            <span class="title">用户名</span>
                            <span class="tips" id="userTip" style="display:none;">&nbsp;&nbsp;用户名不能为空</span>
                            <a href="javascript:;"
                               style="color: #0080C6; font-family: microsoft yahei; font-weight: bold;">免费注册</a>
                        </div>
                        <br/>

                        <div class="field">
                            <input type="text" tabindex="1" name="username" id="username" class="username common"
                                   onkeypress="javascript: if(event.keyCode == 13) doLogin(document.loginForm)"
                                   maxlength=20/>
                            <a class="clear" href="#" onfocus="this.blur();"></a>
                        </div>
                    </div>
                    <div class="item">
                        <div class="label">
                            <span class="title">密&nbsp;&nbsp;&nbsp;码</span>
                            <span class="tips" id="passwordTip" style="display:none;">&nbsp;&nbsp;密码不能为空</span>
                            <a href="javascript:;">忘记密码?</a>
                        </div>
                        <br/>

                        <div class="field">
                            <input type="password" name="password" id="password" tabindex="2"
                                   class="password common" maxlength=20 tabindex="2"
                                   onkeypress="javascript: if(event.keyCode == 13) doLogin(document.loginForm)"/>
                            <a class="clear" href="#" onfocus="this.blur();"></a>
                        </div>
                    </div>
                    <div class="item">
                        <div class="label">
                            <span class="title">验证码&nbsp;&nbsp;</span>
                            <span class="tips" style="display: none;" id="captchaTip">验证码错误</span>
                        </div>
                        <br/>

                        <div class="field" style="position: relative;">
                            <input type="text" id="captcha" name="captcha"
                                   onkeypress="javascript: if(event.keyCode == 13) doLogin(document.loginForm)"
                                   class="captcha common exception" tabindex="3" maxlength="4"/>
                            <img id="checkCode" src=""
                                 style="border: 1px dashed gray; width: 80px; height: 32px; position: absolute; margin: 0px 3px 0 3px;"/>
                            <a href="#"
                               style="position: absolute; margin-left: 90px; margin-top: 5px; font-size: 12px; font-family: microsoft yahei;">看不清，换一张</a>
                            <a class="clear" href="#" style="left:63px;" onfocus="this.blur();"></a>
                        </div>
                    </div>
                    <br/>

                    <div class="submit">
                        <img style="cursor:pointer;"
                             src="https://www.ocj.com.cn/common/images/passport/newlogin.submit.jpg" alt="登录"
                             onClick="javascript:doLogin(document.loginForm);">
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<div style="min-width: 1060px; text-align: center; margin-top: 300px;">
    <p style="padding-top: 30px; font: 12px/1.5 Tahoma,Helvetica,Arial,'宋体';">莫愁网络科技有限公司 www.mochousoft.com
        鄂ICP备10209250号 Copyright &copy;
        2010 - 2013 mochousoft.com All Rights Reserved</p>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $("#captcha").val("");
        if ($("#username").val() != null && $("#username").val() != "") {
            $("#username").siblings('.clear').addClass('clear_show');
        }

        $('.login_box .common').focus(
            function () {
                $(this).addClass('blue');
            }).blur(function () {
            $(this).removeClass('blue');
        });

        /* 侦听键盘输入 */
        var toggleControl = function (event) {
            var curobj = $(event.target);
            if (curobj.val() != '') {
                curobj.removeClass('error');
                if (curobj.attr("id") == "username") {
                    $("#userTip").hide();
                } else if (curobj.attr("id") == "password") {
                    $("#passwordTip").hide();
                } else {
                    $("#captchaTip").hide();
                }
                curobj.siblings('.clear').addClass('clear_show');
            } else {
                curobj.siblings('.clear').removeClass('clear_show');
            }
        };

        $('.login_box .username').bind('keyup', toggleControl);
        $('.login_box .password').bind('keyup', toggleControl);
        $('.login_box .captcha').bind('keyup', toggleControl);

        /* 清空输入 */
        $('.login_box .clear').click(function (event) {
            event.preventDefault();
            $(this).siblings('.common').removeClass('error');
            $(this).siblings('.common').addClass('blue');
            $(this).siblings('.common').val('');
            $(this).siblings('.common').focus();
            $(this).removeClass('clear_show');
        });
    });

    function doLogin(loginForm) {
        var temp = 0;
        if (loginForm.username.value == "") {
            $("#userTip").show();
            $("#username").addClass("error");
            loginForm.username.focus;
            temp++;
        }
        if (loginForm.password.value == "") {
            $("#passwordTip").show();
            $("#password").addClass("error");
            loginForm.password.focus;
            temp++;
        }
        if (loginForm.captcha.value == "") {
            $("#captchaTip").show();
            $('#captcha').addClass('error');
            loginForm.captcha.focus;
            temp++;
        }
        if (temp != 0) {
            return false;
        }

        $.ajax({
            type : 'POST',
            url : '${ctx}/passport/login',
            data : $("#loginForm").serialize(),
            success : function(data) {
                data = JSON.parse(data);
                if (data.status) {
                    window.location.href = '${ctx}';
                } else {
                    alert(data.message);
                }
            }
        });
    }

</script>

</body>
</html>
