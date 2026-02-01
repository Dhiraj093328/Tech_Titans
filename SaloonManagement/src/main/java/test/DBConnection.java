package test;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() 
    {
        Connection con = null;
        try 
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/saloon_management", "root", "root");
        } 
        catch (Exception e) 
        {
            System.out.println();
        }
        return con;
    }
}
