<!DOCTYPE html>
<%@ page language="java" isErrorPage="true" contentType="text/html; charset=UTF-8" %>
<!--这是一个典型的JSP，它包含了JSP中常用的元素  这个注释源代码中能看到-->
<%!
//    这个是脚本元素  声明
    String getDate() {
        return new java.util.Date().toString();
    }
    int count = 10;


%>
<html>
<head><title>一个典型的JSP</title></head>
<body>
<%--这个是动作元素  引入一个页面--%>
<jsp:include page="header.jsp"/>
<%--以下是输出一个表格--%>
<div style="text-align: center" >
    <table style="margin: 0 auto;">
        <tr style="background: #777;">
            <th>----------------</th>
        </tr>
        <%
            // color java代码注释  这个是脚本元素  小脚本
            String c1 = "#9cf", c2 = "#8c3";
            for (int i = 0; i < count; i++) {
                String color;
                if (i % 2 == 0) {
                    color = c1;
                } else {
                    color = c2;
                }
//                out jsp页面的隐式对象
                out.println("<tr style=\"background:" + color + ";\"><td>-</td></tr>");
//                request
//                response

            }
        %>
    </table>
    <hr/>
    当前的时间是：
    <%-- 下面是使用表达式的例子 源代码中看不到的注释 --%>
    <%--这个是脚本元素 表达式--%>
    <%=getDate()%>
    <br>
    来访用户的ip地址
    <%=request.getRemoteAddr()%>
</div>
</body>
</html>

<%--http://localhost:8080/classic.jsp   --%>