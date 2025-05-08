<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <%@ page session="true" %>
    <%
    	String username = (String) session.getAttribute("username");
    	String role = (String) session.getAttribute("role");
    	String name = (String) session.getAttribute("name");
    	int id = (int)session.getAttribute("id");
    	System.out.println(role);
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Information</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/useraccount.css">
</head>
<body>

 <!-- Top Navigation Bar (with logo) -->
 <c:forEach var="regus" items="${RegUserAccountDetails}">
    <nav class="top-navbar">
        <div class="top-left">
            <!-- Logo -->
            <div class="top-logo">
                <img src="photos/attachment_1079822681.png" alt="Inspire Logo">
            </div>
        </div>
        
        <div class="user-info">
            <!-- Other Links (Optional) -->
            <h3><span class="username">${regus.username}</span></h3>
            <a href="logout.jsp" class="Logout-btn">Logout</a>


        </div> 

    </nav>
    
    <!-- Main Navigation Bar (with Home, Vehicles & Rates, etc.) -->
    <nav class="navbar">
        <!-- Navigation Links on the right -->
        <ul class="nav-links">
            <% if ("User".equals(role)) { %>
        	<li><a href="UserHomePage.jsp">Home</a></li>
    		<% } else if ("VehicleOwner".equals(role)) { %>
        	<li><a href="OwnerHomePage.jsp">Home</a></li>
    		<% } %>
            
            <% if ("User".equals(role)) { %>
        	<li><a href="availbleVehicleServlet">Vehicles & Rates</a></li>
    		<% } else if ("VehicleOwner".equals(role)) { %>
        	<li><a href="RentVehicle.jsp/displayVehicleDetails.jsp">Your Vehicles</a></li>
    		<% } %>
    			
            <% if ("User".equals(role)) { %>
        	<li><a href="DispalyReservationServlet?name=<%= java.net.URLEncoder.encode(name, "UTF-8") %>">Your Rentals</a></li>
    		<% } else if ("VehicleOwner".equals(role)) { %>
        	<li><a href="RentVehicle.jsp/rentyourvehicle.jsp">Rent Your Vehicle</a></li>
    		<% } %>
    		
            <li><a href="ContactUs.jsp/ContactUs.jsp">Contact Us</a></li>
            <li><a href="Announcement.jsp/displaypage">Announcements</a></li>
            <li><a href="UserReadServlet?username=<%= java.net.URLEncoder.encode(username, "UTF-8") %>">Account</a></li>
        </ul>
    </nav>

	<div class="user-account-container">
       <center> <h2>Your Information </h2> </center> 
        
        <c:set var="id" value="${regus.id }"/>
		<c:set var="name" value="${regus.name }"/>
		<c:set var="address" value="${regus.address }"/>
		<c:set var="dob" value="${regus.dob }"/>
		<c:set var="email" value="${regus.email }"/>
		<c:set var="mobile" value="${regus.mobile }"/>
		<c:set var="role" value="${regus.role }"/>
		<c:set var="username" value="${regus.username }"/>
		<c:set var="password" value="${regus.password }"/>
	
        
        <!-- User Information Table -->
        <table class="user-info-table">
            <tr>
                <th>User ID</th>
                <td>${regus.id}</td>
            </tr>
            <tr>
                <th>Name</th>
                <td>${regus.name}</td>
            </tr>
            <tr>
                <th>Address</th>
                <td>${regus.address}</td>
            </tr>
            <tr>
                <th>Date of Birth</th>
                <td>${regus.dob}</td>
            </tr>
            <tr>
                <th>Email</th>
                <td>${regus.email}</td>
            </tr>
            <tr>
                <th>Mobile</th>
                <td>${regus.mobile}</td>
            </tr>
            <tr>
                <th>Username</th>
                <td>${regus.username}</td>
            </tr>
            <tr>
                <th>Password</th>
                <td>${regus.password}</td> 
            </tr>
        </table>
    </div>
    </c:forEach>
    
    <c:url value="updateUserAccount.jsp" var="userupdate">
		<c:param name="id" value="${id}"/>
		<c:param name="name" value="${name}"/>
		<c:param name="address" value="${address}"/>
		<c:param name="dob" value="${dob}"/>
		<c:param name="email" value="${email}"/>
		<c:param name="mobile" value="${mobile}"/>
		<c:param name="role" value="${role}"/>
		<c:param name="username" value="${username}"/>
		<c:param name="password" value="${password}"/>
	</c:url>
	 
  <div class="action-buttons">
    <!-- For Edit Information, using anchor link instead of wrapping button -->
    <a href="${userupdate}" class="btn" role="button">Edit Information</a>

    <c:url value="deleteUserAccount.jsp" var="userdelete">
        <c:param name="id" value="${id}"/>
        <c:param name="role" value="${role}"/>
    </c:url>

    <!-- For Delete Account, using anchor link instead of wrapping button -->
    <a href="${userdelete}" class="btn" role="button">Delete Account</a>
    
    <form action="read" method="get">
     	 			<input type="hidden" name="id" value="<%=id%>">

            	<button type="submit" class="btn">Show My Inquiries</button>
        </form>
        
</div>

<!-- Link to view user's inquiries -->
            	<!-- <a href="${pageContext.request.contextPath}/read">
                	<button class="btn contact-btn">Show My Inquiries</button>
              	</a> -->
     
	
	
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