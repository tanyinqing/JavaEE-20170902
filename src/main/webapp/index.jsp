<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/23 0023
  Time: 下午 9:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h1>index page</h1>
  <form action="signIn.jsp">
    <input name="email" placeholder="Email"> <br>
    <input type="password" name="password" placeholder="Passsword"> <br>
    <input type="submit" value="Sign in">
  </form>
  <%--下面的内容是小脚本--%>
  <%
  String message=(String)request.getAttribute("message");
    if (message != null) {
out.print(message);
    }
  %>
  <hr>
  <a href="sign_up.jsp" >sign up</a>
  </body>
</html>
