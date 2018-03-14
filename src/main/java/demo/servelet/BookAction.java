package demo.servelet;

import demo.util.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @author mingfei.net@gmail.com
 * @link https://github.com/thu/JavaEE-20170902/
 * @since 22:53 14 Mar 2018
 */
@WebServlet("/book")
public class BookAction extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action.equals("add")) {
            add(req, resp);
        }
    }

    private void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String author = req.getParameter("author");
        String pubTime = req.getParameter("pubTime");
        double price = Double.parseDouble(req.getParameter("price"));
        int amount = Integer.parseInt(req.getParameter("amount"));

        String sql = "INSERT INTO db.book(title, author, pubTime, price, amount) VALUE (?, ?, ?, ?, ?)";
        Connection connection = DB.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, title);
            preparedStatement.setString(2, author);
            preparedStatement.setString(3, pubTime);
            preparedStatement.setDouble(4, price);
            preparedStatement.setInt(5, amount);

            preparedStatement.executeLargeUpdate();

            resp.sendRedirect("home.jsp");

            DB.close(null, preparedStatement, connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
