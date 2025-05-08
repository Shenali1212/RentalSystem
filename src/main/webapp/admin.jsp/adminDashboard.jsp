<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page session="true" %>
    <%
    	String username = (String) session.getAttribute("username");
    %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Vehicle Rental System</title>
    <link rel="stylesheet" type="text/css" href="css/adminDashboard.css">
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
        <!-- Sidebar -->
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

        <!-- Main Content -->
        <div class="main-content">
            <h1>Welcome, Admin</h1>
            <div class="dashboard-cards">
                <div class="card">
                    <h3>Requested Vehicles</h3>
                    <p class="count" data-count="${requestedVehicleCount }">${requestedVehicleCount}</p>
                </div>
                <div class="card">
                    <h3>Total Users</h3>
                    <p class="count" data-count="${userCount }">${userCount}</p>
                </div>
                 <div class="card">
                    <h3>Vehicle Owners</h3>
                    <p class="count" data-count="${vehicleOnwerCount }">${vehicleOnwerCount}</p>
                </div>
                <div class="card">
                    <h3>Customers</h3>
                    <p class="count" data-count="${customerCount }">${customerCount}</p>
                </div>
        
                <!--  <div class="card">
                    <h3>Active Rentals</h3>
                    <p>45</p>
                </div>
                <div class="card">
                    <h3>Pending Payments</h3>
                    <p>15</p>
                </div>-->
            </div>
           
            
        </div>
    </div>
</body>
</html>
