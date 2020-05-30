package user;

import java.sql.Date;




public class User {
    
    
    private String nom_mu, appat_mu, apmat_mu, tel_mu, cel_mu, email_mu, pass_mu,id;
    private Date birth_mu;

    public String getNom_mu() {
        return nom_mu;
    }

    public void setNom_mu(String nom_mu) {
        this.nom_mu = nom_mu;
    }

    public String getAppat_mu() {
        return appat_mu;
    }

    public void setAppat_mu(String appat_mu) {
        this.appat_mu = appat_mu;
    }

    public String getApmat_mu() {
        return apmat_mu;
    }

    public void setApmat_mu(String apmat_mu) {
        this.apmat_mu = apmat_mu;
    }

  

    public String getTel_mu() {
        return tel_mu;
    }

    public void setTel_mu(String tel_mu) {
        this.tel_mu = tel_mu;
    }

    public String getCel_mu() {
        return cel_mu;
    }

    public void setCel_mu(String cel_mu) {
        this.cel_mu = cel_mu;
    }

    public String getEmail_mu() {
        return email_mu;
    }

    public void setEmail_mu(String email_mu) {
        this.email_mu = email_mu;
    }

    public String getPass_mu() {
        return pass_mu;
    }

    public void setPass_mu(String pass_mu) {
        this.pass_mu = pass_mu;
    }

    public Date getBirth_mu() {
        return birth_mu;
    }

    public void setBirth_mu(Date birth_mu) {
        this.birth_mu = birth_mu;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}