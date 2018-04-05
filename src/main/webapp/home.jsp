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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
    <script>
function del() {
    return confirm("delete?");
}
    </script>
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

<h1>home page</h1>
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
<pre>
    c:choose
    c:when
    c:when
    c:otherwise
</pre>
<%--登录进来的时候查询下图书--%>
<%--action中调用--%>

<table border="1">
    <c:choose>
         <%-- <c:when test="${sessionScope.books[0] eq null}">
              NO RECORDS1.
          </c:when>--%>
        <c:when test="${fn:length(sessionScope.books) eq 0}">
            NO RECORDS2.
        </c:when>
        <c:otherwise>
            <tr>
                <th>count</th>
                <th>TITLE</th>
                <th>AUTHOR</th>
                <th>PUBLISH TIME</th>
                <th>PRICE</th>
                <th>AMOUNT</th>
                <th>PICTURE</th>
                <th colspan="2">OPERATION</th>
            </tr>
        </c:otherwise>
    </c:choose>

    <%--运用了forEach标签--%>
    <%--begin 从第几条记录开始--%>
    <%--end 从第几条记录结束--%>
    <%--step 跳过几个--%>
    <%--varStatus id变成序号--%>
    <c:forEach var="book" items="${sessionScope.books}" varStatus="vs" begin="0" end="6" step="1">
     <tr>
         <%--<td>${book.id}</td>--%>
         <td>${vs.index+1}</td>
         <td>${book.title}</td>
         <td>${book.author}</td>
         <td>${book.pubTime}</td>
         <td>${book.price}</td>
         <td>${book.amount}</td>
         <td>${book.picture}</td>
         <td><a href="/book?action=search&id=${book.id}">EDIT</a></td>
         <td><a href="/book?action=remove&id=${book.id}">REMOVE</a></td>
     </tr>
    </c:forEach>
    <%--小脚本  一个方法放到了2个小脚本中--%>
  <%--  <%
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
        &lt;%&ndash;<%=book.getId()%> 这个是表达式&ndash;%&gt;
        <td><a href="/book?action=search&id=<%=book.getId()%>">EDIT</a></td>
        <td><a href="/book?action=remove&id=<%=book.getId()%>" onclick="return del()">REMOVE</a></td>
    </tr>
    &lt;%&ndash;小脚本&ndash;%&gt;
    <%
    }
    %>--%>

</table>
</body>
</html>
