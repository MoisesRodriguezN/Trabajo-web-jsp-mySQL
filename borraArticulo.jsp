<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrado de artículo</title>
    </head>
    <body>
      <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda_informatica","root", "root");
      Statement s = conexion.createStatement();
      request.setCharacterEncoding("UTF-8");
      s.execute ("DELETE FROM articulo WHERE codigoArticulo=" + request.getParameter("codigoArticulo"));
      
      s.close();
    %>	
    
    </body>
</html>
