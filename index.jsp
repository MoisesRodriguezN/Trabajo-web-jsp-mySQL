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
        
        <script type="text/javascript">
            function mostrarAñadir(){//Table-row es para que no meta todo en una misma columna
            document.getElementById('añadir').style.display = 'table-row';}
        </script> 
        
        <script type="text/javascript">
            function ocultarAñadir(){
            document.getElementById('añadir').style.display = 'none';}
        </script> 
        
         <script type="text/javascript">
            function mostrarModificar(codigoArticulo){
                document.getElementById('modificar').style.display = 'table-row';
                document.getElementById('codigoArticulo').value = codigoArticulo;
            }
        </script>
      
    </head>
    <body style="background-color: #afa;">
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda_informatica","root", "root");
            Statement s = conexion.createStatement();
        %>
        
        <div class="container">
            <br>
            <br>
            <div class="panel panel-primary">
                <div class="panel-heading text-center"><h2>Gestión de artículos</h2></div>
                <div class="panel-footer text-center">Listado, Alta, Modificación y Borrado</div>
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
                        <th> <!--Botón añadir que llama a la función mostrarAñadir-->
                            <form method="get" action="#">
                                <button type="submit" onclick="mostrarAñadir()" class="btn btn-info"><span class="glyphicon glyphicon glyphicon-plus"></span>Añadir</button>
                            </form>
                        </th>
                        <th>
                            <button type="submit" onclick="ocultarAñadir()" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></span>Cancelar</button>
                        </th>
                    </tr> 
                    <form name="añadir" action="altaArticulo.jsp" method="get">
                        <tr id="añadir" style="display: none;" class="warning">  <!--Formulario para añadir artículos-->
                            <td>
                                <input name="codigoArticulo" size="4" type="text">
                            </td>

                            <td>
                                <input name="nombreArticulo" size="12" type="text">
                            </td>
                            <td> <!--Consulta para el Select-->
                                <% 
                                ResultSet listadoCategorias = s.executeQuery("SELECT distinct ca.nombreCategoria, ar.categoriaArticulo FROM categoria ca, articulo ar WHERE ca.codCategoria = ar.categoriaArticulo");

                                    out.print("<select name=\"Categoria\">");
                                    
                                    while (listadoCategorias.next()) {
                                     
                                     out.print("<option value=\"" + listadoCategorias.getString("categoriaArticulo") +
                                       "\" " + "> " + listadoCategorias.getString("nombreCategoria") + "</option>");
                                    
                                    }
                                    out.print("</select>");

                                %>
                            </td>
                            <td>
                                <input name="fabricanteArticulo" size="13" type="text">
                            </td>
                            <td>
                                <input name="descripcionArticulo" size="18" type="text">
                            </td> 
                            <td>
                                <input name="precioCompraArticulo" size="4" type="text">
                            </td>
                            <td>
                                <input name="precioVentaArticulo" size="4" type="text">
                            </td>
                            <td>
                                <input name="stockArticulo" size="4" type="text">
                            </td>
                            <td>
                                <button type="submit" class="btn btn-info"><span class="glyphicon glyphicon-plus"></span>Añadir</button>   
                            </td>
                        </tr>
                    </form> 
                </thead>
                
                <%  
                    ResultSet listado = s.executeQuery ("SELECT codigoArticulo, nombreArticulo, nombreCategoria, fabricanteArticulo, descripcionArticulo, precioCompraArticulo, precioVentaArticulo, stockArticulo, categoriaArticulo FROM articulo ar,categoria ca WHERE ca.codCategoria = ar.categoriaArticulo ORDER BY 1"); 
                %>
                <tbody class="text-center"><!--Listado de artículos-->
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
                    <td class=success> <!--Obtiene todo los datos de cada artículo para después modificar-->
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
 
                    <td class=info> <!--boton eliminar. Llama a la función mostrar pasando como parametro
                        el codigo del articulo.-->
                        
                        <form method="get" action="#">
                            <button type="submit" onclick="mostrar(<%=listado.getString("codigoArticulo") %>)" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
                        </form>
                <%
                    }
                    
                %>
                    </td></tr>
                </tbody>      
            </table>
            <!--Cuadro de advertencia de borrado de un articulo. 
            Tiene un botón para eliminar (confirma el borrado) y otro para cancenlar que llama a la 
            función ocultar.-->   
             <div  class="alert alert-danger fade in text-center" id="oculto" style="display: none; position: fixed; top: 120px; left:488px; ">
                <span class="glyphicon glyphicon-exclamation-sign"></span> <strong>Cuidado!</strong> ¿Está seguro de borrar el artículo? 
                <br>
                <form method="get" action="borraArticulo.jsp" style="display: inline-block;">
                    <input id ="codigoArticulo" type="hidden" name="codigoArticulo" value="">
                    <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>   
                </form>
                    
                    <button type="submit" onclick="ocultar()" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
            </div>
            

    </body>
</html>
