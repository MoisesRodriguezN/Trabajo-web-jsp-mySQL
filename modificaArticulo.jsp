<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ModificaArticulo</title>
    </head>
    <body>
      <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda_informatica","root", "root");
        Statement s = conexion.createStatement();
      
      
       String actualizacion = "UPDATE articulo SET " + "nombreArticulo='" + (request.getParameter("nombreArticulo")) + 
                "',categoriaArticulo='" + Integer.valueOf(request.getParameter("Categoria")) +
                "',fabricanteArticulo='" + (request.getParameter("fabricanteArticulo")) +
                "',descripcionArticulo='" + (request.getParameter("descripcionArticulo")) +
                "',precioCompraArticulo='" + Integer.valueOf(request.getParameter("precioCompraArticulo")) +
                "',precioVentaArticulo='" + Integer.valueOf(request.getParameter("precioVentaArticulo")) + 
                "',stockArticulo='" + Integer.valueOf(request.getParameter("stockArticulo")) + 
                "' WHERE codigoArticulo='" +  + Integer.valueOf(request.getParameter("codigoArticulo")) + "\'";
                s.execute(actualizacion);

                conexion.close();
        %>
        <script>document.location = "index.jsp"</script> 
    </body>
</html>
