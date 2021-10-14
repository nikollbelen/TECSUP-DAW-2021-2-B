<%-- 
    Document   : listadoMatriculas
    Created on : 14-oct-2021, 13:19:06
    Author     : nikol
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" 
              href="webjars/bootstrap/5.1.0/css/bootstrap.min.css" type="text/css" />
    </head>
    <body>
    <div class="card" style="padding: 30px 0px 0px 30px;">
        <h4 class="display-8">Detalles de matricula</h4>
        <form method=POST action="#">
            <table class="table table-striped table-hover">
            <thead>
            <tr>
            <th scope="col">Codigo</th>
            <th scope="col">Fecha</th>
            <th scope="col">Nro_doc</th>
            <th scope="col">Codigo del alumno</th>
            <th scope="col">Total</th>
            <th scope="col">Estado</th>
            </tr>
            </thead>
            <tbody>
            <tr>
            <td><c:out value='${matricula.codigo}'/></td>
            <td><c:out value='${matricula.fecha}' /></td>
            <td><c:out value='${matricula.nro_doc}'/></td>
            <td><c:out value='${matricula.codigo_alumno}'/></td>
            <td><c:out value='${matricula.total}'/></td>
            <td><c:out value='${matricula.estado}'/></td>
            </tr>
            </tbody>
            </table>
        </form>
    </div>
    </body>
</html>
