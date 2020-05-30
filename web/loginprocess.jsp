<%-- 
    Document   : loginprocess
    Created on : 29/05/2020, 07:15:22 PM
    Author     : tutus
--%>

<%@page import="user.UserActions"%>
<%@page import="user.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
                    <%
                            String email,password;
                            password = request.getParameter("password");
                            email = request.getParameter("correo");
                            System.out.println(email + password);

                            User e = new User();
                            e.setEmail_mu(email);
                            e.setPass_mu(password);

                            int status = UserActions.Loguear(e);

                            if (status > 0) {
                                int id = UserActions.getIdByEmail(email);
                                int lvl = UserActions.getNivelByEmail(email);
                                session.setAttribute("id",id);
                                System.out.println("datos sesion login"+session.getAttribute("email")+" "+session.getAttribute("id")+" "+session.getAttribute("nivel"));
                                if (lvl == 1) {
                                    session.setAttribute("nivel", lvl);
                                    response.sendRedirect("mainadmins.jsp");
                                }else{
                                    session.setAttribute("email", email);
                                    response.sendRedirect("main.jsp");
                                }
                                    
                            }else{
                                out.println("<h>Contraseña o correo invalidos</h>");
                            }
                    %>
