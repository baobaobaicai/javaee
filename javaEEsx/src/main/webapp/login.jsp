<%--
  Created by IntelliJ IDEA.
  User: cyh
  Date: 2023/6/19
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="fkjava.ico" rel="shortcut icon" type="images/x-icon"/>
        <script type="text/javascript">
            function login() {
                if (!$("#verifyCode").val()){
                    alert("请输入验证码");
                }
                $.post("${pageContext.request.contextPath}/login",{
                    "verifyCode":$("#verifyCode").val()
                },function (response) {
                    if (response){
                        alert("登录验证通过");
                    }else {
                        alert("请输入正确的验证码");
                    }

                })


            }
            function changeValidateCode(obj) {
                var timenow=new Date().getTime();
                obj.src="/common/verifyCode?d="+timenow;

            }

        </script>
        <title>购物商城登录界面</title>
    </head>
    <div id="wrap" align="center">
        <form action="${pageContext.request.contextPath}/loginHandler" method="post">
        <p>
            <label for="usercode" >账号</label>
            <input type="text" id="usercode" name="usercode" value="${check.usercode}" placeholder="请输入用户名">
        </p>
        <p>
            <label for="userPassword" >密码</label>
            <input type="text" id="userPassword" name="userPassword" value="${check.userpassword}" placeholder="请输入密码">
        </p>
            <p>
            <div class="password clearfix">
            <img src="${pageContext.request.contextPath}/verifyCode" onclick="changeValidateCode(this)"/>
        </div>
            <div class="password clearfix">
                <input type="text" id="verifyCode" placeholder="请输入验证码" >
            </div>
        <div class="btn" type="submit" onclick="login()">
            <button>登录</button></div>
            <font color="red">${msg}</font>
        </form>
            <a href=""><button>注册</button></a>

    </div>
    </body>
</html>
