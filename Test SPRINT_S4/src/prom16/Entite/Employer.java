package prom16.Entite;

import prom16.annotation.AnnoterAttribut;
import prom16.annotation.AnnoterObject;
import prom16.annotation.Annoter;
import prom16.annotation.Email;
import prom16.annotation.Range;
import prom16.annotation.Required;

@AnnoterObject
public class Employer {
    @Required
    private String nom;

    @Required
    @Email
    private String email;

    @Range(min = 0,max=1000000)
    @AnnoterAttribut("argent")
    private double vola;

    public Employer(String nom, String email,double argent) {
        this.setNom(nom);
        this.setEmail(email);
        this.setVola(argent);
    }

    public Employer() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public double getVola() {
        return vola;
    }

    public void setVola(double vola) {
        this.vola = vola;
    }
}
