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
      
        <a href="MainWeb" id="logo">WATERBNB</a>
        <nav class="navigation">
          <ul>
            <li><a href="MainWeb">Inicio</a></li>
            <li><a href="./location.html">Localización</a></li>
          	
          	<li><div ${visibility_profile}><a href="#">Perfil</a></div>
         			<ul>
	            		<li><a class=desp href="Profile">Editar Perfil</a></li>
	            		<li><a class=desp href="#">Mis Alojamientos</a></li>            	
	            	</ul>
            </li>
            <li><div ${visibility_login}><a href="Login">Login</a></div>
            <li><a href="Logout">Salir</a></li>
          </ul>
        </nav>
      </div>
    </header>
  </body>
</html>
