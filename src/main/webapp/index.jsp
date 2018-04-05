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
  <h1>index page session id: <%=session.getId()%></h1>
  <h1>index page</h1>
 <%--默认get提交--%>
  <%--<form action="signIn.jsp" method="post">--%>
 <%--运用页面处理请求--%>
  <%--<form action="/signIn" method="post">  //运用java来处理请求--%>
  <form action="/user" method="post">
      <%--运用java来处理请求--%>
   <input type="hidden" name="action" value="signIn">
    <input name="email" placeholder="Email" value="tom@tom.com"> <br>
    <input type="password" name="password" placeholder="Passsword" value="123"> <br>
    <input type="submit" value="Sign in">
  </form>
  <%--下面的内容是小脚本--%>
  ${requestScope.message}
 <%-- <%
  String message=(String)request.getAttribute("message");
    if (message != null) {
out.print(message);
    }
  %>--%>
  <hr>
  <a href="sign_up.jsp" >sign up</a>
  </body>
</html>
