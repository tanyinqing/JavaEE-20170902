<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/26 0026
  Time: 下午 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String username= (String) session.getAttribute("username");
    if (username==null){
        response.sendRedirect("index.jsp");
    }
%>
<h1>home page</h1>
<h1>home page session id: <%=session.getId()%></h1>
<p>
    <%=session.getAttribute("username")%>
</p>
<hr>
<a href="/user?action=signOut">Sign out</a>
<hr>
<hr>
<a href="test.jsp">go to test page</a>
<hr>
<form action="/book" method="post">
    <input type="hidden" name="action" value="add">
    <input name="title" placeholder="Title"><br>
    <input name="author" placeholder="Author"><br>
    <input name="pubTime" placeholder="Publish time"><br>
    <input name="price" placeholder="Price"><br>
    <input name="amount" placeholder="Amount"><br>
    Picture <input type="file" name="picture"><br>
    <input type="submit" value="Add Book">
</form>
</body>
</html>
