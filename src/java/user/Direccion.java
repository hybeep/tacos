/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

/**
 *
 * @author tutus
 */
public class Direccion {
    private int cp,no_int,no_ext;
    private String ciudad, colonia,  calle;

    public int getCp() {
        return cp;
    }

    public void setCp(int cp) {
        this.cp = cp;
    }

    public int getNo_int() {
        return no_int;
    }

    public void setNo_int(int no_int) {
        this.no_int = no_int;
    }

    public int getNo_ext() {
        return no_ext;
    }

    public void setNo_ext(int no_ext) {
        this.no_ext = no_ext;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getColonia() {
        return colonia;
    }

    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }
    
    
    
}
