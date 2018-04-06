<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/26 0026
  Time: 下午 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script>
        $(function () {
            $('#email').blur(function () {
                $.ajax({
                    url: '/user', // request url
                    type: 'post', // request method: get, post, put, delete...
                    data: { // request data
                        email: $('#email').val(),
                        action: 'isEmailExisted'
                    },
                    success: function (res) { // success callback
                        if (res === 'true') {
                            $('small').text('Email is already existed.').css('color', 'red');
                        } else {
                            $('small').text('Email is available.').css('color', 'green');
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>
<h1>Sign up page</h1>
<%--<form action="signUp.jsp" method="post">--%>
<form action="/user" method="post">  //运用java来处理请求
    <input type="hidden" name="action" value="signUp">
    <input id="email" name="email" placeholder="Email" value="tom@tom.com"> <small></small><br>
    <input name="username" placeholder="username" value="tan"> <br>
    <input type="password" name="password" placeholder="Passsword" value="123"><br>
    <select name="citiies" multiple>
        <option value="Beijing">Beijing</option>
        <option value="Shanghai">Shanghai</option>
        <option value="Nanjing">Nanjing</option>
    </select><br>
    <input type="checkbox" name="hobbess" value="TV">TV
    <input type="checkbox" name="hobbess" value="Movie">Movie
    <input type="checkbox" name="hobbess" value="Game">Game
    <br>
    <input type="submit" value="Sign in">
</form>
${requestScope.message}
<%--<%
    String message= (String) request.getAttribute("message");
    if (message != null) {
        out.print(message);
    }
//    404是找不到页面
%>--%>
</body>
</html>
