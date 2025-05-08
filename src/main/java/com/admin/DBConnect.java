package com.admin;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	private static String url = "jdbc:mysql://localhost:3306/rentalsystem?useSSL=false";
	private static String userName = "root";
	private static String password = "tashen20030829";
	private static Connection con;
	
	public static Connection getConnection() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, userName, password);
		}
		catch(Exception e) {
			System.out.println("Database connection is not successful!!");
			e.printStackTrace();  // To get more details on the error.
		}
		
		return con;
	}
}