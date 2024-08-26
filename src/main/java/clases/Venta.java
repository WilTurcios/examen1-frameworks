/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package clases;

/**
 *
 * @author wilbe
 */
public class Venta {
    private String mes;
    private double monto;
    
    public Venta(String mes, double monto){
        this.mes = mes;
        this.monto = monto;
    }
    
    public void setMes(String mes){
        this.mes = mes;
    }
    
    public String getMes(){
        return this.mes;
    }
    public void setMonto(double monto){
        this.monto = monto;
    }
    
    public double getMonto(){
        return this.monto;
    }
    
}
