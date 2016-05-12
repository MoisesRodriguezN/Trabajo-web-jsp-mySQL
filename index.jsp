<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de artículos</title>
        <head>
    </head>
    <body>
        <h1>Listado de todos los articulos</h1>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda_informatica","root", "root");
            Statement s = conexion.createStatement();
            ResultSet listado = s.executeQuery ("SELECT * FROM articulo");
            while (listado.next()) {
                out.println(listado.getString("codigoArticulo") + " " + listado.getString("nombreArticulo") + "<br>");
            }
            conexion.close();
        %>
    </body>
</html>
