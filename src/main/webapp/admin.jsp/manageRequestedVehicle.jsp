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
    
     <h1>Manage Requested Vehicles</h1>
     
        <div class="vehicle-details">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Make & Model</th>
                        <th>Manu Year</th>
                        <th>License Plate</th>
                        <th>Mileage</th>
                        <th>Transmission</th>
                        <th>Fuel Type</th>
                        <th>Color</th>
                        <th>Condition</th>
                        <th>Photo</th>
                        <th>Reg Cert.</th>
                        <th>Insurance</th>
                        <th>Proof of Ownership</th>
                        <th>Allowed Usage</th>
                        <th>Rental Pricing</th>
                        <th>Responsibility</th>
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
                        <td><img src="RegVehicles/VehiclePhotos/${regvehicle.vehiclePhoto}" width="200" height="150"></td>
                        <td><img src="RegVehicles/VehicleRegistrationPhoto/${regvehicle.vehicleReg}" width="200" height="150"></td>
                        <td>${regvehicle.insurance}</td>
                        <td><img src="RegVehicles/Ownership/${regvehicle.ownership}" width="200" height="150"></td>
                        <td>${regvehicle.usage}</td>
                        <td>${regvehicle.rentalPricing}</td>
                        <td>${regvehicle.respon}</td>
                        <td>
                        <c:url value="admin.jsp/addVehicletoSystem.jsp" var="vehicleadd">
							<c:param name="vehId" value="${vehId}"/>
						    <c:param name="makeModel" value="${makeModel}"/>
							<c:param name="transmission" value="${transmission}"/>
							<c:param name="fuel" value="${fuel}"/>
							<c:param name="vehiclePhoto" value="${vehiclePhoto}"/>
							<c:param name="rentalPricing" value="${rentalPricing}"/>
						</c:url>
							<a href="${vehicleadd}">
							<input type="button" class="add-btn" name="add" value="Add">
							</a>
							                
                        <c:url value="RentVehicle.jsp/deletevehicle.jsp" var="vehicledelete">
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
