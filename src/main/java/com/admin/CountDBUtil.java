package com.admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class CountDBUtil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	private static boolean isSuccess;
	
	
public static int getUserCount() {
	int count = 0;
	
		try {
		
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			System.out.println("Connection success");
			
			String sql = "select COUNT(*) AS count From regusers;";
			
			rs = stmt.executeQuery(sql);
			
					if(rs.next())
					{
						count = rs.getInt("count");
					}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return count - 1;
	}

public static int getVehicleOwnersCount() {
	int count = 0;
	
		try {
		
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			System.out.println("Connection success");
			
			String sql = "select COUNT(*) AS count From regusers where role = 'VehicleOwner';";
			
			rs = stmt.executeQuery(sql);
			
					if(rs.next())
					{
						count = rs.getInt("count");
					}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}


public static int getCustomerCount() {
	int count = 0;
	
		try {
		
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			System.out.println("Connection success");
			
			String sql = "select COUNT(*) AS count From regusers where role = 'User';";
			
			rs = stmt.executeQuery(sql);
			
					if(rs.next())
					{
						count = rs.getInt("count");
					}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}

public static int getRequestedVehicleCount() {
	int count = 0;
	
		try {
		
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			System.out.println("Connection success");
			
			String sql = "select COUNT(*) AS count From registeredvehicles;";
			
			rs = stmt.executeQuery(sql);
			
					if(rs.next())
					{
						count = rs.getInt("count");
					}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}

}



