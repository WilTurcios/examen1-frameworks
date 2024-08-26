<%@page import="clases.Empleado" %>
<%@page import="clases.Venta" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Cuentas</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div class="container my-5">
        <h1 class="text-center mb-4">Listado de Empleados 😊</h1>
        
        <div>
        </div>
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
                        // Inicializar las variables para los cálculos
                        HashMap<String, Integer> cantidadEmpleadosPorSucursal = new HashMap<>();
                        List<Venta> todasVentas = new ArrayList<>();
                        double menorVenta = 0.0;
                        double mayorVenta = 0.0;
                        String mesMenorVenta = "";
                        String mesMayorVenta = "";
                        String empleadoMenorVenta = "";
                        String empleadoMayorVenta = "";
                        UUID idEmpleadoMenorVenta = null;
                        UUID idEmpleadoMayorVenta = null;
                        double sumaTotalVentas = 0.0;

                        // Obtener el HashMap de sucursales desde la sesión
                        HashMap<String, List<Empleado>> sucursales = (HashMap<String, List<Empleado>>) session.getAttribute("sucursales");

                        if (sucursales == null || sucursales.isEmpty()) {
                            out.println("<tr><td colspan='14' class='text-center'>No hay ningún empleado registrado :(</td></tr>");
                        } else {
                            for (String nombreSucursal : sucursales.keySet()) {
                                int cantidadEmpleados = 0;

                                for (Empleado empleado : sucursales.get(nombreSucursal)) {
                                    cantidadEmpleados++;
                                    out.println("<tr>");
                                    out.println("<td>" + nombreSucursal + "</td>");
                                    out.println("<td>" + empleado.getNombre() + "</td>");
                                    double totalVentasEmpleado = 0.0;

                                    for (String mes : Arrays.asList("enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre")) {
                                        double totalVentasMes = empleado.getTotalVentasPorMes(mes);
                                        totalVentasEmpleado += totalVentasMes;
                                        out.println("<td>" + totalVentasMes + "</td>");
                                    }

                                    out.println("<td>" + totalVentasEmpleado + "</td>");
                                    out.println("</tr>");

                                    // Actualizar datos globales
                                    sumaTotalVentas += totalVentasEmpleado;
                                    for (Venta venta : empleado.getVentas()) {
                                        double monto = venta.getMonto();
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
                                }

                                cantidadEmpleadosPorSucursal.put(nombreSucursal, cantidadEmpleados);
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
        
        <h2 class="text-center mt-5">Resumen de Ventas</h2>
        <div class="table-responsive">
            <table class="table table-striped table-hover mt-3">
                <thead class="table-dark">
                    <tr>
                        <th>Sucursal</th>
                        <th>Cantidad de Empleados</th>
                        <th>Total de Vendedores</th>
                        <th>Menor Venta</th>
                        <th>Mes de Menor Venta</th>
                        <th>Empleado de Menor Venta</th>
                        <th>ID Empleado Menor Venta</th>
                        <th>Mayor Venta</th>
                        <th>Mes de Mayor Venta</th>
                        <th>Empleado de Mayor Venta</th>
                        <th>ID Empleado Mayor Venta</th>
                        <th>Suma Total Ventas</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        for (String sucursal : sucursales.keySet()) {
                            int cantidadEmpleados = cantidadEmpleadosPorSucursal.getOrDefault(sucursal, 0);
                            out.println("<tr>");
                            out.println("<td>" + sucursal + "</td>");
                            out.println("<td>" + cantidadEmpleados + "</td>");
                            out.println("<td>" + sucursales.get(sucursal).size() + "</td>");
                            out.println("<td>" + menorVenta + "</td>");
                            out.println("<td>" + mesMenorVenta + "</td>");
                            out.println("<td>" + empleadoMenorVenta + "</td>");
                            out.println("<td>" + idEmpleadoMenorVenta + "</td>");
                            out.println("<td>" + mayorVenta + "</td>");
                            out.println("<td>" + mesMayorVenta + "</td>");
                            out.println("<td>" + empleadoMayorVenta + "</td>");
                            out.println("<td>" + idEmpleadoMayorVenta + "</td>");
                            out.println("<td>" + sumaTotalVentas + "</td>");
                            out.println("</tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
    <a href="../index.jsp" class="position-fixed bottom-0 start-50 translate-middle-x btn btn-primary">Volver</a>
    <!-- Bootstrap 5 JS (Optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
