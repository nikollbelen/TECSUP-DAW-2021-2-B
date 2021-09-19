<%-- 
    Document   : Eliminar
    Created on : 18-sep-2021, 18:03:58
    Author     : nikol
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="xcon" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost/tecsup?useSSL=false&serverTimezone=UTC"
                           user="root"
                           password=""/>
        <sql:update dataSource="${xcon}" var="count">
            DELETE FROM t_usuarios
            WHERE codigo='${codigo}'
        </sql:update>
        <c:if test="${count>=1}">
            <c:redirect url="jstl_sql_a.jsp"/>          
        </c:if>
    </body>
</html>
