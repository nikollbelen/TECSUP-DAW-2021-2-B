<%-- 
    Document   : areas
    Created on : 10 sept. 2021, 13:49:31
    Author     : Nikolini
--%>

<%@ page import = "java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%--validacion de sesion--%>
<%
HttpSession misession= (HttpSession) request.getSession();
String usuario= (String) misession.getAttribute("usuario");  
if(misession == null || misession.getAttribute("usuario") == null){
      out.print("<link rel=\"stylesheet\" \n"
                + "              href=\"webjars/bootstrap/5.1.0/css/bootstrap.min.css\" type=\"text/css\" />");
      out.println("<center>");           
      out.println("<h3>Debe estar identificado para poder ver el contenido</h3>");
      out.println("<a class='btn btn-primary' href='/WebJava04/login.jsp'>Ir a pagina de acceso</a>");
      out.println("</center>");
      return;
  }    
%>

<%
  String driver = "com.mysql.cj.jdbc.Driver";
  String url   = "jdbc:mysql://localhost:3306/tecsup?useSSL=false&serverTimezone=UTC";
  String user   = "root";
  String pass   = "";
  
  Class.forName(driver);
  Connection xcon = DriverManager.getConnection(url, user, pass);
  
  String sql = "select * from areas";
  Statement stm = xcon.createStatement();
  ResultSet rs = stm.executeQuery(sql);
  
  String sqlest = "select estado from t_usuarios where nombre=?";
  PreparedStatement ps=xcon.prepareStatement(sqlest);
  ps.setString(1, usuario );
  ResultSet rsest = ps.executeQuery();
  rsest.next();
  String estado = rsest.getString(1);
%>
 
<!DOCTYPE html>
<html>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" 
              href="webjars/bootstrap/5.1.0/css/bootstrap.min.css" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <h3>Usuario Logeado: <b><% out.print(usuario); %></b></h3>
            <h3>Usuario Logeado: <b><% if (estado.charAt(0) == 'A'){out.print("Activo");}else{out.print("No activo");} %></b></h3>
            <h3><a class='btn btn-danger' href="/WebJava04/ServletSesion">Cerrar Sesion</a></h3>
                      
            <br><form action="#" method="POST">
                <div class="form-row align-items-center">
                        <select class="form-group col-md-4" name="colorImpar">
                            <option selected>Colores de filas impares</option>
                            <option value="primary">Azul</option>
                            <option value="secondary">Plomo</option>
                            <option value="success">Verde</option>
                            <option value="danger">Rojo</option>
                            <option value="warning">Amarillo</option>
                            <option value="info">Celeste</option>
                            <option value="light">Blanco</option>
                        </select>
                        <select class="form-group col-md-4" name="colorPar">
                            <option selected>Colores de filas pares</option>
                            <option value="primary">Azul</option>
                            <option value="secondary">Plomo</option>
                            <option value="success">Verde</option>
                            <option value="danger">Rojo</option>
                            <option value="warning">Amarillo</option>
                            <option value="info">Celeste</option>
                            <option value="light">Blanco</option>
                        </select>
                        
                    </div><br>
                        <!-- Boton de enviar -->
                        <input type="submit" class="btn btn-primary mb-2" name="submit" value="Enviar">
            </form>
            <%
            try{
            %>
            <h1>Listado de Areas</h1>
            
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">CODIGO</th>
                        <th scope="col">NOMBRE</th>
                        <th scope="col">ESTADO</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String colorPar = request.getParameter("colorPar").toString();
                        String colorImpar = request.getParameter("colorImpar").toString();
                        boolean par = false; 
                        while (rs.next()) {
                            if(par){
                                out.print("<tr class='table-" + colorPar + "'>");
                                out.print("<td>" + rs.getString(1) + "</td>");
                                out.print("<td>" + rs.getString(2) + "</td>");
                                out.print("<td>" + rs.getString(3) + "</td>");
                                out.print("</tr>");
                                par = false;
                            }else{
                                out.print("<tr class='table-" + colorImpar + "'>");
                                out.print("<td>" + rs.getString(1) + "</td>");
                                out.print("<td>" + rs.getString(2) + "</td>");
                                out.print("<td>" + rs.getString(3) + "</td>");
                                out.print("</tr>");
                                par = true;
                            }
                        }
                    %>
                </tbody>
            </table>
            <%
            }catch(Exception we){

            }    

            %>
            
        </div>
    </body>
</html>
