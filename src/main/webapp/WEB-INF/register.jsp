<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login-register.css" />
  </head>

  <body>
    <div class="register">
      <div class="login-card">
        <h1>Registro</h1>
        <form action="login.html">
          <p>Usuario</p>
          <input
            class="input"
            type="text"
            name="user"
            id="user"
            placeholder="Usuario"
          />
          <p>Contraseña</p>
          <input
            class="input"
            type="password"
            pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
            title="Debe contener 8 dígitos entre los que se incluye un número, una mayúscula y una minúscula"
            required
            name="pass"
            id="pass"
            placeholder="Contraseña"
          />
          <p>Email</p>
          <input
            class="input"
            type="text"
            name="email"
            id="email"
            placeholder="Email"
          />
          <input type="submit" value="Registrarse" />
        </form>
      </div>
    </div>
  </body>
</html>
