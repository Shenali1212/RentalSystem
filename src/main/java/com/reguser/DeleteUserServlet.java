package com.reguser;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		String role = request.getParameter("role");
		
		
		boolean isTrue;
		
		isTrue = ReguserDBUtil.deleteUser(id);
		
		System.out.println(isTrue);	
		
		if(isTrue){
			
			if("admin".equals(username)) {
				
				response.sendRedirect(request.getContextPath() + "/GetAllUsers");
				return;
			}
			
			if("User".equals(role) || "VehicleOwner".equals(role)) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
				dispatcher.forward(request, response);
				
			}else {
		
				List<Reguser> ReguserDetails = ReguserDBUtil.getUserDetails(id);
				request.setAttribute("ReguserDetails", ReguserDetails);
		
				RequestDispatcher dispatcher = request.getRequestDispatcher("useraccount.jsp");
				dispatcher.forward(request, response);
			}	
		}
	}
}
