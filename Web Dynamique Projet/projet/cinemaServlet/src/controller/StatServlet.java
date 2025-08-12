package controller;

import model.Film;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Vector;

public class StatServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Vector<String[]> nombreClientsParGenre = Film.getNombreClientsParGenre();
        request.setAttribute("nombreClientsParGenre", nombreClientsParGenre);
        request.getRequestDispatcher("view/home.jsp").forward(request, response);
    }
}
