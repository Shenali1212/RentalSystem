package com.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reguser.Reguser;

@WebServlet("/GetAllUsers")
public class GetAllUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			List<Reguser> RegUserAccountDetails = GetDetailsDBUtil.getUserDetails();
			request.setAttribute("RegUserAccountDetails", RegUserAccountDetails);
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("admin.jsp/manageUsers.jsp");
		dis.forward(request, response);
	}


}
