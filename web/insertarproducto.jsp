<%--
    Document   : main.jsp
    Created on : 30/05/2020, 10:06:34 PM
    Author     : tutus
--%>

<%@page import="products.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="user.UserActions"%>
<%@page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="css/master.css">
        <script></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Agregar Productos</title>
    </head>
    <body>
        <script>
        function nuevoprod(){
            var name = document.getElementsByName("txtNombre")[0].value;
            var precio = document.getElementsByName("dfPrecio")[0].value;
            var stock = document.getElementsByName("dfStock")[0].value;
            var file = document.getElementsByName("fileImg")[0].value;
            var desc = document.getElementsByName("txtDesc")[0].value;
            if (/^[A-Z]+$/i.test(name) && desc!== null && file !== null && /^[0-9]+$/.test(precio) 
               && /^[0-9]+$/.test(stock)) {
              document.getElementById("formularioprod").submit();
            }else{
                alert("Datos invalidos, vuelva a intentar");
            }
        }
        </script>
        <% if(session.getAttribute("nivel") != null){
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
            <section class="cuerpo" id="cuerpo">
                <div align="center" width="200%" >
                    <br>
                    <h2>
                        Agregar Nuevo Producto
                    </h2>
                    <br>
                    <form action="Controler" method="POST" enctype="multipart/form-data" id="formularioprod">
                        <label>Nombre del producto:</label>
                        <input type="text" name="txtNombre" placeholder="Nombre"><br>
                        <label>Precio del producto:</label>
                        <input type="number" name="dfPrecio" step=".01" placeholder="Precio"><br>
                        <label>Stock del producto:</label>
                        <input type="number" name="dfStock" placeholder="Stock"><br>
                        <label>Imagen del producto:</label>
                        <input type="file" name="fileImg" placeholder="Imagen"><br>
                        <label>Descripcion del producto:</label>
                        <input type="text" style="WIDTH: 200px; HEIGHT: 75px" name="txtDesc" placeholder="Descripcion"><br>
                        <input type="submit" name="action" value="Guardar">
                    </form>
                </div>
            </section>
        </section>
        <%
            }else{
                response.sendRedirect("error.jsp");
            }
        %>
    </body>
</html>