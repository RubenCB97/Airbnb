<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Waterbnb-alquilar</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/detail.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/menu.css" />
</head>

<body>

	<%@include file="/WEB-INF/menu.jsp"%>

	<main class="main">
		<div class="container">
			<h2>Titulo: ${host.title}</h2>
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
					<h3>${host.price}€/noche</h3>
					<p>${host.description}</p>
					<p>${host.location}.</p>
					<p>Tlf: ${host.telephone}</p>
					<p>Correo de contacto: ${host.contactEmail}.</p>
					<p>
						Categoria:

						<c:forEach var="cat" items="${categoryList}">
						${cat.name} 
    				</c:forEach>
					<p>
						Servicios:
						<c:forEach var="serv" items="${serviceList}">
						${serv.name}
						</c:forEach>
					</p>
					<div>
						<c:choose>
							<c:when test="${host.available=='1'}">
    					Estado: Reservado
    				</c:when>
							<c:otherwise>
    					Estado: Disponible
					</c:otherwise>
						</c:choose>
					</div>
					<div>
						<p>Likes :${host.likes}</p>
					</div>
					<c:choose>
						<c:when test="${like=='0'}">
							<form
								action="${pageContext.request.contextPath}/DetailHostServlet?id=${host.id}"
								method="POST">
								<input type="submit" value="Dar Like" />
							</form>
						</c:when>
						<c:otherwise>
							<form
								action="${pageContext.request.contextPath}/DetailHostServlet?id=${host.id}"
								method="POST">
								<input type="submit" value="Quitar Like" />
							</form>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</main>
</body>
</html>
