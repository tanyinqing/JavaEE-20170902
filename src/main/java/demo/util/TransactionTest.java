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

            connection.setAutoCommit(false); // �ر��Զ��ύ������һ�� JDBC ����

            String sql="DELETE  FROM db.book";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.executeUpdate();
            /*
                DML ������INSERT UPDATE DELETE
             */

            int i=1/0;  // �쳣
            connection.commit(); // �������ύ
        } catch (Exception e) {
            e.printStackTrace();
            try {
                connection.rollback(); // �쳣���ع�
                connection.setAutoCommit(true); // ����Ϊ�Զ��ύ
            } catch (SQLException sql) {
                sql.printStackTrace();
            }
        } finally {
            DB.close(null, preparedStatement, connection);
        }
    }
}