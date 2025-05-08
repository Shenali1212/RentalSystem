package com.admin;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/AddVehicletoSystemServlet")
public class AddVehicletoSystemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("sysveh servlet awa");
		
		PrintWriter out = response.getWriter();
    	response.setContentType("text/html");
		
		String vehId = request.getParameter("vehId");
		String makeModel = request.getParameter("makeModel");
		String transmission = request.getParameter("transmission");
		String fuel = request.getParameter("fuel");
		System.out.println("xxxxxxxxxxxxxxxx");
		System.out.println("yyyyyyyyyyyyyyyyyyyyyyy");
		String rentalPricing = request.getParameter("rentalPricing");
		float rentPrice = Float.parseFloat(rentalPricing);
		
//		String imageFileName1=vehiclePhoto.getSubmittedFileName();
//		System.out.println("Selected image file name : " + imageFileName1);
//		
//		String uploadPath1 = "C:/Projects/Rentalsystem/src/main/webapp/SystemVehicles/" + imageFileName1;
//		
//		try {
//			
//			FileOutputStream fos1 = new FileOutputStream(uploadPath1);
//			InputStream is1 = vehiclePhoto.getInputStream();
//				
//			byte[] data1 = new byte[is1.available()];
//			is1.read(data1);
//			fos1.write(data1);
//			fos1.close();
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//		}
		
		byte[] vehiclePhoto = GetDetailsDBUtil.getVehiclePhotoFromSourceTable(vehId);

        if (vehiclePhoto == null) {
            response.sendRedirect(request.getContextPath() + "/errorPage.jsp"); // Handle if photo not found
            return;
        }
		
		boolean isTrue;
		
		isTrue = GetDetailsDBUtil.AddVehicle(vehId, makeModel, transmission, fuel, vehiclePhoto, rentPrice);
		
		if(isTrue == true) {
			
			out.println("<script type='text/javascript'>");
            out.println("alert('Vehicle added to System Successfully!');");
            out.println("window.location.href = '../GetAllRequestedVehicleServlet';");
            out.println("</script>");
			
		}
		else {
			response.sendRedirect(request.getContextPath() + "/GetAllRequestedVehicleServlet");
		}
	}

}
