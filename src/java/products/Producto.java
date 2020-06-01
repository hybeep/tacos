package products;

import java.io.InputStream;

/**
 *
 * @author PorfirioDamián
 */
public class Producto {

    String nom_prod, descripcion_prod;
    int id_mprod, id_dprod, stock;
    float precio;
    InputStream img;

    public Producto() {
    }

    public Producto(String nom_prod, String descripcion_prod, int id_mprod, int id_dprod, int stock, float precio, InputStream img) {
        this.nom_prod = nom_prod;
        this.descripcion_prod = descripcion_prod;
        this.id_mprod = id_mprod;
        this.id_dprod = id_dprod;
        this.stock = stock;
        this.precio = precio;
        this.img = img;
    }

    public String getNom_prod() {
        return nom_prod;
    }

    public void setNom_prod(String nom_prod) {
        this.nom_prod = nom_prod;
    }

    public String getDescripcion_prod() {
        return descripcion_prod;
    }

    public void setDescripcion_prod(String descripcion_prod) {
        this.descripcion_prod = descripcion_prod;
    }

    public int getId_mprod() {
        return id_mprod;
    }

    public void setId_mprod(int id_mprod) {
        this.id_mprod = id_mprod;
    }

    public int getId_dprod() {
        return id_dprod;
    }

    public void setId_dprod(int id_dprod) {
        this.id_dprod = id_dprod;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public InputStream getImg() {
        return img;
    }

    public void setImg(InputStream img) {
        this.img = img;
    }
    
    
    
}
