 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Announcements</title>
    <link rel="stylesheet" type="text/css" href="../css/updateAnn.css"> <!-- Link to your CSS file -->
</head>
<body>

<%
    String id = request.getParameter("id");
    String date = request.getParameter("date");
    String category = request.getParameter("category");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    
%>

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
     <div class="main-content">   
        
		<h1>Delete Announcement&#128203;&#128260;</h1> <!-- Added title above the form -->
	<form action="deleteAnn" method="post">
    	<table>
        <tr>
            <td>Announcement ID</td>
            <td><input type="text" name="id" value="<%= id %>" readonly></td>
        </tr>
        <tr>
            <td>Date</td>
            <td><input type="text" name="date" value="<%= date%>" readonly></td>
        </tr>
        <tr>
            <td>Category</td>
            <td><input type="text" name="category" value="<%= category %>"readonly></td>
        </tr>
        <tr>
            <td>Title</td>
            <td><input type="text" name="title" value="<%= title %>"readonly></td>
        </tr>
        <tr>
            <td>Content</td>
            <td><input type="text" name="content" value="<%= content %>"readonly></td>
        </tr>
        
    </table>
    
    <input type="submit" name="submit" value="delete">
</form>
</div>
</div>
</body>
</html>