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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
        <script type="text/javascript">
            function mostrar(codigoArticulo){
                document.getElementById('oculto').style.display = 'block';
                document.getElementById('codigoArticulo').value = codigoArticulo;
            }
        </script>
        <script type="text/javascript">
            function ocultar(){
            document.getElementById('oculto').style.display = 'none';}
        </script>  
      
    </head>
    <body style="background-color: #afa;">
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda_informatica","root", "root");
            Statement s = conexion.createStatement();
            ResultSet listado = s.executeQuery ("SELECT codigoArticulo, nombreArticulo, nombreCategoria, fabricanteArticulo, descripcionArticulo, precioCompraArticulo, precioVentaArticulo, stockArticulo FROM articulo ar,categoria ca WHERE ca.codCategoria = ar.categoriaArticulo");  
        %>
        
        <div class="container">
            <br>
            <br>
            <div class="panel panel-primary">
                <div class="panel-heading text-center"><h2>Gestión de artículos</h2></div>
                <div class="panel-footer text-center">Listado</div>
            </div>
            <table class="table table-hover">
                <thead>
                  <tr class="warning" >
                    <th class="text-center">Código</th>
                    <th class="text-center">Nombre</th>
                    <th class="text-center">Categoria</th>
                    <th class="text-center">Fabricante</th>
                    <th class="text-center">Descripción</th>
                    <th class="text-center col-lg-1">Precio de Compra</th>
                    <th class="text-center col-lg-1">Precio de Venta</th>     
                    <th class="text-center">Stock</th>  
                  </tr>
                </thead>
                
                <tbody class="text-center">
                    <%
                    while (listado.next()) {
                        out.println("<tr><td class=success>");
                        out.println(listado.getString("codigoArticulo") + "</td>");
                        out.println("<td class=info>" + listado.getString("nombreArticulo") + "</td>");
                        out.println("<td class=success>" + listado.getString("nombreCategoria") + "</td>");
                        out.println("<td class=info>" + listado.getString("fabricanteArticulo") + "</td>");
                        out.println("<td class=success>" + listado.getString("descripcionArticulo") + "</td>");
                        out.println("<td class=info>" + listado.getString("precioCompraArticulo") + "</td>");
                        out.println("<td class=success>" + listado.getString("precioVentaArticulo") + "</td>");
                        out.println("<td class=info>" + listado.getString("stockArticulo") + "</td>");
                    %>
                    <td class=success>
                        <form method="get" action="modificaArticulo.jsp">
                            <input type="hidden" name="codigoArticulo" value="<%=listado.getString("codigoArticulo") %>">
                            <input type="hidden" name="nombreArticulo" value="<%=listado.getString("nombreArticulo") %>">
                            <input type="hidden" name="nombreCategoria" value="<%=listado.getString("nombreCategoria") %>">
                            <input type="hidden" name="fabricanteArticulo" value="<%=listado.getString("fabricanteArticulo") %>">
                            <input type="hidden" name="descripcionArticulo" value="<%=listado.getString("descripcionArticulo") %>">
                            <input type="hidden" name="precioCompraArticulo" value="<%=listado.getString("precioCompraArticulo") %>">
                            <input type="hidden" name="precioVentaArticulo" value="<%=listado.getString("precioVentaArticulo") %>">
                            <input type="hidden" name="stockArticulo" value="<%=listado.getString("stockArticulo") %>">
                            <button type="submit"  class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> Modificar</button>
                        </form>
                    </td>
 
                    <td class=info> <!--boton eliminar y formulario borrado-->
                        
                        <form method="get" action="#">
                            <button type="submit" onclick="mostrar(<%=listado.getString("codigoArticulo") %>)" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
                        </form>
                <%
                    }
                %>
                    </td></tr>
                </tbody>      
            </table>
                    
             <div  class="alert alert-danger fade in text-center" id=oculto style="display: none; position: fixed; top: 120px; left:488px; ">
                <span class="glyphicon glyphicon-exclamation-sign"></span> <strong>Cuidado!</strong> ¿Está seguro de borrar el artículo? 
                <br>
                <form method="get" action="borraArticulo.jsp" style="display: inline-block;">
                    <input id ="codigoArticulo" type="hidden" name="codigoArticulo" value="">
                    <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>   
                </form>
                    
                    <button type="submit" onclick="ocultar()" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
            </div>
        </div>

    </body>
</html>
