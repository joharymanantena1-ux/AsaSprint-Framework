package prom16.Controlleur;

import prom16.annotation.Annoter;
import prom16.annotation.Auth;
import prom16.annotation.Get;
import prom16.annotation.Param;
import prom16.annotation.Roles;
import prom16.annotation.Url;
import prom16.fonction.ModelView;
import prom16.fonction.CustomSession;
import prom16.Entite.Employer;

@Auth
@Annoter()
public class EmpControlleur {
    private CustomSession session;

    @Get
    @Url("/testeView")
    public ModelView transferView(@Param("nomView") String nom, String mailView, double ageView) {
        ModelView mv = new ModelView("/view/liste.jsp");
        mv.addObject("mail", mailView);
        mv.addObject("anarana", nom);
        mv.addObject("age", ageView);
        return mv;
    }

    // @Get
    // @Url("/insertionObjet")
    // public String insertionObject(@Param("emp") Employer employer,@Param("poste") String poste,@Param("num") String num) {
    //     String referer = "/";
    //     session.add("referer", referer);
    //     if (session != null) {
    //         session.add("vaovao", "ito vaovao");
    //     } else {
    //         return ("CustomSession is not initialized.");
    //     }
    //     return "Vous avez tapez dans le parametre object avec attribut nom = " + employer.getNom() + " et l'attribut mail = "+ employer.getEmail() + " avec de l'argent " + employer.getVola() + " izay manana poste " + poste + " sy numero "+ num;
    // }

    @Roles({"Admin","Developper"})
    @Get
    @Url("/insertionObjet")
    public ModelView insertionObject(@Param("emp") Employer employer,@Param("poste") String poste,@Param("num") String num) {
        String referer = "/";
        if (session != null) {
            session.add("vaovao", "ito vaovao");
        } 
        String valiny = "Vous avez tapez dans le parametre object avec attribut nom = " + employer.getNom() + " et l'attribut mail = "+ employer.getEmail() + " avec de l'argent " + employer.getVola() + " izay manana poste " + poste + " sy numero "+ num;
        ModelView mv = new ModelView("/view/accueil.jsp");
        mv.addObject("referer", referer);
        mv.addObject("message", valiny);
        return mv;
    }
}