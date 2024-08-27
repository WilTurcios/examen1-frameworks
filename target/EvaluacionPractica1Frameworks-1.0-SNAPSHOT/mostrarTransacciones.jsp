<%-- 
    Document   : mostrarTransacciones
    Created on : 26 ago. 2024, 14:21:49
    Author     : wilbeR
--%>

<%@ page import="clases.Cuenta" %>
<%@ page import="clases.Transaccion" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Transacciones</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container">
    <h2 class="my-4">Transacciones Realizadas</h2>

    <%
        String numeroCuenta = request.getParameter("cuenta");

        List<Cuenta> cuentas = (List<Cuenta>) session.getAttribute("cuentas");
        if (cuentas != null) {
           Cuenta cuenta = null;
            
            for(Cuenta cuentaSesion : cuentas){
                if(cuentaSesion.getCuenta().equals(numeroCuenta)){
                    cuenta = cuentaSesion;
                    break;
                }
            }

            if (cuenta != null) {
                List<Transaccion> transacciones = cuenta.getTransacciones();

    %>
                <table class="table table-striped table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th>Tipo</th>
                            <th>Monto</th>
                            <th>Fecha</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Transaccion transaccion : transacciones) {
                        %>
                            <tr>
                                <td><%= transaccion.getTipo() %></td>
                                <td><%= transaccion.getMonto() %></td>
                                <td><%= transaccion.getFecha() %></td>
                            </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
    <%
            } else {
    %>
                <div class="alert alert-warning" role="alert">
                    No se encontró una cuenta con el número proporcionado.
                </div>
    <%
            }
        } else {
    %>
            <div class="alert alert-danger" role="alert">
                No se encontraron cuentas en la sesión.
            </div>
    <%
        }
    %>
    <a href="index.jsp" class="position-fixed bottom-0 start-50 btn btn-primary">Volver</a>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
