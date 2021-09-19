<%-- 
    Document   : jstl_sql_a
    Created on : 17-sep-2021, 14:41:01
    Author     : nikol
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" 
              href="webjars/bootstrap/5.1.0/css/bootstrap.min.css" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
    <sql:setDataSource var="xcon" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost/tecsup?useSSL=false&serverTimezone=UTC"
                           user="root"
                           password=""/>

    <sql:query dataSource="${xcon}"
               sql="select * from t_usuarios"
               var="result"/>

    <div style="width: 450px; text-align: center; margin: 50px auto;">
        <h1 class="display-8">Listado de Usuarios</h1>
        <table class="table table-striped">
            <thead>
                <tr>
                <th scope="col">Codigo</th>
                <th scope="col">Nombre</th>
                <th scope="col">Clave</th>
                <th scope="col">Estado</th>
                <th scope="col"></th>
                <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <th scope="row"><c:out value="${row.codigo}"/></th>
                        <td><c:out value="${row.nombre}"/></td>
                        <td><c:out value="${row.clave}"/></td>
                        <td><c:out value="${row.estado}"/></td>
                        <td><a href="Editar?codigo=<c:out value='${row.codigo}'/>" class="btn btn-info text-light">Editar</a></td>
                        <td><a href="Eliminar?codigo=<c:out value='${row.codigo}'/>" class="btn btn-danger">Eliminar</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    </body>

</html>
