<%-- 
    Document   : newdir
    Created on : 3/06/2020, 08:30:29 PM
    Author     : tutus & profirio
--%>

<%@page import="user.DireccionActions"%>
<%@page import="user.Direccion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Direccion d = new Direccion();
    Integer id_mu = (Integer)session.getAttribute("id");
    
    String ciudad, colonia, calle;
    int cp, exterior, interior;

    ciudad = request.getParameter("ciudad");
    colonia = request.getParameter("colonia");
    calle = request.getParameter("calle");
    cp = Integer.parseInt(request.getParameter("cp"));
    interior = Integer.parseInt(request.getParameter("int"));
    exterior = Integer.parseInt(request.getParameter("ext"));

    d.setCiudad(ciudad);
    d.setColonia(colonia);
    d.setCalle(calle);
    d.setCp(cp);
    d.setNo_ext(exterior);
    d.setNo_int(interior);

    int estado = DireccionActions.GuardarDireccion(d, id_mu);

    if(estado > 0){
        response.sendRedirect("direcciones.jsp");
    }else{
        System.out.println("Error al registrar");
    }    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error direccion</title>
    </head>
    <body>
        <h1>Error al guardar direccion <a href="profile.jsp">regresar</a></h1>
    </body>
</html>
