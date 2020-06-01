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
        <title>Document</title>
    </head>
    <body>
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
                    <form action="Controler" method="POST" enctype="multipart/form-data">
                        <label>Nombre del producto:</label>
                        <input type="text" name="txtNombre" placeholder="Nombre"><br>
                        <label>Precio del producto:</label>
                        <input type="number" name="dfPrecio" placeholder="Precio"><br>
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
    </body>
</html>