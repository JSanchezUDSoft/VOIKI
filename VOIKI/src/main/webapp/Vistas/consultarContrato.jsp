<%--
  Created by IntelliJ IDEA.
  User: juan_
  Date: 19/05/2024
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Consultar Contrato</title>
</head>
<body>
<h1>Consultar Contrato</h1>
<c:if test="${not empty contrato}">
    <div>
        <div>ID Contrato: ${contrato.idContrato}</div>
        <div>Fecha de Creación: ${contrato.fechaCreacion}</div>
        <div>Fecha de Firma: ${contrato.fechaFirma}</div>
        <div>Fecha de Inicio: ${contrato.fechaInicio}</div>
        <div>Fecha de Finalización: ${contrato.fechaFinalizacion}</div>
        <div>Cédula Arrendador: ${contrato.cedulaArrendador}</div>
        <div>Cédula Arrendatario: ${contrato.cedulaArrendatario}</div>
        <div>Código del Inmueble: ${contrato.codigoInmueble}</div>
        <div>Canon Pactado: ${contrato.canonPactado}</div>
        <div>Periodo de Facturación: ${contrato.periodoFacturacion}</div>
        <div>Términos y Condiciones: ${contrato.terminosycondicionesContrato}</div>
        <div>Firma Arrendador: ${contrato.firmaArrendador}</div>
        <div>Firma Arrendatario: ${contrato.firmaArrendatario}</div>
    </div>
</c:if>
<c:if test="${empty contrato}">
    <div>No se encontró un contrato para la consulta realizada.</div>
</c:if>
</body>
</html>