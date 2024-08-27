/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package clases;

import java.time.LocalDateTime;

/**
 *
 * @author wilbe
 */
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Transaccion {
    private String tipo;
    private double monto;
    private LocalDateTime fecha;
    
    public Transaccion(String tipo, double monto) {
        this.tipo = tipo;
        this.monto = monto; 
        this.fecha = LocalDateTime.now();  
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public void setFecha(LocalDateTime fecha) {
        this.fecha = fecha;
    }

    public String getTipo() {
        return tipo;
    }

    public double getMonto() {
        return monto;
    }

    public String getFecha() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
        return fecha.format(formatter);
    }

}
