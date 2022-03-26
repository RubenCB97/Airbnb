<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html id="list">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet"  href="${pageContext.request.contextPath}/css/stylesheet.css"   />
		<title>List of Hostings</title>
	</head>
	<body>
		<h1> Different Lists:</h1> 
		<h2> List of Hostings:</h2>
		<table>
			<thead>
				<tr>
					<th>Title</th>
					<th>Description</th>
					<th>Telephone</th>
					<th>Likes</th>
					<th>Location</th>
					<th>Contact Email</th>
					<th>Available</th>
					<th>User</th>
					<th>Category Ids</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="Hosting" items="${HostingsList}">
					<tr> 
						<td>${Hosting.first.title}</td>
						<td>${Hosting.first.description}</td>
						<td>${Hosting.first.telephone}</td>
						<td>${Hosting.first.likes}</td>
						<td>${Hosting.first.location}</td>
						<td>${Hosting.first.contactEmail}</td>
						<td>
						<c:choose>
		    				<c:when test="${Hosting.first.available=='1'}">
		    					Yes
		    				</c:when>
		    				<c:otherwise>
		    					No
		    				</c:otherwise>	
		    			</c:choose>
						</td>
						<td>${Hosting.second.username}</td>
						<td> <c:forEach var="category" items="${Hosting.third}">
							${category.idct} - 		    	
							</c:forEach>
						</td>
						
					</tr>	
		    	</c:forEach>
		    	</tbody>	
			</table>	
		<h2> List of Hostings by users:</h2>
		<c:forEach var="HostingsByUser" items="${usersMap}"> 
			<h3>User: ${HostingsByUser.key.username}</h3>
			<h3>Email: ${HostingsByUser.key.email}</h3>
			<c:forEach var="Hosting" items="${HostingsByUser.value}">
				<div>
					<h4>${Hosting.title}</h4>
		    		<p>${Hosting.description}</p> 
		    		<p>${Hosting.telephone}</p> 
		    		<p>${Hosting.likes}</p> 
		    		<p>${Hosting.location}</p> 
		    		<p>${Hosting.contactEmail}</p>
		    		<p>
		    			<c:choose>
		    				<c:when test="${Hosting.available=='1'}">
		    					Booked
		    				</c:when>
		    				<c:otherwise>
		    					Available
		    				</c:otherwise>	
		    			</c:choose>
					</p> 
				</div>	
		    </c:forEach>
	    </c:forEach>
	</body>
</html>
