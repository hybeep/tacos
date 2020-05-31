<%-- 
    Document   : borrarproducto
    Created on : 31/05/2020, 01:32:27 AM
    Author     : tutus
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="user.UserActions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int idprod = Integer.parseInt(request.getParameter("idhide"));
    int status = 0;
    try{
            Connection con = UserActions.getConnection();
            String q ="delete from dtacos where id_taco ="+idprod;
            String q2 ="delete from mtacos where id_mtacos ="+idprod;
            PreparedStatement ps = con.prepareStatement(q);
            PreparedStatement ps2 = con.prepareStatement(q2);
            ps.executeUpdate();
            ps2.executeUpdate();
            response.sendRedirect("mainadmins.jsp");
            con.close();
        
        }catch (Exception ed){
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }
%>
