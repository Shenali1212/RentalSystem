<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page session="true" %>
    <%
    	String username = (String) session.getAttribute("username");
    	String name = (String) session.getAttribute("name");
    	
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/BookingTable.css">
<title>Bookings</title>
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
            <li><a href="ContactUs.jsp/ContactUs.jsp">Contact Us</a></li>
            <li><a href="Announcement.jsp/displaypage">Announcements</a></li>
            <li><a href="UserReadServlet?username=<%= java.net.URLEncoder.encode(username, "UTF-8") %>">Account</a></li>
        </ul>
    </nav>
 <!-- printing -->
    	<table>
    	<tr>
    	<th>ID</th>
    	<th>Name</th>
    	<th>Phone</th>
    	<th>Vehicle ID</th>
    	<th>Pick-up date</th>
    	<th>Return date</th>
    	<th>Total Price</th>
    	
    	<th>Action</th>
    	</tr>
    	
    	<c:forEach var="rd" items="${RData}">
 		
 			<c:set var= "id" value="${rd.id}" />
 			<c:set var= "name" value="${rd.name}" />
 			<c:set var= "phone" value="${rd.phone}" />
 			<c:set var= "vID" value="${rd.vehicle}" />
 			<c:set var= "pDate" value="${rd.pDate}" />
 			<c:set var= "rDate" value="${rd.rDate}" />
 			<c:set var= "price" value="${rd.fee}" />
 			
    	<tr>
    	<td>${rd.id}</td>
    	<td>${rd.name}</td>
    	<td>${rd.phone}</td>
    	<td>${rd.vehicle} </td>
    	<td>${rd.pDate}</td>
    	<td>${rd.rDate}</td>
    	<td>${rd.fee}</td>
    	
    	
    	<td>
    	<c:url value ="VehicleNRates.jsp/UpdateRentalDetails.jsp" var ="upDetails">
    		<c:param name="id" value="${id}" />
    		<c:param name="name" value="${name}" />
    		<c:param name="phone" value="${phone}" />
    		<c:param name="vID" value="${vID}" />
    		<c:param name="pDate" value="${pDate}" />
    		<c:param name="rDate" value="${rDate}" />
    		<c:param name="price" value="${price}" />
    	</c:url>
    	
    	<a href="${upDetails}" class="btn" role="button">Update</a>
    	
    	<c:url value ="VehicleNRates.jsp/DeleteRecs.jsp" var ="DeleteRecs">
    		<c:param name="id" value="${id}" />
    		<c:param name="name" value="${name}" />
    		<c:param name="phone" value="${phone}" />
    		<c:param name="vID" value="${vID}" />
    		<c:param name="pDate" value="${pDate}" />
    		<c:param name="rDate" value="${rDate}" />
    		<c:param name="price" value="${price}" />
    	</c:url>
    	<a href="${DeleteRecs}" class="btn" role="button">Delete</a>
    	</td>
    	</tr>
    	</c:forEach>
    	</table>
    	 
    	
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