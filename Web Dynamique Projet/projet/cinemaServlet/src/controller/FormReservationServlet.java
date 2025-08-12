package controller;

import model.Reservation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class FormReservationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (!isLoggedIn(request)) {
            response.sendRedirect("log"); // Redirect login
            return;
        }
        
        String action = request.getParameter("action");
        if ("edit".equals(action)) {
            int idReservation = Integer.parseInt(request.getParameter("idReservation"));
            Reservation reservation = Reservation.getById(idReservation);
            request.setAttribute("reservation", reservation);
        }
        request.getRequestDispatcher("view/reservationForm.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (!isLoggedIn(request)) {
            response.sendRedirect("log"); // Redirect login
            return;
        }


        String action = request.getParameter("action");
        int idSeance = Integer.parseInt(request.getParameter("idSeance"));
        int idClient = Integer.parseInt(request.getParameter("idClient"));
        int nombreTickets = Integer.parseInt(request.getParameter("nombreTickets"));

        Reservation reservation = new Reservation(idSeance, idClient, nombreTickets);

        if ("create".equals(action)) {
            reservation.insert();
        } else if ("update".equals(action)) {
            int idReservation = Integer.parseInt(request.getParameter("idReservation"));
            reservation.setIdReservation(idReservation);
            reservation.update();
        }

        response.sendRedirect("lesreservation");
    }

    // Helper method to check if user is logged in
    private boolean isLoggedIn(HttpServletRequest request) {
        return request.getSession().getAttribute("client") != null;
    }
}
