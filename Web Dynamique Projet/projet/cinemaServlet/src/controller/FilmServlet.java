package controller;

import model.Film;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class FilmServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("search".equals(action)) {
            String title = request.getParameter("title");
            List<Film> films = Film.searchByTitle(title);
            request.setAttribute("films", films);
            request.setAttribute("searchQuery", title); // req attribut recherche Film Titre
            request.getRequestDispatcher("view/filmList.jsp").forward(request, response);
        } else {
            List<Film> films = Film.getAll();
            request.setAttribute("films", films);
            request.getRequestDispatcher("view/filmList.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (!isLoggedIn(request)) {
            response.sendRedirect("log"); // Redirect login
            return;
        }
        
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            int idFilm = Integer.parseInt(request.getParameter("idFilm"));
            Film film = new Film();
            film.setIdFilm(idFilm);
            film.delete();
        }

        response.sendRedirect("films");
    }
    // Helper method to check if user is logged in
    private boolean isLoggedIn(HttpServletRequest request) {
        return request.getSession().getAttribute("client") != null;
    }
}
