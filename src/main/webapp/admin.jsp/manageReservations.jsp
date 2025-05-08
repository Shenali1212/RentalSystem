<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Reservations</title>
    <link rel="stylesheet" href="css/manageReservations.css">
</head>

<script>
    // Function to filter rentals based on search input
    function filterRentals() {
        // Get the search query
        let query = document.getElementById('searchQuery').value.toLowerCase();

        // Get all rows of rental records (or rows in the table)
        let rentals = document.querySelectorAll('.rental-row');

        // Loop through all the rentals and display/hide based on search query
        rentals.forEach(rental => {
            let name = rental.querySelector('.rental-name').textContent.toLowerCase();
            
            if (name.includes(query)) {
                rental.style.display = "table-row";  // Show matching rental
            } else {
                rental.style.display = "none";  // Hide non-matching rental
            }
        });
    }
</script>


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
    <div class="search-bar">
        <label for="searchQuery">Search by Name:</label>
        <input type="text" id="searchQuery" onkeyup="filterRentals()" placeholder="Enter name to search...">
    </div>

    <!-- Rental Records Table -->
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Vehicle ID</th>
            <th>Pick-up date</th>
            <th>Return date</th>
            <th>Total Price</th>
        </tr>
        
        <!-- Printing records using JSTL forEach loop -->
        <c:forEach var="rd" items="${RData}">
            <tr class="rental-row">
                <td>${rd.id}</td>
                <td class="rental-name">${rd.name}</td>
                <td>${rd.phone}</td>
                <td>${rd.vehicle}</td>
                <td>${rd.pDate}</td>
                <td>${rd.rDate}</td>
                <td>${rd.fee}</td>
            </tr>
        </c:forEach>
    </table>
    </div>
    </div>
</body>
</html>
