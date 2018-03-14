package demo.servelet;
import com.mysql.jdbc.Driver;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
@WebServlet("/signIn")  //对一个类进行绑定
public class SignServlet extends HttpServlet{
    @Override//2个参数 一个是请求  一个是响应
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      /*  String email = req.getParameter("email");
        String password = req.getParameter("password");

        System.out.println(email + password);

        try {
            new Driver();
            Connection connection = DriverManager.getConnection("jdbc:mysql:///?user=root&password=system");

            String sql = "SELECT * FROM db.user WHERE email = ? AND password = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                req.getSession().setAttribute("username", resultSet.getString("username"));
                resp.sendRedirect("home.jsp");
            } else {
                req.setAttribute("message", "Invalid email or password.");
                req.getRequestDispatcher("index.jsp").forward(req, resp);
            }

            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }*/
    }
}
