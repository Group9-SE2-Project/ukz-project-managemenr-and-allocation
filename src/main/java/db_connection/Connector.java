package db_connection;

import java.sql.*;

public class Connector {
    private static Connection con;

    public static Connection getConnection() {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectallocationdb","root","CarlTech@_56");
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
}