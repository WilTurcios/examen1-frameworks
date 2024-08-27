    <%@page import="java.util.*" %>
<%@page import="clases.Empleado" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Lista de Empleados</title>
    </head>
    <body>
        <section class="container-fluid">
            <div class="row justify-content-center">
                <h2 class="mb-4 text-center">Lista de Empleados por Sucursal</h2>
                <table class="table table-striped table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Sucursal</th>
                            <th>Nombre del Empleado</th>
                            <th>ID</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            HashMap<String, List<Empleado>> sucursales = (HashMap<String, List<Empleado>>) session.getAttribute("sucursales");

                            if (sucursales != null && !sucursales.isEmpty()) {
                                for (Map.Entry<String, List<Empleado>> entry : sucursales.entrySet()) {
                                    String sucursal = entry.getKey();
                                    List<Empleado> empleados = entry.getValue();

                                    if (empleados != null && !empleados.isEmpty()) {
                                        for (Empleado emp : empleados) {
                        %>
                            <tr>
                                <td><%= sucursal %></td>
                                <td><%= emp.getNombre() %></td>
                                <td><%= emp.getId() %></td>
                                <td>
                                    <form action="verDetalleVentasEmpleado.jsp" method="GET">
                                        <input type="hidden" name="sucursal" value="<%= sucursal %>">
                                        <input type="hidden" name="id" value="<%= emp.getId() %>">
                                        <button type="submit" class="btn btn-primary">Ver Detalles de Ventas</button>
                                    </form>
                                </td>
                            </tr>
                        <%
                                        }
                                    }
                                }
                            } else {
                        %>
                            <tr>
                                <td colspan="4" class="text-center">No hay empleados registrados en ninguna sucursal.</td>
                            </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </section>

        <a href="../index.jsp" class="position-fixed bottom-0 start-50 translate-middle-x btn btn-primary">Volver</a>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
