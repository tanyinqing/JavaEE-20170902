<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
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
    new Driver();
    Connection connection= DriverManager.getConnection("jdbc:mysql:///?user=root&password=system");
    String sql="SELECT * FROM db.user WHERE email=? AND password=?";
    PreparedStatement preparedStatement=connection.prepareStatement(sql);
    preparedStatement.setString(1,email);
    preparedStatement.setString(2,password);
    ResultSet resultSet=preparedStatement.executeQuery();

    String username=null;
    if (resultSet.next()) {
        username=resultSet.getString("username");
    }
    resultSet.close();
    preparedStatement.close();
    connection.close();
    // 查询数据库
    if (username!=null) {
//        跳转到主页面
      //  request.setAttribute("username",username); 只有效一次  请求中
        session.setAttribute("username",username);//一次会话中都会有效
//        request.getRequestDispatcher("home.jsp").forward(request, response);
//       刷新也必须用重定向 刷新不会出错
        response.sendRedirect("home.jsp");
    } else {
        request.setAttribute("message", "非法的用户名");
//        登录失败 用转发跳转比较合适
        //页面跳转 并传送参数  转发跳转
       request.getRequestDispatcher("index.jsp").forward(request, response);
//       重定向 不能保存消息
        //     response.sendRedirect("index.jsp");
    }
    out.print(email + "," + password);
%>

  <%--
   1. 登录成功时 转发与重定向？
    2. 登录失败时，属性message是放在request内，还是放在session内
    --%>

</body>
</html>
