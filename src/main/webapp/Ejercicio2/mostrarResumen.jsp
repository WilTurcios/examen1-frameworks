<%-- 
    Document   : mostrarResumen
    Created on : 26 ago. 2024, 13:50:58
    Author     : wilbe
--%>

<%@page import="clases.Empleado" %>
<%@page import="clases.Venta" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Resumen de Ventas</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div class="container my-5">
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead class="table-dark">x
                    <tr>
                        <th>Sucursal</th>
                        <th>Nombre del empleado</th>
                        <th>Ventas Enero</th>
                        <th>Ventas Febrero</th>
                        <th>Ventas Marzo</th>
                        <th>Ventas Abril</th>
                        <th>Ventas Mayo</th>
                        <th>Ventas Junio</th>
                        <th>Ventas Julio</th>
                        <th>Ventas Agosto</th>
                        <th>Ventas Septiembre</th>
                        <th>Ventas Octubre</th>
                        <th>Ventas Noviembre</th>
                        <th>Ventas Diciembre</th>
                        <th>Total de Ventas</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <% 
                        HashMap<String, List<Empleado>> sucursales = (HashMap<String, List<Empleado>>) session.getAttribute("sucursales");

                        if (sucursales == null || sucursales.isEmpty()) {
                            out.println("<tr><td colspan='14' class='text-center'>No hay ningún empleado registrado :(</td></tr>");
                        } else {
                            for (String nombreSucursal : sucursales.keySet()) {
                                for (Empleado empleado : sucursales.get(nombreSucursal)) {
                                    out.println("<tr>");
                                    out.println("<td>" + nombreSucursal + "</td>");
                                    out.println("<td>" + empleado.getNombre() + "</td>");
                                    
                                    for (String mes : Arrays.asList("enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre")) {
                                        double totalVentasMes = empleado.getTotalVentasPorMes(mes);
                                        out.println("<td>" + totalVentasMes + "</td>");
                                    }

                                    out.println("<td>" + empleado.getTotalVentas() + "</td>");
                                    out.println("</tr>");

                                    
                                }
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
                
        <h1 class="text-center mb-4">Resumen de Ventas</h1>

        <div class="list-group">
            <% 
                HashMap<String, Integer> cantidadEmpleadosPorSucursal = new HashMap<>();
                double menorVenta = Double.MAX_VALUE;
                double mayorVenta = Double.MIN_VALUE;
                String mesMenorVenta = "";
                String mesMayorVenta = "";
                String empleadoMenorVenta = "";
                String empleadoMayorVenta = "";
                UUID idEmpleadoMenorVenta = null;
                UUID idEmpleadoMayorVenta = null;
                double sumaTotalVentas = 0.0;
                int totalEmpleados = 0;
                boolean hayVentas = false;

        //      HashMap<String, List<Empleado>> sucursales = (HashMap<String, List<Empleado>>) session.getAttribute("sucursales");

                if (sucursales == null || sucursales.isEmpty()) {
                    out.println("<div class='list-group-item text-center'>No hay empleados registrados.</div>");
                } else {
                    for (String nombreSucursal : sucursales.keySet()) {
                        int cantidadEmpleados = 0;

                        for (Empleado empleado : sucursales.get(nombreSucursal)) {
                            cantidadEmpleados++;
                            totalEmpleados++;

                            double totalVentasEmpleado = 0.0;

                            for (Venta venta : empleado.getVentas()) {
                                hayVentas = true;
                                double monto = venta.getMonto();
                                totalVentasEmpleado += monto;

                                if (monto < menorVenta) {
                                    menorVenta = monto;
                                    mesMenorVenta = venta.getMes();
                                    empleadoMenorVenta = empleado.getNombre();
                                    idEmpleadoMenorVenta = empleado.getId();
                                }
                                if (monto > mayorVenta) {
                                    mayorVenta = monto;
                                    mesMayorVenta = venta.getMes();
                                    empleadoMayorVenta = empleado.getNombre();
                                    idEmpleadoMayorVenta = empleado.getId();
                                }
                            }

                            sumaTotalVentas += totalVentasEmpleado;
                        }

                        cantidadEmpleadosPorSucursal.put(nombreSucursal, cantidadEmpleados);
                    }

                    if (!hayVentas) {
                        menorVenta = 0.0;
                        mayorVenta = 0.0;
                        mesMenorVenta = "N/A";
                        mesMayorVenta = "N/A";
                        empleadoMenorVenta = "N/A";
                        empleadoMayorVenta = "N/A";

                        out.println("<div class='list-group-item text-center'>No hay ventas registradas :(</div>");
                    } else {
                        for (String sucursal : sucursales.keySet()) {
                            int cantidadEmpleados = cantidadEmpleadosPorSucursal.getOrDefault(sucursal, 0);

                            out.println("<div class='list-group-item'>");
                            out.println("<h5 class='mb-2'>" + sucursal + "</h5>");
                            out.println("<p><strong>Cantidad de Empleados:</strong> " + cantidadEmpleados + "</p>");
                            out.println("<p><strong>Mayor Venta:</strong> " + mayorVenta + "</p>");
                            out.println("<p><strong>Mes de Mayor Venta:</strong> " + mesMayorVenta + "</p>");
                            out.println("<p><strong>Empleado de Mayor Venta:</strong> " + empleadoMayorVenta + "</p>");
                            out.println("<p><strong>Menor Venta:</strong> " + menorVenta + "</p>");
                            out.println("<p><strong>Mes de Menor Venta:</strong> " + mesMenorVenta + "</p>");
                            out.println("<p><strong>Empleado de Menor Venta:</strong> " + empleadoMenorVenta + "</p>");
                            out.println("<p><strong>Total de Vendedores:</strong> " + totalEmpleados + "</p>");
                            out.println("<p><strong>Suma Total de Ventas:</strong> " + sumaTotalVentas + "</p>");
                            out.println("</div>");
                        }
                    }
                }
            %>
        </div>

    </div>
    <a href="../index.jsp" class="position-fixed bottom-0 start-50 translate-middle-x btn btn-primary">Volver</a>
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>

