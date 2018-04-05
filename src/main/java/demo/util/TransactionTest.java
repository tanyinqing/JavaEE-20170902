package demo.util;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TransactionTest {
    public static void main(String[] args) {
        Connection connection = DB.getConnection();
        PreparedStatement preparedStatement = null;
        try {

            if (connection == null) {
                return;
            }

            connection.setAutoCommit(false); // 关闭自动提交：开启一次 JDBC 事务

            String sql="DELETE  FROM db.book";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.executeUpdate();
            /*
                DML 操作：INSERT UPDATE DELETE
             */

            int i=1/0;  // 异常
            connection.commit(); // 正常：提交
        } catch (Exception e) {
            e.printStackTrace();
            try {
                connection.rollback(); // 异常：回滚
                connection.setAutoCommit(true); // 重置为自动提交
            } catch (SQLException sql) {
                sql.printStackTrace();
            }
        } finally {
            DB.close(null, preparedStatement, connection);
        }
    }
}