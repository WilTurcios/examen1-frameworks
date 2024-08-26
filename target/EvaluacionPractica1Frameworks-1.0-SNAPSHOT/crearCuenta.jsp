<%-- 
    Document   : crearCuenta
    Created on : 19 ago. 2024, 13:54:41
    Author     : wilber

    
--%>

<%@page import="clases.Cuenta" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        
        <section class="container-fluid">
            <div class="row justify-content-center">
                
                    <h2 class="mb-4 text-center">Crea tu cuenta 😊</h2>
                    <form class="col-md-6 col-sm-8 col-12 m-4 p-4 bg-light rounded shadow-sm" method="POST">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Titular de la Cuenta:</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingresa tu nombre">
                        </div>
                        <div class="mb-3">
                            <label for="cuenta" class="form-label">Número de Cuenta:</label>
                            <input type="text" class="form-control" id="cuenta" name="cuenta" placeholder="Ingresa el número de cuenta">
                        </div>
                        <div class="mb-3">
                            <label for="saldo" class="form-label">Monto inicial a depositar:</label>
                            <input type="number" step="0.01" class="form-control" id="saldo" name="saldo" placeholder="Ingresa el monto inicial">
                        </div>
                        <div class="mb-3">
                            <label for="interes" class="form-label">Interés:</label>
                            <input type="number" step="0.01" class="form-control" id="interes" name="interes" placeholder="Ingresa el porcentaje de interés">
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Crear Cuenta</button>
                    </form>
            </div>
        </section>
        
        <%
            String nombre = request.getParameter("nombre");
            String numeroCuenta = request.getParameter("cuenta");
            String saldoStr = request.getParameter("saldo");
            String interesStr = request.getParameter("interes");

            if(nombre != null && numeroCuenta != null && !nombre.isEmpty() && !numeroCuenta.isEmpty() && saldoStr != null && interesStr != null && !saldoStr.isEmpty() && !interesStr.isEmpty()){
                double saldo = Double.parseDouble(saldoStr);
                double interes = Double.parseDouble(interesStr);

                List<Cuenta> accounts = (List<Cuenta>) session.getAttribute("cuentas");

                if (accounts == null) {
                    accounts = new ArrayList<>();
                }

                Cuenta newAccount = new Cuenta(nombre, numeroCuenta, saldo, interes);
                accounts.add(newAccount);

                session.setAttribute("cuentas", accounts);

                out.println("<span id='message'>La cuenta ha sido creada exitosamente</span>");
            }
        %>


         <a href="index.jsp" class="position-fixed bottom-0 start-50 btn btn-primary">Volver</a>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </body>
</html>
