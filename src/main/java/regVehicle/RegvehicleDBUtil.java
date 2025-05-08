package regVehicle;

import java.util.ArrayList;
import java.util.List;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;

import javax.servlet.http.Part;


public class RegvehicleDBUtil {
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static boolean AddVehicle(String username, String makeModel, String year, String license, String mileage, String transmission, 
			String fuel, String color, String condition, String imageFileName1, String imageFileName2, String insurance, String imageFileName3, String usage, float rentalPricing,
			String respon) {
		
		System.out.println("Mn mekata awaa");
		
		boolean isSuccess = false;
		
		try {
			con = DBConnect.getConnection();		
			PreparedStatement stmt1;
			String sql = "Insert into registeredvehicles(id, username, makeModel, Manu_Year, License, Mileage, Trasmission, fuel, color, `condition`, photo, Vehicle_re_certifi, Insurance, ownership, `Usage`, Price, respon) values(0, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
			stmt1 = con.prepareStatement(sql);
			stmt1.setString(1, username);
			stmt1.setString(2, makeModel);
			stmt1.setString(3, year);
			stmt1.setString(4, license);
			stmt1.setString(5, mileage);
			stmt1.setString(6, transmission);
			stmt1.setString(7, fuel);
			stmt1.setString(8, color);
			stmt1.setString(9, condition);
			stmt1.setString(10, imageFileName1);
			stmt1.setString(11, imageFileName2);
			stmt1.setString(12, insurance);
			stmt1.setString(13, imageFileName3);
			stmt1.setString(14, usage);
			stmt1.setFloat(15, rentalPricing);		
			stmt1.setString(16, respon);
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
	
	public static List<Regvehicle> validate(String ousername){
		
		System.out.println("validate ekata awa");
		System.out.println(ousername);
		
		ArrayList<Regvehicle> regvehicle = new ArrayList<>();
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from registeredvehicles where username='"+ousername+"'";	
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
	
	private static String[] getCurrentFileNames(String id) {
	    String[] fileNames = new String[3]; // [0] = imageFileName, [1] = videoFileName
	    try {
	    	con = DBConnect.getConnection();
	        String sql = "SELECT photo, Vehicle_re_certifi, ownership FROM registeredvehicles WHERE id=?";
	        PreparedStatement stmt = con.prepareStatement(sql);
	        stmt.setString(1, id);

	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            fileNames[0] = rs.getString("photo");
	            fileNames[1] = rs.getString("Vehicle_re_certifi");
	            fileNames[2] = rs.getString("ownership");
	        }
	    } catch (SQLException e) {
	        System.out.println("SQL Exception occurred while retrieving current file names: " + e.getMessage());
	        e.printStackTrace();
	    }
	    return fileNames;
	}
	
	public static boolean updateVehicle(String vehId, String username, String makeModel, String year, String license, String mileage, String transmission, 
			String fuel, String color, String condition, Part vehiclePhoto, Part vehicleReg, String insurance, Part ownership, String usage, float rentalPricing,
			String respon, String retainvehicelPhoto, String retainvehicleReg, String retainownership) {
			
		System.out.println("update ekata awaaa");
		
		String[] currentFiles = getCurrentFileNames(vehId);
		String currentvehiclePhoto = currentFiles[0];
		String currentvehicleReg = currentFiles[1];
		String currentownership = currentFiles[2];
		
		String imageFileName1 = null;
		String imageFileName2 = null;
		String imageFileName3 = null;
		
		// Process image upload
	    if (retainvehicelPhoto == null && vehiclePhoto != null && vehiclePhoto.getSize() > 0) {
	    	imageFileName1 = vehiclePhoto.getSubmittedFileName();
	        System.out.println("New image file uploaded: " + imageFileName1);
	        String ImguploadPath = "C:/Projects/Rentalsystem/src/main/webapp/RegVehicles/VehiclePhotos" + imageFileName1;
	        try (FileOutputStream fos = new FileOutputStream(ImguploadPath); InputStream is = vehiclePhoto.getInputStream()) {
	            byte[] data = new byte[is.available()];
	            is.read(data);
	            fos.write(data);
	            System.out.println("Image uploaded successfully to: " + ImguploadPath);
	        } catch (Exception e) {
	            System.out.println("Error while uploading image file: " + e.getMessage());
	            e.printStackTrace();
	        }
	    } else {
	        imageFileName1 = currentvehiclePhoto; 
	        System.out.println("Retaining the current image1: " + imageFileName1);
	    }
	    
	    if (retainvehicleReg == null && vehicleReg != null && vehicleReg.getSize() > 0) {
	    	imageFileName2 = vehicleReg.getSubmittedFileName();
	        System.out.println("New image file uploaded: " + imageFileName2);
	        String ImguploadPath = "C:/Projects/Rentalsystem/src/main/webapp/RegVehicles/VehicleRegistrationPhoto" + imageFileName2;
	        try (FileOutputStream fos = new FileOutputStream(ImguploadPath); InputStream is = vehicleReg.getInputStream()) {
	            byte[] data = new byte[is.available()];
	            is.read(data);
	            fos.write(data);
	            System.out.println("Image uploaded successfully to: " + ImguploadPath);
	        } catch (Exception e) {
	            System.out.println("Error while uploading image file: " + e.getMessage());
	            e.printStackTrace();
	        }
	    } else {
	        imageFileName2 = currentvehicleReg; 
	        System.out.println("Retaining the current image2: " + imageFileName2);
	    }
	    
	    if (retainownership == null && ownership != null && ownership.getSize() > 0) {
	    	imageFileName3 = ownership.getSubmittedFileName();
	        System.out.println("New image file uploaded: " + imageFileName3);
	        String ImguploadPath = "C:/Projects/Rentalsystem/src/main/webapp/RegVehicles/VehicleRegistrationPhoto" + imageFileName3;
	        try (FileOutputStream fos = new FileOutputStream(ImguploadPath); InputStream is = ownership.getInputStream()) {
	            byte[] data = new byte[is.available()];
	            is.read(data);
	            fos.write(data);
	            System.out.println("Image uploaded successfully to: " + ImguploadPath);
	        } catch (Exception e) {
	            System.out.println("Error while uploading image file: " + e.getMessage());
	            e.printStackTrace();
	        }
	    } else {
	        imageFileName3 = currentownership; 
	        System.out.println("Retaining the current image3: " + imageFileName3);
	    }
		
		try {
			con = DBConnect.getConnection();
			PreparedStatement stmt1;
			String sql="update registeredvehicles set makeModel=?, Manu_Year=?, License=?, Mileage=?, Trasmission=?, fuel=?, color=?, `condition`=?, photo=?, Vehicle_re_certifi=?"
					+ ", Insurance=?, ownership=?, `Usage`=?, Price=?, respon=? where id= ?";
			stmt1 = con.prepareStatement(sql);
			stmt1.setString(1, makeModel);
			stmt1.setString(2, year);
			stmt1.setString(3, license);
			stmt1.setString(4, mileage);
			stmt1.setString(5, transmission);
			stmt1.setString(6, fuel);
			stmt1.setString(7, color);
			stmt1.setString(8, condition);
			stmt1.setString(9, imageFileName1);
			stmt1.setString(10, imageFileName2);
			stmt1.setString(11, insurance);
			stmt1.setString(12, imageFileName3);
			stmt1.setString(13, usage);
			stmt1.setFloat(14, rentalPricing);		
			stmt1.setString(15, respon);
			stmt1.setString(16, vehId);
			int rs=stmt1.executeUpdate();
			
			
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
		}finally {
	        // Attempt to delete temporary files
	        if (vehiclePhoto != null) {
	            try {
	            	vehiclePhoto.delete();
	                System.out.println("Temporary image file deleted.");
	            } catch (IOException e) {
	                System.out.println("Error deleting temporary image file: " + e.getMessage());
	            }
	        }
	        if (vehicleReg != null) {
	            try {
	            	vehicleReg.delete();
	                System.out.println("Temporary video file deleted.");
	            } catch (IOException e) {
	                System.out.println("Error deleting temporary video file: " + e.getMessage());
	            }
	        }
	        if (ownership != null) {
	            try {
	            	ownership.delete();
	                System.out.println("Temporary video file deleted.");
	            } catch (IOException e) {
	                System.out.println("Error deleting temporary video file: " + e.getMessage());
	            }
	        }
	    }
		
		return isSuccess;
	}
	
public static List<Regvehicle> getVheicleDetails (String Id){
		
		int convertedID = Integer.parseInt(Id);
		ArrayList<Regvehicle> regvehicle = new ArrayList<>();
		
		con = DBConnect.getConnection();
		
		try {
			con = DBConnect.getConnection();
			String sql = "Select * from registeredvehicles where id='"+convertedID+"'";
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
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return regvehicle;
	}
	
public static boolean deleteVehicle(String id) {
		
		int convId = Integer.parseInt(id);
		
		
		try {
			con = DBConnect.getConnection();
		
			Statement stmt = con.createStatement();
			
			String sql = "delete from registeredvehicles where id='"+convId+"'";
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
