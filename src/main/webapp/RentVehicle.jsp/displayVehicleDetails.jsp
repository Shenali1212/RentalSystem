<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import="regVehicle.Regvehicle" %>
    
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/displayVehicleDetails.css">
<script src="displayVehicleValidation.js"></script>

<style>
/* Style for the Update button */
.update-btn {
    border: none; /* Remove border */
    color: white;
    background-color:  rgb(209, 31, 57);
    padding: 10px 20px; /* Add some padding */
    text-align: center; /* Center the text */
    text-decoration: none; /* Remove underline */
    display: inline-block; /* Align properly */
    font-size: 16px; /* Increase font size */
    margin: 4px 2px; /* Add some margin */
    cursor: pointer; /* Change cursor to pointer */
    border-radius: 5px; /* Rounded corners */
    transition: background-color 0.3s; /* Smooth transition */
}

/* Hover effect */
.update-btn:hover {
    color: black;
    background-color: rgb(217, 212, 212);
}

.delete-btn {
    border: none; /* Remove border */
    color: white;
    background-color:  rgb(209, 31, 57);
    padding: 10px 20px; /* Add some padding */
    text-align: center; /* Center the text */
    text-decoration: none; /* Remove underline */
    display: inline-block; /* Align properly */
    font-size: 16px; /* Increase font size */
    margin: 4px 2px; /* Add some margin */
    cursor: pointer; /* Change cursor to pointer */
    border-radius: 5px; /* Rounded corners */
    transition: background-color 0.3s; /* Smooth transition */
}

/* Hover effect */
.delete-btn:hover {
   color: black;
    background-color: rgb(217, 212, 212);
}

.error-message {
    color: red;
    font-size: 16px;
    margin-top: 10px;
}

