package demo.servelet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/signIn")  //对一个类进行绑定
public class SignServlet extends HttpServlet{
    @Override//2个参数 一个是请求  一个是响应
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String email=req.getParameter("email");
       String password=req.getParameter("password");
       System.out.print(email+"  "+password);
    }
}
