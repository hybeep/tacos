<%--
    Document   : main.jsp
    Created on : 30/05/2020, 10:06:34 PM
    Author     : tutus
--%>

<%@page import="products.adminactions"%>
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
                    <li><a href="insertarproducto.jsp">Agregar Productos</a></li>
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
<div align="center" width="200%" >
            <br>
            <h2>
                Agregar
            </h2>
            <br>
            <form action="insertarproducto.jsp" method="post">
                <%
                    try{
                        String nombre = request.getParameter("nombre");
                        Float precio = Float.parseFloat(request.getParameter("precio"));
                        int stock = Integer.parseInt(request.getParameter("stock"));
                        String img = request.getParameter("imagen");
                        byte[] bytes = img.getBytes();
                        Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
                        String desc = request.getParameter("desc");
                       
                        Producto e = new Producto();
                        e.setNom_prod(nombre);
                        e.setPrecio(precio);
                        e.setStock(stock);
                        e.setDescripcion_prod(desc);
                        //e.setImg(blob);
                       
                        int status = adminactions.AgregarProd(e);
                       
                        if (status>0 && request.getParameter("insertaprod")!=null) {
                            response.sendRedirect("mainadmins.jsp");
                        }else if(request.getParameter("insertaprod")!=null){
                            out.println("<p>No se agrego correctamente</p>");
                        }
                               
                    }catch(Exception e){
                        System.out.println("Error, Fallo de conexion con la BD");
                        System.out.println(e.getMessage());
                        System.out.println(e.getStackTrace());
                    }
                %>
                Nombre del producto:<input type="text" name="nombre" placeholder="Nombre"><br>
                Precio del producto:<input type="number" name="precio" placeholder="Precio"><br>
                Stock del producto:<input type="number" name="stock" placeholder="Stock"><br>
                Imagen del producto:<input type="file" name="imagen" placeholder="Imagen"><br>
                Descripcion del producto:<input type="text" name="desc" placeholder="Descripcion"><br>
                <input type="submit" name="insertaprod" value="Crear producto">
            </form>
        </div>
        <%
            }else{
                response.sendRedirect("error.jsp");
            }
        %>
    </body>
</html>