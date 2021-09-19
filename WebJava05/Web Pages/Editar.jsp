<%-- 
    Document   : Editar
    Created on : 18-sep-2021, 18:18:56
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
                   sql="select * from t_usuarios where codigo='${codigo}'"
                   var="result"/>

        <div style="width: 450px; text-align: center; margin: 50px auto;">
            <h1 class="display-8">Editar usuario</h1>
            <form name="form" action="/WebJava05/update">
                <c:forEach var="row" items="${result.rows}">
                 <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">Codigo</label>
                    <div class="col-sm-10">
                      <input name="codigo" type="text" readonly class="form-control-plaintext" value=<c:out value="${row.codigo}"/>>
                    </div>
                  </div>
                 <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">Nombre</label>
                    <div class="col-sm-10">
                      <input name="nombre" type="text" class="form-control" value=<c:out value="${row.nombre}"/>>
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">Clave</label>
                    <div class="col-sm-10">
                      <input name="clave" type="text" class="form-control" value=<c:out value="${row.clave}"/>>
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">Estado</label>
                    <div class="col-sm-10">
                      <select name="estado" class="form-control" id="exampleFormControlSelect1" value=<c:out value="${row.estado}"/>>
                        <option></option>
                        <option>A</option>
                        <option>X</option>
                      </select>
                    </div>
                  </div>
                  <div class="mb-3 row">
                      <div class="col-sm-6">
                        <button type="submit" class="btn btn-primary">Guardar</button>
                      </div>
                      <div class="col-sm-6">
                        <a href="/WebJava05/jstl_sql_a.jsp" class="btn btn-danger text-light">Cancelar</a>
                      </div>
                  </div>
                </c:forEach>
            </form>  
        </div>
    </body>
</html>
