package controller;

import model.Film;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FormFilmServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (!isLoggedIn(request)) {
            response.sendRedirect("log"); // Redirect login
            return;
        }
        
        String action = request.getParameter("action");
        if ("edit".equals(action)) {
            int idFilm = Integer.parseInt(request.getParameter("idFilm"));
            Film film = Film.getById(idFilm);
            request.setAttribute("film", film);
        }
        request.getRequestDispatcher("view/filmForm.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (!isLoggedIn(request)) {
            response.sendRedirect("log"); // Redirect login
            return;
        }

        String action = request.getParameter("action");
        String titre = request.getParameter("titre");
        String realisateur = request.getParameter("realisateur");
        int anneeSortie = Integer.parseInt(request.getParameter("anneeSortie"));
        String genre = request.getParameter("genre");

        Film film = new Film(titre, realisateur, anneeSortie, genre);

        if ("create".equals(action)) {
            film.insert();
        } else if ("update".equals(action)) {
            int idFilm = Integer.parseInt(request.getParameter("idFilm"));
            film.setIdFilm(idFilm);
            film.update();
        }

        response.sendRedirect("films");
    }

    // Helper method to check if user is logged in
    private boolean isLoggedIn(HttpServletRequest request) {
        return request.getSession().getAttribute("client") != null;
    }
}
