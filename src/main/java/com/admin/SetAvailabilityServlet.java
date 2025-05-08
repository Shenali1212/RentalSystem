package com.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SetAvailabilityServlet")
public class SetAvailabilityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
    	response.setContentType("text/html");
	
		String Availability = request.getParameter("Availability");
		String id = request.getParameter("vehid");
		
		int vehid = Integer.parseInt(id);
		
		
		boolean isTrue;
		
		isTrue = GetDetailsDBUtil.setAvailability(vehid, Availability);
		
		if(isTrue == true) {
			out.println("<script type='text/javascript'>");
            out.println("alert('Set Availability Successfully!');");
            out.println("window.location.href = 'GetAllSystemVehiclesServlet';");
            out.println("</script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
	}

}
