<%-- 
    Document   : obtenerEmpleados
    Created on : 21 ago. 2024, 21:54:06
    Author     : wilbe
--%>

<%@page import="clases.Empleado" %>
<%@page import="java.util.*" %>
<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%
    String sucursal = request.getParameter("sucursal");
    if (sucursal == null) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Sucursal no proporcionada");
        return;
    }

    HashMap<String, List<Empleado>> sucursales = (HashMap<String, List<Empleado>>) session.getAttribute("sucursales");
    if (sucursales == null || !sucursales.containsKey(sucursal)) {
        response.setContentType("application/json");
        out.print("[]");
        return;
    }

    List<Empleado> empleados = sucursales.get(sucursal);
    response.setContentType("application/json");
    out.print("[");
    boolean first = true;
    for (Empleado emp : empleados) {
        if (!first) {
            out.print(",");
        }
        
        out.print("{\"id\":\"" + emp.getId() + "\",\"nombre\":\"" + emp.getNombre() + "\"}");
        first = false;
    }
    out.print("]");
%>

