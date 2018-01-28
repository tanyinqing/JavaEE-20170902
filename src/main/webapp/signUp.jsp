<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/26 0026
  Time: 下午 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String emal=request.getParameter("email");
    String username=request.getParameter("username");
    String password=request.getParameter("password");

    String[] cites=request.getParameterValues("citiies");
    String[] hobbies=request.getParameterValues("hobbess");
//    Arrays.toString(cites) 取出数组内的值
    out.print(emal+","+username+","+password+","+ Arrays.toString(cites)+","+Arrays.toString(hobbies));
%>
</body>
</html>
