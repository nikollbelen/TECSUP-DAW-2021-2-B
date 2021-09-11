<%-- 
    Document   : ingresoExitoso
    Created on : 10 sept. 2021, 15:13:34
    Author     : Nikolini
--%>

<%@ page import = "java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%--validacion de sesion--%>
<%
HttpSession misession= (HttpSession) request.getSession();
String usuario= (String) misession.getAttribute("usuario");

  String driver = "com.mysql.cj.jdbc.Driver";
  String url   = "jdbc:mysql://localhost:3306/tecsup?useSSL=false&serverTimezone=UTC";
  String user   = "root";
  String pass   = "";
  
  Class.forName(driver);
  Connection xcon = DriverManager.getConnection(url, user, pass);
  
  String sqlest = "select estado from t_usuarios where nombre=?";
  PreparedStatement ps=xcon.prepareStatement(sqlest);
  ps.setString(1, usuario );
  ResultSet rsest = ps.executeQuery();
  rsest.next();
  String estado = rsest.getString(1);
%>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" 
              href="webjars/bootstrap/5.1.0/css/bootstrap.min.css" type="text/css" />
        <title>Pagina Principal</title>
    </head>
    <body>
        <div class="container mt-5">
            <h3>Usuario Logeado: <b><% out.print(usuario); %></b></h3>
            <h3>Usuario Logeado: <b><% if (estado.charAt(0) == 'A'){out.print("Activo");}else{out.print("No activo");} %></b></h3>
            <h3><a class='btn btn-danger' href="/WebJava04/ServletSesion">Cerrar Sesion</a></h3>
            
            <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
                  <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
                </symbol>
            </svg>

            <div class="alert alert-primary d-flex align-items-center" role="alert">
                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Info:"><use xlink:href="#info-fill"/></svg>
                <div>
                  <a href="areas.jsp">Areas</a>
                </div>
            </div>  
            
            <div class="alert alert-primary d-flex align-items-center" role="alert">
                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Info:"><use xlink:href="#info-fill"/></svg>
                <div>
                  <a href="cargos.jsp">Cargos</a>
                </div>
            </div> 
     
        </div>
    </body>
</html>
