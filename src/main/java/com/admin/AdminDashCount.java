package com.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AdminDashCount")
public class AdminDashCount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			int userCount = CountDBUtil.getUserCount();
			int vehicleOnwerCount = CountDBUtil.getVehicleOwnersCount();
			int customerCount = CountDBUtil.getCustomerCount();
			int requestedVehicleCount = CountDBUtil.getRequestedVehicleCount();
			
			
			request.setAttribute("userCount", userCount);
			request.setAttribute("vehicleOnwerCount", vehicleOnwerCount);
			request.setAttribute("customerCount", customerCount);
			request.setAttribute("requestedVehicleCount", requestedVehicleCount);
			
			RequestDispatcher dis = request.getRequestDispatcher("admin.jsp/adminDashboard.jsp");
			dis.forward(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}


}
