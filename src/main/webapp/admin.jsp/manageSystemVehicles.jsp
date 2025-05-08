<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Vehicles</title>
    <link rel="stylesheet" href="css/manageRequestedVehicle.css">
</head>
<body>

<nav class="top-navbar">
        <div class="top-left">
            <!-- Logo -->
            <div class="top-logo">
                <img src="photos/attachment_1079822681.png" alt="Inspire Logo">
            </div>
        </div>      
    </nav>
    
    <div class="container"> 
    	<div class="sidebar">
            <h2>Admin Dashboard</h2>
            <ul>
            	<li><a href="AdminDashCount">Home</a></li>
                <li><a href="GetAllRequestedVehicleServlet">Requested Vehicles</a></li>
                <li><a href="GetAllUsers">Manage Users</a></li>
                <li><a href="GetAllSystemVehiclesServlet">System Vehicles</a></li>
                <li><a href="AdminDisplayReservationServlet">Manage Reservations</a></li>
                <li><a href="Announcement.jsp/display">Announcements</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </div>
        <!-- Header -->
                       
    <div class="main-content">
    
     <h1>Manage System Vehicles</h1>
     
        <div class="vehicle-details">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Make & Model</th>
                        <th>Transmission</th>
                        <th>Fuel Type</th>
                        <th>Photo</th>
                        <th>Rental Pricing</th>
                        <th>Availability</th>
                        <th>Operations</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="sysvehicle" items="${SysvehicleDetails}">
                   <c:set var="vehId" value="${sysvehicle.id }"/>
                   <c:set var="makeModel" value="${sysvehicle.makeModel }"/>
                   <c:set var="transmission" value="${sysvehicle.transmission }"/>
                   <c:set var="fuel" value="${sysvehicle.fuel }"/>
                   <c:set var="vehiclePhoto" value="${sysvehicle.vehiclePhoto }"/>
                   <c:set var="rentalPricing" value="${sysvehicle.rentalPricing }"/>
                  
                    <tr>
                        <td>${sysvehicle.id}</td>
                        <td>${sysvehicle.makeModel}</td>
                        <td>${sysvehicle.transmission}</td>
                        <td>${sysvehicle.fuel}</td>
                        <td><img src="RegVehicles/VehiclePhotos/${sysvehicle.vehiclePhoto}" width="200" height="150"></td>
                        <td>${sysvehicle.rentalPricing}</td>
                        <td>
                        	<form action="setAvailability" method="post">
                        		<select name="Availability" id="Availability" required>
                            		<option value="Available">Available</option>
                            		<option value="Rented">Rented</option>
                        		</select>
                        		
                        		<input type="hidden" name="vehid" value="${sysvehicle.id}">
                        		
                        		<button type="submit" class="submit-btn">OK</button>
                        	</form>
                        </td>
                        <td>
	                
                        <c:url value="admin.jsp/deleteSysVehicle.jsp" var="vehicledelete">
							<c:param name="vehId" value="${vehId}"/>					
						</c:url>
							<a href="${vehicledelete}">
							<input type="button" class="delete-btn" name="delete" value="Delete">
							</a>
                    	</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    </div>
</body>
</html>
