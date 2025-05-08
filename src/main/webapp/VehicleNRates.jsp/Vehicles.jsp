<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <%@ page session="true" %>
    <%
    	String username = (String) session.getAttribute("username");
    	String name = (String) session.getAttribute("name");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Available Vehicles</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AvailableVehicle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/browsingPage.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">


</head>
<body>

  <!-- Top Navigation Bar (with logo and Login/Register) -->
    <nav class="top-navbar">
        <div class="top-left">
            <!-- Logo -->
            <div class="top-logo">
                <img src="${pageContext.request.contextPath}/photos/attachment_1079822681.png" alt="Inspire Logo">
            </div>
        </div>
        
         <div class="top-right">
            <!-- Other Links (Optional) -->
            <h3><%=username %></h3>
        </div> 
        
    </nav>
    
   

    <!-- Main Navigation Bar (with Home, Vehicles & Rates, etc.) -->
    <nav class="navbar">
        <!-- Navigation Links on the right -->
        <ul class="nav-links">
            <li><a href="UserHomePage.jsp">Home</a></li>
            <li><a href="availbleVehicleServlet">Vehicles & Rates</a></li>
            <li><a href="DispalyReservationServlet?name=<%= java.net.URLEncoder.encode(name, "UTF-8") %>">Your Rentals</a></li>
            <li><a href="ContactUs/ContactUs.jsp">Contact Us</a></li>
            <li><a href="Announcement.jsp/displaypage">Announcements</a></li>
            <li><a href="UserReadServlet?username=<%= java.net.URLEncoder.encode(username, "UTF-8") %>">Account</a></li>
        </ul>
    </nav>
    
    	
<!-- Display Section for Vehicles -->
<div class="DISPLAY">

    <!-- Iterating  vehicle details and display them as cards -->
    <c:forEach var="ve" items="${vDetails}">
    
 
 		
        <div class="vehicle-card">
            
            <img src="${pageContext.request.contextPath}/RegVehicles/VehiclePhotos/${ve.vehiclePhoto}" alt="${ve.makeModel}" id="${ve.id}">
            <h3>${ve.makeModel}</h3>
            <p><span>${ve.transmission}</span>| <span>${ve.fuel}</span> | <span>${ve.availability}</span></p>
            <p>Price per Day : Rs: ${ve.rentalPricing}</p>
          	<button class="b1" onclick="window.location.href='VehicleNRates.jsp/reserve.jsp?vehicleId=${ve.id}&price=${ve.rentalPricing}'">Reserve</button>
			
        </div>
    </c:forEach>
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