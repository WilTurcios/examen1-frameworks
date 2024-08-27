<%-- 
    Document   : index
    Created on : 19 ago. 2024, 15:03:11
    Author     : wilbe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Start Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">WT</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavDropdown">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-bs-toggle="dropdown" aria-expanded="false">Ejercicio 1</a>
                                <ul class="dropdown-menu" aria-labelledby="dropdown01">
                                    <li><a class="dropdown-item" href="crearCuenta.jsp">Crear Cuenta</a></li>
                                    <li><a class="dropdown-item" href="mostrarCuentas.jsp">Cuentas Registradas</a></li>
                                    <li><a class="dropdown-item" href="transaccionesCuenta.jsp">Realizar Transacciones</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdown02" data-bs-toggle="dropdown" aria-expanded="false">Ejercicio 2</a>
                                <ul class="dropdown-menu" aria-labelledby="dropdown02">
                                    <li><a class="dropdown-item" href="./Ejercicio2/registrarEmpleado.jsp">Registrar Empleados</a></li>
                                    <!--<li><a class="dropdown-item" href="./Ejercicio2/mostrarEmpleados.jsp">Mostrar Empleados</a></li>-->
                                    <li><a class="dropdown-item" href="./Ejercicio2/registrarVentas.jsp">Registrar Ventas</a></li>
                                    <li><a class="dropdown-item" href="./Ejercicio2/listaEmpleados.jsp">Lista de empleados</a></li>
                                    <li><a class="dropdown-item" href="./Ejercicio2/mostrarResumen.jsp">Resumen de Ventas</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
         
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
