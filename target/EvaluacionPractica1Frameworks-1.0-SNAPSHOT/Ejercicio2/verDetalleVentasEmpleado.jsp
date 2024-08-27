<%-- 
    Document   : verDetalleVentasEmpleado
    Created on : 22 ago. 2024, 18:24:06
    Author     : wilber
--%>
<%@page import="clases.Empleado" %>
<%@page import="clases.Venta" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle de Ventas del Empleado</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <div class="container my-5">
            <h1 class="text-center mb-4">Detalle de Ventas del Empleado</h1>

            <%
                String empleadoId = request.getParameter("id");
                String sucursalEmpleado = request.getParameter("sucursal");
                Map<String, List<Empleado>> sucursales = (Map<String, List<Empleado>>) session.getAttribute("sucursales");
                List<Empleado> empleados = sucursales != null ? sucursales.get(sucursalEmpleado) : null;

                if(empleados == null) {
            %>
                        <div class="alert alert-warning" role="alert">
                            No hay empleados registrados en esa sucursal.
                        </div>
            <%
                } else {
                    UUID empleadoUUID;
                    try {
                        empleadoUUID = UUID.fromString(empleadoId);
                    } catch (IllegalArgumentException e) {
            %>
                            <div class="alert alert-danger" role="alert">
                                ID de empleado inválido.
                            </div>
            <%
                        return;
                    }

                    Empleado empleadoSeleccionado = null;
                    for(Empleado empleado : empleados) {
                        if(empleado.getId().equals(empleadoUUID)) {
                            empleadoSeleccionado = empleado;
                            break;
                        }
                    }

                    if(empleadoSeleccionado != null) {
                        double totalVentasEmpleado = 0.0;
            %>
                            <div class="card">
                                <div class="card-header">
                                    <h2><%= empleadoSeleccionado.getNombre() %></h2>
                                    <h5>Sucursal: <%= sucursalEmpleado %></h5>
                                </div>
                                <div class="card-body">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Mes</th>
                                                <th>Ventas del Mes</th>
                                            </tr>
                                        </thead>
                                        <tbody>
            <%
                                                for (String mes : Arrays.asList(
                                                        "enero", "febrero", "marzo", "abril", "mayo", 
                                                        "junio", "julio", "agosto", "septiembre", 
                                                        "octubre", "noviembre", "diciembre")) 
                                                {
                                                    double totalVentasMes = empleadoSeleccionado.getTotalVentasPorMes(mes);
                                                    totalVentasEmpleado += totalVentasMes;
            %>
                                                    <tr>
                                                        <td><%= mes.substring(0, 1).toUpperCase() + mes.substring(1) %></td>
                                                        <td>$<%= String.format("%.2f", totalVentasMes) %></td>
                                                    </tr>
            <%
                                                }
            %>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>Total Ventas</th>
                                                <th>$<%= String.format("%.2f", totalVentasEmpleado) %></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
            <%
                    } else {
            %>
                            <div class="alert alert-warning" role="alert">
                                Empleado no encontrado.
                            </div>
            <%
                    }
                }
            %>
        </div>
        <a href="../index.jsp" class="position-fixed bottom-0 start-50 translate-middle-x btn btn-primary">Volver</a>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>