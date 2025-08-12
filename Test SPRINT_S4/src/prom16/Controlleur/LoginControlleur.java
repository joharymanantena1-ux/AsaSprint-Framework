package prom16.Controlleur;

import prom16.annotation.Annoter;
import prom16.annotation.Get;
import prom16.annotation.Param;
import prom16.annotation.Post;
import prom16.annotation.Public;
import prom16.annotation.Roles;
import prom16.annotation.Url;
import prom16.fonction.ModelView;
import prom16.fonction.CustomSession;
import jakarta.servlet.http.Part;

@Annoter
public class LoginControlleur {

    @Public
    @Get
    @Url("/connecter")
    public boolean connecter(){
        return true;
    }

    @Url("/log")
    public ModelView login() {
        ModelView mv = new ModelView("/WEB-INF/view/login.jsp");
        return mv;
    }


    @Url("/")
    public ModelView login(CustomSession session) {
        ModelView mv = new ModelView("/WEB-INF/view/home.jsp");
        session.add("authUser", true);
        session.add("userRoles", "Admine");
        return mv;
    }
    

    @Post
    @Url("/traitementlogin")
    @Roles({"Admin","Developper"})
    public ModelView traitement( @Param("cin") Part cin,@Param("pseudo") String nom, @Param("mail") String mail, @Param("mdp") String mdp, CustomSession session) {
        String anarana = nom + " Post";
        session.add("session_nom", anarana);
        session.add("session_mdp", mdp);
        ModelView mv = new ModelView("/view/home.jsp");
        mv.addObject("anarana", anarana);
        mv.addObject("mail", mail);
        String etat = "Contenu Part vide";
        if (cin != null) {
            etat = "Contenu Part non vide";
            mv.addObject("filename", cin.getHeader("content-disposition"));
        }
        mv.addObject("uploadMessage", etat);
        return mv;
    }




    // @Get
    // @Url("/traitementlogin")
    // @RestAPI
    // public ModelView traitement(@Param("pseudo") String nom, @Param("mail") String mail, CustomSession session){
    //     String anarana = nom + "Get";
    //     session.add("session_nom", anarana);
    //     ModelView mv = new ModelView("/view/home.jsp");
    //     mv.addObject("anarana", anarana);
    //     mv.addObject("mail", mail);
    //     return mv;
    // }




}