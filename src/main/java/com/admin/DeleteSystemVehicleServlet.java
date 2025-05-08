package com.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/DeleteSystemVehicleServlet")
public class DeleteSystemVehicleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("delete servlet awa");
		
		PrintWriter out = response.getWriter();
    	response.setContentType("text/html");
		
		String id = request.getParameter("vehId");
		String username = request.getParameter("username");
		
		boolean isTrue;
		
		isTrue = GetDetailsDBUtil.deleteSysVehicle(id);
		
		if(isTrue == true){
			
			out.println("<script type='text/javascript'>");
            out.println("alert('Vehicle Delete Successfully!');");
            out.println("window.location.href = '../GetAllSystemVehiclesServlet';");
            out.println("</script>");
			
			return;		
		}else {
			
			response.sendRedirect(request.getContextPath() + "/GetAllSystemVehiclesServlet");
			
		}
		
		
	}

}
