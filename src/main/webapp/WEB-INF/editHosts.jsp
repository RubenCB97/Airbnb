<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="es">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Waterbnb-editar alojamiento</title>
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

		<form
			action="${pageContext.request.contextPath}/waterbnb/EditHostServlet?id=${host.id}"
			method="POST">
			<div class="container">
				<h2>
					Titulo: <input class="input" type="text" name="title" id="title"
						placeholder="${host.title}" required value="${host.title}" />
				</h2>
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
						<p>Descripcion:</p>
						<textarea rows="" cols="" name="description" id="description">${host.description}</textarea>

						<p>Location:</p>
						<input class="input" type="text" name="location" id="location"
							value="${host.location}" />

						<p>Tlf:</p>
						<input class="input" type="tel" name="telephone" id="telephone"
							value="${host.telephone}" />

						<p>Precio:</p>
						<input class="input" type="number" name="price" id="price"
							value="${host.price}" />

						<p>Correo de contacto:</p>
						<input class="input" type="email" name="contactEmail"
							id="contactEmail" value="${host.contactEmail}" />

						<p>
							Categoria:

							<c:forEach var="cat" items="${categoryList}">
								<c:choose>
									<c:when test="${cat.value == true }">
										<input id="${cat.key.name}" type="checkbox" name="categories"
											checked value="${cat.key.id}" />
										<label for="${cat.key.name} ">${cat.key.name}</label>
									</c:when>
									<c:otherwise>
										<input id="${cat.key.name}" type="checkbox" name="categories"
											value="${cat.key.id}" />
										<label for="${cat.key.name} ">${cat.key.name}</label>
									</c:otherwise>
								</c:choose>
							</c:forEach>

						</p>

						<p>
							Servicios:
							<c:forEach var="serv" items="${serviceList}">
								<c:choose>
									<c:when test="${serv.value == true }">
										<input id="${serv.key.name}" type="checkbox" name="services"
											checked value="${serv.key.id}" />
										<label for="${serv.key.name}">${serv.key.name}</label>
									</c:when>
									<c:otherwise>
										<input id="${serv.key.name}" type="checkbox" name="services"
											value="${serv.key.id}" />
										<label for="${serv.key.name}">${serv.key.name}</label>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</p>

						<div>
							<c:choose>
								<c:when test="${host.available=='1'}">
									<input type="radio" name="state" id="available" value="0" />
									<label for="available">Disponible </label>
									<input type="radio" name="state" id="Booked" value="1"
										checked="checked" />
									<label for="Booked">Reservado </label>

								</c:when>
								<c:otherwise>
									<input type="radio" name="state" id="available" value="0"
										checked="checked" />
									<label for="available">Disponible </label>
									<input type="radio" name="state" id="Booked" value="1" />
									<label for="Booked">Reservado </label>
								</c:otherwise>
							</c:choose>


						</div>
						<div></div>

						<div>
							<input type="submit" value="Editar" />
						</div>
					</div>
				</div>
			</div>
		</form>
		<p>${menError}</p>


	</main>
</body>
</html>
