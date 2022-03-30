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
			<h2>Villas Canava II, piscina privada, Santorini</h2>

			<div class="row">
				<div class="column">
					<img src="./images/House1.jpg" alt="TestHouse" /> <img
						src="./images/piscina-lujo.jpg" alt="TestHouse" />
				</div>
				<div class="column">
					<img src="./images/piscina-lujo2.jpg" alt="TestHouse" /> <img
						src="./images/piscina-lujo3.jpg" alt="TestHouse" />
				</div>
				<div class="column">
					<h3>$1.000.000/noche</h3>
					<p>Preciosa Villa con Piscina Privada. Vista despejada de
						montañas, valles y mar. Acogedora y confortable villa
						"Clementina", 2 plantas. Monte Pego, posición elevada, a 8 km del
						mar. Para uso privado: jardín natural, piscina en forma de riñón
						(8 x 4 m). Plaza de aparcamiento en el suelo. Supermercado 6 km,
						restaurante 2 km, playa de arena 8 km. Campo de golf a 12 km,
						tenis a 5 km.</p>
					<p>A 920 kilómetros de distancia.</p>
					<p>Tlf: 666666666</p>
					<p>Correo de contacto: prueba@gmail.com.</p>
					<select required name="Categoria" class="form-control">
						<option value="">Categoria</option>
						<option value="Categoria1">Categoria1</option>
						<option value="Categoria2">Categoria2</option>
						<option value="Categoria3">Categoria3</option>
					</select><br />
					<p>
						Servicios: <input type="checkbox" name="Servicios"
							value="Servicios" />
					</p>
					<p>
						Fecha de reserva <input type="date" name="Fecha" class="date" />
					</p>
					<p>
						<input type="submit" class="comp" name="Compra" value="Reservar" />
					</p>
					<form>
						<p class="clasificacion">
							<input id="radio1" type="radio" name="estrellas" value="5" />
							<!--
                            -->
							<label for="radio1">★</label>
							<!--
                            -->
							<input id="radio2" type="radio" name="estrellas" value="4" />
							<!--
                            -->
							<label for="radio2">★</label>
							<!--
                            -->
							<input id="radio3" type="radio" name="estrellas" value="3" />
							<!--
                            -->
							<label for="radio3">★</label>
							<!--
                            -->
							<input id="radio4" type="radio" name="estrellas" value="2" />
							<!--
                            -->
							<label for="radio4">★</label>
							<!--
                            -->
							<input id="radio5" type="radio" name="estrellas" value="1" />
							<!--
                            -->
							<label for="radio5">★</label>
						</p>
					</form>
				</div>
			</div>
		</div>
	</main>
</body>
</html>
