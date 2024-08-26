/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package clases;

/**
 *
 * @author wilbe
 */
import clases.Venta;
import java.util.*;

public class Empleado {
    private UUID id;
    private String nombre;
    private List<Venta> ventas;
    
    public Empleado(String nombre, List<Venta> ventas) {
        this.nombre = nombre;
        this.ventas = ventas;
        this.id = UUID.randomUUID();
    }
    
    public Empleado(String nombre){
        this(nombre, new ArrayList<Venta>());
    }

    public String getNombre() {
        return this.nombre;
    }

    public List<Venta> getVentas() {
        return this.ventas;
    }
    
    public double getTotalVentasPorMes(String mes){
        double totalVentas = 0.0;
        for(Venta venta : this.ventas){
            if(venta.getMes().equals(mes)){
                totalVentas += venta.getMonto();
            }
        }
        
        return totalVentas;
    }
    
    public double getTotalVentas(){
        double totalVentas = 0.0;
        for(Venta venta : this.ventas){
            totalVentas += venta.getMonto();
        }
        
        return totalVentas;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setVentas(List<Venta> ventas) {
        this.ventas = ventas;
    }
    
    public void addVenta(Venta venta){
        this.ventas.add(venta);
    }
    
    public UUID getId(){
        return this.id;
    }
    
    public boolean equals(Empleado empleado){
        return this.id == empleado.getId();
    }
}
