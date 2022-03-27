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
          <option value="CasaDeLujo">Casa de lujo</option>
          <option value="CasaDeDomo">Casa de domo</option>
          <option value="CasasDeCampo">Casa de campo</option>
          <option value="CasasDePlaya">Casa de playa</option>
          <option value="Castillo">Castillo</option>
          <option value="Cabaña">Cabaña</option>
        </select>
        <input
          type="search"
          id="site-search"
          name="q"
          aria-label="Search through site content"
        />

        <button id="button-search">Buscar</button>
      </div>
      <div class="container">
        <div class="card">
          <a href="detail.html"
            ><img
              class="card-image"
              src="${pageContext.request.contextPath}/images/House1.jpg"
              alt="TestHouse"
              />
            </a>
          <div class="card-text">
            <div class="title">
              <span>Villas Canava II, piscina privada, Santorini</span>
            </div>
            <div class="subtitle">
              <span>A 920 kilómetros de distancia</span>
            </div>
          </div>
        </div>

        <div class="card">
          <a
            ><img
              class="card-image"
              src="${pageContext.request.contextPath}/images/house16.jpg"
              alt="TestHouse"
          /></a>
          <div class="card-text">
            <div class="title">
              <span>Piscina climatizada de la villa Minoas Sea</span>
            </div>
            <div class="subtitle">
              <span>A 90 kilómetros de distancia</span>
            </div>
          </div>
        </div>

        <div class="card">
          <a
            ><img
              class="card-image"
              src="${pageContext.request.contextPath}/images/House4.jpeg"
              alt="TestHouse"
          /></a>
          <div class="card-text">
            <div class="title">
              <span>Vista a la playa aparte</span>
            </div>
            <div class="subtitle">
              <span>A 145 kilómetros de distancia</span>
            </div>
          </div>
        </div>

        <div class="card">
          <a
            ><img
              class="card-image"
              src="${pageContext.request.contextPath}/images/House5.jpg"
              alt="TestHouse"
          /></a>
          <div class="card-text">
            <div class="title">
              <span>Una casa única en una ubicación muy especial</span>
            </div>
            <div class="subtitle">
              <span>A 832 kilómetros de distancia</span>
            </div>
          </div>
        </div>

        <div class="card">
          <a
            ><img
              class="card-image"
              src="${pageContext.request.contextPath}/images/house10.jpg"
              alt="TestHouse"
          /></a>
          <div class="card-text">
            <div class="title">
              <span>Casa menorquina frente al mar</span>
            </div>
            <div class="subtitle">
              <span>A 58 kilómetros de distancia</span>
            </div>
          </div>
        </div>

        <div class="card">
          <a
            ><img
              class="card-image"
              src="${pageContext.request.contextPath}/images/house11.jpg"
              alt="TestHouse"
          /></a>
          <div class="card-text">
            <div class="title">
              <span>Cavernas modernas</span>
            </div>
            <div class="subtitle">
              <span>A 92 kilómetros de distancia</span>
            </div>
          </div>
        </div>

        <div class="card">
          <a
            ><img
              class="card-image"
              src="${pageContext.request.contextPath}/images/house12.jpg"
              alt="TestHouse"
          /></a>
          <div class="card-text">
            <div class="title">
              <span>Villamaravilla</span>
            </div>
            <div class="subtitle">
              <span>A 325 kilómetros de distancia</span>
            </div>
          </div>
        </div>

        <div class="card">
          <a
            ><img
              class="card-image"
              src="${pageContext.request.contextPath}/images/house13.jpg"
              alt="TestHouse"
          /></a>
          <div class="card-text">
            <div class="title">
              <span>Villa con piscina</span>
            </div>
            <div class="subtitle">
              <span>A 570 kilómetros de distancia</span>
            </div>
          </div>
        </div>

        <div class="card">
          <a
            ><img
              class="card-image"
              src="${pageContext.request.contextPath}/images/house14.jpg"
              alt="TestHouse"
          /></a>
          <div class="card-text">
            <div class="title">
              <span>Mansión inglesa</span>
            </div>
            <div class="subtitle">
              <span>A 126 kilómetros de distancia</span>
            </div>
          </div>
        </div>

        <div class="card">
          <a
            ><img
              class="card-image"
              src="${pageContext.request.contextPath}/images/house15.jpg"
              alt="TestHouse"
          /></a>
          <div class="card-text">
            <div class="title">
              <span>Castillo en Villamonte</span>
            </div>
            <div class="subtitle">
              <span>A 432 kilómetros de distancia</span>
            </div>
          </div>
        </div>

        <div class="card">
          <a
            ><img
              class="card-image"
              src="${pageContext.request.contextPath}/images/House8.jpg"
              alt="TestHouse"
          /></a>
          <div class="card-text">
            <div class="title">
              <span>Cabaña en la noche</span>
            </div>
            <div class="subtitle">
              <span>A 712 kilómetros de distancia</span>
            </div>
          </div>
        </div>

        <div class="card">
          <a
            ><img
              class="card-image"
              src="${pageContext.request.contextPath}/images/Airbnb-Cabins-Japan.jpg"
              alt="TestHouse"
          /></a>
          <div class="card-text">
            <div class="title">
              <span>Cabaña salvaje</span>
            </div>
            <div class="subtitle">
              <span>A 31 kilómetros de distancia</span>
            </div>
          </div>
        </div>
      </div>
    </main>
  </body>
</html>
