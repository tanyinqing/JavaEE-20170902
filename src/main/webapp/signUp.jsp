<%@ page import="java.util.Arrays" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.rmi.ConnectException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
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
    String email=request.getParameter("email");
    String username=request.getParameter("username");
    String password=request.getParameter("password");

    String[] cites=request.getParameterValues("citiies");
    String[] hobbies=request.getParameterValues("hobbess");
//    Arrays.toString(cites) 取出数组内的值

    //todo JDBC
    new Driver();
    Connection connection= DriverManager.getConnection("jdbc:mysql:///?user=root&password=system");
    String sql="INSERT INTO db.user VALUE(NULL ,?,?,?)";
    PreparedStatement preparedStatement=connection.prepareStatement(sql);
    preparedStatement.setString(1,username);
    preparedStatement.setString(2,password);
    preparedStatement.setString(3,email);
    preparedStatement.executeUpdate();

    preparedStatement.close();
    connection.close();
    out.print(password+","+username+","+password+","+ Arrays.toString(cites)+","+Arrays.toString(hobbies));

    request.getRequestDispatcher("index.jsp").forward(request,response);
%>
</body>
</html>
