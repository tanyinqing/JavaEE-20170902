<%@ page import="demo.model.Book" %>
<%@ page import="java.util.List" %><%--
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
<%--添加后 更新一下--%>
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
<hr>
<%--登录进来的时候查询下图书--%>
<%--action中调用--%>
<table>
    <tr>
        <th>ID</th>
        <th>TITLE</th>
        <th>AUTHOR</th>
        <th>PUBLISH TIME</th>
        <th>PRICE</th>
        <th>AMOUNT</th>
        <th>PICTURE</th>
        <th colspan="2">OPERATION</th>
    </tr>
    <%--小脚本  一个方法放到了2个小脚本中--%>
    <%
    List<Book> books= (List<Book>) session.getAttribute("books");
    for(Book book:books){
 %>
    <tr>
        <td><%= book.getId()%></td>
        <td><%= book.getTitle()%></td>
        <td><%= book.getAuthor()%></td>
        <td><%= book.getPubTime()%></td>
        <td><%= book.getPrice()%></td>
        <td><%= book.getAmount()%></td>
        <td><%= book.getPicture()%></td>
        <%--<%=book.getId()%> 这个是表达式--%>
        <td><a href="/book?action=search&id=<%=book.getId()%>">EDIT</a></td>
        <td><a href="/book?action=search&id=<%=book.getId()%>">REMOVE</a></td>
    </tr>
    <%--小脚本--%>
    <%
    }
    %>

</table>
</body>
</html>
