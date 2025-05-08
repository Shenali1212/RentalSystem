package com.reguser;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	System.out.println("ssdfsdfsdfsdfs");
        String username = request.getParameter("uid");
        String password = request.getParameter("pass");
        
        try {
            // Validate user credentials
            List<Reguser> ReguserDetails = ReguserDBUtil.validate(username, password);
            request.setAttribute("ReguserDetails", ReguserDetails);

            if (ReguserDetails != null && !ReguserDetails.isEmpty()) {
                Reguser user = ReguserDetails.get(0); // Assume first result is the correct one
                String role = user.getRole(); // Fetch the role from the Reguser object
                int id = user.getId();
                String name = user.getName();

                // Get session and set username
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", role);
                session.setAttribute("id", id);
                session.setAttribute("name", name);
                

                // Redirect based on role
                if ("VehicleOwner".equalsIgnoreCase(role)) {
                    // Forward to the vehicle owner page
                    RequestDispatcher dis = request.getRequestDispatcher("OwnerHomePage.jsp");
                    dis.forward(request, response);

                } else if ("User".equalsIgnoreCase(role)) {
                    // Forward to the user account page
                    RequestDispatcher dis = request.getRequestDispatcher("UserHomePage.jsp");
                    dis.forward(request, response);

                } else if ("Admin".equalsIgnoreCase(role)) {
                    // Forward to the user account page
                	System.out.println("Redirecting to Admin Dashboard");
                    response.sendRedirect(request.getContextPath() + "/AdminDashCount");
                } else {
                    // If the role is unknown, redirect to login page with error
                    request.setAttribute("errorMessage", "Unknown role");
                    RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                    dis.forward(request, response);
                }
            } else {
                // If validation fails, redirect to login page with error
                request.setAttribute("errorMessage", "Invalid username or password");
                RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                dis.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred during login.");
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
        }
    }
}
