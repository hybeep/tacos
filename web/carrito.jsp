<%-- 
    Document   : direcciones
    Created on : 28/05/2020, 03:04:26 PM
    Author     : tutus
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="user.UserActions"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Taco-Carrito</title>
        <link rel="stylesheet" href="css/master.css">
        <script>
        function accion() {
            var id = document.getElementById('long').value;
            console.log(id);
            if(id === 3){
                form.setAttribute('action', 'compraprocess.jsp');
                form.submit();
            }
        }
        </script>
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
                <form action="compraprocess.jsp" id="form">

                    <table border="1" borderColor="black">
                    
                <th width="290" align="center" >Nombre del Producto
                    
                </th>
                <th width="290" align="center" >Precio
                    
                </th>
                <th width="290" align="center" >Stock
                    
                </th>
                <th width="230" align="center" >img
                    
                </th>
                <th width="290" align="center" >Descripción
                    
                </th>
                <th width="290" align="center" >Numero
                    
                </th>
                <th width="290" align="center" >Eliminar

                </th>
                                    <%
                    String prodlist = (String)session.getAttribute("prodlist");
                    int numlist = (Integer)session.getAttribute("numlist");
                    if(prodlist != null){
                    System.out.println("prodlist"+prodlist);
                    String prods[] = new String[numlist];
                    prods = prodlist.split(",");
                    Connection con = UserActions.getConnection();
                    Statement st = con.createStatement();
                    Statement st2 = con.createStatement();
                    Statement st3 = con.createStatement();
                    ResultSet rs,rs2,rs3;
                    try{
                        for (int i = 0; i < prods.length ; i++) {
                            String q = "Select * from mtacos where id_mtacos="+prods[i];
                            String q2 = "Select * from dtacos where id_taco="+prods[i];
                            rs = st.executeQuery(q);
                            rs2 = st2.executeQuery(q2);   
                            while(rs.next() && rs2.next()){
                                int idprod = rs2.getInt(1);
                                String form = "form"+i;
                                String prod = "idprod"+i;
                                String numero = "numero"+i;
                                String formul = "form action='eliminarcarrito.jsp' name='" + form + "'";
                    %>
                    <p id="long" value="<%=prods.length%>" style="display: none;"></p>
                    <tr>
                     <p name="id" value="<%=idprod%>" style="display: none;"></p>
                     <td valign="top" width="80" height="19" ><%=rs.getString(2) %> 
                     </td>
                     
                     <td valign="top" width="80" height="19" ><%=rs2.getFloat(2) %> 
                     </td>
                     
                     <td valign="top" width="80" height="19" ><%=rs2.getInt(3) %> 
                     </td>
                     
                     <td><img src="ControlerImg?id=<%=idprod%>" width="150" height="100">
                     </td>
                     
                     <td valign="top" width="80" height="19" ><%=rs2.getString(7) %> 
                     </td>
                     
                     <td valign="top" width="80" height="19" >
                        <input type="number" value="1" max="20" min="1" step="1" name="<%=numero%>">
                     </td>
                     
                     <td valign="top" width="80" height="19" >
                        <<%= formul%>>
                            <input type="hidden" name="<%=prod%>" value="<%=rs.getInt(1)%>">
                            <input type="hidden" name="i" value="<%=i%>">
                            <input type="submit" value="Eliminar del carrito">
                        </form>
                     </td>

                 </tr>
            
                 <%
                     }
                    }
                 %>
                    </table>
                    
                    <h2>Complementos</h2>
                    <%
                        String sql3 = "select * from ccomplementos";
                        rs3 = st3.executeQuery(sql3);
                        
                        int z = 0;
                        while(rs3.next()){
                           
                            int id_cc = rs3.getInt(1);
                            String nom_cc = rs3.getString(2);
                            String  name_cc_form ="complementos_form"+z;
                            String hiden = nom_cc +"_"+ id_cc;
                            String name_label = "nom_cc"+z;
                    
                    %>
                    <input type="hidden" name="<%=hiden%>" value="<%=id_cc%>">
                    <input type="hidden" name="z" value="6">
                    <%=nom_cc%><input type="hidden"  name="<%=name_label%>" value="<%=nom_cc%>" >
                    <input type="checkbox" name = "<%= name_cc_form%>" id="<%= name_cc_form%>" ><br>
                        <% z++;
                                }
                    %>
                    
                        <input type="submit" value="Pagar">
                    </form>
                    
                 </section>
                 <%
                        st.close();
                        con.close();
                    }catch(Exception e){
                        System.out.println("Error, Fallo de conexion con la BD");
                        System.out.println(e.getMessage());
                        System.out.println(e.getStackTrace());
                    }
}
                 %>
                    
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
