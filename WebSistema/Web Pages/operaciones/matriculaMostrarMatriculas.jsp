<%-- 
    Document   : matriculaMostrarMatriculas
    Created on : 14-oct-2021, 14:04:53
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
    <div class="card" style="width: 50rem; padding: 30px 0px 0px 30px;">
        <h4 class="display-8">Seleccionar Matricula</h4>
        <form method=POST action="/WebSistema/controladorPrincipal">
            <input type=HIDDEN name=accion value="matriculaMostrarMatriculas">
            <input type=HIDDEN name=modo value="busqueda">
            <table class="table table-striped table-hover">
            <tbody>
            <tr><td>
            Buscar Matricula: <input name="xnro" value="<c:out value='${nro_doc}'/>"
                size=60>
            </td></tr>
            <tr><td>
            <select name="xcodMatricula" size="10" class="form-control" id="exampleFormControlSelect2">
              <c:forEach items="${arrMatriculas}" var="matricula">
                <option value=<c:out value='${matricula.nro_doc}'/> >
                   <c:out value='${matricula.nro_doc}'/>
                </option>
              </c:forEach>
            </select>
            </td></tr>
            <tr><td>
            <input type=submit name=boton class="btn btn-primary" value="Buscar">
            <input type=submit name=boton class="btn btn-dark" value="Detalles">
            </td></tr>
            </tbody>
            </table>
        </form>
    </div>
    </body>
</html>
