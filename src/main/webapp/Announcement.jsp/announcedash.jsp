 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Random" %>
<%@ page import="java.util.Arrays" %>
<%
    // Array of image file names stored in the 'images/announcements' folder
    String[] images = {
        "announcement1.jpg","announcement2.jpg","announcement3.jpg","announcement4.jpg","announcement5.jpg","announcement6.jpg"
        ,"announcement7.jpeg"
    };

    // Function to get a random image for each announcement
    Random random = new Random();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Announcements</title>
    <link rel="stylesheet" type="text/css" href="../css/ancadmin.css"> <!-- Link to CSS file -->
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
        
    <!-- Container for main content -->
    <div class="main-container">
         <h1>Announcements &#x1F4E8;</h1>

        <!-- Button to create a new announcement -->
        <div class="create-announcement-container">
            <a href="insertannouce.jsp">
                <button class="btn-create-announcement">Create Announcement</button>
            </a>
        </div>

        <!-- Announcement list in card format -->
        <div class="announcement-list">
            <c:forEach var="anc" items="${annDetails}">
             <%
                // Pick a random image for each announcement
                String randomImage = images[random.nextInt(images.length)];
            %>
                <div class="announcement-card">
                  <!-- Display the random image -->
                 <img src="images/<%= randomImage %>" alt="Announcement Image">
                    <!-- Header of the announcement -->
                    
                    <div class="announcement-header">
                        <h4>ID : ${anc.id}</h4>
                        <span class="announcement-date">${anc.date}</span>
                        <h2>${anc.title}</h2>
                    </div>
                    
                    <!-- Announcement content -->
                    <p>${anc.content}</p>

                    <!-- Update Button -->
                    <c:url value="announceUpdate.jsp" var="annupdate">
                        <c:param name="id" value="${anc.id}"/>
                        <c:param name="date" value="${anc.date}"/>
                        <c:param name="category" value="${anc.category}"/>
                        <c:param name="title" value="${anc.title}"/>
                        <c:param name="content" value="${anc.content}"/>
                    </c:url>
                    <a href="${annupdate}">
                        <button class="btn-update">Update</button>
                    </a>

                    <!-- Delete Button -->
                    <c:url value="announceDelete.jsp" var="anndelete">
                        <c:param name="id" value="${anc.id}"/>
                        <c:param name="date" value="${anc.date}"/>
                        <c:param name="category" value="${anc.category}"/>
                        <c:param name="title" value="${anc.title}"/>
                        <c:param name="content" value="${anc.content}"/>
                    </c:url>
                    <a href="${anndelete}">
                        <button class="btn-delete">Delete</button>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
 