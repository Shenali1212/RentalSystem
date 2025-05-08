package rent;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import java.util.List;

import com.admin.SystemVehicles;

import regVehicle.DBConnect;

import com.admin.SystemVehicles;
public class rentDButil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	private static boolean isSucces;
	
	
	//inserting values
	
	public static boolean reserveVehicle(String name,String pdate,String rdate, String phone,String vID,String total) {
		isSucces = false;
		//System.out.println("util" + name+""+pdate+""+rdate+""+vID+""+phone+""+vID);
		float convertedTotal = Float.parseFloat(total);
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "insert into reservation values(0, '"+name+"', '"+vID+"', '"+pdate+"', '"+rdate+"' , '"+phone+"', '"+convertedTotal+"')";
			int rs = stmt.executeUpdate(sql);
			
			//1-success 0 - fail
			
			if(rs > 0) {
				isSucces =true;
			}
			else {
				isSucces =false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isSucces;
	}
	
	//Retriving
	
public static List<SystemVehicles> getVehiclesDetails(){
		
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
		
	
	
	
	//Retrieving user rental data
	
	public static List<rentalData> DisplayRentalRecords(String uname) {
		
		ArrayList<rentalData>  RD = new ArrayList<>();

		try {
			con =DBConnect.getConnection();
			stmt = con.createStatement();
			
			
			String sql = "Select * from  reservation where name = '"+uname+"'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int id = rs.getInt(1);
				String Uname = rs.getString(2);
				String vID = rs.getString(3);
				String pDate = rs.getString(4);
				String rDate = rs.getString(5);
				String phone = rs.getString(6);
				float fee = rs.getFloat(7);
				
				rentalData ob = new rentalData(id, Uname,vID,pDate,rDate,phone,fee);
				RD.add(ob);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return RD;
	}
	
	
	//Updating reservation table
	
	public static boolean updateRenatlRecords(String id ,String name,String vID,String pDate,String rDate, String phone, String fee) {
		
		float convertedFee = Float.parseFloat(fee);
		try {
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		
		String sql = "Update reservation set name = '"+name+"',VehicleID = '"+vID+"', pDate = '"+pDate+"' , rDate ='"+rDate+"' , phone ='"+phone+"', TotalFee ='"+convertedFee+"' where idreservation = '"+id+"'";
		int rs = stmt.executeUpdate(sql);
		
		if(rs > 0) {
			
			isSucces = true;
			
		}else {
			isSucces = false;
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSucces;
	}
	
	//Deleting rental records
	
	public static boolean deleteRentalRecords(String id) {
		
		int convertedID = Integer.parseInt(id);
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql ="delete from reservation where idreservation = '"+convertedID+"'";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				
				isSucces = true;
				
			}else {
				isSucces = false;
				}
			
			}catch(Exception e) {
				e.printStackTrace();
			}
		return isSucces;
	}
	
	//Retrieving user rental data for admin
	
public static List<rentalData> DisplayRentalRecords() {
			
			ArrayList<rentalData>  RD = new ArrayList<>();

			try {
				con =DBConnect.getConnection();
				stmt = con.createStatement();
				
				
				String sql = "Select * from  reservation ";
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					
					int id = rs.getInt(1);
					String Uname = rs.getString(2);
					String Vid = rs.getString(3);
					String pDate = rs.getString(4);
					String rDate = rs.getString(5);
					String phone = rs.getString(6);
					float fee = rs.getFloat(7);
					
					rentalData ob = new rentalData(id, Uname,Vid,pDate,rDate,phone,fee);
					RD.add(ob);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return RD;
		}
		

}
