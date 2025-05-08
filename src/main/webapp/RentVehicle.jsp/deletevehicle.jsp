<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page session="true" %>
    <%
    	String username = (String) session.getAttribute("username");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/deletevehicle.css">
</head>
<body>

	<nav class="top-navbar">
        <div class="top-left">
            <!-- Logo -->
            <div class="top-logo">
                <img src="../photos/attachment_1079822681.png" alt="Inspire Logo">
            </div>
        </div>      
    </nav>
    
    <!-- Main Navigation Bar (with Home, Vehicles & Rates, etc.) --> 
    	<%
        String vehId = request.getParameter("vehId");
		%>
	
	 <div class="confirmation-container">
        <h2>Confirm Deletion</h2>
        <p>Are you sure you want to delete this item? This action cannot be undone.</p>

        <form action="deleteV" method="post">
            <!-- Hidden input to pass ID or other relevant information -->
            <input type="hidden" name="vehId" value="<%=vehId %>">
            
             <input type="hidden" name="username" value="<%=username%>">

            <!-- Buttons for confirmation and cancel -->
            <button type="submit" class="btn-delete">Delete</button>
            <!-- Conditional navigation based on the username -->
        	<a href="<%= "admin".equals(username) ? "GetAllRequestedVehicleServlet" : "displayVehicleDetails.jsp" %>" class="btn-cancel">Cancel</a>
        </form>
    </div>
	
	<footer class="footer">
        <div class="footer-container">
            <div class="footer-left">
                <h3>Motorista Vehicle Rental</h3>
                <p>&copy; 2024 All rights reserved</p>
            </div>

            <div class="footer-center">
                <h3>Contact Us</h3>
                <p>Email: support@motorista.com</p>
                <p>Phone: +1 123 456 7890</p>
            </div>

            <div class="footer-right">
                <h3>Follow Us</h3>
                <div class="social-icons">
                    	<a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a>
                        <a href="https://twitter.com/"><i class="fab fa-twitter"></i></a>
                        <a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a>
                        <a href="https://www.linkedin.com/"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
    </footer>
    
</body>
</html>