</style>
</head>
<body>
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
            <li><a href="../OwnerHomePage.jsp">Home</a></li>
            <li><a href="displayVehicleDetails.jsp">Your Vehicles</a></li>
            <li><a href="rentyourvehicle.jsp">Rent Your Vehicle</a></li>
            <li><a href="../ContactUs.jsp/ContactUs.jsp">Contact Us</a></li>
            <li><a href="../Announcement.jsp/displaypage">Announcements</a></li>
            <li><a href="../UserReadServlet?username=<%= java.net.URLEncoder.encode(username, "UTF-8") %>">Account</a></li>
        </ul>
    </nav>
    
    <!-- Main Content -->
    <div class="main-container">
        <h1>Your Vehicles</h1>
        <h3>List of all vehicles you have listed for rent</h3>
        
        <!-- Search Bar -->
        <div class="search-container">
            <label for="search-input">Username:</label>
            <form action="displayVehicle" method="post" onsubmit="return validateSearch()">
           
            	<input type="text" id="search-input" placeholder="Enter Owner Username..." name="ownerusername">
                <button type="submit" class="submit-btn">Search</button>
                    
            </form>
            
            <input type="hidden" id="loggedInUsername" value="<%= username %>">
            <div id="error-message" class="error-message"></div> <!-- Error message container -->
        </div>
        
        <!-- Table for displaying vehicle details -->
        <div class="table-container">
            <table class="vehicle-table">
                <thead>
                    <tr>
                        <th>Vehicle ID</th>
                        <th>Make & Model</th>
                        <th>Manufacture Year</th>
                        <th>License Plate Number</th>
                        <th>Mileage</th>
                        <th>Transmission Type</th>
                        <th>Fuel Type</th>
                        <th>Color</th>
                        <th>Vehicle Condition</th>
                        <th>Vehicle Photo</th>
                        <th>Vehicle Registration Certificate</th>
                        <th>Insurance Details</th>
                        <th>Proof of Ownership</th>
                        <th>Allowed Usage</th>
                        <th>Rental Pricing</th>
                        <th>Damage & Maintenance Responsibility</th>
                        <th>Operations</th>
                    </tr>
                </thead>
                <tbody>
                
               <c:forEach var="regvehicle" items="${RegvehicleDetails}">
                   <c:set var="vehId" value="${regvehicle.id }"/>
                   <c:set var="username" value="${regvehicle.username }"/>
                   <c:set var="makeModel" value="${regvehicle.makeModel }"/>
                   <c:set var="year" value="${regvehicle.year }"/>
                   <c:set var="license" value="${regvehicle.license }"/>
                   <c:set var="mileage" value="${regvehicle.mileage }"/>
                   <c:set var="transmission" value="${regvehicle.transmission }"/>
                   <c:set var="fuel" value="${regvehicle.fuel }"/>
                   <c:set var="color" value="${regvehicle.color }"/>
                   <c:set var="condition" value="${regvehicle.condition }"/>
                   <c:set var="vehiclePhoto" value="${regvehicle.vehiclePhoto }"/>
                   <c:set var="vehicleReg" value="${regvehicle.vehicleReg }"/>
                   <c:set var="insurance" value="${regvehicle.insurance }"/>
                   <c:set var="ownership" value="${regvehicle.ownership }"/>
                   <c:set var="usage" value="${regvehicle.usage }"/>
                   <c:set var="rentalPricing" value="${regvehicle.rentalPricing }"/>
                   <c:set var="respon" value="${regvehicle.respon }"/>
                    <tr>
                        <td>${regvehicle.id}</td>
                        <td>${regvehicle.makeModel}</td>
                        <td>${regvehicle.year}</td>
                        <td>${regvehicle.license}</td>
                        <td>${regvehicle.mileage}</td>
                        <td>${regvehicle.transmission}</td>
                        <td>${regvehicle.fuel}</td>
                        <td>${regvehicle.color}</td>
                        <td>${regvehicle.condition}</td>
                        <td><img src="${pageContext.request.contextPath}/RegVehicles/VehiclePhotos/${regvehicle.vehiclePhoto}" width="200" height="150"></td>
                        <td><img src="${pageContext.request.contextPath}/RegVehicles/VehicleRegistrationPhoto/${regvehicle.vehicleReg}" width="200" height="150"></td>
                        <td>${regvehicle.insurance}</td>
                        <td><img src="${pageContext.request.contextPath}/RegVehicles/Ownership/${regvehicle.ownership}" width="200" height="150"></td>
                        <td>${regvehicle.usage}</td>
                        <td>${regvehicle.rentalPricing}</td>
                        <td>${regvehicle.respon}</td>
                        
                        <c:url value="updateRentyourVehicle.jsp" var="vehicleupdate">
							<c:param name="vehId" value="${vehId}"/>
							<c:param name="username" value="${username}"/>
							<c:param name="makeModel" value="${makeModel}"/>
							<c:param name="year" value="${year}"/>
							<c:param name="license" value="${license}"/>
							<c:param name="mileage" value="${mileage}"/>
							<c:param name="transmission" value="${transmission}"/>
							<c:param name="fuel" value="${fuel}"/>
							<c:param name="color" value="${color}"/>
							<c:param name="condition" value="${condition}"/>
							<c:param name="vehiclePhoto" value="${vehiclePhoto}"/>
							<c:param name="vehicleReg" value="${vehicleReg}"/>
							<c:param name="insurance" value="${insurance}"/>
							<c:param name="ownership" value="${ownership}"/>
							<c:param name="usage" value="${usage}"/>
							<c:param name="rentalPricing" value="${rentalPricing}"/>
							<c:param name="respon" value="${respon}"/>
						</c:url>
						
                        <td><a href="${vehicleupdate}">
							<input type="button" class="update-btn" name="update" value="Update">
						</a>
						<c:url value="deletevehicle.jsp" var="vehicledelete">
							<c:param name="vehId" value="${vehId}"/>
						</c:url>
							<a href="${vehicledelete}">
							<input type="button" class="delete-btn" name="delete" value="Delete">
							</a>
						</td> 
                    </tr>
				</c:forEach>
                    <!-- More rows can be dynamically generated with JSP from a database query -->
                </tbody>
            </table>
        </div>
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