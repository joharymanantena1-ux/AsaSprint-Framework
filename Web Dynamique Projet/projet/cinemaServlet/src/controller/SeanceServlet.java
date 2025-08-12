package controller;

import model.Seance;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class SeanceServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        String salle = request.getParameter("salle");

        List<Seance> seances = Seance.rechercheSeances(startTime, endTime, salle);

        request.setAttribute("seances", seances);
        request.getRequestDispatcher("view/seanceList.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (!isLoggedIn(request)) {
            response.sendRedirect("log"); // Redirect login
            return;
        }

        
        String action = request.getParameter("action");
        int idSeance = Integer.parseInt(request.getParameter("idSeance"));

        if ("delete".equals(action)) {
            Seance seance = new Seance();
            seance.setIdSeance(idSeance);
            seance.delete();
        }

        response.sendRedirect("seances");
    }

    // Helper method to check if user is logged in
    private boolean isLoggedIn(HttpServletRequest request) {
        return request.getSession().getAttribute("client") != null;
    }
}


