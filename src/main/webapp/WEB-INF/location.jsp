<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Waterbnb-localizacion</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/location.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/card.css" />
  </head>

  <body>
  
    <%@include file="/WEB-INF/menu.jsp" %>

    <main class="main">
      <div class="search">
        <select required name="provincia" class="form-control">
          <option value="">Elige País</option>
          <option value="España">España</option>
        </select>
        <select required name="provincia" class="form-control">
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
        <input
          type="date"
          class="start"
          name="trip-start"
          value="2022-02-01"
          min="2022-01-01"
          max="2022-12-31"
        />
      </div>
      <div class="map-responsive">
        <iframe
          src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d12320.422056324322!2d-6.3758094!3d39.46694495!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses!2ses!4v1646042870185!5m2!1ses!2ses"
          width="800"
          height="450"
          style="border: 0"
          allowfullscreen=""
        ></iframe>
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
      </div>
    </main>
  </body>
</html>
