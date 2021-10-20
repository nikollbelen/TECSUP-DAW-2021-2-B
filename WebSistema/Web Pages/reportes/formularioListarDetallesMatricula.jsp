<%-- 
    Document   : formularioListarDetallesMatricula
    Created on : 20-oct-2021, 9:14:18
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
        <form method="post" action="/WebSistema/reportes/listarDetallesMatricula.jsp">
        <input type="hidden" name="accion" value="MOSTRAR">
        <table class="table table-striped table-hover">
            <tr>
                <td>Seleccione Estado:</td>
            </tr>
            <tr>
                <td><select name="nro_doc" size="10" class="form-control">
                        <c:forEach items="${arrMatriculas}" var="matricula">
                            <option value=<c:out value='${matricula.nro_doc}'/> >
                               <c:out value='${matricula.nro_doc}'/>
                            </option>
                          </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <input type="submit" class="btn btn-primary" value="Mostrar Reporte">
                </td>
            </tr>
        </table>
        </form>
        </div>
    </body>
</html>
