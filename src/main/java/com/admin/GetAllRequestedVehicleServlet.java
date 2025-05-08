package com.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import regVehicle.Regvehicle;


@WebServlet("/GetAllRequestedVehicleServlet")
public class GetAllRequestedVehicleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
				
		try {
			List<Regvehicle> RegvehicleDetails = GetDetailsDBUtil.getRequestedVheicleDetails();
			request.setAttribute("RegvehicleDetails", RegvehicleDetails);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		RequestDispatcher dis = request.getRequestDispatcher("admin.jsp/manageRequestedVehicle.jsp");
		dis.forward(request, response);
	}


}
