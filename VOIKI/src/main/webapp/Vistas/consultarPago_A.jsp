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
    <title>Consultar Pagos</title>
</head>
<body>
<h1>Consultar Pagos</h1>
<c:forEach var="pago" items="${pagos}">
    <div>
        <div>Cuota: ${pago.cuota}</div>
        <div>Fecha de Pago: ${pago.fechaPago}</div>
        <div>Estado de Pago: ${pago.estadoPago}</div>
    </div>
    <hr>
</c:forEach>
<c:if test="${empty pagos}">
    <div>No se encontraron pagos para la consulta realizada.</div>
</c:if>
</body>
</html>
