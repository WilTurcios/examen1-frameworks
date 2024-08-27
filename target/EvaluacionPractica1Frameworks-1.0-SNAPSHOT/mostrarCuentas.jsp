<%-- 
    Document   : mostrarCuentas
    Created on : 19 ago. 2024, 15:55:24
    Author     : wilber
--%>
<%@page import="clases.Cuenta" %>
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
            <h1 class="text-center mb-4">Listado de Cuentas 😊</h1>
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Titular de la cuenta</th>
                            <th>Número de cuenta</th>
                            <th>Saldo Total</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% 
                        List<Cuenta> accounts = (List<Cuenta>) session.getAttribute("cuentas");
                        
                        if(accounts == null){
                            out.println("<tr><td colspan='3' class='text-center'>No hay ninguna cuenta registrada :(</td></tr>");
                        } else {
                            for(Cuenta account : accounts){
                                out.println("<tr>");                   
                                out.println("<td>" + account.getNombre() + "</td>");
                                out.println("<td>" + account.getCuenta() + "</td>");
                                out.println("<td>$" + account.consultarSaldo() + "</td>");
                    %>
                                <td>
                                    <form action="mostrarTransacciones.jsp" method="GET">
                                        <input type="hidden" name="cuenta" value="<%= account.getCuenta() %>">
                                        <button type="submit" class="btn btn-primary">Ver Detalles de Transacciones</button>
                                    </form>
                                </td>
                            </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
                    <a href="index.jsp" class="position-fixed bottom-0 start-50 btn btn-primary">Volver</a>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
