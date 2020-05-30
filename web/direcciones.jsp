<%-- 
    Document   : direcciones
    Created on : 28/05/2020, 03:04:26 PM
    Author     : tutus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="user.UserActions"%>
<%@page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/master.css">
    </head>
    <body>
        <% if(session.getAttribute("email") != null){ 
        %>
        <section class="fondo" id="fondo">
            <header class="cabecera" id="cabecera">
                <h1>TACO MASTER®</h1>
            </header>
                <nav class="navegacion" id="navegacion">
                    <ul>
                        <li><a href="main.jsp">Pagina principal</a></li>
                        <li><a href="billetera.jsp">TACOin</a></li>
                        <li><a href="carrito.jsp">Mi Carrito</a></li>
                        <li><a href="profile.jsp">Mi perfil</a></li>
                        <form action="LogoutUser">
                            <input type="submit" value="Cerrar sesion">
                        </form>
                    </ul>
                </nav>
                <section class="cuerpo" id="cuerpo">
                    <aside class="lateral_izquierdo" id="lateral_izquierdo">
                        <ul>
                            <p>Perfil</p>
                            <li><a href="profile.jsp">Mi Perfil</a></li>
                            <li><a href="direcciones.jsp">Direcciones Guardadas</a></li>
                            <li><a href="historial.jsp">Historial de Compras</a></li>
                        </ul>
                    </aside>
                    <section class="productos" id="productos">
                        <h1>Crear nueva direccion</h1>
                        <form action="">
                            Ciudad:<input type="text" name="ciudad" placeholder="Ingresa tu ciudad"><br>
                            Colonia:<input type="text" name="colonia" placeholder="Ingresa tu colonia"><br>
                            Codigo postal:<input type="text" name="cp" placeholder="Ingresa tu cp"><br>
                            Calle:<input type="text" name="calle" placeholder="Ingresa tu calle"><br>
                            #Interior:<input type="text" name="int" placeholder="Ingresa tu numero interior"><br>
                            #Exterior:<input type="text" name="ext" placeholder="Ingresa tu numero exterior"><br>
                            <input type="submit" value="Guardar">
                        </form>
                        <h1>Direcciones guardadas</h1>
                        <div align="center" width="200%" >
                            <br>
                            <h2>
                                Consulta
                            </h2>
                            <br>
                            <div align="left" width="200%" >
                            </div>
                            <br>
                            <table border="1" borderColor="black">
                                <tbody>
                                <td bgColor="cyan" width="150" align="center" >Ciudad

                                </td>
                                <td bgColor="cyan" width="290" align="center" >Codigo Postal

                                </td>
                                <td bgColor="cyan" width="290" align="center" >Colonia

                                </td>
                                <td bgColor="cyan" width="290" align="center" >#Exterior

                                </td>
                                <td bgColor="cyan" width="230" align="center" >#Interior

                                </td>
                                <td bgColor="cyan" width="290" align="center" >Calle

                                </td>
                                <td bgColor="cyan" width="290" align="center" >Eliminar

                                </td>

                                <% 
                                    Connection con = UserActions.getConnection();
                                    Statement st = con.createStatement();
                                    ResultSet rs,rs2;
                                    try{
                                        Integer id = (Integer)session.getAttribute("id");

                                        
                                        String q = "Select id_mde from edireccioncliente where id_mu='"+id+"';";
                                        rs = st.executeQuery(q);
                                   
                                    while(rs.next()){
                                        int id_direccion = rs.getInt(2);
                                        String q2 = "Select * from mdireccionentrega where id_mde='"+id_direccion+"';";
                                        rs2 = st.executeQuery(q2);
                                        int i = 1;
                                        while(rs2.next()){

                                            if(i == (i/2)*2){
                                 %>

                                 <tr>
                                     <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs2.getString(2) %> 

                                     </td>
                                     <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs2.getInt(3) %> 

                                     </td>
                                     <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs2.getString(4) %> 

                                     </td>
                                    <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs2.getInt(5) %> 

                                     </td>
                                    <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs2.getInt(6) %> 

                                     </td>
                                     <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs2.getString(7) %> 

                                     </td>
                                     <td bgColor="lightgreen" valign="top" width="80" height="19" >
                                        <form action="">
                                            <input type="submit" value="Eliminar">
                                        </form>
                                     </td>

                                 </tr>

                                 <% 
                                        }else{%>


                                   <tr>
                                     <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs.getString(1) %> 

                                     </td>
                                     <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs.getString(3) %> 

                                     </td>
                                     <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs.getString(4) %> 

                                     </td>
                                    <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs.getString(5) %> 

                                     </td>
                                    <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs.getString(7) %> 

                                     </td>
                                    <td bgColor="lightgreen" valign="top" width="80" height="19" ><%=rs.getString(10) %> 

                                     </td>

                                 </tr>

                                <%         }
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
                        
                    </section>
                </section>
                <footer class="pie_de_pagina" id="pie_de_pagina">
                    <h4>Contactanos en</h4>
                    <h5>facebook</h5> 
                    <h5>twiter</h5>
                    <h5>instagram</h5>
                </footer>
        </section> 
        <%
            }else{
                response.sendRedirect("error.jsp");
            }
        %>
    </body>
</html>
