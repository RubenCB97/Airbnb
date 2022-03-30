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
			action="${pageContext.request.contextPath}/waterbnb/CreateHostServlet"
			method="POST">
			<div class="container">
				<h2>
					Titulo: <input class="input" type="text" name="title" id="title"
						placeholder="${host.title}" required value="${host.title}" />
				</h2>
					</div>
					<div class="column">
						<p>Descripcion:</p>
						<textarea rows="" cols="" name="description" id="description">Descripcion del alojamiento</textarea>

						<p>Location:</p>
						<input class="input" type="text" name="location" id="location"/>
						<p>Tlf:</p>
						<input class="input" type="tel" name="telephone" id="telephone" />
						<p>Precio:</p>
						<input class="input" type="number" name="price" id="price" placeholder="0€" />
						<p>Correo de contacto:</p>
						<input class="input" type="email" name="contactEmail" id="contactEmail"/>
						<p>Categoria</p>
						<input type="radio" name="state" id="available" value="0"/> Disponible
						<input type="radio" name="state" id="Booked" value="1" /> Ocupado
						
						<div>
							<input type="submit" value="Crear Alojamiento" />
						</div>
					</div>
		</form>

	</main>
</body>
</html>
