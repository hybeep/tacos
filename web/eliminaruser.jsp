<%-- 
    Document   : eliminaruser
    Created on : 31/05/2020, 02:08:38 AM
    Author     : tutus
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="user.UserActions"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    int id = Integer.parseInt(request.getParameter("usert"));
    Connection con = UserActions.getConnection();
    try{
        String q = "delete from musuario where id_mu="+id;
        PreparedStatement ps = con.prepareStatement(q);
        ps.executeUpdate();
        ps.close();
        con.close();
    }catch(Exception e){
        System.out.println("Error, Fallo de conexion con la BD");
        System.out.println(e.getMessage());
        System.out.println(e.getStackTrace());
    }
%>
