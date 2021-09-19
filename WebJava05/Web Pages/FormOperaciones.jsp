<%-- 
    Document   : jstl_enviar
    Created on : 17-sep-2021, 14:18:23
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
            <form name="form" action="/WebJava05/Operaciones">
                <div class="card" style=" width: 450px; text-align: center; margin: 50px auto;">
                    <h2 class="card-header">Operaciones</h2>
                    <div class="card-body">
                        <input type="number" name="n1" class="form-control" placeholder="Ingrese primer numero"><br>
                        <input type="number" name="n2" class="form-control" placeholder="Ingrese segundo numero"><br>
                        <div class="form-group">
                            <label for="exampleFormControlSelect1">Seleccione la operacion a generar:</label><br>
                            <select name="operacion" class="form-control" id="exampleFormControlSelect1">
                                <option>Suma</option>
                                <option>Resta</option>
                                <option>Multiplicacion</option>
                                <option>Division</option>
                            </select>
                        </div><br>
                        <button type="submit" class="btn btn-primary">Enviar</button><br>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
