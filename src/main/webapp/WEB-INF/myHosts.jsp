<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Waterbnb-alquilar</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/detail.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/card.css" />
  </head>
  <body>
    
     
         <%@include file="/WEB-INF/menu.jsp" %>

    <main class="main">
     <c:forEach var="host" items="${hostlist}">
        <div class="container">
        <h2>${host.title}</h2>
            <div class="row">
            
                <div class="column">
                <img src="./images/House1.jpg" alt="TestHouse" />
                <img src="./images/piscina-lujo.jpg" alt="TestHouse" />
                </div>
                <div class="column">
                <img src="./images/piscina-lujo2.jpg" alt="TestHouse" />
                <img src="./images/piscina-lujo3.jpg" alt="TestHouse" />
                </div>
                <div class="column">
                <p>${host.description}</p>
                <p>${host.location}</p>
                <p>Tlf: ${host.telephone}</p>
                <p>Correo de contacto: ${host.contactEmail}</p>
                
                <p>Categoria: ${host.contactEmail}</p>
                <p>Estado: ${host.available}</p>
	                <div>
	                    <form action="DeleteProfileServlet" method="post">
	                    <button type="submit" class="btn-delete">Editar</button>
	                    </form>
	                    <form action="DeleteProfileServlet" method="post">
	                    <button type="submit" class="btn-delete">Eliminar</button>
	                    </form>
	                
	                </div>
           		</div>
           </div>
         
        </div>
        </c:forEach>
        
       
    </main>
  </body>
</html>
