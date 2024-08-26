<%-- 
    Document   : transaccionesCuenta.jsp
    Created on : 19 ago. 2024, 15:21:32
    Author     : wilber
--%>
<%@page import="clases.Cuenta" %>
<%@page import="exceptions.InsufficientBalance" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Realizar Transacciones</title>
    </head>
    <body>
        <section class="container-fluid">
            <div class="row justify-content-center">
                <h2 class="mb-4 text-center">Realiza tus Operaciones 😊</h2>
                <form class="col-md-6 col-sm-8 col-12 m-4 p-4 bg-light rounded shadow-sm" method="POST">
                    <div class="mb-3">
                        <label for="cuenta" class="form-label">Número de Cuenta:</label>
                        <input type="text" class="form-control" id="cuenta" name="cuenta" placeholder="Ingresa el número de cuenta" required>
                    </div>
                    <div class="mb-3">
                        <label for="monto" class="form-label">Monto:</label>
                        <input type="number" step="0.01" class="form-control" id="monto" name="monto" placeholder="Ingresa el monto" step="0.01" required>
                    </div>
                    <div class="mb-3">
                        <label for="transaccion" class="form-label">Tipo de Transacción:</label>
                        <select class="form-select" id="transaccion" name="transaccion" required>
                            <option value="" disabled selected>Selecciona una opción</option>
                            <option value="depositar">Depositar</option>
                            <option value="retirar">Retirar</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Realizar Operación</button>
                </form>
                
                <% 
                    String numeroCuenta = request.getParameter("cuenta");
                    String transaccion = request.getParameter("transaccion");
                    String montoStr = request.getParameter("monto");
                    
                    if (numeroCuenta != null && transaccion != null && montoStr != null) {
                        try {
                            double monto = Double.parseDouble(montoStr);

                            List<Cuenta> accounts = (List<Cuenta>) session.getAttribute("cuentas");

                            if (accounts == null) {
                                out.println("<p>No hay cuentas registradas.</p>");
                            } else {
                                Cuenta cuenta = null;
                                for (Cuenta c : accounts) {
                                    if (c.getCuenta().equals(numeroCuenta)) {
                                        cuenta = c;
                                        break;
                                    }
                                }

                                if (cuenta == null) {
                                    out.println("<p>No se encontró la cuenta con el número proporcionado.</p>");
                                } else {
                                    if ("depositar".equals(transaccion)) {
                                        cuenta.depositar(monto);
                                        out.println("<p>Se depositaron $" + monto + " en la cuenta " + numeroCuenta + ".</p>");
                                    } else if ("retirar".equals(transaccion)) {
                                        try {
                                            cuenta.retirar(monto);
                                            out.println("<p>Se retiraron $" + monto + " de la cuenta " + numeroCuenta + ".</p>");
                                        } catch(InsufficientBalance e){
                                            out.println("<p>" + e.getMessage() + "</p>");
                                        }
                                       
                                        
                                    } else {
                                        out.println("<p>Tipo de transacción no válido.</p>");
                                    }
                                }
                            }
                        } catch (NumberFormatException e) {
                            out.println("<p>Error: El monto ingresado no es válido.</p>");
                        }
                    }
                %>
                
                 
            </div>
        </section>
        
        <a href="index.jsp" class="position-fixed bottom-0 start-50 btn btn-primary">Volver</a>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
