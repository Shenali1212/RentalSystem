<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


	<%@ page session="true" %>
    <%
    	String username = (String) session.getAttribute("username");
    	String role = (String) session.getAttribute("role");
    	String name = (String) session.getAttribute("name");
    	int id = (int)session.getAttribute("id");
    	System.out.println(id);
    	System.out.println(role);
    %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Us - Vehicle Rental</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="../css/contactUs.css">
	<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
    <!-- Top Navigation Bar (with logo) -->
    <nav class="top-navbar">
        <div class="top-left">
            <!-- Logo -->
            <div class="top-logo">
                <img src="../photos/attachment_1079822681.png" alt="Inspire Logo">
            </div>
        </div>
        
        <div class="top-right">
            <!-- Other Links (Optional) -->
            <h3><%=username %></h3>
        </div> 
        
    </nav>
    
    <nav class="navbar">
        <!-- Navigation Links on the right -->
        <ul class="nav-links">
            <% if ("User".equals(role)) { %>
        	<li><a href="../UserHomePage.jsp">Home</a></li>
    		<% } else if ("VehicleOwner".equals(role)) { %>
        	<li><a href="../OwnerHomePage.jsp">Home</a></li>
    		<% } %>
            
            <% if ("User".equals(role)) { %>
        	<li><a href="../availbleVehicleServlet">Vehicles & Rates</a></li>
    		<% } else if ("VehicleOwner".equals(role)) { %>
        	<li><a href="../RentVehicle.jsp/displayVehicleDetails.jsp">Your Vehicles</a></li>
    		<% } %>
    			
            <% if ("User".equals(role)) { %>
        	<li><a href="../DispalyReservationServlet?name=<%= java.net.URLEncoder.encode(name, "UTF-8") %>">Your Rentals</a></li>
    		<% } else if ("VehicleOwner".equals(role)) { %>
        	<li><a href="../RentVehicle.jsp/rentyourvehicle.jsp">Rent Your Vehicle</a></li>
    		<% } %>
    		
            <li><a href="ContactUs.jsp">Contact Us</a></li>
            
            <li><a href="../Announcement.jsp/displaypage">Announcements</a></li>
            <li><a href="../UserReadServlet?username=<%= java.net.URLEncoder.encode(username, "UTF-8") %>">Account</a></li>
        </ul>
    </nav>

    <!-- Contact Us Form Section -->
    <div class="inquiry-container">
        <div class="inquiry-box">
            <h2>Contact Us</h2>
            <!-- Display success or error message if status attribute is set -->
            <% if (request.getAttribute("status") != null) { %>
                <p class="<%= request.getAttribute("status").equals("success") ? "success" : "error" %>">
                    <%= request.getAttribute("status").equals("success") ? "Message sent successfully!" : "Error sending message. Please try again." %>
                </p>
            <% } %>
            <!-- Contact Us form -->
            <form action="insert" method="post">
                <div class="input-group">
                    <label for="name">User Name</label>
                    <input type="text" id="name" name="username" value="<%=username%>" readonly>
                </div>
                <div class="input-group">
                    <label for="name">User ID</label>
                    <input type="text" id="ID" name="userid" value="<%=id%>" readonly>
                </div>
                <div class="input-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="input-group">
                    <label for="subject">Inquiry Subject</label>
                    <input type="text" id="subject" name="inquirysubject" required>
                </div>
                <div class="input-group">
                    <label for="message">Inquiry Details</label>
                    <textarea id="message" name="inquirydetails" required></textarea>
                </div>
                <div class="input-group">
                    <button type="submit" class="btn contact-btn">Send Message</button>
                </div>
                <div>
                	
                </div>
            </form>           	
        </div>
    </div>

    <!-- Footer Section -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-left">
                <h3>Inspire Vehicle Rental</h3>
                <p>&copy; 2024 All rights reserved</p>
            </div>

            <div class="footer-center">
                <h3>Contact Us</h3>
                <p>Email: support@inspire.com</p>
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