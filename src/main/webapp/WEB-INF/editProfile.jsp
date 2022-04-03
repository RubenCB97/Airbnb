<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Waterbnb-Perfil</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/user.css" />
</head>

<body>

	<%@include file="/WEB-INF/menu.jsp"%>

	<div class="editPerfil">
	<div class="login-card">
		<div class="title">
			<b>${name} - Editar perfil</b>
		</div>
		<div class="email">
		<p>Email actual: ${email}</p>
		</div>
		<form method="POST" action="ProfileServlet">

			<p>Contraseña actual</p>
			<input class="input" type="password" name="passwordOld" id="passOld"
				placeholder="Contraseña actual" />
			<p>Contraseña nueva</p>
			<input class="input" type="password"
				pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				title="Debe contener 8 dígitos entre los que se incluye un número, una mayúscula y una minúscula"
				required name="password" id="pass" placeholder="Contraseña" />
			<p>Cambiar email</p>
			<input class="input" type="email"
				pattern="[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-zA-Z]{2,4}" name="email"
				required id="email" placeholder="Email" /> <input type="submit"
				value="Guardar cambios" />
		</form>

		<div>
			<form method="POST" action="DeleteProfileServlet">
				<input type="submit" value="Eliminar Cuenta" />
			</form>
		</div>
		<p class="error">${messages}</p>
	</div>
	</div>	
	

</body>
</html>
