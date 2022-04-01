<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="es">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Waterbnb-mis alojamientos</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/detail.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/menu.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/card.css" />
</head>
<body>


	<%@include file="/WEB-INF/menu.jsp"%>
	
	<main class="main">
	<button
		onclick="location.href='${pageContext.request.contextPath}/waterbnb/CreateHostServlet'"
		type="button">Crear Alojamiento</button>
		<c:forEach var="host" items="${hostlistMap}">
			<div class="container">
				<h2>${host.key.title}</h2>
				<div class="row">

					<div class="column">
						<img src="${pageContext.request.contextPath}/images/House1.jpg"
							alt="TestHouse" /> <img
							src="${pageContext.request.contextPath}/images/piscina-lujo.jpg"
							alt="TestHouse" />
					</div>
					<div class="column">
						<img
							src="${pageContext.request.contextPath}/images/piscina-lujo2.jpg"
							alt="TestHouse" /> <img
							src="${pageContext.request.contextPath}/images/piscina-lujo3.jpg"
							alt="TestHouse" />
					</div>
					<div class="column">
						<p>${host.key.description}</p>
						<p>${host.key.location}</p>
						<p>Tlf: ${host.key.telephone}</p>
						<p>${host.key.price}€/noche</p>
						<p>Correo de contacto: ${host.key.contactEmail}</p>
						<p>Categoria:
						<c:forEach var="cat" items="${host.value}">
							 ${cat}
						</c:forEach>
						<p>Servicios extra:
						<c:forEach var="serv" items="${userServicesMap}">
							<c:if test ="${host.key.id==serv.key.id}">
								<c:forEach var="se" items="${serv.value}">
									${se}
								</c:forEach>
							</c:if>
						</c:forEach>  
						</p>
						<p>Likes: ${host.key.likes}</p>
						<c:choose>
							<c:when test="${host.key.available=='1'}">
		    			Estado: Booked
		    		</c:when>
							<c:otherwise>
		    			Estado: Available
		    		</c:otherwise>
						</c:choose>
						<div>
							<button
								onclick="location.href='${pageContext.request.contextPath}/waterbnb/EditHostServlet?id=${host.key.id}'"
								type="button">Editar</button>
							<form
								action="${pageContext.request.contextPath}/waterbnb/DeleteHostServlet?id=${host.key.id}"
								method="POST">
								<button type="submit" name="deleteHost" value="delete">Delete</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</main>
</body>
</html>
