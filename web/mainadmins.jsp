<%-- 
    Document   : main.jsp
    Created on : 29/05/2020, 05:27:57 PM
    Author     : tutus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="css/master.css">
        <script></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <body>
        <%  
            if(session.getAttribute("nivel") != null){
        %>
        <section class="fondo" id="fondo">
            <header class="cabecera" id="cabecera">
                <h1>TACO MASTER®</h1>
            </header>
            <nav class="navegacion" id="navegacion">
                <ul>
                    <li><a href="mainadmins.jsp">Productos</a></li>
                    <li><a href="users.jsp">Usuarios</a></li>
                    <li>
                        <form action="LogoutUser">
                        <input type="submit" value="Cerrar sesion">
                        </form>
                    </li>
                </ul>
            </nav>
            
            <form >
                <input type="submit" placeholder="Ver los productos">
            </form>
                
            
        </section> 
        <%
            }else{
                response.sendRedirect("error.jsp");
            }
        %>
    </body>
</html>
