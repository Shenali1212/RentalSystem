package com.reguser;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String dob = request.getParameter("dob");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String role = request.getParameter("role");
		String username = request.getParameter("uid");
		String password = request.getParameter("psw");
		
		boolean isTrue;
		
		isTrue = ReguserDBUtil.updateuser(id, name, address, dob, email, mobile, role, username, password);
		
		if(isTrue == true) {
			
			System.out.println("true");
			
			List<Reguser> RegUserAccountDetails = ReguserDBUtil.getUserDetails(id);
			request.setAttribute("RegUserAccountDetails", RegUserAccountDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("useraccount.jsp");
			dis.forward(request, response);
		}
		else {
			
			System.out.println("false");
			
			List<Reguser> ReguserDetails = ReguserDBUtil.getUserDetails(id);
			request.setAttribute("ReguserDetails", ReguserDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("useraccount.jsp");
			dis.forward(request, response);
		}	
		
	}

}
