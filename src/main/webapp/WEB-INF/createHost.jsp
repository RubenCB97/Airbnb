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

</head>
<body>


	<%@include file="/WEB-INF/menu.jsp"%>

	<main class="main">

		<form
			action="${pageContext.request.contextPath}/user/CreateHostServlet"
			method="POST">
			<div class="container">
				<h2>
					Titulo: <input class="input" type="text" name="title" id="title"
						placeholder="${host.title}" required value="${host.title}" />
				</h2>
					</div>
					<div class="column">
						<p>Descripcion:</p>
						<textarea class="input" name="description" id="description">Descripción del alojamiento</textarea>

						<p>Localización:</p>
						<input class="input" type="text" name="location" required id="location"/>
						<p>Tlf:</p>
						<input class="input" type="tel" name="telephone" required id="telephone" />
						<p>Precio:</p>
						<input class="input" type="number" name="price" required id="price" placeholder="0€" />
						<p>Correo de contacto:</p>
						<input class="input" type="email" name="contactEmail" required id="contactEmail"/>
						<p>Categoria:
						<c:forEach var="cat" items="${categoryList}">
							<input id="${cat.name}" type="checkbox" name="categories"  value="${cat.id}"/> 
							<label for="${cat.name} ">${cat.name}</label> 
						</c:forEach>
						</p>
						<p>Servicios:
						<c:forEach var="serv" items="${serviceList}">
							<input id="${serv.name}" type="checkbox" name="services"  value="${serv.id}"/> 
							<label for="${serv.name} ">${serv.name}</label> 
						</c:forEach>
						</p>
						<p>Estado:
						<input type="radio" name="state" id="available" checked value="0"/> Disponible
						<input type="radio" name="state" id="Booked" value="1" /> Reservado
						</p>
						<div>
							<input class="create" type="submit" value="Crear Alojamiento" />
						</div>
					</div>
		</form>
		<p class="error">${menError}</p>

	</main>
</body>
</html>
