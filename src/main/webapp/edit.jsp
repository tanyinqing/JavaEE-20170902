<%@ page import="demo.model.Book" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/26 0026
  Time: 下午 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--<%
    String username= (String) session.getAttribute("username");
    if (username==null){
        response.sendRedirect("index.jsp");
    }
%>--%>
<c:if test="${sessionScope.username eq null}">
    <c:redirect url="index.jsp"/>
</c:if>
<h1>edit page</h1>
<h1>home page session id: <%=session.getId()%></h1>
<p>
    <%--<%=session.getAttribute("username")%>--%>
    ${requestScope.username}
</p>
<hr>
<a href="/user?action=signOut">Sign out</a>
<hr>
<hr>
<a href="test.jsp">go to test page</a>
<hr>
<%--添加后 更新一下--%>
<form action="/book" method="post">
    <input type="hidden" name="action" value="modify">
    <%--<input type="hidden" name="id" value="<%=((Book)session.getAttribute("book")).getId()%>"/>--%>
    <input type="hidden" name="id" value="${sessionScope.book.id}"/>
    <input name="title" placeholder="Title" value="<%=((Book)session.getAttribute("book")).getTitle()%>"><br>
    <input name="author" placeholder="Author" value="<%=((Book)session.getAttribute("book")).getAuthor()%>"><br>
    <input name="pubTime" placeholder="Publish time" value="<%=((Book)session.getAttribute("book")).getPubTime()%>"><br>
    <input name="price" placeholder="Price" value="<%=((Book)session.getAttribute("book")).getPrice()%>"><br>
    <input name="amount" placeholder="Amount" value="<%=((Book)session.getAttribute("book")).getAmount()%>"><br>
    Picture <input type="file" name="picture" value="<%=((Book)session.getAttribute("book")).getPicture()%>"><br>
    <%-- <input name="title" placeholder="Title" value="<%=((Book)session.getAttribute("book")).getTitle()%>"><br>
    <input name="author" placeholder="Author" value="<%=((Book)session.getAttribute("book")).getAuthor()%>"><br>
    <input name="pubTime" placeholder="Publish time" value="<%=((Book)session.getAttribute("book")).getPubTime()%>"><br>
    <input name="price" placeholder="Price" value="<%=((Book)session.getAttribute("book")).getPrice()%>"><br>
    <input name="amount" placeholder="Amount" value="<%=((Book)session.getAttribute("book")).getAmount()%>"><br>
    Picture <input type="file" name="picture" value="<%=((Book)session.getAttribute("book")).getPicture()%>"><br>--%>
    <input type="submit" value="save">
</form>


</body>
</html>
