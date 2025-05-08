package contactUs;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

//database operations
public class ContactUsDBUtil {
	//database connection objects
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
     
    private static boolean istrue;
    
    //insert inquiry method
    public static boolean InsertInquiries(String username, String userid, String email, String inquirysubject, String inquirydetails) {
    	 
    	 istrue = false;
		
    	 try {
    		 //database connection
    		 con = DBConnect.getConnection();
    		 stmt= con.createStatement();
    		 
    		 //SQL query to insert new inquiry
    		 String sql = "INSERT INTO inquiries (username, userID, email, subject, details) VALUES ('"+ username + "', '" + userid + "', '" + email + "', '" + inquirysubject + "', '" + inquirydetails + "')";
    		 
    		 //execute insert method
    		 int rs = stmt.executeUpdate(sql);
    		 
    		 //check if the insertion was successful
    		 if(rs > 0)
    		 {
    			 istrue = true;
    			 
    		 }
    		 
    		 else {
    			 istrue = false;
    		 }
    		 
    		 
    	 }catch(Exception e) {
    		 e.printStackTrace();
    	 }
    
    	 
    	 
    	 return istrue;
    	 
     }

    //read inquiries(show my inquiries) method
     public static ArrayList<inquiry> readInqList(int id){
    	 
    	 System.out.println("read Iq came");
    	 ArrayList<inquiry> inqlist = new ArrayList<>();
    	 
    	 try {
    		//database connection
    		 con = DBConnect.getConnection();
    		 stmt= con.createStatement();
    		 
    		//SQL query to read all inquiries
    		 String sql = "select * from inquiries where userId='"+id+"'";
    		 rs = stmt.executeQuery(sql);
    		 
    		 //iterate through the result set and create inquiry objects
    		 while (rs.next()) 
    		 {
    			 int ID = rs.getInt(1);
    			 String Name = rs.getString(2);
    			 String UserID = rs.getString(3);
    			 String Email = rs.getString(4);
    			 String Subject = rs.getString(5);
    			 String Details = rs.getString(6);
    			 String Date = rs.getString(7);
    			 
    			 inquiry inq1 = new inquiry(ID, Name, UserID, Email, Subject, Details, Date);
    			 inqlist.add(inq1);
    		 }
    		 
    	 }catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	
    	 return inqlist;
     } 
     
     
     //update inquiries method
     public static boolean updateinquiry(String id, String subject, String message, String date){
    	 
    	 try {
    		 
    		//database connection
    		 con = DBConnect.getConnection();
    		 stmt= con.createStatement();
    		 
    		//SQL query to update inquiries
    		 String sql = "update inquiries set subject = '"+subject+"', details = '"+message+"' where inquiryId = '"+id+"'";
    		 
    		 int rs = stmt.executeUpdate(sql);
    		 
    		// Check if the update was successful
    		 if(rs > 0) {
    			 istrue = true;
    			 System.out.println("Inquiry updated successfully. ID: " + id);
    		 }
    		 else {
    			 istrue = false;
    			 System.out.println("No rows affected. Inquiry might not exist. ID: " + id);
    		 }
    		 
    	 }
    	 catch(Exception e) {
    		 System.out.println("SQL Error Occured");
    		 e.printStackTrace();
    	 }
    	 
    	 return istrue;
     }

     //delete inquiries method
     public static boolean deleteinquiry(String id) {
    	 
    	 int convId = Integer.parseInt(id);
    	 
    	 try {
    		//database connection
    		 con = DBConnect.getConnection();
    		 stmt= con.createStatement();
    		 Statement stmt = con.createStatement();
    		 
    		//SQL query to delete inquiry
    		 String sql = "delete from inquiries where inquiryId='"+convId+"'";
    		 int r = stmt.executeUpdate(sql);
    		 
    		// Check if the deletion was successful
    		 if(r > 0) {
    			 istrue = true;
    			 System.out.println("Inquiry deleted successfully. ID: " + id);
    		 }
    		 
    		 else {
    			 istrue = false;
    			 System.out.println("No inquiries deleted. Inquiry might not exist. ID: " + id);
    		 }
    		 
    	 }
    	 
    	 catch (Exception e){
    		 e.printStackTrace();
    	 }
    	 
    	 return istrue;
     }

}