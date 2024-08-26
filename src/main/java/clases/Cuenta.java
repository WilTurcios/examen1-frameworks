package clases;

/**
 *
 * @author wilbe
 */
import exceptions.*;

public class Cuenta {
    private String nombre;
    private String cuenta;
    private double saldoAnterior = 0.0;
    private double saldo;
    private double tipoInteres;
    
    public Cuenta(String nombre, String cuenta, double saldo, double tipoInteres) { 
        this.cuenta = cuenta;
        this.nombre = nombre;
        this.saldo = saldo;
        this.tipoInteres = tipoInteres;
    }
    
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    
    public String getNombre() {
        return this.nombre;
    }
    
    public void setCuenta(String cuenta){
        this.cuenta = cuenta;
    }
    
    public String getCuenta() {
        return this.cuenta;
    }
    
    public void setInteres(double tipoInteres){
        this.tipoInteres = tipoInteres;
    }
    
    public double getInteres() {
        return this.tipoInteres;
    }
    
    public double getSaldoAnterior() {
        return this.saldoAnterior;
    }
    
    public void depositar(double cantidad) { 
        this.saldoAnterior = this.saldo;
        this.saldo += cantidad;
    }
    
    public void retirar(double cantidad) throws InsufficientBalance {
        this.saldoAnterior = this.saldo;
        if (cantidad <= this.saldo) {
            this.saldo -= cantidad;
        } else {
            throw new InsufficientBalance("El saldo para realizar la operación es insuficiente.");
        }
    }
    
    public double consultarSaldo() {
        return this.saldo;
    }
    
    public double calcularInteresGanado(int años) {
        double interesGanado = this.saldo * (this.tipoInteres / 100) * años;
        return interesGanado;
    }
}
