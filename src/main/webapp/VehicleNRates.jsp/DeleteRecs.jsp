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
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/DeleteTable.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<title>Delete Records</title>
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
            <li><a href="../UserHomePage.jsp">Home</a></li>
            <li><a href="../availbleVehicleServlet">Vehicles & Rates</a></li>
            <li><a href="../DispalyReservationServlet?name=<%= java.net.URLEncoder.encode(name, "UTF-8") %>">Your Rentals</a></li>
            <li><a href="../ContactUs.jsp/ContactUs.jsp">Contact Us</a></li>
            <li><a href="Announcement.jsp/displaypage">Announcements</a></li>
            <li><a href="../UserReadServlet?username=<%= java.net.URLEncoder.encode(username, "UTF-8") %>">Account</a></li>
        </ul>
    </nav>
    
   
	      
    

	<%
		String id = request.getParameter("id");
		String vID = request.getParameter("vID");
		String pDate = request.getParameter("pDate");
		String rDate = request.getParameter("rDate");
		String phone = request.getParameter("phone");
		String price = request.getParameter("price");
	%>
		<h1>Delete Rental Records</h1>
	<!-- Highlighted the new table structure -->
	<form action="delete" method="post">
		<table class="delete-table">
			<tr>
				<th>Reservation ID</th>
				<td><input type="text" name="ResID" value="<%=id %>" readonly></td>
			</tr>
			<tr>
				<th>Name</th>
				<td><input type="text" name="ResNAME" value="<%=name %>" readonly></td>
			</tr>
			<tr>
				<th>Phone Number</th>
				<td><input type="text" name="ResPhone" value="<%=phone %>" readonly></td>
			</tr>
			<tr>
				<th>Vehicle Type</th>
				<td><input type="text" name="ResVType" value="<%=vID %>" readonly></td>
			</tr>
			<tr>
				<th>Pickup Date</th>
				<td><input type="text" name="RespDATE" value="<%=pDate %>" readonly></td>
			</tr>
			<tr>
				<th>Return Date</th>
				<td><input type="text" name="ResrDATE" value="<%=rDate %>" readonly></td>
			</tr>
			
			 <tr>
                <th>Total Price</th>
                <td><input type="text" name="ResPrice" value="<%=price %>" readonly></td>
            </tr>
			<tr>
				<td colspan="2" class="submit-cell">
					<input type="submit" name="submit" value="Delete">
				</td>
			</tr>
		</table>
	</form>


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