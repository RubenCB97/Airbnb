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
     <c:forEach var="host" items="${hostlistMap}">
        <div class="container">
        <h2>${host.key.title}</h2>
            <div class="row">
            
                <div class="column">
                <img src="${pageContext.request.contextPath}/images/House1.jpg" alt="TestHouse" />
                <img src="${pageContext.request.contextPath}/images/piscina-lujo.jpg" alt="TestHouse" />
                </div>
                <div class="column">
                <img src="${pageContext.request.contextPath}/images/piscina-lujo2.jpg" alt="TestHouse" />
                <img src="${pageContext.request.contextPath}/images/piscina-lujo3.jpg" alt="TestHouse" />
                </div>
                <div class="column">
                <p>${host.key.description}</p>
                <p>${host.key.location}</p>
                <p>Tlf: ${host.key.telephone}</p>
                <p>Correo de contacto: ${host.key.contactEmail}</p>
  				<c:forEach var="cat" items="${host.value}">
                		<p>Categoria: ${cat}</p>	
                </c:forEach> 
                <p>Likes: ${host.key.likes}</p>
                <c:choose>
                	<c:when test="${Hosting.available=='1'}">
		    			Estado: Booked
		    		</c:when>
		    		<c:otherwise>
		    			Estado: Available
		    		</c:otherwise>	
		    	</c:choose>
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
