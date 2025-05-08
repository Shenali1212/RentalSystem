<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Announcements - car rent</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
     <link rel="stylesheet" type="text/css" href="../css/abc.css">
    
</head>
<body>
    <nav class="top-navbar">
        <div class="top-left">
            <!-- Logo -->
            <div class="top-logo">
                <img src="../photos/attachment_1079822681.png" alt="Inspire Logo">
            </div>
        </div>      
    </nav>
    
    <div class="container"> 
    	<div class="sidebar">
            <h2>Admin Dashboard</h2>
            <ul>
            	<li><a href="../AdminDashCount">Home</a></li>
                <li><a href="../GetAllRequestedVehicleServlet">Requested Vehicles</a></li>
                <li><a href="../GetAllUsers">Manage Users</a></li>
                <li><a href="../GetAllSystemVehiclesServlet">System Vehicles</a></li>
                <li><a href="../AdminDisplayReservationServlet">Manage Reservations</a></li>
                <li><a href="display">Announcements</a></li>
                <li><a href="../logout.jsp">Logout</a></li>
            </ul>
        </div>

    <div class="announcement-container">
        <h2>Create Announcements &#128172; &#128226;</h2>
        <form action="insertAnn" method="post" class="announcement-form">
            <label for="date">Date &#128198; :</label>
            <input type="date" id="date" name="date" required>
            
            <label for="category">Category &#128450; :</label>
            <input type="text" id="category" name="category" placeholder="Enter the category" required>
            
            <label for="title">Title &#128221; :</label>
            <input type="text" id="title" name="title" placeholder="Enter the title" required>
            
            <label for="content">Content &#9997; :</label>
            <textarea id="content" name="content" placeholder="Enter the announcement content" required></textarea>
            
            <input type="submit" name="submit" value="Publish &#x1F680;" class="btn-submit">
        </form>
    </div>

    </div>
</body>
</html>
