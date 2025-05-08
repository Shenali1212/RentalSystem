package com.reguser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/CheckEmailExistsServlet")
public class CheckEmailExistsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	System.out.println("check email servlet called");
    	
        String email = request.getParameter("email");
        
        System.out.println(email);
        boolean emailExists = false;

        try {
            emailExists = ReguserDBUtil.doesEmailExist(email);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        // Output "true" or "false" as plain text
        out.print(emailExists ? "true" : "false");
        out.flush();
    }
}