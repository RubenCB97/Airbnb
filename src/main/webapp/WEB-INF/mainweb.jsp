<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Waterbnb-inicio</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/catalogue.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/card.css" />
  </head>

  <body>
   	
   	<%@include file="/WEB-INF/menu.jsp"  %>
   
    <main class="main">
      <div class="category">
        <select required name="categoria" class="form-control">
          <option value="">Elige categoria</option>
          <c:forEach var="cat" items="${category}">
          <option value="${cat.name}">${cat.name}</option> 
        </c:forEach>
        </select>
        <input
          type="search"
          id="site-search"
          name="q"
          aria-label="Search through site content"
        />
	<button id="button-search">Filtrar</button>
      </div>
      
      
      <div class="container">
      
       <c:forEach var="host" items="${allHost}">
        <div class="card">
          <a href="${pageContext.request.contextPath}/DetailHostServlet?id=${host.id}"
            ><img class="card-image"
					src="${pageContext.request.contextPath}/images/House1.jpg"
					alt="TestHouse" /> </a>
          <div class="card-text">
            <div class="titles">
               <p>${host.title}</p>
            </div>
            <div class="subtitles">
              	<span>${host.location}</span>
            </div>
            <div class="subtitles">
            	<span>${host.price}</span>
            </div>
            <div class="subtitles">
            	 <span>Likes: ${host.likes}</span>
            	
            </div>
          </div>
        </div>
        </c:forEach>

      </div>
    </main>
  </body>
</html>
