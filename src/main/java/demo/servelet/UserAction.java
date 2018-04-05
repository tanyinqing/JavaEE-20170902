package demo.servelet;

import com.mysql.jdbc.Driver;
import demo.util.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.dsig.SignedInfo;
import java.io.IOException;
import java.sql.*;

@WebServlet("/user")
public class UserAction extends HttpServlet {

    private static final String URL = "jdbc:mysql:///?user=root&password=system";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action.equals("signIn")) {
            signIn(req, resp);
        }
        if (action.equals("signUp")) {
            signUp(req, resp);
        }
        if (action.equals("signOut")) {
            signOut(req, resp);
        }
    }

    private void signIn(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            Connection connection = DB.getConnection();
            String sql = "SELECT * FROM db.user WHERE email = ? AND password = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                req.getSession().setAttribute("username", resultSet.getString("username"));
               // resp.sendRedirect("home.jsp");//跳转到home界面
                resp.sendRedirect("/book?action=queryAll");//查询和显示全部图书的信息
            } else {
                req.setAttribute("message", "Invalid email or password.");
                req.getRequestDispatcher("index.jsp").forward(req, resp);
            }

            DB.close(resultSet, preparedStatement, connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void signUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            Connection connection = DB.getConnection();
            String queryEmail = "SELECT * FROM db.user WHERE email = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(queryEmail);
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();

            //如果邮箱存在就什么也不做，所以重复的邮箱注册会出错
            if (resultSet.next()) {
                req.setAttribute("message", "Email is already existed.");
                req.getRequestDispatcher("sign-up.jsp").forward(req, resp);
                return;
            }

            String sql = "INSERT INTO db.user VALUE(NULL, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, username);
            preparedStatement.setString(3, password);
            preparedStatement.executeUpdate(); // DML INSERT UPDATE DELETE

            DB.close(resultSet, preparedStatement, connection);

            resp.sendRedirect("index.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void signOut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().invalidate();
        resp.sendRedirect("index.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}

