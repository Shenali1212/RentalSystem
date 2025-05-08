package com.reguser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/CheckUsernameExistsServlet")
public class CheckUsernameExistsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	System.out.println("check username servlet called");
    	
        String username = request.getParameter("username");
        
        System.out.println(username);
        boolean usernameExists = false;

        try {
            usernameExists = ReguserDBUtil.doesUsernameExist(username);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        // Output "true" or "false" as plain text
        out.print(usernameExists ? "true" : "false");
        out.flush();
    }
}


