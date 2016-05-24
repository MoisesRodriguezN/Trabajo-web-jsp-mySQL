<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <LINK REL=StyleSheet HREF="estilosLogin.css" TYPE="text/css" MEDIA=screen>
        <link href='https://fonts.googleapis.com/css?family=Exo+2:500italic' rel='stylesheet' type='text/css'>
        
    </head>
    <body>
        <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda_informatica","root", "root");
        Statement s = conexion.createStatement();
        request.setCharacterEncoding("UTF-8");
        %>
    <div class="container">
        <div style="text-align: center; margin-top:26px; color:#98FB98; font-size: 30px; 
             font-family: 'Exo 2', sans-serif;">GESTIÓN TIENDA INFORMÁTICA <br></div>
        <div class="card card-container">
            <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" name="formularioLogin" method="post" action="index.jsp">
                <span id="reauth-email" class="reauth-email"></span>
                <input type="hidden" value="1" name="campoAux">
                <input type="text" id="inputEmail" name="usuario" class="form-control" placeholder="Usuario" required autofocus>
                <input type="password" id="inputPassword" name="clave" class="form-control" placeholder="Contraseña" required>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Iniciar sesión</button>
            </form>
        <div id="oculto" style="display: none;">
            <span style="color: red">Usuario o clave incorrecto</span>
        </div>
        
        <div>
            <%  //si los campos no están vacios se realiza consulta con usuario y clave
                if(request.getParameter("campoAux") != null){
                    String usuario = request.getParameter("usuario");
                    String clave = request.getParameter("clave");
                    //Devuelve una fila si existe y se contará la fila ( 0 ó 1)
                    String consulta = "SELECT * FROM acceso WHERE usuarioAcceso = " + "\'" + usuario + "\' " + "AND " + "claveAcceso= " + "\'" + clave + "\'";
                    ResultSet listado = s.executeQuery(consulta);
                    listado.next();
                    int cuentaFilas = listado.getRow();
                    
                    //Si el usuario o claves son incorrecto, se mostrará un aviso
                    //Si son correctos, se llevará a la página de gestión.
                    if(cuentaFilas == 0){
                        %>      
                            <body onload=f1();>
                        <%
                    }else{
                        %>      
                            <script>document.location = "gestion.jsp"</script> 
                        <%
                    }
                  
                }else{
                  
                }
                
            %>
        </div>
    </div>
        <script>
            function f1(){
                document.getElementById('oculto').style.display = 'block';
            }
            
        </script>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </body>
</html>
