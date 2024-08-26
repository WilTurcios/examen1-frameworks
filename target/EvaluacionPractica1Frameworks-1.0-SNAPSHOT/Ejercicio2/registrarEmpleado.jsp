<%-- 
    Document   : registrarEmpleado
    Created on : 21 ago. 2024, 08:11:58
    Author     : wilbe
--%>

<%@page import="clases.Empleado" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Registrar Empleados</title>
    </head>
    <body>
        
        <section class="container-fluid">
            <div class="row justify-content-center">
                
                    <h2 class="mb-4 text-center">Regista a tus Nuevos Empleados 😊</h2>
                    <form class="col-md-6 col-sm-8 col-12 m-4 p-4 bg-light rounded shadow-sm" method="POST">
                        <div class="mb-3">
                            <label for="sucursal" class="form-label">Sucursal a la que Pertenece:</label>
                            <select class="form-select" id="sucursal" name="sucursal" required>
                                <option value="" disabled selected>Selecciona una opción</option>
                                <option value="A">Sucursal A</option>
                                <option value="B">Sucursal B</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre:</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingresa el nombre del empleado">
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Crear Cuenta</button>
                    </form>
            </div>
        </section>
        
        <%
            String sucursal = request.getParameter("sucursal");
            String nombre = request.getParameter("nombre");

            if(sucursal != null && nombre != null && !sucursal.isEmpty() && !nombre.isEmpty()){
                HashMap<String, List<Empleado>> sucursales = (HashMap<String, List<Empleado>>) session.getAttribute("sucursales");

                if (sucursales == null) {
                    sucursales = new HashMap<String, List<Empleado>>();
                    sucursales.put("A", new ArrayList<Empleado>());
                    sucursales.put("B", new ArrayList<Empleado>());
                }

                if(sucursales.containsKey(sucursal)) {
                    Empleado newEmployee = new Empleado(nombre);
                    sucursales.get(sucursal).add(newEmployee);

                    session.setAttribute("sucursales", sucursales);
                    out.println(
                        "<span id='message'> El empleado ha sido añadido correctamente a la sucursal " + sucursal + " </span>"
                    );
                } else {
                    out.println(
                        "<span id='message'>La sucursal " + sucursal + " no existe</span>"
                    );
                }
            }
        %>


         <a href="../index.jsp" class="position-fixed bottom-0 start-50 btn btn-primary">Volver</a>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </body>
</html>
