package regVehicle;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@MultipartConfig
@WebServlet("/updateVehicleServlet")
public class updateVehicleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
    	response.setContentType("text/html");
		
		String vehId = request.getParameter("vehId");	
		String username = request.getParameter("username");
		String makeModel = request.getParameter("makeModel");
		String year = request.getParameter("year");
		String license = request.getParameter("license");
		String mileage = request.getParameter("mileage");
		String transmission = request.getParameter("transmission");
		String fuel = request.getParameter("fuel");
		String color = request.getParameter("color");
		String condition = request.getParameter("condition");
	    Part vehiclePhoto = request.getPart("vehiclePhoto");
		Part vehicleReg = request.getPart("vehicleReg");
		String insurance = request.getParameter("insurance");
		Part ownership = request.getPart("ownership");
		String usage = request.getParameter("usage");
		String rentalPricing= request.getParameter("rentalPricing");
		float rentPrice= Float.parseFloat(rentalPricing);
		String respon = request.getParameter("respon");
		
		String retainvehicelPhoto = request.getParameter("retainvehiclePhoto");
		String retainvehicleReg = request.getParameter("retainvehicleReg");
		String retainownership = request.getParameter("retainownership");
		
//		String imageFileName1=vehiclePhoto.getSubmittedFileName();
//		//System.out.println("Selected image file name : " + imageFileName1);
//		
//		String imageFileName2=vehicleReg.getSubmittedFileName();
//		//System.out.println("Selected image file name : " + imageFileName2);
//		
//		String imageFileName3=ownership.getSubmittedFileName();
//		//System.out.println("Selected image file name : " + imageFileName3);
//		
//		String uploadPath1 = "C:/Projects/Rentalsystem/src/main/webapp/RegVehicles/VehiclePhotos/" + imageFileName1;
//		String uploadPath2 = "C:/Projects/Rentalsystem/src/main/webapp/RegVehicles/VehicleRegistrationPhoto/" + imageFileName2;
//		String uploadPath3 = "C:/Projects/Rentalsystem/src/main/webapp/RegVehicles/Ownership/" + imageFileName3;
		
		//System.out.println("Upload Path : " + uploadPath1);
		//System.out.println("Upload Path : " + uploadPath2);
		//System.out.println("Upload Path : " + uploadPath3);
		
		System.out.println(vehId);
		
//		try {
//			
//			FileOutputStream fos1 = new FileOutputStream(uploadPath1);
//			InputStream is1 = vehiclePhoto.getInputStream();
//				
//			byte[] data1 = new byte[is1.available()];
//			is1.read(data1);
//			fos1.write(data1);
//			fos1.close();
//			
//			FileOutputStream fos2 = new FileOutputStream(uploadPath2);
//			InputStream is2 = vehicleReg.getInputStream();
//				
//			byte[] data2 = new byte[is2.available()];
//			is2.read(data2);
//			fos2.write(data2);
//			fos2.close();
//			
//			FileOutputStream fos3 = new FileOutputStream(uploadPath3);
//			InputStream is3 = ownership.getInputStream();
//				
//			byte[] data3 = new byte[is3.available()];
//			is3.read(data3);
//			fos3.write(data3);
//			fos3.close();
//			;
//			}
//			catch(Exception e) {
//				e.printStackTrace();
//			}
		
		
		boolean isTrue;
		
		isTrue = RegvehicleDBUtil.updateVehicle(vehId, username, makeModel, year, license, mileage, transmission, fuel, color, condition, vehiclePhoto, vehicleReg, insurance, ownership, usage, rentPrice, respon, retainvehicelPhoto, retainvehicleReg, retainownership);
		
		if(isTrue == true) {
			List<Regvehicle> vehicleDetails = RegvehicleDBUtil.getVheicleDetails(vehId);
			request.setAttribute("vehicleDetails", vehicleDetails);
			
			out.println("<script type='text/javascript'>");
            out.println("alert('Update Successfull!');");
            out.println("location='displayVehicleDetails.jsp'");
            out.println("</script>");
		}
		else {
			List<Regvehicle> vehicleDetails = RegvehicleDBUtil.getVheicleDetails(vehId);
			request.setAttribute("vehicleDetails", vehicleDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("displayVehicleDetails.jsp");
			dis.forward(request, response);
		}
	}

}
