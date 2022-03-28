<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Menu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css" />
  </head>

  <body>
   <header class="header">
      <div class="menu">
      
        <a href="MainWebServlet" id="logo">WATERBNB</a>
        <nav class="navigation">
          <ul>
            <li><a href="MainWebServlet">Inicio</a></li>
            <li><a href="waterbnb/HostServlet">Localización</a></li>
            <li><div ${visibility_profile}><a class=desp href="waterbnb/HostServlet">Mis Alojamientos</a></div></li>  
          	<li><div ${visibility_profile}><a href="#">Perfil</a></div>
       			<ul>
           			<li><a class=desp href="waterbnb/ProfileServlet">Editar Perfil</a></li>          	
           		</ul>
            </li>
            <li><div ${visibility_login}><a href="waterbnb/LoginUserServlet">Login</a></div>
            <li><a href="waterbnb/LogoutServlet">Salir</a></li>
          </ul>
        </nav>
      </div>
    </header>
  </body>
</html>
