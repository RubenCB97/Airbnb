<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Waterbnb-inicio</title>
 <link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/catalogue.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/menu.css" />

<link rel="stylesheet" 
	href="${pageContext.request.contextPath}/css/card.css" />
</head>

<body>

	<%@include file="/WEB-INF/menu.jsp"%>

	<main class="main">
		
	
		<div class="search">
		
		<form method="GET" action="MainWebServlet">
			<input type="search" id="site-search" name="search"
				aria-label="Search through site content" />
			<button id="button-search">Buscar</button>
		</form>
		
		
		<form method="GET" action="MainWebServlet">
			<div class="SelecLike">
				<label class="TextLike" for="MinLike"> Likes desde:	</label> 
				<input class="InputLike" value="0" type="number" name="MinLikes"
					placeholder="Likes Mínimo">
			</div>
		</form>

		<div class="button">
			<a
				href="<c:url value='MainWebServlet?filterLikes=MasLikes'/>"><button>Más
						favoritos</button></a>
			<a
				href="<c:url value='MainWebServlet?filterLikes=MenosLikes'/>"><button>Menos
						favoritos</button></a>
			<a href="<c:url value='MainWebServlet?filterFav=AllHosts'/>"><button>Todos
						los alojamientos</button></a>
			<a
				href="<c:url value='MainWebServlet?filterFav=DispHosts'/>"><button>Alojamientos
						disponibles</button></a>
			<a href="<c:url value='MainWebServlet?filterFav=ResHosts'/>"><button>Alojamientos
						reservados</button></a>
			</div>
	
	</div>
	
		<form method="GET" action="MainWebServlet">
	
		<div class="search">
			<select name="category" class="form-control">
				<option >Elige categoria</option>
				<c:forEach var="cat" items="${category}">
					<option value="${cat.name}" >${cat.name}</option>
				</c:forEach>
			</select>
			 <select name="provincia" class="form-control">
		          <option value="">Elige Provincia</option>
		          <option value="Álava/Araba">Álava/Araba</option>
		          <option value="Albacete">Albacete</option>
		          <option value="Alicante">Alicante</option>
		          <option value="Almería">Almería</option>
		          <option value="Asturias">Asturias</option>
		          <option value="Ávila">Ávila</option>
		          <option value="Badajoz">Badajoz</option>
		          <option value="Baleares">Baleares</option>
		          <option value="Barcelona">Barcelona</option>
		          <option value="Burgos">Burgos</option>
		          <option value="Cádiz">Cádiz</option>
		          <option value="Cantabria">Cantabria</option>
		          <option value="Castellón">Castellón</option>
		          <option value="Ceuta">Ceuta</option>
		          <option value="Ciudad Real">Ciudad Real</option>
		          <option value="Córdoba">Córdoba</option>
		          <option value="Cuenca">Cuenca</option>
		          <option value="Gerona/Girona">Gerona/Girona</option>
		          <option value="Granada">Granada</option>
		          <option value="Guadalajara">Guadalajara</option>
		          <option value="Guipúzcoa/Gipuzkoa">Guipúzcoa/Gipuzkoa</option>
		          <option value="Huelva">Huelva</option>
		          <option value="Huesca">Huesca</option>
		          <option value="Jaén">Jaén</option>
		          <option value="La Coruña/A Coruña">La Coruña/A Coruña</option>
		          <option value="La Rioja">La Rioja</option>
		          <option value="Las Palmas">Las Palmas</option>
		          <option value="León">León</option>
		          <option value="Lérida/Lleida">Lérida/Lleida</option>
		          <option value="Lugo">Lugo</option>
		          <option value="Madrid">Madrid</option>
		          <option value="Málaga">Málaga</option>
		          <option value="Melilla">Melilla</option>
		          <option value="Murcia">Murcia</option>
		          <option value="Navarra">Navarra</option>
		          <option value="Orense/Ourense">Orense/Ourense</option>
		          <option value="Palencia">Palencia</option>
		          <option value="Pontevedra">Pontevedra</option>
		          <option value="Salamanca">Salamanca</option>
		          <option value="Segovia">Segovia</option>
		          <option value="Sevilla">Sevilla</option>
		          <option value="Soria">Soria</option>
		          <option value="Tarragona">Tarragona</option>
		          <option value="Tenerife">Tenerife</option>
		          <option value="Teruel">Teruel</option>
		          <option value="Toledo">Toledo</option>
		          <option value="Valencia">Valencia</option>
		          <option value="Valladolid">Valladolid</option>
		          <option value="Vizcaya/Bizkaia">Vizcaya/Bizkaia</option>
		          <option value="Zamora">Zamora</option>
		          <option value="Zaragoza">Zaragoza</option>
	      	  </select>
				<div class="SelecPrice">
					<label class="TextPrice" for="MinPrice"> Precio desde:	</label> 
					<input class="InputPrice"  type="number" name="MinPrice"
					placeholder="Precio Mínimo">
					<label class="TextPrice" for="MaxPrice"> hasta: </label> <input class="InputPrice" type="number" name="MaxPRice"
					placeholder="Precio Máximo">
				</div>
			<select name="service" class="form-control">
				<option >Elige servicio</option>
				<c:forEach var="serv" items="${allServ}">
					<option value="${serv.name}">${serv.name}</option>
				</c:forEach>
			</select>
			<input type="search" id="site-search" name="search2"
				aria-label="Search through site content" />
			<button id="button-search">Buscar</button>
		</div>
		</form>
		

		<div class="container">

			<c:forEach var="host" items="${allHost}">
				<div class="card">
					<a
						href="${pageContext.request.contextPath}/DetailHostServlet?id=${host.id}"><img
						class="card-image"
						src="${pageContext.request.contextPath}/images/House1.jpg"
						alt="TestHouse" /> </a>
					<div class="card-text">
						<div class="title">
							<span>${host.title}</span>
						</div>
						<div class="subtitle">
							<span>${host.location}</span>
							<span>${host.price} €/noche</span>
							<span>Likes: ${host.likes}</span>
							<c:choose>
								<c:when test="${host.available=='1'}">
		    			 Reservado
		    		</c:when>
								<c:otherwise>
		    			 Disponible
		    		</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
	</main>
</body>
</html>
