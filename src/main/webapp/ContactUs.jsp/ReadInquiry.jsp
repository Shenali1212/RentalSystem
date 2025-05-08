<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <title>My Inquiries - Vehicle Rental</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/contactUs.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<!-- Top Navigation Bar (with logo) -->
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
    
    <nav class="navbar">
        <!-- Navigation Links on the right -->
        <ul class="nav-links">
            <% if ("User".equals(role)) { %>
        	<li><a href="${pageContext.request.contextPath}/UserHomePage.jsp">Home</a></li>
    		<% } else if ("VehicleOwner".equals(role)) { %>
        	<li><a href="${pageContext.request.contextPath}/OwnerHomePage.jsp">Home</a></li>
    		<% } %>
            
            <% if ("User".equals(role)) { %>
        	<li><a href="${pageContext.request.contextPath}/availbleVehicleServlet">Vehicles & Rates</a></li>
    		<% } else if ("VehicleOwner".equals(role)) { %>
        	<li><a href="${pageContext.request.contextPath}/RentVehicle.jsp/displayVehicleDetails.jsp">Your Vehicles</a></li>
    		<% } %>
    			
            <% if ("User".equals(role)) { %>
        	<li><a href="DispalyReservationServlet?name=<%= java.net.URLEncoder.encode(name, "UTF-8") %>">Your Rentals</a></li>
    		<% } else if ("VehicleOwner".equals(role)) { %>
        	<li><a href="${pageContext.request.contextPath}/RentVehicle.jsp/rentyourvehicle.jsp">Rent Your Vehicle</a></li>
    		<% } %>
    		
            <li><a href="${pageContext.request.contextPath}/ContactUs.jsp/ContactUs.jsp">Contact Us</a></li>
            <li><a href="${pageContext.request.contextPath}/Announcement.jsp/displaypage">Announcements</a></li>
            <li><a href="${pageContext.request.contextPath}/UserReadServlet?username=<%= java.net.URLEncoder.encode(username, "UTF-8") %>">Account</a></li>
        </ul>
    </nav>

<!-- Inquiry Table -->
<h2>My Inquiries</h2>
<table>	
	<tr>
		<th>ID</th>
		<th>Subject</th>
		<th>Message</th>
		<th>Date</th>
		<th>Action</th>
	</tr>
	<!-- Iterate through the list of inquiries -->
	<c:forEach var="inqlist" items="${inqlist}">
	
	<!-- Set variables for each inquiry detail -->
	<c:set var="id" value="${inqlist.inquiryID}"/>
	<c:set var="subject" value="${inqlist.inquirySubject}"/>
	<c:set var="message" value="${inqlist.inquiryDetails}"/>
	<c:set var="date" value="${inqlist.inquiryDate}"/>
	
    <tr>
        <td>${inqlist.inquiryID}</td>
        <td>${inqlist.inquirySubject}</td>
        <td>${inqlist.inquiryDetails}</td>
        <td>${inqlist.inquiryDate}</td>
        <td>
        
        <!-- Create URL for updating inquiry -->
        <c:url value="ContactUs.jsp/UpdateInquiry.jsp" var="updateinq">
        	<c:param name = "id" value="${id}"/>
        	<c:param name = "subject" value="${subject}"/>
        	<c:param name = "message" value="${message}"/>
        	<c:param name = "date" value="${date}"/>
        </c:url>
        
        <!--  <a href="${updateinq}">
        <input type  = "button" name="edit" value="Edit">-->
        <a href="${updateinq}" class="btn" role="button">Edit</a>
       
        
        <!-- Create URL for deleting inquiry -->
        <c:url value="ContactUs.jsp/DeleteInquiry.jsp" var="deleteinq">
        	<c:param name = "id" value="${id}"/>
        	<c:param name = "subject" value="${subject}"/>
        	<c:param name = "message" value="${message}"/>
        	<c:param name = "date" value="${date}"/>
        </c:url>
        
        <!--<a href="${deleteinq}">
        	<input type  = "button" name="delete" value="Delete">-->
        	<a href="${deleteinq}" class="btn" role="button">Delete</a>
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