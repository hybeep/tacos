<%-- 
    Document   : main.jsp
    Created on : 29/05/2020, 05:27:57 PM
    Author     : tutus
--%>
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
        <title>Administración</title>
    </head>
    <body>
        <% if(session.getAttribute("nivel") != null){
        %>
        <section class="fondo" id="fondo">
            <section class="cabeza">
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
            </section>
            <section class="cuerpo" id="cuerpo">
                <center>
                    <div>
                        <form action="Controler" method="POST">
                            <input type="submit" name="action" value="Ver Productos">
                            <!---<li><a href="insertarproducto.jsp">Agregar Productos</a></li>--->
                            <input type="submit" name="action" value="Agregar Productos">
                        </form>
                        <hr>
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>IMG</th>
                                    <th>Nombre</th>
                                    <th>Descripcion</th>
                                    <th>Precio</th>
                                    <th>Stock</th>
                                    <th>Eliminar</th>
                                </tr>
                            </thead>
                            <tbody>
<%
        Connection con = UserActions.getConnection();
        Statement st = con.createStatement();
        Statement st2 = con.createStatement();
        ResultSet rs,rs2;
        String prodlist = (String) session.getAttribute("prodlist");
        String prods[] = null;
        
        if(prodlist != null){
            
            prods = prodlist.split(",") ;
            
        }
        
        try{
            
            String q = "Select * from mtacos";
            String q2 = "Select * from dtacos";
            rs = st.executeQuery(q);
            rs2 = st2.executeQuery(q2);
            int i =1;

            while(rs.next() && rs2.next()){
                
                int h = rs.getInt(1);
                boolean existe = false;
                
                if(prods!=null){
                    
                    for (int k = 0; k < prods.length; k++) {
                        
                        if (Integer.parseInt(prods[k]) == h) {
                            
                            existe = true;
                            
                        }
                        
                    }
                    
                }
                
                if(existe == false){
                    
                    int idprod = rs2.getInt(1);
                    int idmprod = rs.getInt(1);
                    String id = "id"+i;
                    String add = "add"+i;
                    //System.out.println("idss: "+idprod+", "+idmprod);


%>                                
                                <tr>
                                    <td><%=rs.getString(1) %></td>
                                    <td>
                                        <p name="id" value="<%=idprod%>" style="display:none"></p>
                                        <img src="ControlerImg?id=<%=idprod%>" width="150" height="100">
                                    </td>
                                    <td><%=rs.getString(2) %></td>
                                    <td><%=rs2.getString(7) %></td>
                                    <td><%=rs2.getFloat(2) %></td>
                                    <td><%=rs2.getInt(3) %></td>
                                    <td>
                                        <form action="Controler" method="POST">
                                                <input type="hidden" name="iddhide" value="<%=idprod%>">
                                                <input type="hidden" name="idmhide" value="<%=idmprod%>">
                                                <input type="submit" name="action" value="Eliminar">
                                        </form>
                                    </td>
                                </tr>
<%
                i++;
                
                }

        }

            rs.close();
            st.close();
            con.close();

        }catch(Exception e){

            System.out.println("Error, Fallo de conexion con la BD");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());

        }

%>           
                            </tbody>
                        </table>
                    </div>
                </center>
            </section>
            <section class="abajo" id="abajo">
                <footer class="pie_de_pagina" id="pie_de_pagina">
                    <h4>Contactanos en</h4>
                    <h5>facebook</h5> 
                    <h5>twiter</h5>
                    <h5>instagram</h5>
                </footer>
            </section>
        </section>
         <%
            }else{
                response.sendRedirect("error.jsp");
            }
        %>
    </body>
</html>
