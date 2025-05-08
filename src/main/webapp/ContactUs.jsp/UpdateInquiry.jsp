<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page session="true" %>
    <%
    	String username = (String) session.getAttribute("username");
    	String role = (String) session.getAttribute("role");
    	int uid = (int)session.getAttribute("id");
    	System.out.println(uid);
    	System.out.println(role);
    %>
    
<!DOCTYPE html>
<html>
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
        	<li><a href="${pageContext.request.contextPath}/vehiclesRates.jsp">Vehicles & Rates</a></li>
    		<% } else if ("VehicleOwner".equals(role)) { %>
        	<li><a href="${pageContext.request.contextPath}/displayVehicleDetails.jsp">Your Vehicles</a></li>
    		<% } %>
    			
            <% if ("User".equals(role)) { %>
        	<li><a href="${pageContext.request.contextPath}/yourrentals.jsp">Your Rentals</a></li>
    		<% } else if ("VehicleOwner".equals(role)) { %>
        	<li><a href="${pageContext.request.contextPath}/rentyourvehicle.jsp">Rent Your Vehicle</a></li>
    		<% } %>
    		
            <li><a href="ContactUs.jsp">Contact Us</a></li>
            <li><a href="${pageContext.request.contextPath}/Announcement.jsp/displaypage">Announcements</a></li>
            <li><a href="${pageContext.request.contextPath}/UserReadServlet?username=<%= java.net.URLEncoder.encode(username, "UTF-8") %>">Account</a></li>
        </ul>
    </nav>

<!-- Retrieve inquiry details from request parameters -->
	<%
		String id = request.getParameter("id");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		String date = request.getParameter("date");
	%>

	<!-- update form-->
	<div class="inquiry-container">
        <div class="inquiry-box">
            <h2>Edit Inquiry</h2>
            
            <form action="update" method="post">
            
            <input type="hidden" id="id" name="userid" value="<%= uid%>">
            
                <div class="input-group">
                    <label for="subject">ID</label>
                    <input type="text" id="id" name="inquiryid" value="<%= id%>" readonly>
                </div>
                <div class="input-group">
                    <label for="subject">Inquiry Subject</label>
                    <input type="text" id="subject" name="inquirysubject" value="<%= subject%>">
                </div>
                <div class="input-group">
                    <label for="message">Message</label>
                    <textarea id="message" name="inquirydetails"><%= message %></textarea> 
                </div>
                <div class="input-group">
               		<label for="message">Date</label>
                	<input type="text" id="date" name="inquirydate" value="<%= date%>" readonly>
                </div>
                <!-- button to save changes -->
                <div class="input-group">
                    <input type="submit" name = "update" value = "Save Changes"><br>
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