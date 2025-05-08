package com.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.reguser.Reguser;

import regVehicle.DBConnect;
import regVehicle.Regvehicle;

public class GetDetailsDBUtil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	private static boolean isSuccess;

	
public static List<Reguser> getUserDetails(){
		
		ArrayList<Reguser> regus = new ArrayList<>();
		
		
		try {
			
			con = DBConnect.getConnection();
			
			Statement stmt = con.createStatement();
			
			String sql = "Select * from regusers where role != 'Admin';";
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
	
public static List<Regvehicle> getRequestedVheicleDetails(){
	
	System.out.println("validate ekata awa");
	
	
	ArrayList<Regvehicle> regvehicle = new ArrayList<>();
	
	try {
		
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		String sql = "select * from registeredvehicles;";	
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			int vehId = rs.getInt("id");
			String username = rs.getString("username");
			String makeModel = rs.getString("makeModel");
			String year = rs.getString("Manu_Year");
			String license = rs.getString("License");
			String mileage = rs.getString("Mileage");
			String transmission = rs.getString("Trasmission");
			String fuel = rs.getString("fuel");
			String color = rs.getString("color");
			String condition = rs.getString("condition");
			String photo = rs.getString("photo");
			String vehicleReg = rs.getString("Vehicle_re_certifi");
			String insurance = rs.getString("Insurance");
			String ownership = rs.getString("ownership");
			String usage = rs.getString("Usage");
			float price = rs.getFloat("Price");
			String respon = rs.getString("respon");
			
			Regvehicle rv = new Regvehicle(vehId, username, makeModel, year, license, mileage, transmission, fuel, color, condition, photo, vehicleReg, insurance,
					ownership, usage, price, respon);
			regvehicle.add(rv);
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
		return regvehicle;
	}
	

public static byte[] getVehiclePhotoFromSourceTable(String vehId) {
    byte[] vehiclePhoto = null;

    try (Connection conn = DBConnect.getConnection()) {
        String sql = "SELECT photo FROM registeredvehicles WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, vehId);
        
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            vehiclePhoto = rs.getBytes("photo");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    return vehiclePhoto;
}


public static boolean AddVehicle(String id, String makeModel, String transmission, String fuel, byte[] vehiclePhoto, float rentalPricing) {
	
	System.out.println("come to systemaddVehcile");
	
	boolean isSuccess = false;
	
	try {
		con = DBConnect.getConnection();		
		PreparedStatement stmt1;
		String sql = "Insert into systemvehicles(VehicleId, MakeModle, transmission, fuel, VehiclePhoto, RentPrice) values( ?, ?, ?, ?, ?, ? )";
		stmt1 = con.prepareStatement(sql);
		stmt1.setString(1, id);
		stmt1.setString(2, makeModel);
		stmt1.setString(3, transmission);
		stmt1.setString(4, fuel);
		stmt1.setBytes(5, vehiclePhoto);
		stmt1.setFloat(6, rentalPricing);
		int rs=stmt1.executeUpdate();
		
		
		if(rs > 0)
			{
				System.out.println("Images added into database successfully");
				isSuccess = true;
			}
			else
			{
				System.out.println("Failed to upload image");
				isSuccess = false;
			}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	
		return isSuccess;
	}

public static List<SystemVehicles> getSystemVheiclesDetails(){
	
	System.out.println("get system vehicle ekata awa");
	
	
	ArrayList<SystemVehicles> Sysvehicles = new ArrayList<>();
	
	try {
		
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		String sql = "select * from systemvehicles;";	
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			int vehId = rs.getInt("VehicleId");
			String makeModel = rs.getString("MakeModle");
			String transmission = rs.getString("transmission");
			String fuel = rs.getString("fuel");
			String photo = rs.getString("VehiclePhoto");
			float price = rs.getFloat("RentPrice");
			String availability = rs.getString("Availability");
			
			SystemVehicles sv = new SystemVehicles(vehId, makeModel, transmission, fuel, photo, price, availability);
			Sysvehicles.add(sv);
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
		return Sysvehicles;
	}

public static boolean setAvailability(int id, String Availability) {
	
	System.out.println("In setAvailability method");
	
	try {
		con = DBConnect.getConnection();
		
		Statement stmt = con.createStatement();
		
		String sql= "update systemvehicles set Availability='"+Availability+"' where VehicleId='"+id+"'";
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

public static boolean deleteSysVehicle(String id) {
	
	int convId = Integer.parseInt(id);
	
	
	try {
		con = DBConnect.getConnection();
	
		Statement stmt = con.createStatement();
		
		String sql = "delete from systemvehicles where VehicleId='"+convId+"'";
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
}
