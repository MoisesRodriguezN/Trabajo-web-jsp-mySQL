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
    </head>
    <body style="background-color: #afa;">
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda_informatica","root", "root");
            Statement s = conexion.createStatement();
            request.setCharacterEncoding("UTF-8");
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
                                <button type="submit" onclick="mostrarAlta()" class="btn btn-info"><span class="glyphicon glyphicon glyphicon-plus"></span>Añadir</button>
                            </form>
                        </th>
                    </tr> <!--Formulario de alta de artículos-->
                    <form name="alta" action="altaArticulo.jsp" method="get">
                        <tr id="alta" style="display: none;" class="warning">  <!--Formulario para añadir artículos-->
                            <td>
                                <input name="codigoArticulo" min="0" type="number" style="width: 60px;" >
                            </td>

                            <td>
                                <input name="nombreArticulo" size="12" type="text">
                            </td>
                            <td> <!--Consulta para el Select-->
                                <% 
                                ResultSet listadoCategorias = s.executeQuery("SELECT codCategoria, nombreCategoria FROM categoria ORDER BY nombreCategoria");

                                    out.print("<select name=\"Categoria\">");
                                    
                                    while (listadoCategorias.next()) {
                                     
                                     out.print("<option value=\"" + listadoCategorias.getString("codCategoria") +
                                       "\" " + "> " + listadoCategorias.getString("nombreCategoria") + "</option>");
                                    
                                    }
                                    out.print("</select>");

                                %>
                            </td>
                            <td>
                                <input name="fabricanteArticulo" size="12" type="text">
                            </td>
                            <td>
                                <input name="descripcionArticulo" size="16" type="text">
                            </td> 
                            <td>
                                <input name="precioCompraArticulo" min="0" step="0.01" type="number" style="width: 60px;">
                            </td>
                            <td>
                                <input name="precioVentaArticulo" min="0" step="0.01" type="number" style="width: 60px;">
                            </td>
                            <td>
                                <input name="stockArticulo" min="0" step="1" type="number" style="width: 60px;">
                            </td>
                            <td>
                                <button type="submit" class="btn btn-info"><span class="glyphicon glyphicon-plus"></span>Añadir</button>   
                            </td>
                        
                    </form> 
                            <td>
                                 <button type="submit" onclick="ocultarAlta()" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Cancelar</button>
                            </td>
                        </tr><!--Fin formilario alta de artículo-->
                    <!--Formulario para añadir artículos-->
                    <form name="modificar" action="modificaArticulo.jsp" method="get">
                        <tr id="modificar" style="display: none;" class="warning">  
                            <td>
                                <input type="hidden" id="codigoArticuloModificar" name="codigoArticuloMod"  value="">
                            </td>

                            <td>
                                <input id="nombreArticuloModificar" name="nombreArticuloMod" size="12" type="text" value="">
                            </td>
                            
                             <td> <!--Consulta para el Select-->
                                <% 
                                    listadoCategorias.beforeFirst();
                                    
                                    out.print("<select name=\"Categoria\" id=\"categoriaArticuloModificar\" value=\"\">");
                                    
                                    while (listadoCategorias.next()) {
                                     out.print("<option value=\"" + listadoCategorias.getString("codCategoria") +
                                       "\" " + "> " + listadoCategorias.getString("nombreCategoria") + "</option>");
                                    
                                    }
                                    out.print("</select>");

                                %>
                            </td>
                            
                            <td>
                                <input id="fabricanteArticuloModificar" name="fabricanteArticuloMod" size="12" type="text" value="">
                            </td>
                            
                            <td>
                                <input id="descripcionArticuloModificar" name="descripcionArticuloMod" size="16" type="text" value="">
                            </td>
                            
                            <td>
                                <input id="precioCompraArticuloModificar" name="precioCompraArticuloMod" value="" min="0" step="0.01" type="number" style="width: 60px;">
                            </td>
                            
                            <td>
                                <input id="precioVentaArticuloModificar" name="precioVentaArticuloMod" value="" min="0" step="0.01" type="number" style="width: 60px;">
                            </td>
                            
                            <td>
                                <input id="stockArticuloModificar" name="stockArticuloMod" min="0" step="1" type="number" style="width: 60px;">
                            </td>
                            
                            <td>
                                <button type="submit" class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> Modificar</button>   
                            </td>

                    </form> 
                            <td>
                                <button type="submit" onclick="ocultarModificar()" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Cancelar</button>
                            </td>
                        </tr>
                </thead>
                <!--Buscador de artículos-->
                <form name="buscar" method="get" action="gestion.jsp">
                    Búsqueda: 
                    <input type="text" name="buscar" placeholder="Nombre del Artículo...">
                    <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span> Buscar</button>
                </form>

                <%  
                    String buscar = "";
                    
                    if(request.getParameter("buscar") == null){
                      buscar = "%";
                    }else{
                      buscar= request.getParameter("buscar");
                    }
                    ResultSet listado = s.executeQuery ("SELECT codigoArticulo, nombreArticulo, nombreCategoria, fabricanteArticulo, descripcionArticulo, precioCompraArticulo, precioVentaArticulo, stockArticulo, categoriaArticulo, codCategoria FROM articulo ar,categoria ca WHERE ca.codCategoria = ar.categoriaArticulo and ar.nombreArticulo like '%" + buscar + "%' " + "ORDER BY codigoArticulo"); 
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
                        </form>
                        <form name="modificar" action="#">
                            <button type="submit" onclick="mostrarModificar('<%=listado.getString("codigoArticulo") %>',
                                '<%=listado.getString("nombreArticulo") %>',
                                '<%=listado.getString("fabricanteArticulo") %>',
                                '<%=listado.getString("descripcionArticulo") %>',
                                '<%=listado.getString("precioCompraArticulo") %>',
                                '<%=listado.getString("precioVentaArticulo") %>',
                                '<%=listado.getString("stockArticulo") %>',
                                '<%=listado.getString("codCategoria")%>')" 
                                class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> Modificar</button>
                        </form>
                    </td>
 
                    <td class=info> <!--boton eliminar. Llama a la función mostrar pasando como parametro
                        el codigo del articulo.-->
                        
                        <form method="get" action="#">
                            <button type="submit" onclick="mostrarEliminar(<%=listado.getString("codigoArticulo") %>)" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
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
                    <button style="margin-right: 90px;" type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>   
                </form>
                    
                    <button type="submit" onclick="ocultarEliminar()" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
            </div>
            <script>
            function mostrarEliminar(codigoArticulo){ //Para borrar artículos
                document.getElementById('oculto').style.display = 'block';
                document.getElementById('codigoArticulo').value = codigoArticulo;
            }

            function ocultarEliminar(){
                document.getElementById('oculto').style.display = 'none';}

            function mostrarAlta(){//Table-row es para que no meta todo en una misma columna
                document.getElementById('alta').style.display = 'table-row';}

            function mostrarModificar(codigoArticuloModificar,nombreArticuloModificar,fabricanteArticuloModificar,descripcionArticuloModificar,precioCompraArticuloModificar,precioVentaArticuloModificar,stockArticuloModificar,categoriaArticuloModificar){
                //Table-row es para que no meta todo en una misma columna
                document.getElementById('modificar').style.display = 'table-row';
                document.getElementById('codigoArticuloModificar').value = codigoArticuloModificar;
                document.getElementById('nombreArticuloModificar').value = nombreArticuloModificar;
                document.getElementById('fabricanteArticuloModificar').value = fabricanteArticuloModificar;
                document.getElementById('descripcionArticuloModificar').value = descripcionArticuloModificar;
                document.getElementById('precioCompraArticuloModificar').value = precioCompraArticuloModificar;
                document.getElementById('precioVentaArticuloModificar').value = precioVentaArticuloModificar;
                document.getElementById('stockArticuloModificar').value = stockArticuloModificar;
                document.getElementById('categoriaArticuloModificar').value = categoriaArticuloModificar;
 
            }
       
            function ocultarModificar(){//Table-row es para que no meta todo en una misma columna
                document.getElementById('modificar').style.display = 'none';}
       
        
      
            function ocultarAlta(){
                document.getElementById('alta').style.display = 'none';}
        </script> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </body>
</html>
