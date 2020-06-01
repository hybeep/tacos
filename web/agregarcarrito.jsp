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
    String no = (String)request.getParameter("i");
    String lab = "id"+no;
    int idprod = Integer.parseInt(request.getParameter(lab));
    String prodlist = (String) session.getAttribute("prodlist");
    String cantidad = (String) session.getAttribute("cantidad");
    int numlist = (Integer) session.getAttribute("numlist");
    if (prodlist != null && cantidad != null) {
        session.removeAttribute("prodlist");
        session.removeAttribute("numlist");
        session.removeAttribute("cantidad");
        prodlist += ","+idprod; 
        cantidad += ","+1;
        session.setAttribute("prodlist",prodlist);
        session.setAttribute("numlist",numlist+1);
        session.setAttribute("cantidad",cantidad);
        response.sendRedirect("main.jsp");
    }else{
        prodlist = Integer.toString(idprod); 
        session.removeAttribute("numlist");
        session.removeAttribute("cantidad");
        session.setAttribute("prodlist", prodlist);
        session.setAttribute("numlist",1);
        session.setAttribute("cantidad","1");
        response.sendRedirect("main.jsp");
    }
%>

