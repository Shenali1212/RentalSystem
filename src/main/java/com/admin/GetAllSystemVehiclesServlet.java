package com.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/GetAllSystemVehiclesServlet")
public class GetAllSystemVehiclesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			List<SystemVehicles> SysvehicleDetails = GetDetailsDBUtil.getSystemVheiclesDetails();
			request.setAttribute("SysvehicleDetails", SysvehicleDetails);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		RequestDispatcher dis = request.getRequestDispatcher("admin.jsp/manageSystemVehicles.jsp");
		dis.forward(request, response);
	}

}
