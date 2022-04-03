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
