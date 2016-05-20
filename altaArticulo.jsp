<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Añadir Articulo</title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda_informatica","root", "root");
            Statement s = conexion.createStatement();

            request.setCharacterEncoding("UTF-8");
            
            String consultaArticulos = "SELECT * FROM articulo WHERE codigoArticulo=" + Integer.valueOf(request.getParameter("codigoArticulo"));  

            ResultSet listadoArticulo = s.executeQuery (consultaArticulos);
            listadoArticulo.last();
            
            if (listadoArticulo.getRow() != 0) {
                out.println("Ya existe un artículo con el código: " + request.getParameter("codigoArticulo") + ". Alta no realizada.");
            }else{
                
                String insercion = "INSERT INTO articulo  VALUES ('" + Integer.valueOf(request.getParameter("codigoArticulo")) + 
                  "', '" + (request.getParameter("nombreArticulo")) + 
                  "', '" + Integer.valueOf(request.getParameter("Categoria")) +
                  "', '" + (request.getParameter("fabricanteArticulo")) +
                  "', '" + (request.getParameter("descripcionArticulo")) +
                  "', '" + Integer.valueOf(request.getParameter("precioCompraArticulo")) +
                  "', '" + Integer.valueOf(request.getParameter("precioVentaArticulo")) + 
                  "', '" + Integer.valueOf(request.getParameter("stockArticulo")) + "')";
                s.execute(insercion);  

            }
        %>
        
        <script>document.location = "index.jsp"</script> 
    </body>
</html>
