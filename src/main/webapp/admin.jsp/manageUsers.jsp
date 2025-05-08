<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <%@ page session="true" %>
    <%
    	String username = (String) session.getAttribute("username");
    	System.out.println(username);
    %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Users - Vehicle Rental System</title>
    <link rel="stylesheet" type="text/css" href="css/manageUsers.css">
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
    
    <div class="main-content">
        <!-- Header -->
        
            <h1>Manage Users</h1>     
            <br>

        <!-- User Table -->
        <table class="user-table">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>DOB</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th>Role</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Operation</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="regus" items="${RegUserAccountDetails}"> 
            	<c:set var="id" value="${regus.id}"/>
                <tr>
                    <td>${regus.id}</td>
                    <td>${regus.name}</td>
                    <td>${regus.address}</td>
                    <td>${regus.dob}</td>
                    <td>${regus.email}</td>
                    <td>${regus.mobile}</td>
                    <td>${regus.role}</td>
                    <td>${regus.username}</td>
                    <td>${regus.password}</td>
                    <td>
                        <c:url value="deleteUserAccount.jsp" var="userdelete">
							<c:param name="id" value="${id}"/>
						</c:url>
							<a href="${userdelete}">
							<input type="button" class="delete-btn" name="delete" value="Delete">
							</a>
                    </td>
                </tr>
           </c:forEach>
            </tbody>
        </table>
        
    </div>
    </div>
</body>
</html>
