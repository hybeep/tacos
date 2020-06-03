<%-- 
    Document   : direcciones
    Created on : 28/05/2020, 03:04:26 PM
    Author     : tutus & PorfirioDamián
--%>

<%@page import="user.DireccionActions"%>
<%@page import="java.util.ArrayList"%>
<%@page import="user.Direccion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="user.UserActions"%>
<%@page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tus Direcciones</title>
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
                        <li>
                            <form action="LogoutUser">
                                <input type="submit" value="Cerrar sesion">
                            </form>
                        </li>
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
                        <form action="" method ="post">
                            <h1>Crear nueva direccion</h1>
                            <%
                                Direccion d = new Direccion();
                                Integer id_mu = (Integer)session.getAttribute("id");
                                int id_direccion;
                                
                                if (request.getParameter("savedir")!=null){
                                    
                                String ciudad, colonia, calle;
                                int cp, exterior, interior;
                                
                                ciudad = request.getParameter("ciudad");
                                colonia = request.getParameter("colonia");
                                calle = request.getParameter("calle");
                                cp = Integer.parseInt(request.getParameter("cp"));
                                interior = Integer.parseInt(request.getParameter("int"));
                                exterior = Integer.parseInt(request.getParameter("ext"));

                                
                                System.out.println(ciudad + cp + colonia + calle + interior + exterior + id_mu);
                                d.setCiudad(ciudad);
                                d.setColonia(colonia);
                                d.setCalle(calle);
                                d.setCp(cp);
                                d.setNo_ext(exterior);
                                d.setNo_int(interior);
                                System.out.println(ciudad + colonia + calle + cp + exterior + interior);
                                    
                                int estado = DireccionActions.GuardarDireccion(d, id_mu);
                                
                                if(estado > 0){
                                    response.sendRedirect("direcciones.jsp");
                                }else{
                                    System.out.println("Error al registrar");
                                }    
                                
                                }
                                
                                
                                
                            %>
                            Ciudad:<input type="text" name="ciudad" placeholder="Ingresa tu ciudad"><br>
                            Colonia:<input type="text" name="colonia" placeholder="Ingresa tu colonia"><br>
                            Codigo postal:<input type="text" name="cp" placeholder="Ingresa tu cp"><br>
                            Calle:<input type="text" name="calle" placeholder="Ingresa tu calle"><br>
                            #Interior:<input type="text" name="int" placeholder="Ingresa tu numero interior"><br>
                            #Exterior:<input type="text" name="ext" placeholder="Ingresa tu numero exterior"><br>
                            <input type="submit" value="Guardar" name = "savedir">
                        </form>
                        
                        <div align="center" style="padding-left: 10%" width="200%" >
                            <h1>Direcciones guardadas</h1>
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
                                <th width="150" align="center" >Ciudad

                                </th>
                                <th width="290" align="center" >Codigo Postal

                                </th>
                                <th width="290" align="center" >Colonia

                                </th>
                                <th width="290" align="center" >#Exterior

                                </th>
                                <th width="230" align="center" >#Interior

                                </th>
                                <th width="290" align="center" >Calle

                                </th>
                                <th width="290" align="center" >Eliminar

                                </th>

                                <% 
                                    Connection con = UserActions.getConnection();
                                    Statement st = con.createStatement();
                                    ResultSet rs,rs2;
                                    try{
                                        int i = 0;
                                            String q = "Select * from mdireccionentrega where id_mu = ("+id_mu+");";
                                            rs = st.executeQuery(q);
                                            
                                        
                                        while(rs.next()){

                                       
                                            if(i == (i/2)*2){
                                 %>

                                 <tr>
                                     

                                     <td valign="top" width="80" height="19" ><%=rs.getString(2) %> 

                                     </td>
                                     <td valign="top" width="80" height="19" ><%=rs.getInt(3) %> 

                                     </td>
                                     <td valign="top" width="80" height="19" ><%=rs.getString(4) %> 

                                     </td>
                                    <td valign="top" width="80" height="19" ><%=rs.getInt(5) %> 

                                     </td>
                                    <td valign="top" width="80" height="19" ><%=rs.getInt(6) %> 

                                     </td>
                                     <td valign="top" width="80" height="19" ><%=rs.getString(7) %> 

                                     </td>
                                     <td valign="top" width="80" height="19" >
                                        <form action="">
                                            <input type="hidden" value="<%=rs.getInt(1)%>" name = "id_dirht">
                                            <input type="submit" value="Eliminar" name="deletedir">
                                        </form>
                                     </td>

                                 </tr>

                                 <% 
                                            }else{%>


                                   <tr>
                                     <td valign="top" width="80" height="19" ><%=rs.getString(1) %> 

                                     </td>
                                     <td valign="top" width="80" height="19" ><%=rs.getString(3) %> 

                                     </td>
                                     <td valign="top" width="80" height="19" ><%=rs.getString(4) %> 

                                     </td>
                                    <td valign="top" width="80" height="19" ><%=rs.getString(5) %> 

                                     </td>
                                    <td valign="top" width="80" height="19" ><%=rs.getString(7) %> 

                                     </td>
                                    <td valign="top" width="80" height="19" ><%=rs.getString(10) %> 

                                     </td>

                                 </tr>

                                <%         }
                                        }
                                        try{

                                            id_direccion = Integer.parseInt(request.getParameter("id_dirht"));
                                            if(request.getParameter("deletedir") != null){

                                                System.out.println(id_direccion);
                                                int statusdelete = 0;
                                                statusdelete = DireccionActions.EliminarDireccion(id_direccion, id_mu);
                                                if(statusdelete > 0){
                                                    System.out.println("Eliminacion de direccion exitosa");
                                                    response.sendRedirect("direcciones.jsp");
                                                }else{
                                                    System.out.println("Error al eliminar la direccion");
                                                }
                                            }

                                        }catch(Exception e){

                                            System.out.println("Error, Fallo al eliminar direccion");
                                            System.out.println(e.getMessage());
                                            System.out.println(e.getStackTrace());

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