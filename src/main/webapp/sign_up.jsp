<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/26 0026
  Time: 下午 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Sign up page</h1>
<form action="signUp.jsp">
    <input name="email" placeholder="Email"> <br>
    <input name="username" placeholder="username"> <br>
    <input type="password" name="password" placeholder="Passsword"><br>
    <select name="citiies" multiple>
        <option value="Beijing">Beijing</option>
        <option value="Shanghai">Shanghai</option>
        <option value="Nanjing">Nanjing</option>
    </select><br>
    <input type="checkbox" name="hobbess" value="TV">TV
    <input type="checkbox" name="hobbess" value="Movie">Movie
    <input type="checkbox" name="hobbess" value="Game">Game
    <br>
    <input type="submit" value="Sign in">
</form>
</body>
</html>
