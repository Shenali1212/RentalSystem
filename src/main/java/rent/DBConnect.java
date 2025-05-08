package rent;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	//url
	private static String url = "jdbc:mysql://localhost:3306/rentalsystem?useSSL=false";
	
	//name
	private static String name = "root";
	
	//password
	private static String pw ="tashen20030829@123";
	private static Connection con;
	
	//building connection between Database and the model class
	public static Connection getConnection() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, name, pw);
			
			
		}
		catch(Exception e) {
			System.out.println("DB conncetion failed");
		}
		
		return con;
		
	}
	
}
