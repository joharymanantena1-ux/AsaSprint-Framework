package controller;

import model.Seance;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class FormSeanceServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (!isLoggedIn(request)) {
            response.sendRedirect("log"); // Redirect login
            return;
        }

        String action = request.getParameter("action");
        if ("edit".equals(action)) {
            int idSeance = Integer.parseInt(request.getParameter("idSeance"));
                Seance seance = Seance.getById(idSeance);
                request.setAttribute("seance", seance);
        }
        request.getRequestDispatcher("view/seanceForm.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (!isLoggedIn(request)) {
            response.sendRedirect("log"); // Redirect login
            return;
        }
        
        String action = request.getParameter("action");
        int idFilm;
        idFilm = Integer.parseInt(request.getParameter("idFilm"));
        String dateSeance = request.getParameter("dateSeance");
        String heureDebut = request.getParameter("heureDebut");
        String heureFin = request.getParameter("heureFin");
        String salle = request.getParameter("salle");

        Seance seance = new Seance(idFilm, dateSeance, heureDebut, heureFin, salle);

        if ("create".equals(action)) {
            seance.insert();
        } else if ("update".equals(action)) {
            int idSeance = Integer.parseInt(request.getParameter("idSeance"));
                seance.setIdSeance(idSeance);
                seance.update();
        }

        response.sendRedirect("seances");
    }

    // Helper method to check if user is logged in
    private boolean isLoggedIn(HttpServletRequest request) {
        return request.getSession().getAttribute("client") != null;
    }
}
