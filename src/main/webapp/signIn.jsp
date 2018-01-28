<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/26 0026
  Time: 下午 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    // todo JDBC
    // 查询数据库
    if (email.equals("tan") && password.equals("123")) {
//        跳转到主页面
        request.getRequestDispatcher("home.jsp").forward(request, response);
    } else {
        request.setAttribute("message", "非法的用户名");
        //页面跳转 并传送参数
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    out.print(email + "," + password);
%>

</body>
</html>
