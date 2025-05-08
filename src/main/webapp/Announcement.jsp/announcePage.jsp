<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<html>
<head>
    <meta charset="UTF-8">
    <title>Announcements</title>
    <link rel="stylesheet" type="text/css" href="../css/announePage.css"> <!-- Link to CSS file -->
</head>
<body>
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
    
   

    <!-- Main Navigation Bar (with Home, Vehicles & Rates, etc.) -->
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
    		
            <li><a href="../ContactUs.jsp/ContactUs.jsp">Contact Us</a></li>
            
            <li><a href="displaypage">Announcements</a></li>
            <li><a href="../UserReadServlet?username=<%= java.net.URLEncoder.encode(username, "UTF-8") %>">Account</a></li>
        </ul>
    </nav>
<!-- Title -->
<h1 class="announcement-title">Announcements</h1>

<div class="announcement-details">
    <c:forEach var="ann" items="${annDetails}">
        <!-- Determine card theme based on category -->
        <c:set var="cardClass" value="card-default" />
        <c:choose>
          
            <c:when test="${ann.category == 'Success'}">
                <c:set var="cardClass" value="card-success" />
            </c:when>
            <c:when test="${ann.category == 'Warning'}">
                <c:set var="cardClass" value="card-warning" />
            </c:when>
            <c:when test="${ann.category == 'Promotion'}">
                <c:set var="cardClass" value="card-promo" />
            </c:when>
        </c:choose>

        <div class="announcement-info ${cardClass}">
            <button class="card-close">&times;</button>
            <h3>${ann.date}</h3>
            <p><strong>Category:</strong> ${ann.category}</p>
            <p><strong>Title:</strong> ${ann.title}</p>
            <p><strong>Content:</strong> ${ann.content}</p>
        </div>
    </c:forEach>
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