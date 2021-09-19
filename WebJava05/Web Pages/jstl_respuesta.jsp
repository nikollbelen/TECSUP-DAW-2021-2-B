<%-- 
    Document   : jstl_recibir
    Created on : 17-sep-2021, 14:24:07
    Author     : nikol
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="container mt-5">
            <div class="card" style=" width: 450px; text-align: center; margin: 50px auto;">
                <h5 class="card-header">Resultado de la <c:out value="${operacion}"/></h5>
                <div class="card-body">
                    <c:choose>

                        <c:when test = "${operacion == 'Suma'}">
                           <p class="card-text"><c:out value="${n1} + ${n2} = ${n1+n2}"/></p>
                        </c:when>

                        <c:when test = "${operacion == 'Resta'}">
                           <p class="card-text"><c:out value="${n1} - ${n2} = ${n1-n2}"/></p>
                        </c:when>
                           
                        <c:when test = "${operacion == 'Multiplicacion'}">
                           <p class="card-text"><c:out value="${n1} * ${n2} = ${n1*n2}"/></p>
                        </c:when>

                        <c:when test = "${operacion == 'Division'}">
                           <p class="card-text"><c:out value="${n1} / ${n2} = ${n1/n2}"/></p>
                        </c:when>

                     </c:choose>
                  <a class="btn btn-primary" href="/WebJava05/FormOperaciones.jsp" role="button">Volver</a>
                </div>
              </div>
        </div>
    </body>
</html>
