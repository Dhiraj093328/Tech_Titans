package test;

import java.sql.Connection;
import java.sql.DriverManager;

public class LocalDBConnection {
	private static final String URL =
	        "jdbc:mysql://localhost:3306/saloon_management?useSSL=false&serverTimezone=UTC";
	    private static final String USER = "root";
	    private static final String PASSWORD = "1234";

	    public static Connection getConnection() {

	        Connection con = null;

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            con = DriverManager.getConnection(URL, USER, PASSWORD);
	            System.out.println("✅ DATABASE CONNECTED SUCCESSFULLY");
	        } catch (Exception e) {
	            System.out.println("❌ DATABASE CONNECTION FAILED");
	            e.printStackTrace();
	        }

	        return con;
	    }

}
