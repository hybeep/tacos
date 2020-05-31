<%-- 
    Document   : agregarcarrito
    Created on : 31/05/2020, 10:29:12 AM
    Author     : tutus
--%>

<%@page import="user.UserActions"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int idprod = Integer.parseInt(request.getParameter("idprod"));
    String prodlist = (String) session.getAttribute("prodlist");
    String[] prods = prodlist.split(",");
    if (prodlist != null) {
        session.removeAttribute("prodlist");
        for (int i = 0; i < prods.length; i++) {
            
        }
        session.setAttribute("prodlist",prodlist);
        response.sendRedirect("main.jsp");
    }else{
        prodlist = "0" + idprod; 
        session.setAttribute("prodlist", prodlist);
        response.sendRedirect("main.jsp");
    }
%>

