package demo.util;


import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;

public class MetaTest  {
    public static void main(String[] args) {
        Connection connection=DB.getConnection();
        try {
            //数据库的源数据
            DatabaseMetaData databaseMetaData=connection.getMetaData();

            System.out.println(databaseMetaData.getDatabaseMajorVersion());
            System.out.println(databaseMetaData.getDatabaseMinorVersion());
            System.out.println(databaseMetaData.getDatabaseProductName());
            System.out.println(databaseMetaData.getDatabaseProductVersion());
            DB.close(null,null,connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
