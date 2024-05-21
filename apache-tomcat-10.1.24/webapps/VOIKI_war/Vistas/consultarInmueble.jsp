<%--
  Created by IntelliJ IDEA.
  User: juan_
  Date: 19/05/2024
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Consultar Inmueble</title>
</head>
<body>
<h1>Consultar Inmueble</h1>
<c:forEach var="propiedad" items="${propiedades}">
    <div>
        <div>ID Propiedad: ${propiedad.idPropiedad}</div>
        <div>Cédula Catastral: ${propiedad.cedulaCatastral}</div>
        <div>Matrícula Inmobiliaria: ${propiedad.matriculaInmobiliaria}</div>
        <div>Dirección: ${propiedad.direccion}</div>
        <div>Ciudad: ${propiedad.ciudad}</div>
        <div>Barrio: ${propiedad.barrio}</div>
        <div>Estrato: ${propiedad.estrato}</div>
        <div>Área: ${propiedad.area}</div>
        <div>Habitaciones: ${propiedad.habitaciones}</div>
        <div>Baños: ${propiedad.banos}</div>
        <div>Descripción: ${propiedad.descripcion}</div>
        <div>Canon de Arrendamiento: ${propiedad.canonArrrendamiento}</div>
        <div>Disponibilidad: ${propiedad.disponibilidad}</div>
    </div>
    <hr>
</c:forEach>
<c:if test="${empty propiedades}">
    <div>No se encontraron inmuebles para la consulta realizada.</div>
</c:if>
</body>
</html>
