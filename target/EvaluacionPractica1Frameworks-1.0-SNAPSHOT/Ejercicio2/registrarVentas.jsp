<%@page import="clases.Empleado" %>
<%@page import="clases.Venta" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Registrar Venta</title>
        <script>
            function cargarEmpleados() {
                var sucursal = document.getElementById("sucursal").value;
                var empleadosSelect = document.getElementById("empleado");
                empleadosSelect.innerHTML = "";

                fetch('obtenerEmpleados.jsp?sucursal=' + encodeURIComponent(sucursal))
                    .then(response => response.json())
                    .then(data => {
                        if (data.length > 0) {
                            data.forEach(emp => {
                                var option = document.createElement("option");
                                option.value = emp.id;
                                option.text = emp.nombre;
                                empleadosSelect.add(option);
                                
                                console.log(emp.id);
                            });
                        } else {
                            var option = document.createElement("option");
                            option.value = "";
                            option.text = "No hay empleados disponibles";
                            empleadosSelect.add(option);
                        }
                    });
            }
        </script>
    </head>
    <body>
        <section class="container-fluid">
            <div class="row justify-content-center">
                <h2 class="mb-4 text-center">Registrar Ventas de Empleados</h2>
                <form class="col-md-6 col-sm-8 col-12 m-4 p-4 bg-light rounded shadow-sm" method="POST">
                    <div class="mb-3">
                        <label for="sucursal" class="form-label">Sucursal:</label>
                        <select class="form-select" id="sucursal" name="sucursal" required onchange="cargarEmpleados()">
                            <option value="" disabled selected>Selecciona una opción</option>
                            <option value="A">Sucursal A</option>
                            <option value="B">Sucursal B</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="empleado" class="form-label">Empleado:</label>
                        <select class="form-select" id="empleado" name="empleado" required>
                            <option value="" disabled selected>Selecciona un empleado</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="mes" class="form-label">Mes:</label>
                        <select class="form-select" id="mes" name="mes" required>
                            <option value="" disabled selected>Selecciona un mes</option>
                            <option value="enero">Enero</option>
                            <option value="febrero">Febrero</option>
                            <option value="marzo">Marzo</option>
                            <option value="abril">Abril</option>
                            <option value="mayo">Mayo</option>
                            <option value="junio">Junio</option>
                            <option value="julio">Julio</option>
                            <option value="agosto">Agosto</option>
                            <option value="septiembre">Septiembre</option>
                            <option value="octubre">Octubre</option>
                            <option value="noviembre">Noviembre</option>
                            <option value="diciembre">Diciembre</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="monto" class="form-label">Monto de la Venta:</label>
                        <input type="number" step="0.01" class="form-control" id="monto" name="monto" placeholder="Ingresa el monto de la venta" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Registrar Venta</button>
                </form>
            </div>
        </section>
        
        <%
            String sucursal = request.getParameter("sucursal");
            String empleadoId = request.getParameter("empleado");
            String mes = request.getParameter("mes");
            String montoStr = request.getParameter("monto");

            if(sucursal != null && empleadoId != null && mes != null && montoStr != null &&
               !sucursal.isEmpty() && !empleadoId.isEmpty() && !mes.isEmpty() && !montoStr.isEmpty()) {

                double monto;
                try {
                    monto = Double.parseDouble(montoStr);
                } catch (NumberFormatException e) {
                    out.println("<span id='message'>Monto inválido</span>");
                    return;
                }

                HashMap<String, List<Empleado>> sucursales = (HashMap<String, List<Empleado>>) session.getAttribute("sucursales");

                if (sucursales == null) {
                    sucursales = new HashMap<>();
                    sucursales.put("A", new ArrayList<>());
                    sucursales.put("B", new ArrayList<>());
                }

                if(sucursales.containsKey(sucursal)) {
                    List<Empleado> empleados = sucursales.get(sucursal);
                    Empleado empleadoEncontrado = null;
                    
                    UUID empleadoUUID;
                    try {
                        empleadoUUID = UUID.fromString(empleadoId);
                    } catch (IllegalArgumentException e) {
                        out.println("<span id='message'>ID de empleado inválido</span>");
                        return;
                    }
                    
                    for (Empleado emp : empleados) {
                        if (emp.getId().equals(empleadoUUID)) {
                            empleadoEncontrado = emp;
                            break;
                        }
                    }

                    if (empleadoEncontrado != null) {
                        Venta nuevaVenta = new Venta(mes, monto);
                        empleadoEncontrado.getVentas().add(nuevaVenta);

                        session.setAttribute("sucursales", sucursales);
                        out.println("<span id='message'>Venta registrada correctamente para el empleado " + empleadoId + " en la sucursal " + sucursal + "</span>");
                    } else {
                        out.println("<span id='message'>Empleado no encontrado en la sucursal " + sucursal + "</span>");
                    }
                } else {
                    out.println("<span id='message'>Sucursal no encontrada</span>");
                }
            }
        %>

        <a href="../index.jsp" class="position-fixed bottom-0 start-50 btn btn-primary">Volver</a>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
