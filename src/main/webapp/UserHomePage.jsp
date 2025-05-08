<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page session="true" %>
    <%
    	String username = (String) session.getAttribute("username");
    	String name = (String) session.getAttribute("name");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserHome</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" type="text/css" href="css/home.css">
</head>
<body>

	<!-- Top Navigation Bar (with logo and Login/Register) -->
    <nav class="top-navbar">
        <div class="top-left">
            <!-- Logo -->
            <div class="top-logo">
                <img src="photos/attachment_1079822681.png" alt="Inspire Logo">
            </div>
        </div>
        
         <div class="top-right">
            <!-- Other Links (Optional) -->
            <h3>Welcome <%=username %></h3>
        </div> 
        
    </nav>
    
   

    <!-- Main Navigation Bar (with Home, Vehicles & Rates, etc.) -->
    <nav class="navbar">
        <!-- Navigation Links on the right -->
        <ul class="nav-links">
            <li><a href="UserHomePage.jsp">Home</a></li>
            <li><a href="availbleVehicleServlet">Vehicles & Rates</a></li>
            <li><a href="DispalyReservationServlet?name=<%= java.net.URLEncoder.encode(name, "UTF-8") %>">Your Rentals</a></li>
            <li><a href="ContactUs.jsp/ContactUs.jsp">Contact Us</a></li>
            <li><a href="Announcement.jsp/displaypage">Announcements</a></li>
            <li><a href="UserReadServlet?username=<%= java.net.URLEncoder.encode(username, "UTF-8") %>">Account</a></li>
        </ul>
    </nav>
    
     <!-- Main Content Section with background image -->
    <div class="content-container">
        <div class="text-content">
            <h1>Welcome to Motorista Vehicle Rental</h1>
            <p>Find the best vehicles to rent or rent out your own vehicle with ease.</p>
        </div>
    </div>
    
	<div class="company-info">
        <h2>Largest Rent a Car Company in Sri Lanka</h2>
        <p>In Sri Lanka we are the number one and best company for your rent a car requirement. We provide cars for long-term rental or short-term purposes.</p>
        <p>We have more than 1000 vehicles in different categories such as VVIP, VIP, Luxury, Cabs, Premium, Vans, and buses, all of which are well-maintained and in excellent condition. Additionally, we provide wedding cars and limousines. We have more than 10 years of experience in this industry, and our friendly staff is ready to guide you to select the best match for your vehicle requirements.</p>
    </div>
    
    <!-- Footer Section -->
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