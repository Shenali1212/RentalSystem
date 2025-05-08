package com.reguser;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ReguserDBUtil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	private static boolean isSuccess;
	
public static List<Reguser> validate(String userName, String password){
		
		ArrayList<Reguser> regus = new ArrayList<>();
		
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from regusers where username='"+userName+"' and password='"+password+"'";	
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String address = rs.getString(3);
				String dob = rs.getString(4);
				String email = rs.getString(5);
				String mobile = rs.getString(6);
				String role = rs.getString(7);
				String userU = rs.getString(8);
				String passU = rs.getString(9);
				
				Reguser ru = new Reguser(id, name, address, dob, email, mobile, role, userU, passU);
				regus.add(ru);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return regus;
	}

public static boolean insertUser(String name, String address, String dob, String email, String mobile, String role, String username, String password) {
		
	boolean isSuccess = false;
		
	try {
			
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		String sql = "insert into regusers values (0, '"+name+"', '"+address+"', '"+dob+"', '"+email+"', '"+mobile+"', '"+role+"', '"+username+"', '"+password+"')";
		int rs = stmt.executeUpdate(sql);
		
		if(rs > 0) {
			isSuccess = true;
		}
		else {
			isSuccess = false;
		}
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	
		return isSuccess;
	}
	


public static boolean updateuser(String id, String name, String address, String dob, String email, String mobile, String role, String username, String password) {
	System.out.println("In updateuser method");
	
	try {
		con = DBConnect.getConnection();
		
		Statement stmt = con.createStatement();
		
		String sql= "update regusers set name='"+name+"', address='"+address+"', dob='"+dob+"', email='"+email+"', mobile='"+mobile+"', role='"+role+"', username='"+username+"', password='"+password+"' where id='"+id+"'";
		int rs = stmt.executeUpdate(sql);
		
		if(rs > 0) {
			isSuccess = true;
		}
		else
		{
			isSuccess = false;
		}
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
		System.out.println(isSuccess);
		return isSuccess;
	}

public static List<Reguser> getUserDetails(String Id){
	
	int convertedID = Integer.parseInt(Id);
	ArrayList<Reguser> regus = new ArrayList<>();
	
	
	try {
		
		con = DBConnect.getConnection();
		
		Statement stmt = con.createStatement();
		
		String sql = "Select * from regusers where id='"+convertedID+"'";
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			int id = rs.getInt(1);
			String name = rs.getString(2);
			String address = rs.getString(3);
			String dob = rs.getString(4);
			String email = rs.getString(5);
			String mobile = rs.getString(6);
			String role = rs.getString(7);
			String username = rs.getString(8);
			String password = rs.getString(9);
			
			Reguser ru = new Reguser(id, name, address, dob, email, mobile, role, username, password);
			regus.add(ru);
			}
		
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	
	return regus;
	}

public static boolean deleteUser(String id) {
	
	int convId = Integer.parseInt(id);
	
	try {
		
		con = DBConnect.getConnection();
		Statement stmt = con.createStatement();
		
		String sql = "delete from regusers where id='"+convId+"'";
		int r = stmt.executeUpdate(sql);
		
		if(r > 0) {
			isSuccess = true;
		}
		else {
			isSuccess = false;
			}
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	
	
		return isSuccess;
	}

public static List<Reguser> getUserAccountDetails(String userName){
	
	ArrayList<Reguser> regus = new ArrayList<>();
	
	
	try {
		
		con = DBConnect.getConnection();
		
		Statement stmt = con.createStatement();
		
		String sql = "Select * from regusers where username='"+userName+"'";
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			int id = rs.getInt(1);
			String name = rs.getString(2);
			String address = rs.getString(3);
			String dob = rs.getString(4);
			String email = rs.getString(5);
			String mobile = rs.getString(6);
			String role = rs.getString(7);
			String username = rs.getString(8);
			String password = rs.getString(9);
			
			Reguser ru = new Reguser(id, name, address, dob, email, mobile, role, username, password);
			regus.add(ru);
			}
		
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	
	return regus;
	}

public static boolean doesEmailExist(String email)  {
	
	System.out.println("check email mathod called");
	System.out.println(email);
    try {
    	
    	con = DBConnect.getConnection();
    	
    	String sql = "Select Count(*) from regusers where email = ?";
    	
    	PreparedStatement stmt = con.prepareStatement(sql);
    	
    	stmt.setString(1, email);
    	
    	rs = stmt.executeQuery();
    	
    	if(rs.next()) {
    		return rs.getInt(1) > 0;
    	}
    	
    }catch(Exception e) {
    	e.printStackTrace();
    }
    
    	return false;
	}

public static boolean doesUsernameExist(String username) {
	
	System.out.println("check username mathod called");
	System.out.println(username);

	try {
    	
    	con = DBConnect.getConnection();
    	
    	String sql = "Select Count(*) from regusers where username = ?";
    	
    	PreparedStatement stmt = con.prepareStatement(sql);
    	
    	stmt.setString(1, username);
    	
    	rs = stmt.executeQuery();
    	
    	if(rs.next()) {
    		return rs.getInt(1) > 0;
    	}
    	
    }catch(Exception e) {
    	e.printStackTrace();
    }
    
    	return false;
	}


}
